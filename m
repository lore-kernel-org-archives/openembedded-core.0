Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 20F7560111
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 17:16:51 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id uo6so7845332pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=R7glLhAQctmDislS/VQi/c0tXJjEVbePtosn93ZYVFI=;
	b=RAQjkT7BbjVTrgBEcZeCKoDeAv3dv4KCy7SydkBrqsQcQE3WQns+AHVY26rEexSVv+
	qtrJmXcGw0aSBBI5iTr0+1N2kdFJp2xI/zj5RKtYgvZdmpR6/ewj8A4sd/1OnbzkJ2/S
	SHk/UA3snV7bTMyRQslqyXGzUFb3u3e0JwLhWggU5qneqtKuHOIsR2/L5+1kdErYCQ6d
	UiYTw+4vWvoReN8REUqgFcZnAJd/LkuTF9nGFfjl8VAblwOQEiR1WAsGvI+lYaPDPDEF
	6EW5V3j1PaM+jvoHT7TLd0y/fVxsRX1LNR8xZqGy3Iil5dvaiIDgeK4CCj0BLhYAmpI2
	mlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=R7glLhAQctmDislS/VQi/c0tXJjEVbePtosn93ZYVFI=;
	b=l9kSSERwqTyPhH76OLxc9orCww+0VuCmrSCd9IZ3wiyXfKZhnmKD7q9UrMngoB3334
	N5WYGms4NQZXRVDgGsjj2cSeEajU4c0KrueSLw91COCpiS7gM6/dQtMK+xl2WY23xQ6l
	SbeB5lm7AAm46lF5MocHFClaoXJZaYMrpbLAtB0HD04358mP6XmGAFQx6CTdc9vlD1MO
	+tQF7X4jEU0ssOTpiK4EKGAyQirJtHsxLpjl+QiwLcXj8dMqNBWysm5a4WkIb4KIzg9P
	VQyYvrmDIj5p5Bh1MrRRR1YQBWy5nLfZkfDzX+jyTOYh6QN4NurrvfDxxT/zwuXlM4fw
	3wGg==
X-Gm-Message-State: ALoCoQmNlI47MITUhLR814dRpExhNpsA9tG/sm6+4zmCrTzDBX7NeM3fJ/gz20Jq29QjXKr9DSyUYkS4/FxKX+9ZQ+15eQYEBQ==
X-Received: by 10.66.253.198 with SMTP id ac6mr54110394pad.37.1453310212362;
	Wed, 20 Jan 2016 09:16:52 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:450b:e083:385a:4667?
	([2601:646:8802:5d5c:450b:e083:385a:4667])
	by smtp.gmail.com with ESMTPSA id
	h66sm50037057pfj.52.2016.01.20.09.16.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jan 2016 09:16:51 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160120150754.GA26306@mbabyjoh-mobl.fi.intel.com>
Date: Wed, 20 Jan 2016 09:16:46 -0800
Message-Id: <EFF0F4EC-126D-4B7A-B276-32850ABFEB56@gmail.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>
	<f457364648f238d8b0353c2f7d14a5b08ed427fe.1452472146.git.hongxu.jia@windriver.com>
	<20160120150754.GA26306@mbabyjoh-mobl.fi.intel.com>
To: "Maxin B. John" <maxin.john@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/9] elfutils: 0.163 -> 0.164
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
X-List-Received-Date: Wed, 20 Jan 2016 17:16:52 -0000
X-Groupsio-MsgNum: 76531
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4395F5D8-B495-4CB9-B96D-CD060D6C5F90";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4395F5D8-B495-4CB9-B96D-CD060D6C5F90
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 20, 2016, at 7:07 AM, Maxin B. John <maxin.john@intel.com> =
wrote:
>=20
> Hi,
>=20
> On Mon, Jan 11, 2016 at 08:30:32AM +0800, Hongxu Jia wrote:
>> Update patches from debian
>> =
http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.164-1.debi=
an.tar.xz
>>=20
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>> .../elfutils/elfutils-0.163/arm_func_value.patch   |  165 ----
>> .../elfutils-0.163/arm_unwind_ret_mask.patch       |   83 --
>> .../elfutils/elfutils-0.163/non_linux.patch        |   35 -
>> .../elfutils-0.163/redhat-portability.diff         | 1021 =
--------------------
>> .../elfutils/elfutils-0.163/scanf-format.patch     |   40 -
>> .../uclibc-support-for-elfutils-0.161.patch        |  106 --
>> ...ferences-between-mips-machine-identifiers.patch |   34 +
>> ...m-Silence-Werror-maybe-uninitialized-fals.patch |    0
>> .../0001-fix-a-stack-usage-warning.patch           |    0
>> .../0001-remove-the-unneed-checking.patch          |    0
>> ...-support-for-mips64-abis-in-mips_retval.c.patch |  168 ++++
>> .../0003-Add-mips-n64-relocation-format-hack.patch |  226 +++++
>> .../arm_backend.diff                               |  389 ++++----
>> .../fixheadercheck.patch                           |    0
>> .../hppa_backend.diff                              |   69 +-
>> .../elfutils/elfutils-0.164/kfreebsd_path.patch    |   15 +
>> .../m68k_backend.diff                              |   61 +-
>> .../mips_backend.diff                              |   71 +-
>> .../mips_readelf_w.patch                           |    8 +-
>> .../testsuite-ignore-elflint.diff                  |    0
>> .../{elfutils_0.163.bb =3D> elfutils_0.164.bb}       |   15 +-
>> 21 files changed, 735 insertions(+), 1771 deletions(-)
>> delete mode 100644 =
meta/recipes-devtools/elfutils/elfutils-0.163/arm_func_value.patch
>> delete mode 100644 =
meta/recipes-devtools/elfutils/elfutils-0.163/arm_unwind_ret_mask.patch
>> delete mode 100644 =
meta/recipes-devtools/elfutils/elfutils-0.163/non_linux.patch
>> delete mode 100644 =
meta/recipes-devtools/elfutils/elfutils-0.163/redhat-portability.diff
>> delete mode 100644 =
meta/recipes-devtools/elfutils/elfutils-0.163/scanf-format.patch
>> delete mode 100644 =
meta/recipes-devtools/elfutils/elfutils-0.163/uclibc-support-for-elfutils-=
0.161.patch
>=20
> Here, the patch uclibc-support-for-elfutils-0.161.patch was removed.
> However, it is still referenced in the recipe. It should be updated
> to fix build error with uclibc.
>=20
> WARNING: Failed to fetch URL =
file://uclibc-support-for-elfutils-0.161.patch, attempting MIRRORS if =
available
> ERROR: Fetcher failure: Unable to find file =
file://uclibc-support-for-elfutils-0.161.patch anywhere. The paths that =
were searched were:
> =E2=80=A6

its already fixed in my musl pull request.

>=20
> Best Regards,
> Maxin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_4395F5D8-B495-4CB9-B96D-CD060D6C5F90
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlafwQIACgkQuwUzVZGdMxQ1DwCeKySwlPT/Fg9TFfTQ0iZAudgs
mVEAn0KEMWFEHwMsQCG5ped6wLJe4Lyk
=1UeM
-----END PGP SIGNATURE-----

--Apple-Mail=_4395F5D8-B495-4CB9-B96D-CD060D6C5F90--
