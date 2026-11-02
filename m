Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13003.1793627331328329298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 05:48:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=J1I35SYS;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so19975665e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 05:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627329; x=1794232129; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X/RdWgiGnEVOlV74EFAv/cn/zCsC0Le6Ek+xgNQpd2k=;
        b=J1I35SYSOCYv559ul7k4zdyCmskC1W/a3i5Wxg8s3UynIAqHF225KsT0xGJi+0Xku2
         BJNWfXf1dxm2lfxwSu/z/nvQjYj+ORmpUYBT+N8c4gOuZWwkVMzdGId3q7Ul1C1Bvpey
         1vo/RNfyZNUGJ5mDWsGKw0Z2RS5NwbCnVdijujNQp47RmKAUaenjr8mWQEeRa6Bv2Sjj
         D/pWbu0hwsNrsbVf2RR46zCqMmAsJlhpHlsjt1Z8WjCYTvkwl08zMRTOLFTITouSUi30
         +a+7bg1a80w43e4J7Nngz1gL53o9ivvsDIDLrvCjFjwjNWfzPlamtqzLhbWP9yEyVAOR
         Tw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627329; x=1794232129;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/RdWgiGnEVOlV74EFAv/cn/zCsC0Le6Ek+xgNQpd2k=;
        b=GemKuuf+pZ5c2AlvIeeiEMPxq9Fc2DPTaWWo3P/jD4UB03Xj1fkMoFT5CbzLsEPG0A
         FyzWdr99mxDnm3UkHLIaERwh2qQKHm8UbDZHzRVynk2nvZH0zTo0uOa83wSw+FZDerRQ
         uBlJIjZte6XZXCDSo4mFiwGNZzSYybHEXaDTMAAv2FOtLnCEwyTTAJxzlr6I1vBHWyxA
         hM0TtkLKnXrqi2a2FdbZt4R9Z66meaPaf14PQVCgKECUJM677AzOfwtPV0D8/Dm4bruo
         WKXwNN5cXEZtF0tKnYMNEkddxNkdSSCrehqay7oUVsVKbxEPsLxMEaJOEeitlASQ/EuM
         YvXQ==
X-Gm-Message-State: AFq9FYLK50UjIoJ1QS0fV5MhdT35A444FAz43KIZz9Gevvd3aHKfaWsv
	5W6uVkyAnwWcpL+P6SFDv+ftrVXR1lBgAZwQczmVarzk3d8BQownQiPB
X-Gm-Gg: AYBFou2mDrUJOV6g4QVoBpuGbKQmeWoTKPdWIIy7yyEOdQtWrd9FXCtOoGnO5PpLGvT
	+gXZbgqctWR6SVmUJOl25hCVm61spu166SECf2SwdiGlUFK23khMhNfb8OKM0aiKwuJBcJAoa9t
	zlN+X1azOXsWZQxAe/+t2KqAMAKlBYXX1vhcEi8mBK4isXlHAwdT3+SHDuCP58YUZTZXrpen5zD
	UfoaWWmp9lQu9vFF+lqEVey71iEr7HXDPSFFvSmb3hhKXaCfSxxC3yP2bbEEJ0lYDJiOTFoO6dA
	pGv1Oe+ZZR4+2GbL3ea3kEZ08yoLKiJeBMK2Trxlj6a3smlD+m+WYnUihuaFjzKk/Rv7MS9eMH3
	zzjrEpAH49ohx5VtQct7UitnCSdgF1Sy4yvIkaSieFm/aAE0I/EYWHbalQwHRzdseUEjuSTMtMT
	VdprjzpMEjqNVwElqbzt1q/iA+eXkyrINqY6VYuhx5oO93yipC+JoGCZHoJyFp/2VvdMlyon7y3
	Cf8YDEewIQJHTAW4VZxfSxMR/iY+e3+AuFuFUiG/tMHH4hkpuFFZCW7tklce6NI7j7/Tt4IwbmP
	IQyEvdYbuDioUmyRzuEvx3eqlmDEffhl42VAljv/lPLpzHxKifjp9zOQLOEHya2B4OFCnTPk3j8
	2usc=
X-Received: by 2002:a05:600d:8082:b0:4ad:181a:4348 with SMTP id 5b1f17b1804b1-4ad181a442cmr150268345e9.18.1793627329359;
        Mon, 02 Nov 2026 05:48:49 -0800 (PST)
Return-Path: <adrian.freihofer@gmail.com>
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm20722999f8f.12.2026.11.02.05.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:48:48 -0800 (PST)
Message-ID: <bee5a361c2e66febd1badf11e17ed3a51f54fa2b.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/3] Fix kernel complementary package
 installation
From: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
To: bruce.ashfield@gmail.com, adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, Peter.Marko@siemens.com
Date: Mon, 02 Nov 2026 14:48:47 +0100
In-Reply-To: <6ae7ee2c.757e2132.16a24.77ff@mx.google.com>
References: <20260923205206.1102615-1-adrian.freihofer@siemens.com>
	 <6ae3d215.cf61d36e.14493f.869f@mx.google.com>
	 <7f6cfc2f345e31d031ee099a0d591b72c0a1ddc1.camel@siemens.com>
	 <6ae4b520.2ba6c529.9958c.7be2@mx.google.com>
	 <4b02434605104cd40cf4aa57f7c6a0db42796f64.camel@siemens.com>
	 <6ae7ee2c.757e2132.16a24.77ff@mx.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 13:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249207

