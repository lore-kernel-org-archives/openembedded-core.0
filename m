Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C28C49EA1
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 13:19:20 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.7052.1722950357287044737
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 06:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K+KFFjxn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-36868fcb919so449637f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 06:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722950355; x=1723555155; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uygbnV4RHIQIeSMVRFvX2w+mciAbVu1D5UCOFoY2K/M=;
        b=K+KFFjxnaSjQmB8LrkC6CuyBjbJjugCizLvIita2jLaFHB5XRdIfQQTD+iey896u7x
         wRhjriN9fbglEiTV5OxuHEDTL7jnPW9A6VIhDxvhBMAC8Xw5C8OdOh6gLT+klLa1QIL6
         gUbeWwsKxslEY927k9thaIy57rh2uCF2ycxUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722950355; x=1723555155;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uygbnV4RHIQIeSMVRFvX2w+mciAbVu1D5UCOFoY2K/M=;
        b=vtkUQBZ3RIzwdKdzH56ldKLhJwkvi6wcFdW/4D1IgbYKrra1SEiqgQuPK+4RfpCvNG
         bl8JFDABKQIMTCvtu3GUUv8L5gJJiM/w0UBhKun7GOqT7nCh6dbsKlRqk/5Z/oavaN8s
         yvxxJP6wOdrEJYpFkAvSAgxgzJGf8/PYx4Y+S7Oh0JoE7t7dL1f1dgpcP7mwNdI8dmwJ
         Y+t4+oZomz8rL5BOdBNmVMqMr6DEjtuKIIhoQd97KIMHM7JdRUuPt6kzMSmtiPEeClA2
         En2q5G5VkxTj5Kc/s4f+WOFzHjcVjgRPPhMtCd2wN6rtG8aT0UIndT8+HWXFePSU61we
         uBmQ==
X-Gm-Message-State: AOJu0Yz4BcsYIzcYXsqyp7a/MhBpmiXIYDdMV6zuJWmyY/6bJgD37BdN
	3ybe4qbVrViRkPPJhGfnt5qhuAAN6b+8JkOfqkLexAESqNorO5zuWHdfCdlljDQ=
X-Google-Smtp-Source: AGHT+IEKNYBPn05eq0tSrDfjrqj4OqYfCYpJwrNl2g9UYQtvRI1JmINtFmnhNqwQsP9QudwqQ4B6EQ==
X-Received: by 2002:a05:6000:12ce:b0:367:9769:35b0 with SMTP id ffacd0b85a97d-36bbc0f7b7fmr9727801f8f.4.1722950355422;
        Tue, 06 Aug 2024 06:19:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeae:cd04:92c6:bd93? ([2001:8b0:aba:5f3c:aeae:cd04:92c6:bd93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd013fc1sm13027313f8f.38.2024.08.06.06.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 06:19:14 -0700 (PDT)
Message-ID: <ebdbece797d4ac7bf52356b91d3d43303360fdea.camel@linuxfoundation.org>
Subject: Re: [PATCH] musl: Show error when used with multilibs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, "Richard Purdie via
 lists.openembedded.org"
 <richard.purdie=linuxfoundation.org@lists.openembedded.org>
Date: Tue, 06 Aug 2024 14:19:14 +0100
In-Reply-To: <CAMKF1so-nQMsj6of8XWgnAs-yHpR7WY59MvennvxSpnBOxAP9Q@mail.gmail.com>
References: <20240806094623.38564-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1so-nQMsj6of8XWgnAs-yHpR7WY59MvennvxSpnBOxAP9Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 13:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203024

On Tue, 2024-08-06 at 06:01 -0700, Khem Raj wrote:
>=20
>=20
> On Tue, Aug 6, 2024 at 2:46=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > From: "Richard Purdie via lists.openembedded.org"
> > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org>
> >=20
> > As discussed in the bugzilla entry, musl doesn't work with
> > multilibs.
> >=20
> > I originally sent this patch in 2020 but was told that support was
> > being
> > added. I recently revisited the bug and retested a basic config
> > which still
> > fails the way it did in 2019. Since clearly nobody is using this,
> > make it clear
> > we don't support it. If anyone does add support, we can remove this
> > error very
> > easily.
> >=20
> > [YOCTO #13122]
> >=20
>=20
>=20
> I am ok with patch in general. What is triggering it in your testing
> now=C2=A0
>=20

See the bug:

MACHINE =3D "qemuarm64"
TCLIBC =3D "musl"
require conf/multilib.conf
MULTILIBS =3D "multilib:lib32"
DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7ahf-neon-vfpv4"
IMAGE_INSTALL:append =3D " lib32-libgcc lib32-libstdc++ python3-core lib32-=
python3-core"

and running "bitbake core-image-minimal" results in:

Error: Transaction test error:
  file /usr/bin/ldd conflicts between attempted installs of musl-1.2.4+git0=
+79bdacff83-r0.cortexa57 and lib32-musl-1.2.4+git0+79bdacff83-r0.armv7ahf_n=
eon_vfpv4
  file /usr/include/python3.12/pyconfig.h conflicts between attempted insta=
lls of lib32-python3-core-3.12.4-r0.armv7ahf_neon_vfpv4 and python3-core-3.=
12.4-r0.cortexa57

Cheers,

Richard


