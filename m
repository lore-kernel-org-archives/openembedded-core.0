Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id AE1187910D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 00:30:14 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id y5-v6so2809130pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 17:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=99TTt1MwVXFvrzPS9EYOhiS+V9RWEobw8LCr/wzWnwU=;
	b=RNTW56eIvfAfFgjQdv0uT4u3GBUv2O5XAfvOPrHFX6zu7n7Kqo3tKMaxTXzCEXMGp1
	TyzJsqxKqP1vPrgHfZ4tqhZjScaChGK11P4zzh0a4NOeFjAnfIeKes9ymqLPemy2o+3S
	1+41JNAkLCqPRX5U7zo1WD8Z3409TXnXyvjYO/7JSvzcJA8qn8O7JFCQ+vVPogzx8aoX
	iGZxxxynEv7WNwAR1KLDmE7KNgN8f5ivDWJwPNqNggM/Jy2NrQ++hYIZu2hcMxRPPlMc
	UmBuOXx24Fh5F7xQcLnW/D4hyPEBzQ5nktyOXLhjbHQoHQkQuyklol4TjuncYkwut7lk
	OWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=99TTt1MwVXFvrzPS9EYOhiS+V9RWEobw8LCr/wzWnwU=;
	b=ALCa1xzAp4V4g9ZKGv0Ejupd5hSGH8OUO7SkISLF1dzCGutXN/qVMs/ShDnSbfvAhw
	FbpTQIup0kWS2GFw0u3SgrnsZlH8XybBLaDdhvbSQ7PdFAWxwVq/o4THMEAFIQ1r8TlT
	kNCP54c1qIoN6gvtPU994pT++BicYtRa/JNH7ktqfHG5vO7qk7aI68fMD25UsB7jn1j0
	VTi3YgibHGA5El1KUN2/4FyK+xzyb7xkO8JyXAJHmt2Wz08HbC9FDHxMRGzlit5U8qcQ
	rX7vQ8H3N39u0zRcfXokxl7NEAoXeJO6pQtVCrMGvgImF9OTgvgrgW6jCU4hu9veKCzB
	UdOQ==
X-Gm-Message-State: AOUpUlEz/GD2MH+WzgrE5llcKhVYuZ8ZUJAE2bwb5TfK6WcVvCZWt045
	g0rMQVZjszYTrxfzqHgM6V+dFNrj
X-Google-Smtp-Source: AA+uWPxfqN0dRexd+qCRUUp4hRA3dRuD0oem7Dhx8O1Rc1NiNpzYOshtPncKemV0qaS0sDO+N9mSig==
X-Received: by 2002:a63:c24c:: with SMTP id
	l12-v6mr3497242pgg.255.1534465815286; 
	Thu, 16 Aug 2018 17:30:15 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:2490:104c:b925:26c4])
	by smtp.gmail.com with ESMTPSA id
	87-v6sm667533pfn.103.2018.08.16.17.30.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Aug 2018 17:30:13 -0700 (PDT)
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1534399650.git.liezhi.yang@windriver.com>
	<2f1af64114464437840516b805fec7cd0773858c.1534399650.git.liezhi.yang@windriver.com>
	<ca94ab6e-6f5e-e219-a639-81081636fd43@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <4a27756b-30b1-074f-61d2-1de6a29371e2@gmail.com>
Date: Thu, 16 Aug 2018 17:30:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <ca94ab6e-6f5e-e219-a639-81081636fd43@windriver.com>
Subject: Re: [PATCH 1/1] binutils: Improve check for input file matching output file
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
X-List-Received-Date: Fri, 17 Aug 2018 00:30:14 -0000
X-Groupsio-MsgNum: 114840
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="YZPZqWaaULNZY38TZDw1WI4ePX4sFCngn"

--YZPZqWaaULNZY38TZDw1WI4ePX4sFCngn
Content-Type: multipart/mixed; boundary="nhcRoQkl6vDsJdYwCKQ04XegtthvNO3TS";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <4a27756b-30b1-074f-61d2-1de6a29371e2@gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] binutils: Improve check for input file
 matching output file
References: <cover.1534399650.git.liezhi.yang@windriver.com>
 <2f1af64114464437840516b805fec7cd0773858c.1534399650.git.liezhi.yang@windriver.com>
 <ca94ab6e-6f5e-e219-a639-81081636fd43@windriver.com>
In-Reply-To: <ca94ab6e-6f5e-e219-a639-81081636fd43@windriver.com>

