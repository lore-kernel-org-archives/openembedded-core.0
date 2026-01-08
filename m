Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45014D185C5
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:43:01 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3861.1767868976616853554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ETOjfV7I;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: festevam@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-640c9c85255so3354405d50.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 02:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767868976; x=1768473776; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAf934RNm2zpdSNM+Z7XU1caFur5nQQrrM0OqDPB0Ho=;
        b=ETOjfV7IF+Zq+dzRLxWo6uA+oIZPHnC+bbvkVDNZ6yOilrk63IxLk/OXtIVqVhFlF0
         rhkEVO6lp88D9cGDAZZllAVfwgwW2/ohzz2P+Mf4H781hH0b1GalyKnPK+Km8nL1R/mu
         eL7X0USKppTDotQ87HMHJODj8PWOU10xW5g+1vQC1CXrfdD1X+RQo88BwxFKmTwvL/tW
         ln74cDfwMxtn/7CrJ9YFJ0qpPfm6El0w6UlXqrKUU2IX5c3Y1Ke1p0V39KzhdXQQ7ygq
         q2DSAzEVn1y8ZLODbgQP0ynTQR1BOv6H6ykQC9xSWSa5FqAZDZic3xORr4s5I0koeOnF
         lvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767868976; x=1768473776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aAf934RNm2zpdSNM+Z7XU1caFur5nQQrrM0OqDPB0Ho=;
        b=k2s7h34Mgdx+8Opt5KyyLypqhTM2nG/ghnE9T2ipEXsN4h9Vn07d8ncb04iUR5N5DH
         FN7Jo0tpoIzVntrfZ62Ieeipyyf4biUbWc6JJRScPl057tXgR+Qsk1I9peH9tC9S9yFZ
         nvOvkN+yEWD8DueRSe5DSrGGR7p+/rh8hle3gfY9JhrAhxtQFksYvMds4VO5X73ljohm
         BkKwAPPNcxHIxgwt4YnNeGZLUTMC4mFKwWKn9LhGn7j8NlQUWOsPml+2mEpGH48yCmys
         MIRdb2BhcqpMg5iopkVfwlgzDgv6uUVQTOlNPTPbk7vKtAPB2CtSOWaKvpF3QxSC5TDe
         1tEw==
X-Forwarded-Encrypted: i=1; AJvYcCUtToTxRgFhyT0k4EhXDt/U4kiIIaAhkqwIK49KYLqT/Axl6YWbxyhYCgdIGA+6LunsqTnz/5Da+43qUcaiF9AMmQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz8oOuKJb8GbMsYkHa8ire67XzkGQWBNbGyW71nmUUEDqlcwNcm
	lmfyrBOhIZ4sQpkh0qQEwfoLXTvxkhSn0HarJtZMCd+LamdIb1+azV3m3wBNourkCV6qe8iwZ5W
	gfKG1pf+qCjIrCjP7dYgnCuRQrH7wu90=
X-Gm-Gg: AY/fxX4jKIHp+e/FrE+PY99SK68ySCNHKD8za/PGkDNDp0R/hEe4Iqrec6EY3JBxjGf
	UBHENJXAo5PXeKndnWtww93flAQNXtEvFk5HqZvnu7RhO4KtfgGHI4Wod+rRoFDfwh6BBwZLSiy
	qofi22luA+vTPZe4wO6DhYn9ztkNsw6UKr8vP4aQjSAZnMzlXB7WI1Gw2qR9ix9sOmeG9BYLmwt
	NnAbOxyPaWnZKR6RvKlINd/4xO4abuEO4ECb22ERxlSzr+p1HJp6F81pf6K4GB/qUMO+dXh3SoJ
	P/xOzrwFQLb3zexLfp0x+KHCZx/rZqlhQx/Uag==
X-Google-Smtp-Source: AGHT+IGYnVv/Y6eNJnZ+WDBItQJS/6CTsQgJIxZtZE87BixWGZK8gF8MhrZ4q6Spqo2oc5NuTnwABUCEWOSicL7OElg=
X-Received: by 2002:a05:690e:15d8:b0:646:85b9:8892 with SMTP id
 956f58d0204a3-64716bbbbd2mr3444909d50.9.1767868975701; Thu, 08 Jan 2026
 02:42:55 -0800 (PST)
MIME-Version: 1.0
References: <20260106121413.844461-1-festevam@gmail.com> <DFJ1WJHZ80VB.3C7F25622Y8ZI@bootlin.com>
In-Reply-To: <DFJ1WJHZ80VB.3C7F25622Y8ZI@bootlin.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 8 Jan 2026 07:42:42 -0300
X-Gm-Features: AQt7F2qqOFTzd59__CCZDgSWeiV1gdV1I7W1QUFkxvAlob9Hj3wlv2TFhHoUR9I
Message-ID: <CAOMZO5AL_0Gxezo1R6pDXWc2Fyzn80VDy72t-d=_yF0yUnBO7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: upgrade 2025.10 -> 2026.01
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Jon Mason <jon.mason@arm.com>, Ross Burton <ross.burton@arm.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 10:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229058

On Thu, Jan 8, 2026 at 5:05=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:

> Hi Jon, Ross,
>
> Just a quick warning, once merged, this update will break meta-arm
> builds, as some patches are conflicting:
>
> ERROR: u-boot-1_2026.01-r0 do_patch: Applying patch '/srv/pokybuild/yocto=
-worker/meta-arm/build/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-=
base/0001-vexpress64-Set-the-DM_RNG-property.patch' on target directory '/s=
rv/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux=
/u-boot/2026.01/sources/u-boot-2026.01'
> CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/meta-arm/build/buil=
d/tmp/work/fvp_base-poky-linux/u-boot/2026.01/recipe-sysroot-native/etc/qui=
ltrc push', 0, 'stdout: Applying patch 0001-vexpress64-Set-the-DM_RNG-prope=
rty.patch
> patching file board/armltd/vexpress64/Kconfig
> Hunk #1 FAILED at 21.
> 1 out of 1 hunk FAILED -- rejects in file board/armltd/vexpress64/Kconfig
> Patch 0001-vexpress64-Set-the-DM_RNG-property.patch does not apply (enfor=
ce with -f)

This patch is already present in U-Boot 2026.01, so it must be dropped.