On Sun, 2026-11-01 at 17:58 -0800, Bruce Ashfield via openembedded-core
wrote:
> On Sat, Oct 31, 2026 at 7:22 AM Freihofer, Adrian wrote:
> >=20
> > There are different use cases:
> > =C2=A0=C2=A0 1. working as a developer on the kernel. For this I agree =
with
> > your
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 statement.
> > =C2=A0=C2=A0 2. remote debugging a user space application with a debugg=
er
> > such as
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the Trace32 which supports seamless step=
ping into the kernel
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 context of a user space process. For thi=
s use case the
> > sources
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 are required on the host as for a dynami=
cally linked library
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ideally as a -src and -dbg package.
> > =C2=A0=C2=A0 3. Installing the package (also possible with a binary pac=
kage
> > feed)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 into the rootfs is required for on targe=
t debugging and
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 profiling.
>=20
> Thanks, that's the list I was looking for. 2 and 3 are the concrete
> use
> cases for having the source in a rootfs (or rootfs-dbg), so I've gone
> ahead with it (more below).
>=20
> > Agree. This addresses all use cases by:
> > =C2=A0* devtool modify linux-yocto
> > =C2=A0* IMAGE_INSTALL_DEBUGFS:append =3D " kernel-dev"
> > =C2=A0* IMAGE_INSTALL:append =3D " kernel-dev"
> > =C2=A0* opkg install kernel-dev
>=20
> One correction (so nobody sees this on the list or in the archive
> and copies this into a local.conf): kernel-dev is
> System.map, the config and Module.symvers. The source package is
> kernel-devsrc, and the symbols are kernel-dbg and kernel-vmlinux.
>=20
> kernel-devsrc also doesn't cover 2 or 3 today. (At risk of stating
> what is already well know) It is what's needed to build modules
> (headers, Kconfig/Makefiles, scripts), so it has almost no
> .c files, and installing it pulls in the tools for "make scripts
> prepare"
> (bc, bison, flex, gcc-plugins, openssl-dev, ...), which people
> don't want in rootfs-dbg.
>=20
> > =C2=A0- I'll send the kernel.bbclass prefix map change on its own, once
> > I've
> > =C2=A0=C2=A0 checked SPDX's compiled-sources filter is unaffected (it's=
 the
> > only
> > =C2=A0=C2=A0 other consumer of the kernel's debugsources list)
> >=20
> > I did that a few weeks ago. It's an independent code path.
>=20
> Thanks. I read through it as well, and agree, the compiled-sources
> filter only matches files found in the kernel-source copy, and the
> generated files were never in there.
>=20
> > If we have the 9000+ source files instead of only the 400+
> > generated
> > files, all use cases which I have in mind are addressed. Sounds
> > good.
>=20
> That's what I've prototyped, based on some patches that I've had
> around
> for several years at this point .. It stays one package (kernel-
> devsrc)
> and one tree at /usr/src/kernel, where the debug info points with the
> prefix map. PACKAGECONFIG chooses what goes in it:
>=20
> =C2=A0 build:=C2=A0=C2=A0 what kernel-devsrc is today, with its RDEPENDS.=
 The
> default,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 so nothing c=
hanges for existing users.
> =C2=A0 source:=C2=A0 a curated core (core directories plus the machine's =
arch),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and the driv=
ers the build actually compiled, discovered
> from
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kbuild's .cm=
d files. No RDEPENDS.
> =C2=A0 full:=C2=A0=C2=A0=C2=A0 the whole tree.
> =C2=A0 tarball: the whole tree as a tarball, rather than uncompressed.
> This
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is similar t=
o what other distros have in their linux-
> source
> 	=C2=A0=C2=A0 packages
>=20
> With:
>=20
> =C2=A0 PACKAGECONFIG:pn-kernel-devsrc =3D "source"
> =C2=A0 IMAGE_INSTALL_DEBUGFS =3D "kernel-dbg kernel-vmlinux kernel-devsrc=
"
>=20
> on qemux86-64 (7.2.13), rootfs-dbg gets the symbols and 254MB of
> source
> at /usr/src/kernel, and nothing else: no build tools come along. All
> 9016 source files named in the kernel's debug info are there. The
> only
> ones missing are the 592 generated files from the build directory,
> which we don't want to ship. The full tree is 1.5GB.
>=20
> That covers 2 (rootfs-dbg on the host, no path mapping in the
> debugger)
> and 3 (install it in the image or from a feed). "source build" gives
> both the source and what's needed to build modules on target.
>=20
> The package can optionally be versioned (kernel-devsrc-<kver>, with
> kernel-devsrc holding just the /usr/src/kernel link), so the source
> of
> more than one kernel can be installed side by side.
>=20
> One thing to know: if the image itself already installs kernel-
> devsrc,
> IMAGE_INSTALL_DEBUGFS won't put it in rootfs-dbg. rootfs-dbg starts
> from
> the image's package database, so it's seen as already installed, and
> only the debug files are copied over. That's how the debug rootfs
> works
> in general, but it'll need documenting.

Just a note: There is also the image-combined-dbg.bbclass which merges
all together into rootfs-dbg where ever the package installs it. So,
having it only once installed is fine.

>=20
> If that sounds ok, I'll send the prefix map patch, and then the
> kernel-devsrc series as an RFC so you can try it with TRACE32.

This sounds very good. Thank you!

Adrian

>=20
> Bruce
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#249173):
> https://lists.openembedded.org/g/openembedded-core/message/249173
> Mute This Topic: https://lists.openembedded.org/mt/121400004/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
