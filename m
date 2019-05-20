Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3C24979CCB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:02:07 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id j12so25159110eds.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 11:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+k2X1csHCdU3nPllV5b7eDPOnwlc9uAZ0JrhxguM3l8=;
	b=KE8OjAD1x6kO51yIGgYgtU9PCNH7dV590vBLV0adC0zwmCiHNpkqRV7NOkMh5XHF4m
	JK5gijlekvEhjdkI4NRXJ86VPVNSft8pSFjcXargGdd2Ob25aV2sAQIl2yrIeb7TikfU
	3N7/WfpTHFNiMhrvVlp9N+0AaOPWR0ibskuC911uAjaE9h9I1tFMHeE0aQChd0qCKSaz
	w8oL0kCgidbUmz+gfXIDB4RWdXqnfhzarNMXwQa0COrpohuyY8rpiBpl202dj0FroEap
	b395StGpnEhjvi34BrSGwzJSM+l7xsS3jH05KE96E8GCF2STkS3dF+RwTbU3qkyLTZqi
	eTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+k2X1csHCdU3nPllV5b7eDPOnwlc9uAZ0JrhxguM3l8=;
	b=CGcnaFASe6IP3KHvLhd/4hlIn2qfGQ0hLkAL7i0kLUW8kecCVZLFdE3BH4ev0xpKoj
	zT198so3BKYGhY6T8RFw75deZT2MZoZj+qIYNwBopkSJ7WAtjUuZDi3gnnt1vAWGNB+E
	2SnacmCS20CtVhRuBD5o316waXhaEDUvJ/1p63hkaOF3HBvHp/eNK/OI1GJDNiLZv3PL
	kbN3oNB0ieyxBkncmjx9blrkUBS/iAgb9KKITlkdLbRtnKyGRnHBa8v3HUJLniD07hkz
	N08VqJMDQdf3jH1B7IZPdBDErdvmL3rzrVQp9XU4Iwr6Ssv9Dn/2DzsO55qC7LE6Q1O2
	aVrQ==
X-Gm-Message-State: APjAAAUevSEUyMYFnFgWA0HZZUScty8griJ4SO8kdCnFGMUqjsigWJ1C
	DHzIC0RqxOATlpWHuc5YdWZ5dVq3TgrHSmVJJVU=
X-Google-Smtp-Source: APXvYqwMSK4eh4fNOk0C0vx6DvYSUeepnOX6gDeS0BOgUSHXZziyB2EJkAQj5bpcoI+wLqxEq6iX86FuwsCGMgRuyIk=
X-Received: by 2002:a17:906:cd08:: with SMTP id
	oz8mr14723687ejb.67.1558375327847; 
	Mon, 20 May 2019 11:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
	<20190520141125.10805-29-alex.kanavin@gmail.com>
	<8f9090ac-b828-616a-d39f-7c888bf81ae9@gmail.com>
In-Reply-To: <8f9090ac-b828-616a-d39f-7c888bf81ae9@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 20 May 2019 20:02:04 +0200
Message-ID: <CA+chaQeioXqe4LhK1ZBCzY_h3xmitEsf+jn0xtpDDdhAWBE=kQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 29/42] linux-firmware: upgrade to latest revision
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
X-List-Received-Date: Mon, 20 May 2019 18:02:07 -0000
Content-Type: multipart/alternative; boundary="000000000000d7d849058955872b"

--000000000000d7d849058955872b
Content-Type: text/plain; charset="UTF-8"

And why change formatting in first place?

The old version seems better to me.

