Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63000CA5535
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 10:23:04 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.8429.1694600580799639274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 03:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YadzE+Xz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-402d0eda361so77430515e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694600579; x=1695205379; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIhinbwRYwtZE6Rmnym5ufKs/zhgHrAi6i3HgBzthsY=;
        b=YadzE+XzZiOAdTCQ8UDGZ2U//y8Fucc4+pvpPDSXd/cU54LeVDZf81zFmWfqOlrnbZ
         gEc+Zej7VcUWtmcHrdeiif3SwujhiqWseO/J1EVAImgKH6yBSJh37jcejVPhwPlCqDDK
         7AsZZAiPKo/0kMsO4t57q6u8TJ0O7932eu5C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694600579; x=1695205379;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIhinbwRYwtZE6Rmnym5ufKs/zhgHrAi6i3HgBzthsY=;
        b=ADMpl2MqEPkx52JUSi8C7Lm2UGkl6OHOAbqwODMvoEsrmTolDG6mLszvranaOWfvC9
         /o6VhiOCyQ0h906ehXpfN6jWtjt2k1cpzvTLo/QSMbOgjev9CKPmddeaMFNngsNWHthP
         ijvJTks+ZiFHBxOvEPSpDkEcd2qWuO82SiLXZZOhzBDy6LSE85IiORpdFl4LJrRNS6B+
         EroAJi5MXaz+F/IFYRi15IyI2Al9HHDSPuKtISbwFy3bQV5kDBouPfA7lfT1AVc5gb4+
         UJHefKXTqTrsR4B4HCsdt0qgu3fyLVeEedy/fDqS/DghditMWcmKu8fsxYxMsV4oNbtr
         GbEw==
X-Gm-Message-State: AOJu0YwUCy2FN6g3enjqXVzkSmf6gsFnBJ6o4kxLsmCmPVa8xn8p5lWi
	CuDkU3qgyUWE63eMOtu+1wlFAQ==
X-Google-Smtp-Source: AGHT+IGyGZgFvpx+BQji1Ifd+pkNmGRFWw2BdILW9HxskT4O7kGEy8o1Rqv7nK21GrlNtHcl2ZVp7w==
X-Received: by 2002:a05:600c:290:b0:3fe:2011:a7ce with SMTP id 16-20020a05600c029000b003fe2011a7cemr1786571wmk.6.1694600578863;
        Wed, 13 Sep 2023 03:22:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a8:4888:9029:4207? ([2001:8b0:aba:5f3c:2a8:4888:9029:4207])
        by smtp.gmail.com with ESMTPSA id c23-20020a7bc857000000b003fefb94ccc9sm1591903wml.11.2023.09.13.03.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 03:22:58 -0700 (PDT)
Message-ID: <785b074c8225194393224160acba05fe934c36fe.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] btrfs-tools: upgrade 6.3.3 -> 6.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2023 11:22:57 +0100
In-Reply-To: <1694597302-21193-1-git-send-email-wangmy@fujitsu.com>
References: <1694597302-21193-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 10:23:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187581

On Wed, 2023-09-13 at 17:28 +0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * crc32c implementation speedup (3x)
> * btrfstune:
>    * be more strict about option combinations and refuse changing
>      features from incompatible groups
>    * metadata_uuid changes fixes
> * libbtrfs: fix ABI breakage introduced in 6.3.1, revert struct subvol_in=
fo
>   and subvol_uuid_search changes
> * CI updates
>    * pull request build tests enabled
>    * published static binaries built with backward compatibility (-march=
=3Dx86-64)
> * other
>    * documentation updates
>    * new and updated tests
>    * experimental feature updates (json, list-chunks, checksum switch)
>    * code refactoring
>    * remove btrfs-fragments
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../btrfs-tools/{btrfs-tools_6.3.3.bb =3D> btrfs-tools_6.5.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.3.3.bb =3D> btrf=
s-tools_6.5.bb} (98%)
>=20
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb b/met=
a/recipes-devtools/btrfs-tools/btrfs-tools_6.5.bb
> similarity index 98%
> rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
> rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.bb
> index e7a64e8363..984966bbd4 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.bb
> @@ -18,7 +18,7 @@ DEPENDS =3D "util-linux zlib"
>  SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-p=
rogs.git;branch=3Dmaster;protocol=3Dhttps \
>             file://0001-Add-a-possibility-to-specify-where-python-modules=
-ar.patch \
>             "
> -SRCREV =3D "bb0ca35245858f17a6ced97aade1dd8d70f9c9d7"
> +SRCREV =3D "f7ecc34555b4793573c9e3fc5f77cc8aab63fcc1"
>  S =3D "${WORKDIR}/git"
> =20
>  PACKAGECONFIG ??=3D " \

https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6671/ste=
ps/11/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/7641/step=
s/11/logs/warnings

Cheers,

Richard



