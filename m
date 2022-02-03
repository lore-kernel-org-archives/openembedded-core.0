Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA405C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 15:01:58 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.10177.1643900517945835125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 07:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jzGR9LcE;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id d10so9701442eje.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 07:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g+9re6ZqSZVTOThkysaqaRyLGTSFJs3oYAsserviNeg=;
        b=jzGR9LcEbyoycB9LUucqHLWtf82BSQ+jdwwic72P0+/oTVTFX4/ig93jnemPyAyLvm
         EJiV0x8SU/iJvAZTw56snqt5GHMyw/PrKVXVAmRfp23AkB1n7hqbpb6wN0LQ+uu5kA1K
         m/jztdwXhpDiJfaNIrMJ/crukBgkigTfVv4xSwMEAccz6YZF5rpthHxcy3nCB6c8lOLz
         v1w/7nXheOcqwb7Ww5eB5y8PFjUX2uEKgGUYQV1+/paiUPR5rUqZHEZgcLGnqRWqwCyS
         +jeMBGWV2ywDjsuKosuPSG7M7FMETcXWikLHUORLpEMHYr+4KsEvs3A/2fb4H9fyolV2
         t1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g+9re6ZqSZVTOThkysaqaRyLGTSFJs3oYAsserviNeg=;
        b=V54hfZPvcUgG7VCvoEiP3Ze4jAwWEZAvHczWJVb6yoDenqw+J4C1aoZXZma4v2UgUz
         rTqlARgzrZttW1BnugR2zadrnUHIpTc/LycXAEh4ehwKVcQnM4YW99LgEeCQdK3lIZ0R
         PFT19/tMIuOWIEasB2od5XABX+CCqf9G2fjUUGvH5q1vxfpHOtTsW3eSU9WyV9+/e9RG
         ly9mBaqfG2pXqEhHlrdm/5umwyi+JZStHGdO+A+Cl24DdTlgsAPRMsi+pE+O8yhGpp4V
         vlJiQ4/ZerHojAoMOVAz/AliqFcLtIe7nrUtOKXwQGAl+ZBfF5uw/XUaetp8vw1WH6PQ
         97aQ==
X-Gm-Message-State: AOAM5306/5ySkFv24Ei69SQ1vv0A5sl86/qQH6XU8f1uuC9P0unbi4Kc
	dqerQQoglIb21mS0vAorwTWXO7TynjRFqThlTmd5Ww==
X-Google-Smtp-Source: 
 ABdhPJxpMNnE4Wh0OVAgBUDDZZVrMwBp1yeeMxq5fNt1GSmKokEIQZ1FanRREoF5oOgh6htg8EybhEwaUUX96MNn0Z8=
X-Received: by 2002:a17:907:3f8b:: with SMTP id
 hr11mr29921695ejc.602.1643900516289;
 Thu, 03 Feb 2022 07:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20220201072831.34695-1-nishaparrakat@gmail.com>
 <20220201072831.34695-4-nishaparrakat@gmail.com>
In-Reply-To: <20220201072831.34695-4-nishaparrakat@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 3 Feb 2022 05:01:45 -1000
Message-ID: 
 <CAOSpxdYp65KQY8KZ4x7zo3YCZHsBxA3o2fKzbMk0YJdOe3Q85w@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH 4/8] e2fsprogs: Use specific BSD
 license variant
To: Nisha Parrakat <nishaparrakat@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Joshua Watt <jpewhacker@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nisha Parrakat <nisha.m.parrakat@bmw.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 15:01:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161288

On Mon, Jan 31, 2022 at 9:28 PM Nisha Parrakat <nishaparrakat@gmail.com> wrote:
>
> From: Joshua Watt <JPEWhacker@gmail.com>
>
> Make the license more accurate by specifying the specific variant of BSD
> license instead of the generic one. This helps with SPDX license
> attribution as "BSD" is not a valid SPDX license.
>
> (From OE-Core rev: 966fb77981e4fed0ab7998439940b1e05dd0ee43)
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs.inc | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> index 45fb9720ee..08fb30fc71 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> @@ -3,12 +3,12 @@ DESCRIPTION = "The Ext2 Filesystem Utilities (e2fsprogs) contain all of the stan
>  fixing, configuring , and debugging ext2 filesystems."
>  HOMEPAGE = "http://e2fsprogs.sourceforge.net/"
>
> -LICENSE = "GPLv2 & LGPLv2 & BSD & MIT"
> -LICENSE_e2fsprogs-dumpe2fs = "GPLv2"
> -LICENSE_e2fsprogs-e2fsck = "GPLv2"
> -LICENSE_e2fsprogs-mke2fs = "GPLv2"
> -LICENSE_e2fsprogs-tune2fs = "GPLv2"
> -LICENSE_e2fsprogs-badblocks = "GPLv2"
> +LICENSE = "GPLv2 & LGPLv2 & BSD-3-Clause & MIT"
> +LICENSE:e2fsprogs-dumpe2fs = "GPLv2"
> +LICENSE:e2fsprogs-e2fsck = "GPLv2"
> +LICENSE:e2fsprogs-mke2fs = "GPLv2"
> +LICENSE:e2fsprogs-tune2fs = "GPLv2"
> +LICENSE:e2fsprogs-badblocks = "GPLv2"

Note that the new override syntax is trying to sneak in here.  I've
corrected this.

Steve

>  LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
>                        file://lib/ext2fs/ext2fs.h;beginline=1;endline=9;md5=596a8dedcb4e731c6b21c7a46fba6bef \
>                        file://lib/e2p/e2p.h;beginline=1;endline=7;md5=8a74ade8f9d65095d70ef2d4bf48e36a \
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161148): https://lists.openembedded.org/g/openembedded-core/message/161148
> Mute This Topic: https://lists.openembedded.org/mt/88827820/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