--nhcRoQkl6vDsJdYwCKQ04XegtthvNO3TS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 8/15/18 11:25 PM, Robert Yang wrote:
>=20
>=20
> On 08/16/2018 02:14 PM, Robert Yang wrote:
>> When the assembler reports that the input and output are the same,
>> report the
>> file names involved, in order to help debugging.=C2=A0 Also do not equ=
ate
>> two files
>> are the same if the have the same inode value but reside on different
>> file
>> systems.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>> =C2=A0 meta/recipes-devtools/binutils/binutils-2.31.inc=C2=A0=C2=A0 |=C2=
=A0 1 +
>> =C2=A0 ...check-for-input-file-matching-output-file.patch | 59
>> ++++++++++++++++++++++
>> =C2=A0 2 files changed, 60 insertions(+)
>> =C2=A0 create mode 100644
>> meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-f=
ile-matching-output-file.patch
>>
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc
>> b/meta/recipes-devtools/binutils/binutils-2.31.inc
>> index 02d5bca..6603873 100644
>> --- a/meta/recipes-devtools/binutils/binutils-2.31.inc
>> +++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
>> @@ -36,6 +36,7 @@ SRC_URI =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0014-Detect-64-bit-MIPS-ta=
rgets.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0015-sync-with-OE-libtool-=
changes.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0016-add-i386pep-emulation=
-for-x86_64.patch \
>> +=C2=A0=C2=A0=C2=A0=C2=A0
>> file://0017-improve-check-for-input-file-matching-output-file.patch \
>> =C2=A0 "
>> =C2=A0 S=C2=A0 =3D "${WORKDIR}/git"
>> =C2=A0 diff --git
>> a/meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input=
-file-matching-output-file.patch
>> b/meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input=
-file-matching-output-file.patch
>>
>> new file mode 100644
>> index 0000000..6d8d8a3
>> --- /dev/null
>> +++
>> b/meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input=
-file-matching-output-file.patch
>>
>> @@ -0,0 +1,59 @@
>> +From 2a50366ded329bfb39d387253450c9d5302c3503 Mon Sep 17 00:00:00 200=
1
>> +From: Robert Yang <liezhi.yang@windriver.com>
>> +Date: Tue, 14 Aug 2018 12:22:35 +0100
>> +Subject: [PATCH] as.c: Improve check for input file matching output
>> file.
>> +
>> +When the assembler reports that the input and output are the same,
>> report the
>> +file names involved, in order to help debugging.=C2=A0 Also do not eq=
uate
>> two files
>> +are the same if the have the same inode value but reside on different=

>> file
>> +systems.
>> +
>> +Upstream-Status: Backport
>> +
>> +Robert Yang <liezhi.yang@windriver.com>
>=20
> Sorry, here missed a SOB, I fixed it in the repo:
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>


patch is ok

>=20
> // Robert
>=20
>> +---
>> + gas/as.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 27 ++++++++++++++++++++----=
---
>> + 2 files changed, 20 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/gas/as.c b/gas/as.c
>> +index b2a908a..3105d06 100644
>> +--- a/gas/as.c
>> ++++ b/gas/as.c
>> +@@ -1259,14 +1259,27 @@ main (int argc, char ** argv)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct stat sib;
>> +
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (stat (argv[i], &sib) =3D=3D 0)
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Check that the input file and outp=
ut file are different.=C2=A0 */
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (stat (argv[i], &sib) =3D=3D 0
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 && sib.st_ino=
 =3D=3D sob.st_ino
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* POSIX emul=
ating systems may support stat() but if the
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 underlying file sys=
tem does not support a file serial number
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of some kind then t=
hey will return 0 for the inode.=C2=A0 So
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 two files with an i=
node of 0 may not actually be the same.
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 On real POSIX syste=
ms no ordinary file will ever have an
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inode of 0.=C2=A0 *=
/
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 && sib.st_ino=
 !=3D 0
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Different =
files may have the same inode number if they
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reside on different=
 devices, so check the st_dev field as
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 well.=C2=A0 */
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 && sib.st_dev=
 =3D=3D sob.st_dev)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (sib.st_in=
o =3D=3D sob.st_ino && sib.st_ino !=3D 0)
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Don't let =
as_fatal remove the output file!=C2=A0 */
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 out_file_name=
 =3D NULL;
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as_fatal (_("=
The input and output files must be distinct"));
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *s=
aved_out_file_name =3D out_file_name;
>> ++
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Don't let =
as_fatal remove the output file!=C2=A0 */
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 out_file_name=
 =3D NULL;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as_fatal (_("=
The input '%s' and output '%s' files are the
>> same"),
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a=
rgv[i], saved_out_file_name);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +--
>> +2.7.4
>> +
>>


--nhcRoQkl6vDsJdYwCKQ04XegtthvNO3TS--

--YZPZqWaaULNZY38TZDw1WI4ePX4sFCngn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW3YXDQAKCRC7BTNVkZ0z
FPTsAJ4o2sWMnHKffg5ncNA5/99SPVqw5QCeLT6PifD9ndM6Y+COcEibjU7nFyY=
=Wf60
-----END PGP SIGNATURE-----

--YZPZqWaaULNZY38TZDw1WI4ePX4sFCngn--
