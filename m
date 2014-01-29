Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D73B76EA3D
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 14:53:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0TEr47Q021203
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Jan 2014 06:53:05 -0800 (PST)
Received: from [147.11.118.124] (147.11.118.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 29 Jan 2014 06:53:04 -0800
Message-ID: <52E915D0.3030403@windriver.com>
Date: Wed, 29 Jan 2014 08:53:04 -0600
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1391004721-15474-1-git-send-email-jason.wessel@windriver.com>	
	<1391004721-15474-2-git-send-email-jason.wessel@windriver.com>
	<1391005162.24655.73.camel@ted>
In-Reply-To: <1391005162.24655.73.camel@ted>
X-Enigmail-Version: 1.6
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] unfs3: Fix dependencies and allow target builds
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
X-List-Received-Date: Wed, 29 Jan 2014 14:53:06 -0000
Content-Type: multipart/alternative;
	boundary="------------070808050201020607060900"

--------------070808050201020607060900
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 01/29/2014 08:19 AM, Richard Purdie wrote:
> On Wed, 2014-01-29 at 08:12 -0600, Jason Wessel wrote:
>> > Fixed in this patch:
>> >   * All patches marked as submitted to the upstream
>> >   * Remove the pseudo dependency because unfs3 can fully stand alone
>> >     or be used with pseudo and it does not link against pseudo
>> >   * Dependencies to flex for nativesdk and target builds are fixed
>> >     such that unfs3 can be deployed into an image
>> >   * Delete commented out unfs3 references in separatebuilddir.inc
>> >     because unfs3 works correctly with autotools.
>> > 
>> > Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> > ---
>> >  meta/conf/distro/include/seperatebuilddir.inc      |    2 --
>> >  .../unfs3/unfs3/alternate_rpc_ports.patch          |    2 +-
>> >  .../unfs3/unfs3/fix_compile_warning.patch          |    2 +-
>> >  .../fix_pid_race_parent_writes_child_pid.patch     |    2 +-
>> >  .../unfs3/unfs3/fix_warnings.patch                 |    2 +-
>> >  .../unfs3/unfs3/relative_max_socket_path_len.patch |    2 +-
>> >  .../unfs3/unfs3/rename_fh_cache.patch              |    2 +-
>> >  .../unfs3/unfs3/tcp_no_delay.patch                 |    2 +-
>> >  .../unfs3/unfs3/unfs3_parallel_build.patch         |    2 +-
>> >  meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb   |   17 ++---------------
>> >  10 files changed, 10 insertions(+), 25 deletions(-)
>> > 
>> > diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
>> > index 64e8f6d..a4869c5 100644
>> > --- a/meta/conf/distro/include/seperatebuilddir.inc
>> > +++ b/meta/conf/distro/include/seperatebuilddir.inc
>> > @@ -528,7 +528,6 @@ B_pn-nativesdk-renderproto = "${SEPB}"
>> >  B_pn-nativesdk-sqlite3 = "${SEPB}"
>> >  B_pn-nativesdk-systemtap = "${SEPB}"
>> >  # Not automake, no out of tree build support
>> > -#B_pn-nativesdk-unfs3 = "${SEPB}"
>> >  B_pn-nativesdk-util-macros = "${SEPB}"
>> >  B_pn-nativesdk-xcb-proto = "${SEPB}"
>> >  B_pn-nativesdk-xcmiscproto = "${SEPB}"
>> > @@ -676,7 +675,6 @@ B_pn-tremor = "${SEPB}"
>> >  B_pn-tslib = "${SEPB}"
>> >  B_pn-udev = "${SEPB}"
>> >  # Not automake, no out of tree build support
>> > -#B_pn-unfs3-native = "${SEPB}"
>> >  B_pn-usbutils = "${SEPB}"
>> >  B_pn-util-linux = "${SEPB}"
>> >  B_pn-util-linux-native = "${SEPB}"
> If unfs is now autotools based, can we enable out of tree builds here?

I did not realize this was an opt in list.   I'll send a v2.  Testing shows that it works properly.

Cheers,
Jason.

--------------070808050201020607060900
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 01/29/2014 08:19 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote cite="mid:1391005162.24655.73.camel@ted" type="cite">
      <div class="moz-text-plain" wrap="true" graphical-quote="true"
        style="font-family: -moz-fixed; font-size: 12px;"
        lang="x-unicode">
        <pre wrap="">On Wed, 2014-01-29 at 08:12 -0600, Jason Wessel wrote:
</pre>
        <blockquote type="cite" style="color: #000000;">
          <pre wrap=""><span class="moz-txt-citetags">&gt; </span>Fixed in this patch:
