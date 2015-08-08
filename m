Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3A71D767EF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Aug 2015 23:52:12 +0000 (UTC)
Received: by pdbfa8 with SMTP id fa8so17916060pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Aug 2015 16:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=vFew3+XOBwpVMUPeudjO4kqq0YM+CRSH2uNKqGqWf0Y=;
	b=vCxgRc8ZxJAOuZ4TfbxFcMQASK7FMY7thoIfqoTqWJ43K6tirvlA1bgfolJsVshLWx
	8n8GpsY8h0LO8eOKVNHi24+3vwAwxnulln+fnq1Brf9kdwtGTW0bNYmMnG9zIB1Oykc+
	nZIvugjdEbg8ByvauJ6LGHjPeHz/Tz3d9vxk+GS0v4CW3rddXcWrAVWZQATCIBZzt9sS
	cTzq8AayDbNe5PO9GXoUnNPzOoIzZUTTXzlDqdkle+m8jVTu9USclOeXu1FAvWs6RNVH
	u3EAv0dY/mpgBTpsF3LzyPOuNAtBK53m1KYkDVg4nNiXZWcLm3eebZ/WrXfjNU8DzuHa
	X3pQ==
X-Received: by 10.70.50.165 with SMTP id d5mr30551063pdo.93.1439077932796;
	Sat, 08 Aug 2015 16:52:12 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:61b5:b56b:3665:2b08?
	([2601:646:8601:4580:61b5:b56b:3665:2b08])
	by smtp.gmail.com with ESMTPSA id
	iw2sm14702209pbb.67.2015.08.08.16.52.11
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 16:52:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55B9D4E3.1010305@windriver.com>
Date: Sat, 8 Aug 2015 16:52:06 -0700
Message-Id: <4FCE2229-1F6C-42A3-B74A-9906A61A64AE@gmail.com>
References: <1438155256-3385-1-git-send-email-wenzong.fan@windriver.com>
	<CAJTo0LY_8MGszbQYJziM+bj4GUV+qmQgnzSTOHb4XG0+1GVb8A@mail.gmail.com>
	<55B9D4E3.1010305@windriver.com>
To: wenzong fan <wenzong.fan@windriver.com>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bjam-native: inhibit sysroot strip
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
X-List-Received-Date: Sat, 08 Aug 2015 23:52:13 -0000
X-Groupsio-MsgNum: 69161
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2C59CC59-5D20-4B18-8E9F-336F6A621A2D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2C59CC59-5D20-4B18-8E9F-336F6A621A2D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 30, 2015, at 12:40 AM, wenzong fan <wenzong.fan@windriver.com> =
wrote:
>=20
> On 07/29/2015 06:19 PM, Burton, Ross wrote:
>>=20
>> On 29 July 2015 at 08:34, <wenzong.fan@windriver.com
>> <mailto:wenzong.fan@windriver.com>> wrote:
>>=20
>>    +# bjam is already stripped, don't strip it again
>>    +INHIBIT_SYSROOT_STRIP =3D "1"
>>=20
>>=20
>> In case it's even needed to debug bjam-native, how hard would it be =
to
>> stop bjam from being stripped in the first place?
>=20
> By default, a release version is stripped, we could build & install =
the debug version for bjam.
>=20
> For specific changes, we only need to append "--debug" to build.sh, =
then update do_install() to select the unstripped version.
>=20
> Do you think this is the right ways?


export INSTALL=3D=E2=80=9Cinstall=E2=80=9D or something like that might =
do it. usually folks use install -s by default during install step which =
cause such issues.

> Thanks
> Wenzong
>=20
>>=20
>> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_2C59CC59-5D20-4B18-8E9F-336F6A621A2D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGlioACgkQuwUzVZGdMxS3HwCghfx3XmTJbo1v0cxBukKv5YtY
AIYAn10u/9yyrR7d9nHDAXDLV2GHHO2k
=SF3W
-----END PGP SIGNATURE-----

--Apple-Mail=_2C59CC59-5D20-4B18-8E9F-336F6A621A2D--
