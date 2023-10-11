Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B67ACDB482
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 21:39:24 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.29014.1697060361563838476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 14:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KQjWJwWy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-32329d935d4so279179f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 14:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697060360; x=1697665160; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7c7Yx6aNyYXnifetEwsQCNOG8uC0+NaizFHPehQDlEg=;
        b=KQjWJwWymxhbpnP289q6IXOatXL7FENeHlqfM+dY7Npyg/fQUbqC0RkukIi5uECngm
         Sl1nU3JsxSuQKJfPyrEr55MNaPD9Won1smY+FuHLV7vcdRoYQrneigA2LidrWappnmxs
         6h94T823qIOcxi5X83aEmj9RN0cuCUVPoDDJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697060360; x=1697665160;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7c7Yx6aNyYXnifetEwsQCNOG8uC0+NaizFHPehQDlEg=;
        b=QKrPOzrD7lsBIq9dJBSs6lhYfZjzzHXrWtARWLZbzcLmaMi2w+z+dnz7LQ5Fgr5Q2N
         ZZr2GblMVmTuTaRdLCttXRX2EEFnIATS0R+fjIhBC5G0rP6/jCIk3Wc9TaV4n6xnRYve
         gpVDuX6AAog2RhnIdxwLNBXs2hcOPcUSacMcBuTC0it3HPuPYA6erkFg8GGxGWHt/eZI
         LNTvYwFaaRXtzaTRc20JprM13beWqpQaMrPvbUvqrooewaQUuTOEjgSVTovRq0V8cjPD
         MY3vAUQTe+y1lzToctiXsj2mSauXrDGE5kTYHKmRY0no3VNDIXJKGcQkhTTuZCwl+XIX
         DnLQ==
X-Gm-Message-State: AOJu0YxiGMxi30Ledu93+HkfG0Coe19+9JcatqsZ6CQEgolVNGwBtmo3
	E96P1nPNahZerxZbbfbSeK1rCg==
X-Google-Smtp-Source: AGHT+IHGbg4/Q7q9T4Wz/c4hY+XUmtHDho3FMsNS49DurOFUSNCR5A3mepGQc1YXm1Q9otrprxwXvA==
X-Received: by 2002:adf:db50:0:b0:31f:6524:2de1 with SMTP id f16-20020adfdb50000000b0031f65242de1mr19382261wrj.32.1697060359913;
        Wed, 11 Oct 2023 14:39:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:37b5:155b:a41f:f969? ([2001:8b0:aba:5f3c:37b5:155b:a41f:f969])
        by smtp.gmail.com with ESMTPSA id v3-20020adfa1c3000000b0032d8354fb43sm3231574wrv.76.2023.10.11.14.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:39:19 -0700 (PDT)
Message-ID: <474cb08bfb46afd366961f474f7984a9f9836feb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] qemux86/qemuarm: Drop kernel version
 overrides
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2023 22:39:18 +0100
In-Reply-To: <8f92775b-e01e-4505-9fba-252ddd1a8315@linux.microsoft.com>
References: <20231006113641.3248432-1-richard.purdie@linuxfoundation.org>
	 <20231006113641.3248432-2-richard.purdie@linuxfoundation.org>
	 <8f92775b-e01e-4505-9fba-252ddd1a8315@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 21:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188972

On Tue, 2023-10-10 at 19:11 -0600, Alejandro Enedino Hernandez
Samaniego wrote:
> =C2=A0
>=20
> =C2=A0
> =C2=A0
> On 10/6/23 05:36, Richard Purdie wrote:
> =C2=A0
> =C2=A0
> > =C2=A0
> > Drop the version overrides for the kernel for the x86 and arm
> > machines
> > so we can go back to following the distro versions. The reasons for
> > these versions is mostly historical at this point as the issues
> > were
> > resolved.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/conf/machine/include/x86/x86-base.inc | 1 -
> > =C2=A0meta/conf/machine/qemuarm.conf             | 4 ----
> > =C2=A0meta/conf/machine/qemuarmv5.conf           | 1 -
> > =C2=A03 files changed, 6 deletions(-)
> >=20
> > diff --git a/meta/conf/machine/include/x86/x86-base.inc
> > b/meta/conf/machine/include/x86/x86-base.inc
> > index 050c20af70c..fc6c39148db 100644
> > --- a/meta/conf/machine/include/x86/x86-base.inc
> > +++ b/meta/conf/machine/include/x86/x86-base.inc
> > @@ -18,7 +18,6 @@ SERIAL_CONSOLES ?=3D "115200;ttyS0"
> > =C2=A0# kernel-related variables
> > =C2=A0#
> > =C2=A0PREFERRED_PROVIDER_virtual/kernel ??=3D "linux-yocto"
> > -PREFERRED_VERSION_linux-yocto ??=3D "6.4%"
> > =C2=A0
> > =C2=A0#
> > =C2=A0# XSERVER subcomponents, used to build the XSERVER variable
> > diff --git a/meta/conf/machine/qemuarm.conf
> > b/meta/conf/machine/qemuarm.conf
> > index 04216cdc2e0..881733eb2da 100644
> > --- a/meta/conf/machine/qemuarm.conf
> > +++ b/meta/conf/machine/qemuarm.conf
> > @@ -28,8 +28,4 @@ QB_ROOTFS_OPT =3D "-drive
> > id=3Ddisk0,file=3D@ROOTFS@,if=3Dnone,format=3Draw -device virtio
> > =C2=A0QB_SERIAL_OPT =3D "-device virtio-serial-device -chardev
> > null,id=3Dvirtcon -device virtconsole,chardev=3Dvirtcon"
> > =C2=A0QB_TCPSERIAL_OPT =3D "-device virtio-serial-device -chardev
> > socket,id=3Dvirtcon,port=3D@PORT@,host=3D127.0.0.1 -device
> > virtconsole,chardev=3Dvirtcon"
> > =C2=A0
> > -# 6.4 causes Xorg to fail to read the virtio framebuffer so stick
> > with 6.1 until
> > -# that is resolved.
> > -PREFERRED_VERSION_linux-yocto ??=3D "6.1%"
> > -
> > =C2=A0KMACHINE:qemuarm =3D "qemuarma15"
> > diff --git a/meta/conf/machine/qemuarmv5.conf
> > b/meta/conf/machine/qemuarmv5.conf
> > index deb4869c0aa..f0a86f1e4c7 100644
> > --- a/meta/conf/machine/qemuarmv5.conf
> > +++ b/meta/conf/machine/qemuarmv5.conf
> > @@ -16,5 +16,4 @@ QB_GRAPHICS =3D "-device virtio-gpu-pci"
> > =C2=A0QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device u=
sb-
> > kbd"
> > =C2=A0QB_DTB =3D
> > "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto',
> > '4.7', '', 'zImage-versatile-pb.dtb', d)}"
> > =C2=A0
> > =C2=A0
> =C2=A0
> Removing this bit results in the above line causing an
> ExpansionError, since
> PREFERRED_VERSION_linux-yocto isnt defined anywhere anymore (if not
> using poky.conf)
>=20
> What would be the right approach to solve this issue?, Should QB_DTB
> be depending on such variable?

4.7 is old enough we can probably just drop the conditional now?

Cheers,

Richard


