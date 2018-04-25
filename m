Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3110171A50
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 19:54:34 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v5-v6so3719671wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 12:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jr7S7b2lyuUV7Oz6VKv/IvG6pvHo4Nqb1X93Ogg/EFQ=;
	b=FTdURORyaeUtectlsfMs9f1BjDbvjtppLAArc4IP5duZ20KcR4DwLt4y3gW+0kAjSH
	dkHj5Otot/LuHsiWuNljrrZRTs6jxrzuCra1EV+TfeBKmOd0lGzWHBf7D8u7I6X0Nlxk
	h7rIIsxL/gFDlywYyaZKVC6p3FCgwviBDokEztaiypOJTBh5pTyhPnGqlteg9KbR+3OJ
	47m7id5KT67P5bK7/G3D1BcSX7el5bPw5nHXXpGk1vgbuFGMg9Q17kRjzz6WtsF1Uh1l
	XVghDrMnyPHxGKuJy7yrePfhfsPoDs3xfxFbPNToWcE0vV8ZsGqU+IpDu5TBJxpiLSCN
	gxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jr7S7b2lyuUV7Oz6VKv/IvG6pvHo4Nqb1X93Ogg/EFQ=;
	b=GEnQEaCxubF6L5kkZ/unuFNOEZ9KPBB0dRt0VsVdgQ4ycMPSpWfSnkMYEMMwxhHheI
	MXLMbRWoIL8VqTEiY2ZH5FbrtniCLuSWMBmaEEi0v9WuJKRe7K2AFfNPpCrELr5iIva9
	VeOuqAm/ssKX5WglC2B9gIqdhvnq67KN6c+PNQZh8stsALDwutVNMUv8nXIrKNbd9MBW
	qXUVbFsOpF4eO8mTOTTGDKIh/OfwKtgjsuhrgAttBFbfkR9JAWzOr6k82TK7nbbDIsCQ
	DLJnsT+e2//tFqJzemWsRj+WP9p4W6i3A+Ls5G0LTkebR5A6tLmu+gPM9Iu9FCFsqzNE
	CyOw==
X-Gm-Message-State: ALQs6tBv9xnZz0BU9AlxQUQH0DuHNxJ3KdVRqRgyKzt8zHvURFBIXmsM
	eLRTswUfAZuazbrXLHYPAvw=
X-Google-Smtp-Source: AIpwx4+xGltkMedyJ2dSZMtytQBIP8fOKulIEZDaMkPNzjNr9JMG8L2Jvh2tDxmOJziOMDwet8jePQ==
X-Received: by 2002:adf:91c6:: with SMTP id
	64-v6mr25208988wri.136.1524686075696; 
	Wed, 25 Apr 2018 12:54:35 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w40-v6sm25952753wrc.69.2018.04.25.12.54.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Apr 2018 12:54:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Apr 2018 21:54:37 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180425195437.GA2244@jama>
References: <1493752813-18913-1-git-send-email-mkelly@xevo.com>
	<CAJTo0Lb+GDpEMbZP7tgVuMtpw1=38u486VXoQL1NFGnFpTD4Mw@mail.gmail.com>
	<2607b2d4-c37f-5693-1002-db17f9e1024d@xevo.com>
	<CAJTo0LavpmZCQPHSTrsuJwEZHLT2eAhKLQR8A7Fj3kX6BTC0wg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LavpmZCQPHSTrsuJwEZHLT2eAhKLQR8A7Fj3kX6BTC0wg@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: Joshua G Lock <joshua.g.lock@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH resend] qemuboot.conf: make cpus match built artifacts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Apr 2018 19:54:35 -0000
X-Groupsio-MsgNum: 110764
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2017 at 05:37:50PM +0100, Burton, Ross wrote:
> On 15 June 2017 at 17:17, Martin Kelly <mkelly@xevo.com> wrote:
>=20
> > I am no expert, but running qemu -cpu help just says:
> >
> > kvm32 - "Common 32-bit KVM processor"
> > kvm64 - "Common 64-bit KVM processor"
> >
> > My best guess is that, running on qemu without kvm, both cases will be
> > slow (since it's all software emulation). But, using qemu -kvm, it shou=
ld
> > be fast as long as you run on a native CPU that is core2duo or better, =
as
> > the native instructions can just be exposed and passed through to the h=
ost.
> > Since core2duo is very old by now, it should be fast for virtually ever=
yone
> > building on x86.
> >
>=20
> Right, I did some digging.  Assuming you have KVM enabled then in the
> general case the -cpu option is irrelevant as the instructions are handled
> natively.  -cpu just changes what CPUID flags the userspace sees, and so
> this is the Right Thing To Do.

Sorry for replying to such old thread, but today I've noticed interesting s=
ide-effect of this change.

Today I was checking why starting qtbase examples in qemu fails with
message about missing ssse3 support which which qtbase as compiled.

The DEFAULT_TUNE in qemux86-64 is indeed set to core2-64 which supports
ssse3, so qtbase is right to expect it in runtime.

But then I was starting qemu manually (not with runqemu) with:
qemu-system-x86_64 -M q35 -smp 4 -m 4G -net nic,model=3Dvirtio -net user,ho=
stfwd=3Dtcp::2222-:22 -vga virtio -display sdl,gl=3Don -hda luneui-example-=
image-qemux86-64-20180425152329-jama.rootfs.wic.vmdk -enable-kvm

which defaults to using this kvm64 generic CPU which doesn't support ssse3

Changing it to
qemu-system-x86_64 -M q35 -cpu core2duo -smp 4 -m 4G -net nic,model=3Dvirti=
o -net user,hostfwd=3Dtcp::2222-:22 -vga virtio -display sdl,gl=3Don -hda l=
uneui-example-image-qemux86-64-20180425152329-jama.rootfs.wic.vmdk -enable-=
kvm

gets rid of the message from qtbase, because core2duo supports ssse3 and ma=
tches with qemux86-64,
but my host CPU (AMD Bulldozer FX(tm)-8120), doesn't support the same cpu f=
lags like core2due and qemu shows following
message when starting:
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.=
01H:EDX.ss [bit 27]

EDX.ss is Self Snoop feature which is enabled in core2duo and few other QEm=
u emulated CPUs, so I was looking
on some other cpu I can emulate which has ssse3 while having the same flags=
 as my host's AMD cpu

e.g. -cpu phenom is relatively close, but Bulldozer CPUs don't support 3dno=
w, 3dnowext, so similar warning is shown.

In the end I've switched to using -cpu Nehalem, which has ssse3, but doesn'=
t enable CPUID_SS flag, now it starts without any warnings:
qemu-system-x86_64 -M q35 -cpu Nehalem -smp 4 -m 4G -net nic,model=3Dvirtio=
 -net user,hostfwd=3Dtcp::2222-:22 -vga virtio -display sdl,gl=3Don -hda lu=
neui-example-image-qemux86-64-20180425152329-jama.rootfs.wic.vmdk -enable-k=
vm

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWuDc/QAKCRA3VSO3ZXaA
HEnSAJ9lnBATFBIT8xyl4gdvSV/SqDZZVACeMy2xJHOcC0AFpOkbQa4wihzvka4=
=Zn6x
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
