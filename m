Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BE5C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 06:29:56 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.23384.1644388195724007078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 22:29:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=YuexamA6;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.8.233] (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3D5A120B90F7;
	Tue,  8 Feb 2022 22:29:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3D5A120B90F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1644388194;
	bh=r3U/m95Wh2DGLe3iPV2IBMH3sn1yNIDh8+5mniqtDpU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=YuexamA62UtMZB9oHWNCRG8rzEdVEID1wU17jb7Q8CPRbVEzW/U+cjNCtzxGXo62Q
	 u1ONDj6jR1euJYPcWGv2G2nxr74eajFHM+GfDDw3KrMB1kLN33EQDPni0lKE2Tnyd0
	 cdmxTSrgt2+yad78aef4UxXY1Mrmw7UMVh+L/h+U=
Content-Type: multipart/alternative;
 boundary="------------Q99SGcPE4K0Vkd0DMdyTUNF6"
Message-ID: <ae26b623-6e16-1c9f-c10f-2b4ce8899617@linux.microsoft.com>
Date: Wed, 9 Feb 2022 06:29:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] newlib: fix license checksums
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20220208115629.2867610-1-ross.burton@arm.com>
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <20220208115629.2867610-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 06:29:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161536

This is a multi-part message in MIME format.
--------------Q99SGcPE4K0Vkd0DMdyTUNF6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for catching this Ross


Alejandro

On 2/8/22 11:56, Ross Burton wrote:
> COPYING.LIBGLOSS simply had the FSF street address change.
>
> COPYING.NEWLIB now includes BSD-3-Clause.
>
> Signed-off-by: Ross Burton<ross.burton@arm.com>
> ---
>   meta/recipes-core/newlib/newlib.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
> index 5e488d08483..bfecfe086ef 100644
> --- a/meta/recipes-core/newlib/newlib.inc
> +++ b/meta/recipes-core/newlib/newlib.inc
> @@ -3,14 +3,14 @@ HOMEPAGE ="https://sourceware.org/newlib/"
>   DESCRIPTION = "C library intended for use on embedded systems. It is a conglomeration of several library parts, all under free software licenses that make them easily usable on embedded products."
>   SECTION = "libs"
>   
> -LICENSE = "GPLv2 & LGPLv3 & GPLv3 & LGPLv2 & BSD-2-Clause & tcl"
> +LICENSE = "GPLv2 & LGPLv3 & GPLv3 & LGPLv2 & BSD-2-Clause & BSD-3-Clause & tcl"
>   LIC_FILES_CHKSUM = " \
>   		file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552  \
>   		file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6  \
>   		file://COPYING3;md5=d32239bcb673463ab874e80d47fae504  \
> -		file://COPYING.LIBGLOSS;md5=7b7615de0ecda0ff8d705966ac3b8950  \
> +		file://COPYING.LIBGLOSS;md5=c0469b6ebb847a75781066be515f032d  \
>   		file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1  \
> -		file://COPYING.NEWLIB;md5=b8dda70da54e0efb49b1074f349d7749  \
> +		file://COPYING.NEWLIB;md5=8bb75595dbcc7d45e5c0d116d7bdf6ce  \
>   		file://newlib/libc/posix/COPYRIGHT;md5=103468ff1982be840fdf4ee9f8b51bbf  \
>   		file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=73640207fbc79b198c7ffd4ad4d97aa0  \
>   		"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161498):https://lists.openembedded.org/g/openembedded-core/message/161498
> Mute This Topic:https://lists.openembedded.org/mt/88994406/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alhe@linux.microsoft.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------Q99SGcPE4K0Vkd0DMdyTUNF6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="Courier New, Courier, monospace">Thanks for catching
        this Ross</font></p>
    <p><font face="Courier New, Courier, monospace"><br>
      </font></p>
    <p><font face="Courier New, Courier, monospace">Alejandro</font><br>
    </p>
    <div class="moz-cite-prefix">On 2/8/22 11:56, Ross Burton wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220208115629.2867610-1-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">COPYING.LIBGLOSS simply had the FSF street address change.

COPYING.NEWLIB now includes BSD-3-Clause.

Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a>
---
 meta/recipes-core/newlib/newlib.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index 5e488d08483..bfecfe086ef 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -3,14 +3,14 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://sourceware.org/newlib/">"https://sourceware.org/newlib/"</a>
 DESCRIPTION = "C library intended for use on embedded systems. It is a conglomeration of several library parts, all under free software licenses that make them easily usable on embedded products."
 SECTION = "libs"
 
-LICENSE = "GPLv2 &amp; LGPLv3 &amp; GPLv3 &amp; LGPLv2 &amp; BSD-2-Clause &amp; tcl"
+LICENSE = "GPLv2 &amp; LGPLv3 &amp; GPLv3 &amp; LGPLv2 &amp; BSD-2-Clause &amp; BSD-3-Clause &amp; tcl"
 LIC_FILES_CHKSUM = " \
 		<a class="moz-txt-link-freetext" href="file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552">file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552</a> \
 		<a class="moz-txt-link-freetext" href="file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6">file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6</a> \
 		<a class="moz-txt-link-freetext" href="file://COPYING3;md5=d32239bcb673463ab874e80d47fae504">file://COPYING3;md5=d32239bcb673463ab874e80d47fae504</a> \
-		<a class="moz-txt-link-freetext" href="file://COPYING.LIBGLOSS;md5=7b7615de0ecda0ff8d705966ac3b8950">file://COPYING.LIBGLOSS;md5=7b7615de0ecda0ff8d705966ac3b8950</a> \
+		<a class="moz-txt-link-freetext" href="file://COPYING.LIBGLOSS;md5=c0469b6ebb847a75781066be515f032d">file://COPYING.LIBGLOSS;md5=c0469b6ebb847a75781066be515f032d</a> \
 		<a class="moz-txt-link-freetext" href="file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1">file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1</a> \
-		<a class="moz-txt-link-freetext" href="file://COPYING.NEWLIB;md5=b8dda70da54e0efb49b1074f349d7749">file://COPYING.NEWLIB;md5=b8dda70da54e0efb49b1074f349d7749</a> \
+		<a class="moz-txt-link-freetext" href="file://COPYING.NEWLIB;md5=8bb75595dbcc7d45e5c0d116d7bdf6ce">file://COPYING.NEWLIB;md5=8bb75595dbcc7d45e5c0d116d7bdf6ce</a> \
 		<a class="moz-txt-link-freetext" href="file://newlib/libc/posix/COPYRIGHT;md5=103468ff1982be840fdf4ee9f8b51bbf">file://newlib/libc/posix/COPYRIGHT;md5=103468ff1982be840fdf4ee9f8b51bbf</a> \
 		<a class="moz-txt-link-freetext" href="file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=73640207fbc79b198c7ffd4ad4d97aa0">file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=73640207fbc79b198c7ffd4ad4d97aa0</a> \
 		"
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#161498): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/161498">https://lists.openembedded.org/g/openembedded-core/message/161498</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/88994406/4354175">https://lists.openembedded.org/mt/88994406/4354175</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------Q99SGcPE4K0Vkd0DMdyTUNF6--