On Mon, May 20, 2019 at 7:56 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 5/20/19 7:11 AM, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >   .../linux-firmware/linux-firmware_git.bb      | 128 +++++++++---------
> >   1 file changed, 65 insertions(+), 63 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > index ad7babf7aa4..8b6ad96dba4 100644
> > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > @@ -7,6 +7,7 @@ LICENSE = "\
> >       & Firmware-agere \
> >       & Firmware-amdgpu \
> >       & Firmware-amd-ucode \
> > +    & Firmware-amlogic_vdec \
> >       & Firmware-atheros_firmware \
> >       & Firmware-atmel \
> >       & Firmware-broadcom_bcm43xx \
> > @@ -62,68 +63,68 @@ LICENSE = "\
> >       & WHENCE \
> >   "
> >
> > -LIC_FILES_CHKSUM = "\
> > -    file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
> > -    file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
> > -    file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
> > -    file://LICENSE.amdgpu;md5=ab515ef6495ab5c5a3b08ab2db62df11 \
> > -    file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
> > -
> file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
> > -    file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
> > -
> file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
> > -    file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198 \
> > -    file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0 \
> > -    file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
> > -
> file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
> > -    file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
> > -    file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
> > -    file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
> > -    file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8 \
> > -    file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c296720b7d3921 \
> > -    file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293 \
> > -    file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb \
> > -    file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> > -    file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444 \
> > -    file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
> > -    file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570 \
> > -    file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
> > -    file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
> > -    file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
> > -
> file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
> > -    file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
> > -    file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
> > -    file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
> > -    file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
> > -
> file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
> > -    file://LICENCE.Netronome;md5=4add08f2577086d44447996503cddf5f \
> > -    file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07 \
> > -    file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
> > -
> file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837
> \
> > -    file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
> > -    file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
> > -    file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b \
> > -    file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
> > -    file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0 \
> > -
> file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 \
> > -
> file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8 \
> > -    file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498 \
> > -    file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16 \
> > -
> file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435
> \
> > -
> file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
> > -
> file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
> > -    file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
> > -    file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
> > -
> file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e \
> > -    file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec
> \
> > -    file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c \
> > -
> file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
> > -    file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
> > -    file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b \
> > -    file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
> > -    file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
> > -    file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
> > -    file://WHENCE;md5=ef36d3383becd18f36ce32d84109386f \
> > -"
> > +LIC_FILES_CHKSUM =
> "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
> > +
> file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
> > +
> file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
> > +
> file://LICENSE.amdgpu;md5=ab515ef6495ab5c5a3b08ab2db62df11 \
> > +
> file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
> > +
> file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
> > +
> file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
> > +
> file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
> > +
> file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
> > +
> file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198 \
> > +
> file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0 \
> > +
> file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
> > +
> file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
> > +
> file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
> > +
> file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
> > +
> file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
> > +
> file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8 \
> > +
> file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c296720b7d3921 \
> > +
> file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293 \
> > +
> file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb \
> > +                    file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> > +
> file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444 \
> > +
> file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
> > +
> file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570 \
> > +
> file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
> > +
> file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
> > +
> file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
> > +
> file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
> > +
> file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
> > +
> file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
> > +
> file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
> > +
> file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
> > +
> file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
> > +
> file://LICENCE.Netronome;md5=4add08f2577086d44447996503cddf5f \
> > +
> file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07 \
> > +
> file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
> > +
> file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837
> \
> > +
> file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
> > +
> file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
> > +
> file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b \
> > +
> file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
> > +
> file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0 \
> > +
> file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 \
> > +
> file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8 \
> > +
> file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498 \
> > +
> file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16 \
> > +
> file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435
> \
> > +
> file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
> > +
> file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
> > +
> file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
> > +
> file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
> > +
> file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e \
> > +
> file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec \
> > +
> file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c \
> > +
> file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
> > +
> file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
> > +
> file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b \
> > +
> file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
> > +
> file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
> > +
> file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
> > +                    file://WHENCE;md5=b6e44adf71bc37e5f26ebfe5a08b5490 \
> > +                    "
> >
> >   # These are not common licenses, set NO_GENERIC_LICENSE for them
> >   # so that the license files will be copied from fetched source
> > @@ -132,6 +133,7 @@ NO_GENERIC_LICENSE[Firmware-adsp_sst] =
> "LICENCE.adsp_sst"
> >   NO_GENERIC_LICENSE[Firmware-agere] = "LICENCE.agere"
> >   NO_GENERIC_LICENSE[Firmware-amdgpu] = "LICENSE.amdgpu"
> >   NO_GENERIC_LICENSE[Firmware-amd-ucode] = "LICENSE.amd-ucode"
> > +NO_GENERIC_LICENSE[Firmware-amlogic_vdec] = "LICENSE.amlogic_vdec"
> >   NO_GENERIC_LICENSE[Firmware-atheros_firmware] =
> "LICENCE.atheros_firmware"
> >   NO_GENERIC_LICENSE[Firmware-atmel] = "LICENSE.atmel"
> >   NO_GENERIC_LICENSE[Firmware-broadcom_bcm43xx] =
> "LICENCE.broadcom_bcm43xx"
> > @@ -188,7 +190,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] =
> "LICENCE.xc5000"
> >   NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
> >   NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
> >
> > -SRCREV = "7bc246451318b3536d9bfd3c4e46d541a9831b33"
> > +SRCREV = "711d3297bac870af42088a467459a0634c1970ca"
> >   PE = "1"
> >   PV = "0.0+git${SRCPV}"
> >
> >
>
> Formatting changes could have been a separate patch
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d7d849058955872b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And why change formatting in first place?<div><br></div><d=
iv>The old version seems better to me.</div><div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 20, 2019=
 at 7:56 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
