Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 7B50C7C39B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 02:09:31 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 8D75E1C0277
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 14:09:31 +1200 (NZST)
To: openembedded-core@lists.openembedded.org
References: <20190606011321.23507-1-douglas.royds@taitradio.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <ae219134-ccdb-8b33-76a6-a28010c7ef53@taitradio.com>
Date: Thu, 6 Jun 2019 14:09:31 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606011321.23507-1-douglas.royds@taitradio.com>
Subject: Re: [PATCH v2] json-c: Make implicit-fallthrough only a warning for compilation under icecc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Jun 2019 02:09:32 -0000
Content-Type: multipart/alternative;
	boundary="------------08FDD45EB7C874A9998528AE"
Content-Language: en-GB

--------------08FDD45EB7C874A9998528AE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Please disregard this one, I have submitted a newer patch under a new 
subject-line:

    json-c: Disable icecc to avoid implicit-fallthrough warning as error


On 6/06/19 1:13 PM, Douglas Royds wrote:

> icecc preprocesses source files locally before shipping them off to be compiled
> on remote hosts. This preprocessing removes comments, including /* fallthrough */
> comments in switch statements that normally prevent the implicit-fallthrough
> warning. Rather than turning off -Werror completely, just reduce
> implicit-fallthrough to a warning only.
>
> In the -native case, we might be building on an earlier gcc, eg. gcc 5.4
> under Ubuntu 16.04, so we do disable -Werror completely.
>
> See https://github.com/icecc/icecream/issues/419
>
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>   meta/recipes-devtools/json-c/json-c_0.13.1.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> index 5b10e68297..87a87aec44 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> @@ -22,6 +22,9 @@ inherit autotools
>   
>   EXTRA_OECONF = "--enable-rdrand"
>   
> +TARGET_CPPFLAGS =+ "-Wno-error=implicit-fallthrough"
> +BUILD_CPPFLAGS =+ "-Wno-error"
> +
>   do_configure_prepend() {
>       # Clean up autoconf cruft that should not be in the tarball
>       rm -f ${S}/config.status



--------------08FDD45EB7C874A9998528AE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Please disregard this one, I have submitted a newer patch under a
      new subject-line:<br>
    </p>
    <blockquote>
      <p>json-c: Disable icecc to avoid implicit-fallthrough warning as
        error<br>
      </p>
    </blockquote>
    <p><br>
    </p>
    <p>On 6/06/19 1:13 PM, Douglas Royds wrote:
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">icecc preprocesses source files locally before shipping them off to be compiled
on remote hosts. This preprocessing removes comments, including /* fallthrough */
comments in switch statements that normally prevent the implicit-fallthrough
warning. Rather than turning off -Werror completely, just reduce
implicit-fallthrough to a warning only.

In the -native case, we might be building on an earlier gcc, eg. gcc 5.4
under Ubuntu 16.04, so we do disable -Werror completely.

See <a class="moz-txt-link-freetext" href="https://github.com/icecc/icecream/issues/419">https://github.com/icecc/icecream/issues/419</a>

Signed-off-by: Douglas Royds <a class="moz-txt-link-rfc2396E" href="mailto:douglas.royds@taitradio.com">&lt;douglas.royds@taitradio.com&gt;</a>
---
 meta/recipes-devtools/json-c/json-c_0.13.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
index 5b10e68297..87a87aec44 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -22,6 +22,9 @@ inherit autotools
 
 EXTRA_OECONF = "--enable-rdrand"
 
+TARGET_CPPFLAGS =+ "-Wno-error=implicit-fallthrough"
+BUILD_CPPFLAGS =+ "-Wno-error"
+
 do_configure_prepend() {
     # Clean up autoconf cruft that should not be in the tarball
     rm -f ${S}/config.status
</pre>
      </blockquote>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------08FDD45EB7C874A9998528AE--
