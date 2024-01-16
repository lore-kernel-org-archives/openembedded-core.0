Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E73C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 08:27:23 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.8474.1705393637810628140
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 00:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QxQgwqE5;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so11270441e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705393636; x=1705998436; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ApRRxy4NSnIDClhSPi61KGdq+EOdD3+rQp8rb1Z9dXg=;
        b=QxQgwqE5MjTRGUwyWpdw1eBqgTt+oaa0pwBMr4cudZsDHna5Dh8ox4HF0th13UpmVp
         wAdHhJdCcej60WgPpPCXMnq5dZ+KGuqiGmBJy2dBg6koXsRDTky4GqX74JFNG0W+rR8w
         TADBiJ88RGbGpqrwq3OPwMIlumti2CYp+0acb+vK7mWQgufoEOgn3UODdrA8SfjcJbPZ
         gxp/d/fVndIEB63b/A3J356EO3zn2aUOGLz/aVRADdIQyRnCqwk5fzyHQ4VnjF6zAfgH
         V3ezDyfDXXth+39uvSDceI+fnnWCMwX2F+oS8p2Kx60mADwTMNX7kHjYWnzfYnORDcTZ
         yjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705393636; x=1705998436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApRRxy4NSnIDClhSPi61KGdq+EOdD3+rQp8rb1Z9dXg=;
        b=CtkmhnXTy2EwEGmyc+sj71r3krcmvdc09wZWj7surg4an8peDQRUUNBsPRJAzuwzcJ
         of1YNNMWrCv2RuCs9Lnl5ztM6CivENHoTLDYjzmLbcfQrhL4vTHYWqwJdpPHU7p/MF/j
         9CTj+4eTqR3kwTIw6PK/YjkYsyYZ4r/lwXA+HNlORxD9GNsi1riIcnVWsFNxyTe4aeNj
         MM0i7AH4/PNjTgXHMx24OBieYM5pH3mlQ9XlVdC0W4q1JRMMHG36hS/Hn6+m7tuxzTv9
         DAzKQLLkjM0u4q5DTdxWl5vhvR3EZc/9ICXe2v56B/is8pkA/VzhUkIisslLc2xgZysB
         YdtQ==
X-Gm-Message-State: AOJu0YzBMZe+UZc0fM8NAF1cFXEC9dnPihbD96akuB8xXN+9fgILnvzv
	weLfdebrvxsS7dqSfFA33rvmpTWfKvoRz0Krx7c=
X-Google-Smtp-Source: AGHT+IGr1Gjvf1amozj5BdzCQ2IHcPvdijGUahX1Ytx0IC9B2M8C9eGaC8eMV4J12yyd5b5VWxosuJcjCCXEMZ7tpa0=
X-Received: by 2002:a05:6512:4018:b0:50e:7dcc:ee63 with SMTP id
 br24-20020a056512401800b0050e7dccee63mr3399812lfb.35.1705393635714; Tue, 16
 Jan 2024 00:27:15 -0800 (PST)
MIME-Version: 1.0
References: <1705362852-30067-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1705362852-30067-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jan 2024 09:27:04 +0100
Message-ID: <CANNYZj98RiFLedUYwu84D9xNqwmztRRqPb6K21Jcom2MzqMPVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3-subunit: upgrade 1.4.2 -> 1.4.4
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:27:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193833

Thanks, looks good!

Alex

On Tue, 16 Jan 2024 at 00:54, wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update:
>  change License file to COPYING.
>  add BSD-3-Clause to LICENSE
>
> Changelog:
> ===========
> * Removed use of deprecated "utc" and "utcfromtimestamp"
>   methods of "datetime.datetime".
> * Fix an issue with date parsing exception handling
> * Add support for Python 3.12
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-subunit_1.4.2.bb => python3-subunit_1.4.4.bb}  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python3-subunit_1.4.2.bb => python3-subunit_1.4.4.bb} (55%)
>
> diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.2.bb b/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
> similarity index 55%
> rename from meta/recipes-devtools/python/python3-subunit_1.4.2.bb
> rename to meta/recipes-devtools/python/python3-subunit_1.4.4.bb
> index a018ef1dc8..db5fecf921 100644
> --- a/meta/recipes-devtools/python/python3-subunit_1.4.2.bb
> +++ b/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
> @@ -1,12 +1,12 @@
>  SUMMARY = "Python implementation of subunit test streaming protocol"
>  HOMEPAGE = "https://pypi.org/project/python-subunit/"
>  SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=909c08e291647fd985fbe5d9836d51b6"
> +LICENSE = "Apache-2.0 | BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;beginline=1;endline=20;md5=b1121e68d06c8d9ea544fcd895df0d39"
>
>  PYPI_PACKAGE = "python-subunit"
>
> -SRC_URI[sha256sum] = "2988d324d55ec35dd037e502e3f74ac38f4e457bd44ee0edf5e898f7ee1134d4"
> +SRC_URI[sha256sum] = "1079363131aa1d3f45259237265bc2e61a77e35f20edfb6e3d1d2558a2cdea34"
>
>  inherit pypi setuptools3
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193805): https://lists.openembedded.org/g/openembedded-core/message/193805
> Mute This Topic: https://lists.openembedded.org/mt/103752116/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

