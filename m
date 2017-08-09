Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A5CBB77D42
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 18:12:04 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id c65so6830696pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=jeEqrfYjlhb2h/Bt2NgoobB0WI0mfzkrH00Yc+irJNM=;
	b=UYUYMCbTl8gkPnF+qzB+odRChaNw49Mo/piulo3UcfbWe9QoY/a4QuIO0BXKjkXJQm
	2zpADOuWeJfONptf+8owIB99A8Dg2UOTX3MK76L6tPwXgimVvw9CqjFhPJItJY7Av/dp
	woKvzA68cqdf9Oqu9GwStQOyBakyi6jyBUHhzNtEuyGl8LhPlm7hzQinQaFmV2RuqnN1
	mY6UVkiDpkfF81pfXyxHPx3bGy56cy9lu7kqS3DUjKoDOvg5QA4axr1vl7RrhDE4H4NU
	9hu2YRrkcwQVXvUa3ujEyHPFLU0CWt8uMffNoseAWw2AHqpwbOUzfL7bJcg9kZq2UaE8
	SvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=jeEqrfYjlhb2h/Bt2NgoobB0WI0mfzkrH00Yc+irJNM=;
	b=hAJZZXPd/ZpbZXpeWPMYyJhqMu1talNmQts/oiInr884vLoCojK2Vg+Oz/VGLDGv2h
	xD6pNcBp8KqqSl0JEskOfAvZOnI9I8BEgK7AChxUUCiqFqRIM5fOCo9kIdnMzxnMR9Cj
	i4OSCNU/MHVBANlhXAKFyh17ejxIZDClTKNiU6ulxHbm244JKoqIMswonthnXgF/rugl
	0pzvPhVll780zTcTWWDT86+Cw7HDuWYdzOdDQRY/Yjq5qZYKi24valBVFxT8Y9+Rm1PC
	HQ8EB5zThsML0t1sdDvyJ65D/Msgoh1HV8LT66elpSoQlKoTzPdYdVsaYs7PPp0pvfRL
	roTw==
X-Gm-Message-State: AHYfb5ik2mjqGqtBlkUI1vuIZ3YdmciWwKK9bU4FNh01tKB8netp5uPE
	XCJllNubdG2Xerlzf58=
X-Received: by 10.98.163.68 with SMTP id s65mr9142237pfe.217.1502302325679;
	Wed, 09 Aug 2017 11:12:05 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:6942:ed71:9997:6676?
	([2601:646:8882:b8c:6942:ed71:9997:6676])
	by smtp.gmail.com with ESMTPSA id s4sm9914663pfk.71.2017.08.09.11.12.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Aug 2017 11:12:04 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <20170809141922.2603-1-raj.khem@gmail.com>
	<20170809141922.2603-4-raj.khem@gmail.com>
	<CAJ86T=VTVv+w9YUCU2HpMDCpY64eS9ngiOGZ0uE-CJY_2M_9RQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <14814de0-6516-8e73-b11f-d2a803b8dd03@gmail.com>
Date: Wed, 9 Aug 2017 11:11:55 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:54.0)
	Gecko/20100101 Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VTVv+w9YUCU2HpMDCpY64eS9ngiOGZ0uE-CJY_2M_9RQ@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] cairo: Add pkgconfig for opengl support
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
X-List-Received-Date: Wed, 09 Aug 2017 18:12:04 -0000
X-Groupsio-MsgNum: 101197
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="JGJ5QaLV5052LUSbAPgKAlnMeKF7sn01W"

--JGJ5QaLV5052LUSbAPgKAlnMeKF7sn01W
Content-Type: multipart/mixed; boundary="4QKqluawtIbPxBjKK4mxiWvHoTFRElHpg";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <14814de0-6516-8e73-b11f-d2a803b8dd03@gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] cairo: Add pkgconfig for opengl support
References: <20170809141922.2603-1-raj.khem@gmail.com>
 <20170809141922.2603-4-raj.khem@gmail.com>
 <CAJ86T=VTVv+w9YUCU2HpMDCpY64eS9ngiOGZ0uE-CJY_2M_9RQ@mail.gmail.com>
In-Reply-To: <CAJ86T=VTVv+w9YUCU2HpMDCpY64eS9ngiOGZ0uE-CJY_2M_9RQ@mail.gmail.com>

--4QKqluawtIbPxBjKK4mxiWvHoTFRElHpg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/9/17 8:41 AM, Andre McCurdy wrote:
> On Wed, Aug 9, 2017 at 7:19 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> Any explanation? Was this previously non-deterministic? If so, how far
> back does the problem go?

it isnt non-deterministic atleast not after RSS. However, we need this
enabled when we have openGL/X11 enabled.

>=20
>> ---
>>  meta/recipes-graphics/cairo/cairo.inc | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-grap=
hics/cairo/cairo.inc
>> index 8e1e2e1b88..fd376951bd 100644
>> --- a/meta/recipes-graphics/cairo/cairo.inc
>> +++ b/meta/recipes-graphics/cairo/cairo.inc
>> @@ -22,7 +22,8 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender libx=
ext"
>>  DEPENDS =3D "libpng fontconfig pixman glib-2.0 zlib"
>>
>>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '=
x11 xcb', '', d)} \
>> -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
>> +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>> +           ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
>>
>>  PACKAGECONFIG[x11] =3D "--with-x=3Dyes -enable-xlib,--with-x=3Dno --d=
isable-xlib,${X11DEPENDS}"
>>  PACKAGECONFIG[xcb] =3D "--enable-xcb,--disable-xcb,libxcb"
>> @@ -30,6 +31,7 @@ PACKAGECONFIG[directfb] =3D "--enable-directfb=3Dyes=
,,directfb"
>>  PACKAGECONFIG[valgrind] =3D "--enable-valgrind=3Dyes,--disable-valgri=
nd,valgrind"
>>  PACKAGECONFIG[egl] =3D "--enable-egl=3Dyes,--disable-egl,virtual/egl"=

>>  PACKAGECONFIG[glesv2] =3D "--enable-glesv2,--disable-glesv2,virtual/l=
ibgles2"
>> +PACKAGECONFIG[opengl] =3D "--enable-gl,--disable-gl,virtual/libgl"
>=20
> Since the opengl distro feature can imply either OpenGL or OpenGL ES
> support, it doesn't seem right to use it to select one over the other
> (ie for recipes which support both, shouldn't the choice between
> OpenGL or OpenGL ES be independent of the opengl distro feature) ?

at some point we differentiated between opengl and gles at distro level
atleast for RDK, but I agree that marking opengl as a distro feature
encompassing all OpenGL implementations is better. Although, in this
particular case all openGL implementations can be enabled simultaneously
so may be we can enable egl and gles too with same knob. Alternatively
We can leave the packageconfig knob disabled which will make it same
defaults effectively ( which is disabled)

>=20
>>
>>  #check for TARGET_FPU=3Dsoft and inform configure of the result so it=
 can disable some floating points
>>  require cairo-fpu.inc
>> --
>> 2.14.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--4QKqluawtIbPxBjKK4mxiWvHoTFRElHpg--

--JGJ5QaLV5052LUSbAPgKAlnMeKF7sn01W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlmLUHAACgkQuwUzVZGdMxRv+ACfTz2ca4K1IZui5/GNp0U3DRXR
LSsAn18/J7kuaNVobfutSSTtpPBrUQZb
=bk26
-----END PGP SIGNATURE-----

--JGJ5QaLV5052LUSbAPgKAlnMeKF7sn01W--
