Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAC8C7EE23
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 17:26:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.24242.1677259603665818115
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 09:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ko/xadzp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so2185684wmq.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 09:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TugR9fZTjA5q0qra/gSUTeNQSoK9Nef07ayuSiwqj4o=;
        b=Ko/xadzp7BKHpfPdk6iUQQFmZ6oTWAa19rN3C3CPNtADpH3/jbJa77U9PP67LwoCvV
         KaJw9QCnjgLs+9PLfpAZcTR1Xa9KMIxBlRG2/DSnGmt57vaJqyjD0zLe/RpRT0O/CUyA
         Lbfqj80JXgkQsi1/U2QuZ/IuuQD6fU4djoYuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TugR9fZTjA5q0qra/gSUTeNQSoK9Nef07ayuSiwqj4o=;
        b=UcOIHvCi7xYQFqdM4brvcvMuu/Nw34HVKbvs5qJAK/IgyFqK3i3ORaojtxKQ+Be0oF
         6Rcmwb8W+8c0IO1kxJ4QBY04URTS3YlJ8TIj3P92yeJHpgLaTFR6je/ZJcjIggl0w4Cc
         SkY2Mya405nZY/IRnnG+csVRDR2Kad2Z//cMwjUtjVvTwCQvW9pJp0thOXo95I/YvHij
         z0jf0dzeI1IiGhgDnkm2F+gClpr2aEBCS/TsPSQfpR/wnNjm1vPX5TffikWj4fmKEwE1
         4pLc9RcOr53m/eCiFBTG8W971jEcWtdCk6TuBjbuKYRMapk36zKmuHHhQNGuBifRARSU
         In9g==
X-Gm-Message-State: AO0yUKXIUQSFyUcQDissIgWtldvnKpdle5CznGUrJSm7N3JMv8CrP6hs
	TKryTHpSrtnD1oomuJGiFUMOGQ==
X-Google-Smtp-Source: AK7set9ISvTsI/PPiB7TUn/+hVSOeS+wOgDDGEsOiHEsIMzb8Zq0i46teWafozFkmfTeiir9j43RBQ==
X-Received: by 2002:a05:600c:492f:b0:3e2:6ec:7fbe with SMTP id f47-20020a05600c492f00b003e206ec7fbemr12129399wmp.40.1677259601844;
        Fri, 24 Feb 2023 09:26:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7? ([2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7])
        by smtp.gmail.com with ESMTPSA id m4-20020a05600c4f4400b003e209b45f6bsm3852249wmq.29.2023.02.24.09.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:26:41 -0800 (PST)
Message-ID: <7223e8f9003baf91223e5ed7555d491066f0ba3a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 03/11] build-appliance-image: add support for
 qemu
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2023 17:26:40 +0000
In-Reply-To: <1746CE49489610B4.29542@lists.openembedded.org>
References: <20230221204445.23931-1-twoerner@gmail.com>
	 <20230221204445.23931-4-twoerner@gmail.com>
	 <1746CE49489610B4.29542@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 17:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177706

On Fri, 2023-02-24 at 16:05 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2023-02-21 at 15:44 -0500, Trevor Woerner wrote:
> > Add ext4 explicitly to the list of IMAGE_FSTYPES so the build appliance=
 can be
> > run with runqemu.
> >=20
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  meta/recipes-core/images/build-appliance-image_15.0.0.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b=
/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > index 064e7a1ed82f..e28096758b9b 100644
> > --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > @@ -1,5 +1,5 @@
> >  SUMMARY =3D "An image containing the build system itself"
> > -DESCRIPTION =3D "An image containing the build system that you can boo=
t and run using either VirtualBox, VMware Player or VMware Workstation."
> > +DESCRIPTION =3D "An image containing the build system that you can boo=
t and run using any of qemu, VirtualBox, VMware Player or VMware Workstatio=
n."
> >  HOMEPAGE =3D "http://www.yoctoproject.org/documentation/build-applianc=
e"
> > =20
> >  LICENSE =3D "MIT"
> > @@ -20,7 +20,7 @@ IMAGE_ROOTFS_EXTRA_SPACE =3D "41943040"
> >  APPEND +=3D "rootfstype=3Dext4 quiet"
> > =20
> >  DEPENDS =3D "zip-native python3-pip-native"
> > -IMAGE_FSTYPES =3D "wic.vmdk wic.vhd wic.vhdx"
> > +IMAGE_FSTYPES =3D "ext4 wic.vmdk wic.vhd wic.vhdx"
> > =20
> >  inherit core-image setuptools3
> > =20
>=20
> I've held off this one since whilst it isn't wrong as such, the ext
> images aren't exactly optimal. I think our hope was that we could use
> the vmdk or vhdx images with qemu instead and then directly test the
> ones we publicly share. Do you know if that could work? It may then
> mean people don't need to handle multiple files too?

I quickly tried:

qemu-system-x86_64 tmp/deploy/images/qemux86-64/build-appliance-image-qemux=
86-64.wic.vmdk -enable-kvm

and it nearly works (splash screen displayed but then went blank) so I
suspect runqemu could likely learn to run these relatively easily.

Cheers,

Richard




