Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 32E6B72657
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 08:48:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBH8lWwn011018
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 17 Dec 2014 00:47:32 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 17 Dec 2014 00:47:31 -0800
Message-ID: <54914322.6000309@windriver.com>
Date: Wed, 17 Dec 2014 16:47:30 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<835687296e529e505a948421804d16259eb51d2b.1415350038.git.kai.kang@windriver.com>
	<D9FD4A25-6B2D-4868-B536-9593EFF79254@dominion.thruhere.net>
In-Reply-To: <D9FD4A25-6B2D-4868-B536-9593EFF79254@dominion.thruhere.net>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org, Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH 09/24] libpng: add neon option for aarch64
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
X-List-Received-Date: Wed, 17 Dec 2014 08:49:01 -0000
Content-Type: multipart/alternative;
	boundary="------------010501090803050609080001"

--------------010501090803050609080001
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年12月17日 03:30, Koen Kooi wrote:
>> Op 7 nov. 2014, om 09:51 heeft Kai Kang <kai.kang@windriver.com> het volgende geschreven:
>>
>> Add neon option for aarch64 just as for arm. It fails with:
>>
>> | ./.libs/libpng16.so: undefined reference to `png_init_filter_functions_neon'
>> | collect2: error: ld returned 1 exit status
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> meta/recipes-multimedia/libpng/libpng_1.6.13.bb | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
>> index 0c6fd1f..3d32bfe 100644
>> --- a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
>> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
>> @@ -20,6 +20,7 @@ inherit autotools binconfig-disabled pkgconfig
>>
>> # Work around missing symbols
>> EXTRA_OECONF_append_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
>> +EXTRA_OECONF_append_aarch64 = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
> You're introducing the same bug in a different way: overeager use of qualifiers. Just drop the _arm bit and it works.
>

OK. I'll remove the _arm to fix this issue.

Thanks.

-- 
Regards,
Neil | Kai Kang


--------------010501090803050609080001
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2014年12月17日 03:30, Koen Kooi wrote:<br>
    </div>
    <blockquote
      cite="mid:D9FD4A25-6B2D-4868-B536-9593EFF79254@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">Op 7 nov. 2014, om 09:51 heeft Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a> het volgende geschreven:

Add neon option for aarch64 just as for arm. It fails with:

| ./.libs/libpng16.so: undefined reference to `png_init_filter_functions_neon'
| collect2: error: ld returned 1 exit status

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
meta/recipes-multimedia/libpng/libpng_1.6.13.bb | 1 +
1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
index 0c6fd1f..3d32bfe 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
@@ -20,6 +20,7 @@ inherit autotools binconfig-disabled pkgconfig

# Work around missing symbols
EXTRA_OECONF_append_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
+EXTRA_OECONF_append_aarch64 = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
</pre>
      </blockquote>
      <pre wrap="">
You're introducing the same bug in a different way: overeager use of qualifiers. Just drop the _arm bit and it works.

</pre>
    </blockquote>
    <br>
    <font size="+1">OK. I'll remove the _arm to fix this issue.<br>
      <br>
      Thanks.<br>
    </font><br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------010501090803050609080001--
