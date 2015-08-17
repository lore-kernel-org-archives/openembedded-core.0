Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 23F3065CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 05:04:45 +0000 (UTC)
Received: by pacgr6 with SMTP id gr6so100208424pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 22:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=FHGPdXQ13r8LPe5Cge5HZ63jXUctdy69qkxQfxyUss0=;
	b=w0eCjw+RElZ8HJl072iZuQla/qIvMjfJrv3xVdvWotZ2mdTl7qdQLvybabQ/7WnmxV
	kDnFNc75tUK3c3+eQ6Aht3WL4ZKW55i0RdeP/bcx8mimqyd+OVumuD3sMsufPdolzw4a
	21xdgs2o4PQj4ysXbmno8m672tLpdLo57KW5kT6A5wQ9GI1xB68R/MaNHov0zp9oAg6q
	wT18Uov3kqjdvmtf8iOdGezWF5JuIWTVK7CWsA4Hm2BC2aMx78XObAcsEyCtpochOdph
	PgR5TxU4gCCHwJd9UnhoBL7sSZ/eV548VebDVvZxrDkzrch2+k9t25rLAO98BdW6m512
	ERqg==
X-Received: by 10.66.237.97 with SMTP id vb1mr38668021pac.139.1439787885842;
	Sun, 16 Aug 2015 22:04:45 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:7956:a468:cec5:d8ae?
	([2601:646:8601:4580:7956:a468:cec5:d8ae])
	by smtp.gmail.com with ESMTPSA id
	qf7sm12991849pbc.18.2015.08.16.22.04.45
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Aug 2015 22:04:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANwerB16-bm0+S2tQ2sa7MXzNjW8Qr7c4960PXcENA7zZWMc6w@mail.gmail.com>
Date: Sun, 16 Aug 2015 22:04:40 -0700
Message-Id: <41208A9B-7D35-4982-AC6D-886891DAEF53@gmail.com>
References: <1439688121-32636-1-git-send-email-raj.khem@gmail.com>
	<CANwerB16-bm0+S2tQ2sa7MXzNjW8Qr7c4960PXcENA7zZWMc6w@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Mon, 17 Aug 2015 05:04:46 -0000
X-Groupsio-MsgNum: 69499
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1E730C16-8913-4D9D-A31B-0DB8B465A53B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1E730C16-8913-4D9D-A31B-0DB8B465A53B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 16, 2015, at 7:43 PM, Jonathan Liu <net147@gmail.com> wrote:
>=20
> Hi Khem,
>=20
> On 16 August 2015 at 11:21, Khem Raj <raj.khem@gmail.com> wrote:
>> diff --git a/meta/recipes-core/systemd/systemd_219.bb =
b/meta/recipes-core/systemd/systemd_224.bb
>> similarity index 94%
>> rename from meta/recipes-core/systemd/systemd_219.bb
>> rename to meta/recipes-core/systemd/systemd_224.bb
>> index 83e4bce..16eb497 100644
>> @@ -23,14 +22,13 @@ DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native =
intltool-native gperf-native acl rea
>>=20
>> SECTION =3D "base/shell"
>>=20
>> -inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d =
update-alternatives qemu systemd ptest gettext
>> +inherit useradd pkgconfig autotools perlnative update-rc.d =
update-alternatives qemu systemd ptest gettext
>>=20
>> -SRCREV =3D "85a6fabdd3e43cfab0fc6359e9f2a9e368d4a3ed"
>> +SRCREV =3D "b2a0ac5e5b29c73ca7c0da23369a4769d5a91ddd"
>>=20
>> -PV =3D "219-stable+git${SRCPV}"
>> +PV =3D "224+git${SRCPV}"
>>=20
>> -SRC_URI =3D =
"git://anongit.freedesktop.org/systemd/systemd-stable;branch=3Dv219-stable=
;protocol=3Dgit \
>> -           =
file://0002-shared-missing.h-fall-back-to-insecure-getenv.patch \
>> +SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dgit \
>>            =
file://0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
>>            =
file://0004-configure-Check-for-additional-features-that-uclibc-.patch \
>>            =
file://0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch \
>=20
> The git repository URL has already been changed to github.com in
> master. Please rebase.

Yes, I sent it prior to that rename patch landed in master. I have sent =
out a rebased v2
thanks for bringing it up.


--Apple-Mail=_1E730C16-8913-4D9D-A31B-0DB8B465A53B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXRa2wACgkQuwUzVZGdMxQkyQCfU76plbfxH5OE4Wo0bHOX8wcT
jTUAn1lckYqseWoj2kxjUU55Wpkdx8Py
=o4CM
-----END PGP SIGNATURE-----

--Apple-Mail=_1E730C16-8913-4D9D-A31B-0DB8B465A53B--