<br>
On 5/20/19 7:11 AM, Alexander Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../linux-firmware/<a href=3D"http://linux-firmware_git.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 | 128 +++++++++---------<br>
&gt;=C2=A0 =C2=A01 file changed, 65 insertions(+), 63 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linu=
x-firmware_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.=
bb</a> b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmwar=
e_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><br=
>
&gt; index ad7babf7aa4..8b6ad96dba4 100644<br>
&gt; --- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmw=
are_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><=
br>
&gt; +++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmw=
are_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><=
br>
&gt; @@ -7,6 +7,7 @@ LICENSE =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; Firmware-agere \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; Firmware-amdgpu \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; Firmware-amd-ucode \<br>
&gt; +=C2=A0 =C2=A0 &amp; Firmware-amlogic_vdec \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; Firmware-atheros_firmware \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; Firmware-atmel \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; Firmware-broadcom_bcm43xx \<br>
&gt; @@ -62,68 +63,68 @@ LICENSE =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; WHENCE \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.Abilis;md5=3Db5ee3f410780e56711ad48eadc2=
2b8bc \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.adsp_sst;md5=3D615c45b91a5a4a9fe046d6ab9=
a2df728 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.agere;md5=3Daf0133de6b4a9b2522defd5f188a=
fd31 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENSE.amdgpu;md5=3Dab515ef6495ab5c5a3b08ab2db6=
2df11 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENSE.amd-ucode;md5=3D3c5399dc9148d7f0e1f41e34=
b69cf14f \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.atheros_firmware;md5=3D30a14c7823beedac9=
fa39c64fdd01a13 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENSE.atmel;md5=3Daa74ac0c60595dee4d4e239107ea=
77a3 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.broadcom_bcm43xx;md5=3D3160c14df7228891b=
868060e1951dfbc \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.ca0132;md5=3D209b33e66ee5be0461f13d31da3=
92198 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.cadence;md5=3D009f46816f6956cfb75ede13d3=
e1cee0 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.cavium;md5=3Dc37aaffb1ebe5939b2580d073a9=
5daea \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.chelsio_firmware;md5=3D819aa8c3fa453f1b2=
58ed8d168a9d903 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.cw1200;md5=3Df0f770864e7a8444a5c5aa9d12a=
3a7ed \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.cypress;md5=3D48cd9436c763bf873961f9ed7b=
5c147b \<br>
&gt; -=C2=A0 =C2=A0 file://LICENSE.dib0700;md5=3Df7411825c8a555a1a3e5eab9ca=
773431 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.e100;md5=3Dec0f84136766df159a3ae6d02acdf=
5a8 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.ene_firmware;md5=3Ded67f0f62f8f798130c29=
6720b7d3921 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.fw_sst_0f28;md5=3D6353931c988ad52818ae73=
3ac61cd293 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.go7007;md5=3Dc0bb9f6aaaba55b0529ee9b30aa=
66beb \<br>
&gt; -=C2=A0 =C2=A0 file://GPL-2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \<b=
r>
&gt; -=C2=A0 =C2=A0 file://LICENSE.hfi1_firmware;md5=3D5e7b6e586ce7339d1268=
9e49931ad444 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.i2400m;md5=3D14b901969e23c41881327c0d9e4=
b7d36 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENSE.i915;md5=3D2b0b2e0d20984affd4490ba2cba02=
570 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.ibt_firmware;md5=3Dfdbee1ddfe0fb7ab0b2fc=
d6b454a366b \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.IntcSST2;md5=3D9e7d8bea77612d7cc7d9e9b54=
b623062 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.it913x;md5=3D1fbf727bfb6a949810c4dbfa7e6=
ce4f8 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.iwlwifi_firmware;md5=3D3fd842911ea93c29c=
d32679aa23e1c88 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.kaweth;md5=3Db1d876e562f4b3b8d391ad8395d=
fe03f \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.Marvell;md5=3D9ddea1734a4baf3c78d845151f=
42a37a \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.mediatek;md5=3D7c1976b63217d76ce47d0a11d=
8a79cf2 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.moxa;md5=3D1086614767d8ccf744a923289d3d4=
261 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.myri10ge_firmware;md5=3D42e32fb89f6b959c=
a222e25ac8df8fed \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.Netronome;md5=3D4add08f2577086d444479965=
03cddf5f \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.nvidia;md5=3D4428a922ed3ba2ceec95f076a48=
8ce07 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.OLPC;md5=3D5b917f9d8c061991be4f6f5f10871=
9cd \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.open-ath9k-htc-firmware;md5=3D1b33c9f4d1=
7bc4d457bdb23727046837 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.phanfw;md5=3D954dcec0e051f9409812b561ea7=
43bfa \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.qat_firmware;md5=3D9e7d8bea77612d7cc7d9e=
9b54b623062 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENSE.qcom;md5=3D164e3362a538eb11d3ac51e8e1342=
94b \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.qla1280;md5=3Dd6895732e622d950609093223a=
2c4f5d \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.qla2xxx;md5=3D505855e921b75f1be4a437ad9b=
79dff0 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENSE.QualcommAtheros_ar3k;md5=3Db5fe244fb2b53=
2311de1472a3bc06da5 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENSE.QualcommAtheros_ath10k;md5=3Dcb42b686ee5=
f5cb890275e4321db60a8 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.r8a779x_usb3;md5=3D4c1671656153025d70761=
05a5da7e498 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENSE.radeon;md5=3D68ec28bacb3613200bca44f404c=
69b16 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.ralink_a_mediatek_company_firmware;md5=
=3D728f1a85fd53fd67fa8d7afb080bc435 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.ralink-firmware.txt;md5=3Dab2c269277c454=
76fb449673911a2dfd \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.rtlwifi_firmware.txt;md5=3D00d06cfd3eddd=
5a2698948ead2ad54a5 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENSE.sdma_firmware;md5=3D51e8c19ecc2270f4b8ea=
30341ad63ce9 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.siano;md5=3D4556c1bf830067f12ca151ad953e=
c2a5 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.tda7706-firmware.txt;md5=3D835997cf5e3c1=
31d0dddd695c7d9103e \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.ti-connectivity;md5=3Dc5e02be633f1499c10=
9d1652514d85ec \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.ti-keystone;md5=3D3a86335d32864b0bef996b=
ee26cc0f2c \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.ueagle-atm4-firmware;md5=3D4ed7ea6b507cc=
c583b9d594417714118 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.via_vt6656;md5=3De4159694cba42d4377a912e=
78a6e850f \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.wl1251;md5=3Dad3f81922bb9e197014bb187289=
d3b5b \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.xc4000;md5=3D0ff51d2dc49fce04814c9155081=
092f0 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.xc5000;md5=3D1e170c13175323c32c7f4d0998d=
53f66 \<br>
&gt; -=C2=A0 =C2=A0 file://LICENCE.xc5000c;md5=3D12b02efa3049db65d524aeb418=
dd87ca \<br>
&gt; -=C2=A0 =C2=A0 file://WHENCE;md5=3Def36d3383becd18f36ce32d84109386f \<=
br>
&gt; -&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENCE.Abilis;md5=3Db5ee3f410780e5=
6711ad48eadc22b8bc \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.adsp_sst;md5=3D615c45b91a5a4a9fe046d6ab9a2df728 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.agere;md5=3Daf0133de6b4a9b2522defd5f188afd31 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.amdgpu;md5=3Dab515ef6495ab5c5a3b08ab2db62df11 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.amd-ucode;md5=3D3c5399dc9148d7f0e1f41e34b69cf14f \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.amlogic_vdec;md5=3Ddc44f59bf64a81643e500ad3f39a468a \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.atheros_firmware;md5=3D30a14c7823beedac9fa39c64fdd01a13 \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.atmel;md5=3Daa74ac0c60595dee4d4e239107ea77a3 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.broadcom_bcm43xx;md5=3D3160c14df7228891b868060e1951dfbc \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.ca0132;md5=3D209b33e66ee5be0461f13d31da392198 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.cadence;md5=3D009f46816f6956cfb75ede13d3e1cee0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.cavium;md5=3Dc37aaffb1ebe5939b2580d073a95daea \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.chelsio_firmware;md5=3D819aa8c3fa453f1b258ed8d168a9d903 \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.cw1200;md5=3Df0f770864e7a8444a5c5aa9d12a3a7ed \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.cypress;md5=3D48cd9436c763bf873961f9ed7b5c147b \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.dib0700;md5=3Df7411825c8a555a1a3e5eab9ca773431 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.e100;md5=3Dec0f84136766df159a3ae6d02acdf5a8 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.ene_firmware;md5=3Ded67f0f62f8f798130c296720b7d3921 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.fw_sst_0f28;md5=3D6353931c988ad52818ae733ac61cd293 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.go7007;md5=3Dc0bb9f6aaaba55b0529ee9b30aa66beb \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://GPL-2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.hfi1_firmware;md5=3D5e7b6e586ce7339d12689e49931ad444 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.i2400m;md5=3D14b901969e23c41881327c0d9e4b7d36 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.i915;md5=3D2b0b2e0d20984affd4490ba2cba02570 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.ibt_firmware;md5=3Dfdbee1ddfe0fb7ab0b2fcd6b454a366b \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.IntcSST2;md5=3D9e7d8bea77612d7cc7d9e9b54b623062 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.it913x;md5=3D1fbf727bfb6a949810c4dbfa7e6ce4f8 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.iwlwifi_firmware;md5=3D3fd842911ea93c29cd32679aa23e1c88 \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.kaweth;md5=3Db1d876e562f4b3b8d391ad8395dfe03f \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.Marvell;md5=3D9ddea1734a4baf3c78d845151f42a37a \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.mediatek;md5=3D7c1976b63217d76ce47d0a11d8a79cf2 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.moxa;md5=3D1086614767d8ccf744a923289d3d4261 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.myri10ge_firmware;md5=3D42e32fb89f6b959ca222e25ac8df8fed \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.Netronome;md5=3D4add08f2577086d44447996503cddf5f \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.nvidia;md5=3D4428a922ed3ba2ceec95f076a488ce07 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.OLPC;md5=3D5b917f9d8c061991be4f6f5f108719cd \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.open-ath9k-htc-firmware;md5=3D1b33c9f4d17bc4d457bdb23727046=
837 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.phanfw;md5=3D954dcec0e051f9409812b561ea743bfa \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.qat_firmware;md5=3D9e7d8bea77612d7cc7d9e9b54b623062 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.qcom;md5=3D164e3362a538eb11d3ac51e8e134294b \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.qla1280;md5=3Dd6895732e622d950609093223a2c4f5d \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.qla2xxx;md5=3D505855e921b75f1be4a437ad9b79dff0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.QualcommAtheros_ar3k;md5=3Db5fe244fb2b532311de1472a3bc06da5=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.QualcommAtheros_ath10k;md5=3Dcb42b686ee5f5cb890275e4321db60=
a8 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.r8a779x_usb3;md5=3D4c1671656153025d7076105a5da7e498 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.radeon;md5=3D68ec28bacb3613200bca44f404c69b16 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.ralink_a_mediatek_company_firmware;md5=3D728f1a85fd53fd67fa=
8d7afb080bc435 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.ralink-firmware.txt;md5=3Dab2c269277c45476fb449673911a2dfd =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.rtlwifi_firmware.txt;md5=3D00d06cfd3eddd5a2698948ead2ad54a5=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSE.sdma_firmware;md5=3D51e8c19ecc2270f4b8ea30341ad63ce9 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.siano;md5=3D4556c1bf830067f12ca151ad953ec2a5 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.tda7706-firmware.txt;md5=3D835997cf5e3c131d0dddd695c7d9103e=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.ti-connectivity;md5=3Dc5e02be633f1499c109d1652514d85ec \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.ti-keystone;md5=3D3a86335d32864b0bef996bee26cc0f2c \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.ueagle-atm4-firmware;md5=3D4ed7ea6b507ccc583b9d594417714118=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.via_vt6656;md5=3De4159694cba42d4377a912e78a6e850f \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.wl1251;md5=3Dad3f81922bb9e197014bb187289d3b5b \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.xc4000;md5=3D0ff51d2dc49fce04814c9155081092f0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.xc5000;md5=3D1e170c13175323c32c7f4d0998d53f66 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENCE.xc5000c;md5=3D12b02efa3049db65d524aeb418dd87ca \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://WHENCE;md5=3Db6e44adf71bc37e5f26ebfe5a08b5490 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# These are not common licenses, set NO_GENERIC_LICENSE fo=
r them<br>
&gt;=C2=A0 =C2=A0# so that the license files will be copied from fetched so=
urce<br>
&gt; @@ -132,6 +133,7 @@ NO_GENERIC_LICENSE[Firmware-adsp_sst] =3D &quot;LI=
CENCE.adsp_sst&quot;<br>
&gt;=C2=A0 =C2=A0NO_GENERIC_LICENSE[Firmware-agere] =3D &quot;LICENCE.agere=
&quot;<br>
&gt;=C2=A0 =C2=A0NO_GENERIC_LICENSE[Firmware-amdgpu] =3D &quot;LICENSE.amdg=
pu&quot;<br>
&gt;=C2=A0 =C2=A0NO_GENERIC_LICENSE[Firmware-amd-ucode] =3D &quot;LICENSE.a=
md-ucode&quot;<br>
&gt; +NO_GENERIC_LICENSE[Firmware-amlogic_vdec] =3D &quot;LICENSE.amlogic_v=
dec&quot;<br>
&gt;=C2=A0 =C2=A0NO_GENERIC_LICENSE[Firmware-atheros_firmware] =3D &quot;LI=
CENCE.atheros_firmware&quot;<br>
&gt;=C2=A0 =C2=A0NO_GENERIC_LICENSE[Firmware-atmel] =3D &quot;LICENSE.atmel=
&quot;<br>
&gt;=C2=A0 =C2=A0NO_GENERIC_LICENSE[Firmware-broadcom_bcm43xx] =3D &quot;LI=
CENCE.broadcom_bcm43xx&quot;<br>
&gt; @@ -188,7 +190,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] =3D &quot;LICE=
NCE.xc5000&quot;<br>
&gt;=C2=A0 =C2=A0NO_GENERIC_LICENSE[Firmware-xc5000c] =3D &quot;LICENCE.xc5=
000c&quot;<br>
&gt;=C2=A0 =C2=A0NO_GENERIC_LICENSE[WHENCE] =3D &quot;WHENCE&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -SRCREV =3D &quot;7bc246451318b3536d9bfd3c4e46d541a9831b33&quot;<br>
&gt; +SRCREV =3D &quot;711d3297bac870af42088a467459a0634c1970ca&quot;<br>
&gt;=C2=A0 =C2=A0PE =3D &quot;1&quot;<br>
&gt;=C2=A0 =C2=A0PV =3D &quot;0.0+git${SRCPV}&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
<br>
Formatting changes could have been a separate patch<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000d7d849058955872b--
