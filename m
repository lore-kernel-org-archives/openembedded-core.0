Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC28C63797
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 11:14:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.164089.1673867662471654154
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 03:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PdqtgAV8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id o17-20020a05600c511100b003db021ef437so493923wms.4
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 03:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/XENtzOAzM787IMkmHXObG/lYcd4WX+BKvCKEnyOSQ=;
        b=PdqtgAV8xQV1pqRqygXY/dDyMUKfFi1vJado9W6sBksMhr4Hh6nJiuypSIPPLMJ1NW
         6F9g5FIEnpO6RkFAMgpWEItPTK7fVLypqDmMWg998TD4DUcuRGvnykSo1lcQxpWK5cil
         ZUe22RIOsLV17x7GVb4Wm8TFRGgz2txTpsx6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X/XENtzOAzM787IMkmHXObG/lYcd4WX+BKvCKEnyOSQ=;
        b=LbMRzfAtR52pw6ocyDnoh01zfRaOKjJohkZh+HfRNBPgiId/B6Y4Z6UYDxGgmml6SQ
         PNWMfX4pD6TMnzBQ+ko0hjpBeOYslx8m25FyClU+bJXh6D0hX2KhPQDyt85xcBjXCEY9
         9VnqU07Ej1iQN37aNuNGWHj4TFNOzwopngFY+ZH5XKieZeBOdDF8y5F8HRR46sfV6SWv
         UlVv7qu0KfaDwQvrKuOmlNVRA+0xopmjiITXPdJNBpOeJdhwCMHe6eZrIaYrBn4rotua
         rgf4DHuWfdPaOS6YE7yM3Qo7tZhmh3SrhgmCKLoD1/otsdrkXs3twRFT58Uf/QdqZAZT
         CmnA==
X-Gm-Message-State: AFqh2koR29H7Wk2jr5iDoaa8CWVSfJP2t2wAD0XS/m3qZbU/mMhDdKC4
	ghyejT8LbFemIDZECGUuCTDl0Q==
X-Google-Smtp-Source: AMrXdXs34aUbH/N/3ahr7ZCHod7hJYJyfLCqDAwsJrTUCGNK7k8m+SEyG2Uw0R/s16JP//n+oiU+YA==
X-Received: by 2002:a05:600c:601e:b0:3d0:7fee:8a70 with SMTP id az30-20020a05600c601e00b003d07fee8a70mr69468300wmb.19.1673867660849;
        Mon, 16 Jan 2023 03:14:20 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a31:564c:3393:642? ([2001:8b0:aba:5f3c:2a31:564c:3393:642])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c314e00b003d9fa355387sm21751710wmo.27.2023.01.16.03.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 03:14:20 -0800 (PST)
Message-ID: <729210c666036a1fe57866f8b10326a9768873a9.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on
 nativesdk-file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2023 11:14:19 +0000
In-Reply-To: <173AC3E18715B47D.23170@lists.openembedded.org>
References: <20230116084809.16470-1-Qi.Chen@windriver.com>
	 <173AC3E18715B47D.23170@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 11:14:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175974

On Mon, 2023-01-16 at 10:39 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2023-01-16 at 16:48 +0800, Chen Qi wrote:
> > For now, running `file' inside SDK errors out.
> >   file: could not find any valid magic files!
> >=20
> > This is because nativesdk-rpm exports MAGIC. So let's
> > make nativesdk-rpm depend on file for better user
> > experiences.
> >=20
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/recipes-devtools/rpm/rpm_4.18.0.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb b/meta/recipes-dev=
tools/rpm/rpm_4.18.0.bb
> > index 8eb0ab207e..3b7d4d640a 100644
> > --- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> > +++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> > @@ -188,6 +188,7 @@ PROVIDES +=3D "python3-rpm"
> >  FILES:python3-rpm =3D "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
> > =20
> >  RDEPENDS:${PN}-build =3D "bash perl python3-core"
> > +RDEPENDS:nativesdk-rpm +=3D "nativesdk-file"
>=20
> Should we be adding file to ${PN}-build instead?  Which rpm command was
> this with? Does anywhere else in rpm have/need this dependency?

To answer my question, the problem is that as well as the rpm wrappers,
the code also sets MAGIC=3D from an environment setup file.

At the very least, the RDEPENDS needs a class-nativesdk override in
there as otherwise it is floating around unconditionally.

I don't really like adding workarounds like this since we won't
understand them at some future date.

Other solutions might include:

a) patching RPM to use RPM_FILEMAGIC instead of MAGIC so we can set it
in a more granular way
b) moving the environment setup piece for MAGIC to nativesdk-file so it
is only used if file is installed in the SDK
c) fixing rpm (or file?) to dynamically relocate the paths it is using

Can we see if there is a better solution we can switch to please?

Cheers,

Richard






