Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEB9C54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 16:06:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.10459.1700150815619112000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 08:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nE5svOqg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BF4F240002;
	Thu, 16 Nov 2023 16:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700150813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SaS2y87is0D2zg+UDhQCdKH8IYQVjsOpS2hplls51WQ=;
	b=nE5svOqgViVBHIbK0422dK1AwR+Mw/U5CSCRiCfteKxrz/CGvPzMg0Y4bC1nHaZKO2Xrul
	oSAIgZmClC6NN0X1G6Etkwk0gc2TLUdreGURFa0QNM2Jin164wkQ7Fe5P3h22tRh0aVA1u
	5oSWvffbJ6ZKwug+mYNTJjcBKDxXjIv1BH+/1svd8VztLg1Ctf5enix1jrxfO+Gy0MS9ec
	LbDoC5Y5x3yb/uHWlS/Zvv9QHo4yHqgaJ7gWN6gQOJbC3321gE4bg3IXfdZArwS7dl7KbA
	DjGJCye9YvjE6jyyfQHmQ+6QU7thWk4eRw+pLOGzeKBOT8WuLEMRnW3A1+iMuw==
Date: Thu, 16 Nov 2023 17:06:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] gawk: upgrade 5.2.2 -> 5.3.0
Message-ID: <202311161606520e1ec82b@mail.local>
References: <1700035829-1053-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1700035829-1053-1-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 16:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190801

New ptest failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5720/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5902/steps/13/logs/stdio

od: invalid option -- 'A'
BusyBox v1.36.1 () multi-call binary.

Usage: od [-aBbcDdeFfHhIiLlOovXx] [FILE]
od: invalid option -- 'A'
BusyBox v1.36.1 () multi-call binary.

Usage: od [-aBbcDdeFfHhIiLlOovXx] [FILE]
od: invalid option -- 'A'
BusyBox v1.36.1 () multi-call binary.

Usage: od [-aBbcDdeFfHhIiLlOovXx] [FILE]
od: invalid option -- 'A'
BusyBox v1.36.1 () multi-call binary.

Usage: od [-aBbcDdeFfHhIiLlOovXx] [FILE]
od: invalid option -- 'A'
BusyBox v1.36.1 () multi-call binary.

Usage: od [-aBbcDdeFfHhIiLlOovXx] [FILE]
od: invalid option -- 'A'
BusyBox v1.36.1 () multi-call binary.

Usage: od [-aBbcDdeFfHhIiLlOovXx] [FILE]
od: invalid option -- 'A'
BusyBox v1.36.1 () multi-call binary.

Usage: od [-aBbcDdeFfHhIiLlOovXx] [FILE]
gawk: cmd. line:2: warning: invalid `\u' escape sequence
gawk: cmd. line:3: warning: invalid `\u' escape sequence
gawk: cmd. line:2: warning: invalid `\u' escape sequence
right: literal ? is literal
gawk: cmd. line:2: warning: invalid `\u' escape sequence
gawk: cmd. line:5: warning: invalid `\u' escape sequence
gawk: cmd. line:8: warning: invalid `\u' escape sequence
1 == 1
gawk: cmd. line:3: warning: invalid `\u' escape sequence
1 == 1
0 == 0
gawk: cmd. line:6: warning: invalid `\u' escape sequence
0 == 0
0 == 0
gawk: cmd. line:9: warning: invalid `\u' escape sequence
0 == 0
FAIL: cmdlinefsbacknl2


On 15/11/2023 16:10:29+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ===========
> 1. Infrastructure changes: Removed the use of libsigsegv. The
>    value-add was never very much and it caused problems in some
>    environments.
> 2. In keeping with new features in BWK awk, gawk now has built-in
>    CSV file parsing. The behavior is intended to be identical to
>    that of the "One True AWK" when --csv is applied. See the
>    manual for details.
> 3. Also in keeping with BWK awk, gawk now supports a new \u escape
>    sequence. This should be followed by 1-8 hexadecimal digits. The
>    given code point is converted to its corresponding multibyte encoding
>    for storage inside gawk. See the manual.
> 4. If PROCINFO["BUFFERPIPE"] exists, then pipe output is buffered.
>    You can also use PROCINFO["command", "BUFFERPIPE"]. See the manual
>    for details.
> 5. Because of the additional `do_csv' variable in the API, which breaks
>    binary compatibility, the API major version was updated to 4 and
>    the minor version was reset to zero.  The API remains source code
>    compatible; that is, existing extensions should only require recompilation.
> 6. The manual now requires Texinfo 7.1 and its texinfo.tex for formatting.
>    As a result, we no longer need to pre-process it, removing the need
>    for gawktexi.in and leaving just gawk.texi.
> 7. And of course, there have been several minor code cleanups and bug fixes.
>    See the ChangeLog for details.
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-extended/gawk/{gawk_5.2.2.bb => gawk_5.3.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-extended/gawk/{gawk_5.2.2.bb => gawk_5.3.0.bb} (97%)
> 
> diff --git a/meta/recipes-extended/gawk/gawk_5.2.2.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
> similarity index 97%
> rename from meta/recipes-extended/gawk/gawk_5.2.2.bb
> rename to meta/recipes-extended/gawk/gawk_5.3.0.bb
> index 3c18b6911a..3d652da6e5 100644
> --- a/meta/recipes-extended/gawk/gawk_5.2.2.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
> @@ -19,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
>             file://run-ptest \
>             "
>  
> -SRC_URI[sha256sum] = "945aef7ccff101f20b22a10802bc005e994ab2b8ea3e724cc1a197c62f41f650"
> +SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
>  
>  inherit autotools gettext texinfo update-alternatives
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190561): https://lists.openembedded.org/g/openembedded-core/message/190561
> Mute This Topic: https://lists.openembedded.org/mt/102601410/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

