Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7840C27C40
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 22:26:22 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.52323.1700691972770096955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 14:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dFEODMAs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40b358f216dso978535e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 14:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700691971; x=1701296771; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nccle+TrjYn+bdmqZSCJ/NiEfMfUXovMN9LrSn1w18=;
        b=dFEODMAs807zSItY8TEaWKJIHHjucuN9DxP0TyJ3MbqUqI/gklxnq87IOG4d5EvMws
         HnVPyoTetWCGhy8e1a6NYuboVaac56KtwWX2OME8xi4ek31OKFFvm8aVwO0lLnZVXT4C
         BZLesnnSelqRKmRVHxucEasIvjB2KCv8m/uo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700691971; x=1701296771;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4nccle+TrjYn+bdmqZSCJ/NiEfMfUXovMN9LrSn1w18=;
        b=ksiRorj9uWxubQ9NbMlGeId31YEN29mZnV+vyFKaK4pN6dH6uGq0u4Q22wNK8e/4Up
         tQWjeeZoEOQAGXzfcJcqv0g3nONg4AYXb/pBIh8bR3aIMgZSwPnh1WWo4lhVZLV1+4DN
         0LiCPAiP8XQhNyPfVOCUoyeIkWR1tNCOAlhCB22GelR3UjSfA/QqR51X3Q9SM7M4GICG
         iAsyCKZJPj8Unwfcod1MXKhafwhvP3qixrYsI0S4/VF/bLD3+cU/Pvdz7P/tTXuFu0zL
         AffuPWpwpFq9ydbUaaIkfQl5QLtOInKgThyTizcBsSNkJ56igLejmbP0TjAl3TAPDkmz
         jk1g==
X-Gm-Message-State: AOJu0Yw9N7N78LxZfCIv0Mes4q6UjwTUlrMO8cH2UEnN0d8f19yOVByg
	idHe/f/8VmLAWkpeYioleUfiPA==
X-Google-Smtp-Source: AGHT+IEyG7JvrXg0MNM0PNEUs75/eTwx8yRAACLSX/Od2m2L8lHm3OPyhH91PvfB/hOY045QJpr0Xg==
X-Received: by 2002:a05:600c:4e8e:b0:40b:2ada:fed0 with SMTP id f14-20020a05600c4e8e00b0040b2adafed0mr2920100wmq.20.1700691971201;
        Wed, 22 Nov 2023 14:26:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c511:4d31:367c:ab3c? ([2001:8b0:aba:5f3c:c511:4d31:367c:ab3c])
        by smtp.gmail.com with ESMTPSA id o36-20020a05600c512400b0040596352951sm740417wms.5.2023.11.22.14.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 14:26:10 -0800 (PST)
Message-ID: <c05e72b51eb7f0283645f525976d5b2033587ee1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 20/21] populate_sdk_ext.bbclass: add
 *:do_shared_workdir to BB_SETSCENE_ENFORCE_IGNORE_TASKS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2023 22:26:09 +0000
In-Reply-To: <606a01cbb1f1d6608093260692d9d299218074b7.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
	 <606a01cbb1f1d6608093260692d9d299218074b7.1700600804.git.martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 22:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191125

On Wed, 2023-11-22 at 13:44 +0100, Martin Jansa wrote:
>  meta/classes-recipe/populate_sdk_ext.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-=
recipe/populate_sdk_ext.bbclass
> index f209becae1..5705140359 100644
> --- a/meta/classes-recipe/populate_sdk_ext.bbclass
> +++ b/meta/classes-recipe/populate_sdk_ext.bbclass
> @@ -366,7 +366,7 @@ def write_local_conf(d, baseoutpath, derivative, core=
_meta_subdir, uninative_che
>              f.write('BB_HASHCONFIG_IGNORE_VARS:append =3D " SIGGEN_UNLOC=
KED_RECIPES"\n\n')
> =20
>              # Set up which tasks are ignored for run on install
> -            f.write('BB_SETSCENE_ENFORCE_IGNORE_TASKS =3D "%:* *:do_shar=
ed_workdir *:do_rm_work wic-tools:* *:do_addto_recipe_sysroot"\n\n')
> +            f.write('BB_SETSCENE_ENFORCE_IGNORE_TASKS =3D "%:* *:do_shar=
ed_workdir *:do_rm_work *:do_deploy_links wic-tools:* *:do_addto_recipe_sys=
root"\n\n')
> =20
>              # Hide the config information from bitbake output (since it'=
s fixed within the SDK)
>              f.write('BUILDCFG_HEADER =3D ""\n\n')

The subject says "add do_shared_workdir" but the code change is
actually "add do_deploy_links".

This caught my eye in my inbox as the shared_workdir task can be
painful!

Cheers,

Richard

