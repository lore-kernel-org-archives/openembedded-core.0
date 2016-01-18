Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id EE6DC6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 21:51:41 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id 65so163527286pff.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 13:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ToPDebTYRiuahtCUM5QwbXkFbCryYm+3x1GDXby/pMI=;
	b=nAGvtcVResJPsMX/oQIsDwbzv9KP3Vz3RnQ5W/A7Bb5vDxImSByq13Ql+gDTY4/+4w
	b++4Xk2/wxZbRhVomL1O/yaawk6SPR1OhwHAdb2G3Ptq0TAfAdw7GIMGS0rtQx8KmpEx
	oO1jhF8SC8dLyA9A8nDZk2Jy3YnW51vo+CISyokmf2Xnq8EDXaMrya8HKoFo2svCex2f
	LIREEnvAvN5m6JOp6yjyq9KbdzRmfsg73vbLT53El5wggzw9R2gwMpRYMe4EWERYNbyf
	f38yWYrM5LyFIytkQNSJO15/dZNEh4RrI3Y0jl9Adbc421UsUhuM3CFd6h1lOc/IS6o9
	Pg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=ToPDebTYRiuahtCUM5QwbXkFbCryYm+3x1GDXby/pMI=;
	b=m18N63FX/fXJobbZqlyyzFAIfUmmJeoKMUPnEdJID3+ALuhU3hbz0HfFxMi7t0eswq
	UAbjVVm9lj2t54x/+RLYP0oYTRzcDPYgnhn/WacxJZtYDUjstMHRfpE3yZRJR/lBAeNw
	CMvoWtMgqQFLnqT7fNcvDj6d8Qd0W6aDXxgeQPgsG4w7vLTC2BhORTdk0LH5bShSBTe3
	+yDwTMXCxFPX7P7h3PAIINc/ORXTmsHJv2RZguYclC3CbwIFtR7W8iubBVfH9Ci5ZbYe
	4n6CROyuCa70g+179X/wf6bIb3CkQWo8Lk/jlkLJJCIHDnxF5nL/szxZvffTQyC1p4df
	H3Gw==
X-Gm-Message-State: ALoCoQkU6KiR8EB2dURH+YSbY/vMiHODZX2nn3V+q8zc6yKdJoKVbyNP5XHvVwnh6DTzcDaIIelrPQqV6jGszeCOWGBqguc/fQ==
X-Received: by 10.98.71.93 with SMTP id u90mr39687315pfa.165.1453153902180;
	Mon, 18 Jan 2016 13:51:42 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:3558:fa03:50c:331?
	([2601:646:8802:5d5c:3558:fa03:50c:331])
	by smtp.gmail.com with ESMTPSA id
	q142sm30824914pfq.82.2016.01.18.13.51.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jan 2016 13:51:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1564093.TSl0G7yhEJ@masala.hex>
Date: Mon, 18 Jan 2016 13:51:36 -0800
Message-Id: <F049320E-FDD3-4EBE-B25E-CA431E699223@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
	<d75d4766f208e0c33dae34f536589b78bcbf39eb.1453029952.git.raj.khem@gmail.com>
	<1564093.TSl0G7yhEJ@masala.hex>
To: Roman Khimov <roman@khimov.ru>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 19/73] mtools: Fix build with uclibc
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
X-List-Received-Date: Mon, 18 Jan 2016 21:51:42 -0000
X-Groupsio-MsgNum: 76364
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F16A7869-8C70-47F3-832C-257E08806B32";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F16A7869-8C70-47F3-832C-257E08806B32
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Roman

> On Jan 17, 2016, at 11:17 PM, Roman Khimov <roman@khimov.ru> wrote:
>=20
> =D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 17 =
=D1=8F=D0=BD=D0=B2=D0=B0=D1=80=D1=8F 2016 03:35:52 =
=D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C =
Khem Raj =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>> --- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
>> +++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
>> @@ -5,6 +5,7 @@ SECTION =3D "optional"
>> LICENSE =3D "GPLv3"
>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
>>=20
>> +DEPENDS +=3D "virtual/libiconv"
>>=20
>> RDEPENDS_${PN}_libc-glibc =3D "glibc-gconv-ibm850"
>> RRECOMMENDS_${PN}_libc-glibc =3D "\
>> @@ -35,6 +36,8 @@ inherit autotools texinfo
>>=20
>> EXTRA_OECONF =3D "--without-x"
>>=20
>> +LDFLAGS_append_libc-uclibc =3D " -liconv "
>> +
>> BBCLASSEXTEND =3D "native nativesdk"
>>=20
>> PACKAGECONFIG ??=3D ""
>=20
> I've just checked to see that my mtools bbappend (based on fido) has =
it solved
> like this:
>=20
> DEPENDS_class-target +=3D "virtual/libiconv"
> export LIBS =3D "-liconv"
> LIBS_class-native =3D =E2=80=9C"

Both are doing same thing in the end. if LIBS is altered we inject the =
compiler flags
same happens via LDFLAGS except that if we use LDFLAGS then we can =
utilize overrides
at recipe level and they are automatically exported into component Make =
systems.

LIBS is supposed to be computed during configure if one was to use libs =
approach
then USERLDLIBS is safer.

>=20
> And from what I remember, I had some issue building native package =
with
> 'DEPENDS +=3D'. Although that's an old branch and probably things are =
different
> now.

I guess what you might have seen is that there is no provider for =
libiconv-native
which is already fixed by
=
https://github.com/kraj/openembedded-core/commit/a5e6f5939c0ee4280eabd7cfc=
01131052040bc81

if it was something else. Please report with more details.

>=20
> Same thing with parted.
>=20
> --
> http://roman.khimov.ru
> mailto: roman@khimov.ru
> gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3


--Apple-Mail=_F16A7869-8C70-47F3-832C-257E08806B32
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAladXmwACgkQuwUzVZGdMxRfkACfRs3/eBV6lP96YiZtUnnVnF0h
UNAAmQHvIP5aVjnegiBvCpGGUEcIU8zm
=C8oK
-----END PGP SIGNATURE-----

--Apple-Mail=_F16A7869-8C70-47F3-832C-257E08806B32--