<span class="moz-txt-citetags">&gt; </span>  * All patches marked as submitted to the upstream
<span class="moz-txt-citetags">&gt; </span>  * Remove the pseudo dependency because unfs3 can fully stand alone
<span class="moz-txt-citetags">&gt; </span>    or be used with pseudo and it does not link against pseudo
<span class="moz-txt-citetags">&gt; </span>  * Dependencies to flex for nativesdk and target builds are fixed
<span class="moz-txt-citetags">&gt; </span>    such that unfs3 can be deployed into an image
<span class="moz-txt-citetags">&gt; </span>  * Delete commented out unfs3 references in separatebuilddir.inc
<span class="moz-txt-citetags">&gt; </span>    because unfs3 works correctly with autotools.
<span class="moz-txt-citetags">&gt; </span>
<span class="moz-txt-citetags">&gt; </span>Signed-off-by: Jason Wessel <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:jason.wessel@windriver.com">&lt;jason.wessel@windriver.com&gt;</a>
<span class="moz-txt-citetags">&gt; </span>---
<span class="moz-txt-citetags">&gt; </span> meta/conf/distro/include/seperatebuilddir.inc      |    2 --
<span class="moz-txt-citetags">&gt; </span> .../unfs3/unfs3/alternate_rpc_ports.patch          |    2 +-
<span class="moz-txt-citetags">&gt; </span> .../unfs3/unfs3/fix_compile_warning.patch          |    2 +-
<span class="moz-txt-citetags">&gt; </span> .../fix_pid_race_parent_writes_child_pid.patch     |    2 +-
<span class="moz-txt-citetags">&gt; </span> .../unfs3/unfs3/fix_warnings.patch                 |    2 +-
<span class="moz-txt-citetags">&gt; </span> .../unfs3/unfs3/relative_max_socket_path_len.patch |    2 +-
<span class="moz-txt-citetags">&gt; </span> .../unfs3/unfs3/rename_fh_cache.patch              |    2 +-
<span class="moz-txt-citetags">&gt; </span> .../unfs3/unfs3/tcp_no_delay.patch                 |    2 +-
<span class="moz-txt-citetags">&gt; </span> .../unfs3/unfs3/unfs3_parallel_build.patch         |    2 +-
<span class="moz-txt-citetags">&gt; </span> meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb   |   17 ++---------------
<span class="moz-txt-citetags">&gt; </span> 10 files changed, 10 insertions(+), 25 deletions(-)
<span class="moz-txt-citetags">&gt; </span>
<span class="moz-txt-citetags">&gt; </span>diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
<span class="moz-txt-citetags">&gt; </span>index 64e8f6d..a4869c5 100644
<span class="moz-txt-citetags">&gt; </span>--- a/meta/conf/distro/include/seperatebuilddir.inc
<span class="moz-txt-citetags">&gt; </span>+++ b/meta/conf/distro/include/seperatebuilddir.inc
<span class="moz-txt-citetags">&gt; </span>@@ -528,7 +528,6 @@ B_pn-nativesdk-renderproto = "${SEPB}"
<span class="moz-txt-citetags">&gt; </span> B_pn-nativesdk-sqlite3 = "${SEPB}"
<span class="moz-txt-citetags">&gt; </span> B_pn-nativesdk-systemtap = "${SEPB}"
<span class="moz-txt-citetags">&gt; </span> # Not automake, no out of tree build support
<span class="moz-txt-citetags">&gt; </span>-#B_pn-nativesdk-unfs3 = "${SEPB}"
<span class="moz-txt-citetags">&gt; </span> B_pn-nativesdk-util-macros = "${SEPB}"
<span class="moz-txt-citetags">&gt; </span> B_pn-nativesdk-xcb-proto = "${SEPB}"
<span class="moz-txt-citetags">&gt; </span> B_pn-nativesdk-xcmiscproto = "${SEPB}"
<span class="moz-txt-citetags">&gt; </span>@@ -676,7 +675,6 @@ B_pn-tremor = "${SEPB}"
<span class="moz-txt-citetags">&gt; </span> B_pn-tslib = "${SEPB}"
<span class="moz-txt-citetags">&gt; </span> B_pn-udev = "${SEPB}"
<span class="moz-txt-citetags">&gt; </span> # Not automake, no out of tree build support
<span class="moz-txt-citetags">&gt; </span>-#B_pn-unfs3-native = "${SEPB}"
<span class="moz-txt-citetags">&gt; </span> B_pn-usbutils = "${SEPB}"
<span class="moz-txt-citetags">&gt; </span> B_pn-util-linux = "${SEPB}"
<span class="moz-txt-citetags">&gt; </span> B_pn-util-linux-native = "${SEPB}"
</pre>
        </blockquote>
        <pre wrap="">If unfs is now autotools based, can we enable out of tree builds here?
</pre>
      </div>
    </blockquote>
    <br>
    I did not realize this was an opt in list.   I'll send a v2. 
    Testing shows that it works properly.<br>
    <br>
    Cheers,<br>
    Jason.<br>
  </body>
</html>

--------------070808050201020607060900--
