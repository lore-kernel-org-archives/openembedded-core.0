Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id C3A766E22B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 19:15:18 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id ex4so1128601wid.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 11:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=V7tTxODovUceb1TDT+odP2WcOWw+njzXnHsqwElXfNY=;
	b=alsjNFttuv2l9mJKoJX/wBNXvXoqJdvpo83gyjsMm/3FHJJABBA9HpA3EkmM57b4XX
	DEryYgqyrO31dVgCp4uo4kc95j/+2nELF7VjcRlUl3rTOgrRx4JTZn6fl9W851gmzN0h
	tjPBielZojPk/UWYDqHWl5w2BPgw/sbvjabX3qurXD+0qaiidx3NU8rlDaOdMarRUVC/
	m6EJ7RTkyG4DNCg1aupM/fzsSoh3/VUleRDLppEwGMpz58ERVm8Yn0b24sK0vbtMrMN4
	OvlIH0PmK7PGZwTCkLCCQ1zr4FxU1oJ+XanBI9FVww97ypwwcXVG5rmVnSBpppF4bz8w
	bI0w==
X-Gm-Message-State: ALoCoQk+57OL3JCCN4+vYoaGcHBaTwvi/8JVnKVcSNK9QBDzX9I3NHPZ0NBpE0fvXWjHXEdTOXsA
X-Received: by 10.194.133.135 with SMTP id pc7mr9978151wjb.51.1389899718985;
	Thu, 16 Jan 2014 11:15:18 -0800 (PST)
Received: from ?IPv6:2001:610:612::1ce4:f687:f519:79c1?
	([2001:610:612:0:1ce4:f687:f519:79c1])
	by mx.google.com with ESMTPSA id hv3sm13492472wib.5.2014.01.16.11.15.17
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 Jan 2014 11:15:17 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2B9C97B395470A40B9E9E5D469BCD9FA01562414@EU-MBX-03.mgc.mentorg.com>
Date: Thu, 16 Jan 2014 20:16:00 +0100
Message-Id: <084D8775-9837-4535-97FC-A54E719F17EB@dominion.thruhere.net>
References: <1387895862-15110-1-git-send-email-fahad_arslan@mentor.com>,
	<52B9BC2C.7080709@linux.intel.com>
	<2B9C97B395470A40B9E9E5D469BCD9FA015601C3@EU-MBX-03.mgc.mentorg.com>,
	<52C5B458.5060409@linux.intel.com>
	<2B9C97B395470A40B9E9E5D469BCD9FA01560D68@EU-MBX-03.mgc.mentorg.com>
	<C5CA80B4-8C75-4CA6-9D2B-89404927D417@dominion.thruhere.net>,
	<D570F160-9E98-4C99-BCE3-BDB6123DBDDC@dominion.thruhere.net>
	<2B9C97B395470A40B9E9E5D469BCD9FA01561532@EU-MBX-03.mgc.mentorg.com>,
	<A55D17AE-AD06-4296-805E-55B822E27858@dominion.thruhere.net>
	<2B9C97B395470A40B9E9E5D469BCD9FA01562414@EU-MBX-03.mgc.mentorg.com>
To: "Arslan, Fahad" <Fahad_Arslan@mentor.com>
X-Mailer: Apple Mail (2.1827)
Cc: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
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
X-List-Received-Date: Thu, 16 Jan 2014 19:15:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 jan. 2014, om 13:08 heeft Arslan, Fahad <Fahad_Arslan@mentor.com> =
het volgende geschreven:

>> It's also 10-50x slower on ARM, so always enabling float is a bad =
option. Just patch it to work, no matter what upstream says :)
>=20
> Seems I misunderstood the statement earlier. So to confirm, do you =
mean I should submit patch here for original bug in Speex source code?

Whatever allows us to use fixed-point mode on fpuless systems

