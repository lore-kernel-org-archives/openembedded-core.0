Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4DB6E64A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 06:00:58 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id v86so43485317pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 22:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=IC3u2me6VCTi9z4Ds27hJ+989Pbus2r7eIPk8qwI7Y8=;
	b=H6s3EIWtdK4OC/i5fA9wVWh8a109+t/1TVgDDTBceXlpW8sw4ILYKyDlBhD8CY4xjA
	EXHFcw3TaO6DS3WAdO1o6609hx9IRXURBG0MlLlkyuLm+XlqcoD5Wh8vVmuV+khhIe8n
	IsbMMhyKvWO0pmfcAjpwJMAbLPU4wMOicTy0u91wlwdc2NxSqDBtIWDSiJAmgF5esU/I
	Q1qEessRObMvFgDW03dp0oA/rqpZ3dqDywaV02aCHJKbtIMIxtmoQI2ZCyW/kWeB31Li
	/UnyK7qP0om2w8OVmWaduPngaYRAtO1SKDmXQnF6sLXDj9/aP6d3vkq0849rtOTDrPhv
	faEA==
X-Received: by 10.98.15.74 with SMTP id x71mr2561658pfi.125.1450418459830;
	Thu, 17 Dec 2015 22:00:59 -0800 (PST)
Received: from [192.168.0.4] (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	e74sm12348232pfb.91.2015.12.17.22.00.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Dec 2015 22:00:59 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=VQNgf6QvOZDYWSv4DwEOAMz1FCsEsucjGb-r895M7XHw@mail.gmail.com>
Date: Thu, 17 Dec 2015 22:00:54 -0800
Message-Id: <EE4768DC-A0B6-4B69-8812-35BD3F47512A@gmail.com>
References: <1450413723-22208-1-git-send-email-armccurdy@gmail.com>
	<1450413723-22208-4-git-send-email-armccurdy@gmail.com>
	<FB8878E7-D891-4BB0-A20A-E3536DBF316F@gmail.com>
	<CAJ86T=VQNgf6QvOZDYWSv4DwEOAMz1FCsEsucjGb-r895M7XHw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4 v3] valgrind: don't restrict to armv7a
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
X-List-Received-Date: Fri, 18 Dec 2015 06:01:00 -0000
X-Groupsio-MsgNum: 74973
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B5D6E05B-3194-4820-9E42-74290FFA9ACD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B5D6E05B-3194-4820-9E42-74290FFA9ACD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Dec 17, 2015, at 9:56 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Thu, Dec 17, 2015 at 9:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Dec 17, 2015, at 8:42 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>>>=20
>>> Valgrind has been tested on armv5te/qemuarm, so it seems
>>> that valgrind's configure check for armv7 is over cautious.
>>>=20
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>> meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 8 +++++---
>>> 1 file changed, 5 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb =
b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>>> index 3dc3cc1..bb3f6e1 100644
>>> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>>> @@ -26,14 +26,16 @@ SRC_URI =3D =
"http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>>> SRC_URI[md5sum] =3D "4ea62074da73ae82e0162d6550d3f129"
>>> SRC_URI[sha256sum] =3D =
"6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
>>>=20
>>> -COMPATIBLE_HOST =3D '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
>>> -COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
>>> +COMPATIBLE_HOST =3D =
'(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
>>>=20
>>> inherit autotools ptest
>>>=20
>>> EXTRA_OECONF =3D "--enable-tls --without-mpicc"
>>> -EXTRA_OECONF_armv7a =3D "--enable-tls =
-host=3Darmv7-none-linux-gnueabi --without-mpicc"
>>> EXTRA_OECONF +=3D =
"${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS', =
True) !=3D '32']}"
>>> +
>>> +# valgrind checks host_cpu "armv7*)", so we need to over-ride the =
autotools.bbclass default --host option
>>> +EXTRA_OECONF_append_arm =3D " =
--host=3Darmv7${HOST_VENDOR}-${HOST_OS}=E2=80=9D
>>=20
>> this could be problematic for arm < v7
>=20
> The configure script will give an error if ${host_cpu} doesn't begin
> with "armv7", so we either have to provide this kind of fake --host
> option or patch the configure script.

How is it working right now ?

>=20
> Do you think patching the configure script would be better ?

that could be better since we will get failure.

>=20
>>=20
>>> EXTRA_OEMAKE =3D "-w"
>>>=20
>>> do_install_append () {
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20


--Apple-Mail=_B5D6E05B-3194-4820-9E42-74290FFA9ACD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZzoRoACgkQuwUzVZGdMxQyNwCfQEkiJgNbzqG8MzsIdakw8JfN
mU4AnApQ7BIndaeMOemy2VIUiY/hKF4x
=FFwz
-----END PGP SIGNATURE-----

--Apple-Mail=_B5D6E05B-3194-4820-9E42-74290FFA9ACD--
