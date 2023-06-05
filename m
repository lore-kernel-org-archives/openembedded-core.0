Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849E6C77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 21:25:41 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.2341.1686000331202027593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 14:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=RUK8K2hp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f6a6b9c079so45376805e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 14:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686000329; x=1688592329;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IMJtUEPRnZWhbi67ip0wor4FONewAWzdyO/SD9YRzI=;
        b=RUK8K2hp3leihCYTbwtKW9P4Qf/e/LGHspmTSXQ08rtGeqTDN9EsecY/cf8VIMPtDf
         K+d5eejUSfK3Jg9c1AQ+DxMG2wKzUqq60Kf9ej4qNujBFauHX0xIVeQ3G+IkaNropZw2
         0MIMSbAOwwNhi5iD5TlMqWJeznWcyBWT/xazk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686000329; x=1688592329;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0IMJtUEPRnZWhbi67ip0wor4FONewAWzdyO/SD9YRzI=;
        b=lrPTT2NTWObASjuKSEZeNb5OohZ5nSOxR5sa+myvICRq55iGL36AqddQ6YNIVQYcAM
         kcrc8gg0IiEcAmBwuC8OAlKNvE7Kfl9tVvzMVrbH6wZCOqO6lCCbhPaJM0RIUVdQT3ae
         YM0kfsNmlEasy/y/Jc0tcfEb3bNMVWx7IC8jycJpoKUdLxhfyri66KK0brBMLXQMU2T5
         zTVuGYaLbco/gnnwxrFIW9tPQQjiZwtxv1B43X/cqdOxPhbKoZxWB0qGpzGaRYT2713N
         vW9ZIfOoYjy/1ln4FkjhQScbRnrIwG4iiL8aJ13OEp2zbosNHOf1re4a+5mk7sxwXMWp
         qmZQ==
X-Gm-Message-State: AC+VfDxpdn1qiKB18KOq6yM9QRTVMScLBSF4+7lcztHDbR4ObTeazuMN
	QaUx294dYZQzu7tKyLwvaqxt0w==
X-Google-Smtp-Source: ACHHUZ4Y6lFC59slPgaJwqx38T7ULowEloP6EHucDWxmgLiCnmvJ+7kz/EvYQ09hWOOjX9t9noZqNw==
X-Received: by 2002:a7b:cd0d:0:b0:3f6:13bb:f00b with SMTP id f13-20020a7bcd0d000000b003f613bbf00bmr324829wmj.8.1686000329588;
        Mon, 05 Jun 2023 14:25:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7f10:3282:4c2:7240? ([2001:8b0:aba:5f3c:7f10:3282:4c2:7240])
        by smtp.gmail.com with ESMTPSA id o31-20020a05600c511f00b003f1978bbcd6sm295094wms.3.2023.06.05.14.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 14:25:29 -0700 (PDT)
Message-ID: <1be559aa9d7bff8352de4c7677636712e371e0e2.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] libpam: upgrade 1.5.2 -> 1.5.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 05 Jun 2023 22:25:28 +0100
In-Reply-To: <20230605145724.294860-1-tgamblin@baylibre.com>
References: <20230605145724.294860-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 21:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182400

On Mon, 2023-06-05 at 10:57 -0400, Trevor Gamblin wrote:
> Changelog: https://github.com/linux-pam/linux-pam/releases/tag/v1.5.3
>=20
> The following patch files were removed because they are in v1.5.3:
>=20
> 0001-run-xtests.sh-check-whether-files-exist.patch
> 0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch
> CVE-2022-28321-0002.patch
>=20
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  ...rely-on-all-filesystems-providing-a-.patch | 108 ---------
>  ...-xtests.sh-check-whether-files-exist.patch |  65 ------
>  .../pam/libpam/CVE-2022-28321-0002.patch      | 205 ------------------
>  .../pam/{libpam_1.5.2.bb =3D> libpam_1.5.3.bb}  |   5 +-
>  4 files changed, 1 insertion(+), 382 deletions(-)
>  delete mode 100644 meta/recipes-extended/pam/libpam/0001-pam_motd-do-not=
-rely-on-all-filesystems-providing-a-.patch
>  delete mode 100644 meta/recipes-extended/pam/libpam/0001-run-xtests.sh-c=
heck-whether-files-exist.patch
>  delete mode 100644 meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.=
patch
>  rename meta/recipes-extended/pam/{libpam_1.5.2.bb =3D> libpam_1.5.3.bb} =
(95%)

I think but haven't 100% confirmed this causes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/131/builds/2608
https://autobuilder.yoctoproject.org/typhoon/#/builders/131/builds/2608

Cheers,

Richard