>=20
> ________________________________________
> From: Koen Kooi [koen@dominion.thruhere.net]
> Sent: Friday, January 10, 2014 8:33 PM
> To: Arslan, Fahad
> Cc: Saul Wold; openembedded-core@lists.openembedded.org; Marcin =
Juszkiewicz
> Subject: Re: [OE-core] [PATCH] pulseaudio: rescale input being passed =
to float method of speex
>=20
> Op 10 jan. 2014, om 08:48 heeft Arslan, Fahad =
<Fahad_Arslan@mentor.com> het volgende geschreven:
>=20
>>> def get_speex_fpu_setting(bb, d):
>>>      if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
>>>              return "--enable-fixed-point --disable-float-api =
--disable-vbr"
>>>      return ""
>>=20
>> If we are using Pulseaudio with default settings (speex-float-1) and
>> the if condition in above method is evaluated true, we will end up =
facing
>> the original issue: streams that need to be resampled are not =
playedback
>> since input to speex is zeroed out when float input passed by =
Pulseaudio
>> in range of +/-1 is converted to int.
>>=20
>> So isn't Case 2 appropriate, thoughts?
>=20
> It's also 10-50x slower on ARM, so always enabling float is a bad =
option. Just patch it to work, no matter what upstream says :)
>=20
>=20
>>=20
>> Regards,
>> Fahad
>>=20
>> ________________________________________
>> From: Koen Kooi [koen@dominion.thruhere.net]
>> Sent: Tuesday, January 07, 2014 3:22 PM
>> To: Arslan, Fahad
>> Cc: Saul Wold; openembedded-core@lists.openembedded.org; =
marcin@juszkiewicz.pl
>> Subject: Re: [OE-core] [PATCH] pulseaudio: rescale input being passed =
to float method of speex
>>=20
>> Marcins linaro mail address has expired, adding the other one
>>=20
>> Op 7 jan. 2014, om 11:03 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:
>>=20
>>>=20
>>> Op 7 jan. 2014, om 10:59 heeft Arslan, Fahad =
<Fahad_Arslan@mentor.com> het volgende geschreven:
>>>=20
>>>>> What affect does it have on the overall size of speex
>>>>=20
>>>> If we enable floating point support, there is decrease in size of =
libs.
>>>> libspeexdsp.so is ~480 KB in fixed point configuration
>>>> libspeexdsp.so is ~220 KB in floating point configuration
>>>>=20
>>>> Further details are shown below:
>>>>=20
>>>>=20
>>>> Case-1 (current configuration)
>>>> =3D=3D=3D=3D=3D=3D
>>>>=20
>>>> EXTRA_OECONF =3D " --enable-fixed-point =
--with-ogg-libraries=3D${STAGING_LIBDIR} \
>>>>              --disable-float-api --disable-vbr \
>>>>              --with-ogg-includes=3D${STAGING_INCDIR} =
--disable-oggtest"
>>>>=20
>>>> build$
>>>> build$ ls -l src/.libs/speex*
>>>> -rwxr-xr-x 1 farslan farslan 75112 Jan  7 14:09 src/.libs/speexdec
>>>> -rwxr-xr-x 1 farslan farslan 76989 Jan  7 14:09 src/.libs/speexenc
>>>> build$ file src/.libs/speex*
>>>> src/.libs/speexdec: ELF 32-bit LSB executable, ARM, version 1 =
(SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.16, not =
stripped
>>>> src/.libs/speexenc: ELF 32-bit LSB executable, ARM, version 1 =
(SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.16, not =
stripped
>>>> build$
>>>> build$
>>>> build$ ls -l libspeex/.libs/libspeex*.so.1.5.0
>>>> -rwxr-xr-x 1 farslan farslan 484940 Jan  7 14:09 =
libspeex/.libs/libspeexdsp.so.1.5.0
>>>> -rwxr-xr-x 1 farslan farslan 370309 Jan  7 14:09 =
libspeex/.libs/libspeex.so.1.5.0
>>>> build$
>>>> build$ file libspeex/.libs/libspeex*.so.1.5.0
>>>> libspeex/.libs/libspeexdsp.so.1.5.0: ELF 32-bit LSB shared object, =
ARM, version 1 (SYSV), dynamically linked, not stripped
>>>> libspeex/.libs/libspeex.so.1.5.0:    ELF 32-bit LSB shared object, =
ARM, version 1 (SYSV), dynamically linked, not stripped
>>>> build$
>>>>=20
>>>>=20
>>>> Case-2 (suggested configuration)
>>>> =3D=3D=3D=3D=3D=3D
>>>>=20
>>>> EXTRA_OECONF =3D " --with-ogg-libraries=3D${STAGING_LIBDIR} \
>>>>              --enable-float-api --disable-vbr \
>>>>              --with-ogg-includes=3D${STAGING_INCDIR} =
--disable-oggtest"
>>>=20
>>> Or case 3, which I implemented 3 years ago in =
https://github.com/openembedded/openembedded/commit/e06553979d23531397af3d=
d71870abb80718c681 :
>>>=20
>>> def get_speex_fpu_setting(bb, d):
>>>      if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
>>>              return "--enable-fixed-point --disable-float-api =
--disable-vbr"
>>>      return ""
>>>=20
>>>=20
>>> EXTRA_OECONF +=3D "${@get_speex_fpu_setting(bb, d)}
>>>=20
>>> That OE-classic recipe also has support for arm asm which speed =
things up a lot.
>>>=20
>>> regards,
>>>=20
>>> Koen
>>=20
>>=20
>=20
>=20


