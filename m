Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2A1AE6BE7A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 10:03:41 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so16921634wgh.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2014 02:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=gVtohqAult/TCP0xw87s/xN2qjHtN6Bt8nUnnaY77rs=;
	b=fhtDB+jZ2z/1AxrVK+WybT/MDZo/OsCXeQJfXr6yaEhJGcHrFYalhz+t5C6keMKyYG
	oAy0HnJAmdhbrH5Phuowglr07+99Xt2K44hvYdA3rUxeKXobXDHkDSH2uR+dvzXvTU3z
	87UEUY3J1t2LcZEy4Tpni/c9HZknNcP8Rdj4vk/T3CZoyNfxn/7YjvlKtYYPudL/mkuo
	GwMxpQZJ9AVd9g1Lzg71ryDSQMDD9Snjx2zza8IFGsDjzymw80VFBivnjKUlXfJqtjR4
	pb6OdrhQTODkAoM+uxCobv2ZJQitZCtg2Y/zRu4PAQmsQz/lHygSF0qLI+nhEWsFRNwL
	aozA==
X-Gm-Message-State: ALoCoQlwFK5DE88lqYKRydmfOqv73EfdJL+p+iGs/F1Wn8XVGJi1fXLQhmKOECy0F3iZCtm3JrCW
X-Received: by 10.194.185.113 with SMTP id fb17mr75560793wjc.29.1389089021750; 
	Tue, 07 Jan 2014 02:03:41 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id 11sm2986211wjo.23.2014.01.07.02.03.39
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 Jan 2014 02:03:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2B9C97B395470A40B9E9E5D469BCD9FA01560D68@EU-MBX-03.mgc.mentorg.com>
Date: Tue, 7 Jan 2014 11:03:38 +0100
Message-Id: <C5CA80B4-8C75-4CA6-9D2B-89404927D417@dominion.thruhere.net>
References: <1387895862-15110-1-git-send-email-fahad_arslan@mentor.com>,
	<52B9BC2C.7080709@linux.intel.com>
	<2B9C97B395470A40B9E9E5D469BCD9FA015601C3@EU-MBX-03.mgc.mentorg.com>,
	<52C5B458.5060409@linux.intel.com>
	<2B9C97B395470A40B9E9E5D469BCD9FA01560D68@EU-MBX-03.mgc.mentorg.com>
To: "Arslan, Fahad" <Fahad_Arslan@mentor.com>
X-Mailer: Apple Mail (2.1827)
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 07 Jan 2014 10:03:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 jan. 2014, om 10:59 heeft Arslan, Fahad <Fahad_Arslan@mentor.com> =
het volgende geschreven:

>> What affect does it have on the overall size of speex
>=20
> If we enable floating point support, there is decrease in size of =
libs.=20
> libspeexdsp.so is ~480 KB in fixed point configuration
> libspeexdsp.so is ~220 KB in floating point configuration
>=20
> Further details are shown below:
>=20
>=20
> Case-1 (current configuration)
> =3D=3D=3D=3D=3D=3D
>=20
> EXTRA_OECONF =3D " --enable-fixed-point =
--with-ogg-libraries=3D${STAGING_LIBDIR} \
>                 --disable-float-api --disable-vbr \
>                 --with-ogg-includes=3D${STAGING_INCDIR} =
--disable-oggtest"
>=20
> build$=20
> build$ ls -l src/.libs/speex*
> -rwxr-xr-x 1 farslan farslan 75112 Jan  7 14:09 src/.libs/speexdec
> -rwxr-xr-x 1 farslan farslan 76989 Jan  7 14:09 src/.libs/speexenc
> build$ file src/.libs/speex*
> src/.libs/speexdec: ELF 32-bit LSB executable, ARM, version 1 (SYSV), =
dynamically linked (uses shared libs), for GNU/Linux 2.6.16, not =
stripped
> src/.libs/speexenc: ELF 32-bit LSB executable, ARM, version 1 (SYSV), =
dynamically linked (uses shared libs), for GNU/Linux 2.6.16, not =
stripped
> build$=20
> build$=20
> build$ ls -l libspeex/.libs/libspeex*.so.1.5.0=20
> -rwxr-xr-x 1 farslan farslan 484940 Jan  7 14:09 =
libspeex/.libs/libspeexdsp.so.1.5.0
> -rwxr-xr-x 1 farslan farslan 370309 Jan  7 14:09 =
libspeex/.libs/libspeex.so.1.5.0
> build$=20
> build$ file libspeex/.libs/libspeex*.so.1.5.0=20
> libspeex/.libs/libspeexdsp.so.1.5.0: ELF 32-bit LSB shared object, =
ARM, version 1 (SYSV), dynamically linked, not stripped
> libspeex/.libs/libspeex.so.1.5.0:    ELF 32-bit LSB shared object, =
ARM, version 1 (SYSV), dynamically linked, not stripped
> build$=20
>=20
>=20
> Case-2 (suggested configuration)
> =3D=3D=3D=3D=3D=3D
>=20
> EXTRA_OECONF =3D " --with-ogg-libraries=3D${STAGING_LIBDIR} \
>                 --enable-float-api --disable-vbr \
>                 --with-ogg-includes=3D${STAGING_INCDIR} =
--disable-oggtest"

Or case 3, which I implemented 3 years ago in =
https://github.com/openembedded/openembedded/commit/e06553979d23531397af3d=
d71870abb80718c681 :

def get_speex_fpu_setting(bb, d):
        if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
                return "--enable-fixed-point --disable-float-api =
--disable-vbr"
        return ""


EXTRA_OECONF +=3D "${@get_speex_fpu_setting(bb, d)}

That OE-classic recipe also has support for arm asm which speed things =
up a lot.

regards,

Koen=

