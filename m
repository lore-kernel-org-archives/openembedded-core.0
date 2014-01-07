Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 000D26BC1F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 10:22:31 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id j9so3812305wiv.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2014 02:22:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=vu1DFNgngKlv9v1kjFr3xqp7YJINvpvriTJGCOFOv2Y=;
	b=ddWr++sMQhmcLuBDvlX4yiTYi43b3pjpbAHXqBkE3mf+TxMGg88qZ5dmtt046383S/
	JQ8uHlQuGiWbiDb4TIsJM7kM/RiDQK0DwikcKHLC7rkKFOjCdyuUOXL+W5/mLHAlWWoh
	yprWpyuzkB0wFfqONBmgadyM4Dzejctr+nI47kQMk+37Uob7/9no7RWqRCbDufz7Ev5n
	oP5P7aC/Rr2HCXIDZiLW4OvmfDf8t6CinohXX37aqqqb4RP2SPHBl344KIRKQtisXUPf
	YSHpqjm2596lb0x88Up9khDlKmKYvtOIXwyR8EM/YkyVmNAwaQGIjhg53EgSnhkmKiea
	gasg==
X-Gm-Message-State: ALoCoQlrbPcXslqlysDlzjYyTn2zgs9LeYCN3tk/LpJibvgkzpfp2WiMneN5MAbAL8gvLG9wl/si
X-Received: by 10.194.59.210 with SMTP id b18mr711749wjr.60.1389090151713;
	Tue, 07 Jan 2014 02:22:31 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id w1sm2778059wib.6.2014.01.07.02.22.30
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 Jan 2014 02:22:31 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <C5CA80B4-8C75-4CA6-9D2B-89404927D417@dominion.thruhere.net>
Date: Tue, 7 Jan 2014 11:22:30 +0100
Message-Id: <D570F160-9E98-4C99-BCE3-BDB6123DBDDC@dominion.thruhere.net>
References: <1387895862-15110-1-git-send-email-fahad_arslan@mentor.com>,
	<52B9BC2C.7080709@linux.intel.com>
	<2B9C97B395470A40B9E9E5D469BCD9FA015601C3@EU-MBX-03.mgc.mentorg.com>,
	<52C5B458.5060409@linux.intel.com>
	<2B9C97B395470A40B9E9E5D469BCD9FA01560D68@EU-MBX-03.mgc.mentorg.com>
	<C5CA80B4-8C75-4CA6-9D2B-89404927D417@dominion.thruhere.net>
To: "Arslan, Fahad" <Fahad_Arslan@mentor.com>
X-Mailer: Apple Mail (2.1827)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, marcin@juszkiewicz.pl
Subject: Re: [PATCH] pulseaudio: rescale input being passed to float method of speex
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
X-List-Received-Date: Tue, 07 Jan 2014 10:22:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Marcins linaro mail address has expired, adding the other one

Op 7 jan. 2014, om 11:03 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

>=20
> Op 7 jan. 2014, om 10:59 heeft Arslan, Fahad <Fahad_Arslan@mentor.com> =
het volgende geschreven:
>=20
>>> What affect does it have on the overall size of speex
>>=20
>> If we enable floating point support, there is decrease in size of =
libs.=20
>> libspeexdsp.so is ~480 KB in fixed point configuration
>> libspeexdsp.so is ~220 KB in floating point configuration
>>=20
>> Further details are shown below:
>>=20
>>=20
>> Case-1 (current configuration)
>> =3D=3D=3D=3D=3D=3D
>>=20
>> EXTRA_OECONF =3D " --enable-fixed-point =
--with-ogg-libraries=3D${STAGING_LIBDIR} \
>>                --disable-float-api --disable-vbr \
>>                --with-ogg-includes=3D${STAGING_INCDIR} =
--disable-oggtest"
>>=20
>> build$=20
>> build$ ls -l src/.libs/speex*
>> -rwxr-xr-x 1 farslan farslan 75112 Jan  7 14:09 src/.libs/speexdec
>> -rwxr-xr-x 1 farslan farslan 76989 Jan  7 14:09 src/.libs/speexenc
>> build$ file src/.libs/speex*
>> src/.libs/speexdec: ELF 32-bit LSB executable, ARM, version 1 (SYSV), =
dynamically linked (uses shared libs), for GNU/Linux 2.6.16, not =
stripped
>> src/.libs/speexenc: ELF 32-bit LSB executable, ARM, version 1 (SYSV), =
dynamically linked (uses shared libs), for GNU/Linux 2.6.16, not =
stripped
>> build$=20
>> build$=20
>> build$ ls -l libspeex/.libs/libspeex*.so.1.5.0=20
>> -rwxr-xr-x 1 farslan farslan 484940 Jan  7 14:09 =
libspeex/.libs/libspeexdsp.so.1.5.0
>> -rwxr-xr-x 1 farslan farslan 370309 Jan  7 14:09 =
libspeex/.libs/libspeex.so.1.5.0
>> build$=20
>> build$ file libspeex/.libs/libspeex*.so.1.5.0=20
>> libspeex/.libs/libspeexdsp.so.1.5.0: ELF 32-bit LSB shared object, =
ARM, version 1 (SYSV), dynamically linked, not stripped
>> libspeex/.libs/libspeex.so.1.5.0:    ELF 32-bit LSB shared object, =
ARM, version 1 (SYSV), dynamically linked, not stripped
>> build$=20
>>=20
>>=20
>> Case-2 (suggested configuration)
>> =3D=3D=3D=3D=3D=3D
>>=20
>> EXTRA_OECONF =3D " --with-ogg-libraries=3D${STAGING_LIBDIR} \
>>                --enable-float-api --disable-vbr \
>>                --with-ogg-includes=3D${STAGING_INCDIR} =
--disable-oggtest"
>=20
> Or case 3, which I implemented 3 years ago in =
https://github.com/openembedded/openembedded/commit/e06553979d23531397af3d=
d71870abb80718c681 :
>=20
> def get_speex_fpu_setting(bb, d):
>        if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
>                return "--enable-fixed-point --disable-float-api =
--disable-vbr"
>        return ""
>=20
>=20
> EXTRA_OECONF +=3D "${@get_speex_fpu_setting(bb, d)}
>=20
> That OE-classic recipe also has support for arm asm which speed things =
up a lot.
>=20
> regards,
>=20
> Koen


