Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id C8DC06E8E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 03:44:04 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so7065409pad.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 19:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=E2dS8vJj0A1Lx7e8l3Cu7jAcUoR5r5+Fw3zUIg3+aK4=;
	b=DrbwE8BB08GwHVDF/wBzzTkG7/sucJY8XKIKuJcV/fFEvE47taDhlrDeZd6lXNjRkK
	DM/FmUugSEXYdtEfrS8nA77t2JmOoNSrk56xTqyLHl7cH13Cdm/CGJzu+c5HnTJM4Xld
	6Gp6n9kpnec4YeU2nAY0T98dHzS4OpJOoa8W/zVV38wU9t2F2u87gaPiBoGON7Fiom5J
	cavlghyeO9eurNxGc8zCACxXLhQcxeHh+59BaDQrXe5Rgs82g3IYGaAbpWKYByWCEhGS
	W7HhTlqQcNy+fmhMdWY2jch3oqZtg2wJowWNBGo07uUTlS26nveA1oN4p+tDP8U8XUEE
	3IrQ==
X-Received: by 10.66.197.164 with SMTP id iv4mr29916747pac.18.1392090245889;
	Mon, 10 Feb 2014 19:44:05 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	sy2sm47680336pbc.28.2014.02.10.19.44.04 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Feb 2014 19:44:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAPbeDC=S-U3d=c5uZUYeDXqA0hWf56E5YwGii11pXZHAyo63WQ@mail.gmail.com>
Date: Mon, 10 Feb 2014 19:44:03 -0800
Message-Id: <2C7F328D-B676-40A7-997B-ED8C581FA288@gmail.com>
References: <CAPbeDC=S-U3d=c5uZUYeDXqA0hWf56E5YwGii11pXZHAyo63WQ@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Problem with libicudata.so in OE master
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
X-List-Received-Date: Tue, 11 Feb 2014 03:44:04 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Feb 10, 2014, at 1:21 PM, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> Hi,
>=20
> I'm having problems with running Qt5 apps using OE master. I'm using a =
couple of other layers, but as the problem seems to be related to =
libicudata.so I figured I'd post it here, my apologies if the mail =
should go somewhere else.
>=20
> When starting the Qt5 app I get:
> error while loading shared libraries: /usr/lib/libicudata.so.51: =
internal error
>=20
> I'm building for Wandboard Solo machine from meta-fsl-arm-extra layer.
>=20
> TUNE_FEATURES =3D "armv7a vfp neon callconvention-hard cortexa9"
> TARGET_FPU =3D "vfp-neon"
>=20
> [jkroon@localhost oe-devel]$ readelf -A =
build/tmp-eglibc/sysroots/wandboard-solo/usr/lib/libicudata.so.51.2=20
> Attribute Section: aeabi
> File Attributes
>   Tag_CPU_name: "7-A"
>   Tag_CPU_arch: v7
>   Tag_CPU_arch_profile: Application
>   Tag_ARM_ISA_use: Yes
>   Tag_THUMB_ISA_use: Thumb-2
>   Tag_FP_arch: VFPv3
>   Tag_Advanced_SIMD_arch: NEONv1

this does not seem to be complete output, the key piece thats =
interesting here is what is value of Tag_ABI_VFP_args since you say you =
have call convention-hard in TUNE_FEATURES
I expect Tag_ABI_VFP_args =3D VFP registers



