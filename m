Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 14D2960111
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 22:34:21 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id a136so6403172pfa.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=0UlgVmz8D77cNmpkGqz0Q3BnG2/0X1BmPxWIO5+7qX8=;
	b=CuS6Ysx2xQhxbme/cy68jC/sk9CE+elWVcE6IvyB+d0BrVlV9+FM+yY5s2U7RMdJOg
	jKQFp2Du8VqBkXxTSZorHauouXSzeJoEeWhhPoxDN5aphJiWwqm46BIl7zLH4YDAI/bQ
	KUalfp2jk4PyUOTn6m6k5VMkXotl/vZfQQhFrrv7s1HsjBbdnubClJGRNaomi7Hb5XJC
	LkyvFMf1yd38LQpbKsVPp+jEruKEeLTl9j00GP6AqbPNCzhaEAurvDZ1eA/QNur8LayA
	TgtMD7N2jGWRWy/B2z837qaA86RjAn1OW/UpuRiGdsMD8j6nWyq0TYUdp2q/PufoLSBE
	FKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=0UlgVmz8D77cNmpkGqz0Q3BnG2/0X1BmPxWIO5+7qX8=;
	b=PCffZjT4rw3C4vgbhlZ8YG+ooHOKwMynsMhr2xrQLLIpa5DxSpnMIjWbajEYGC+TUb
	caO5cgtzytVhvYucDvZ3SFKFeVzfTFnSM6AZpTP8itV6IUjK/vHpUaTDQTnw00JtHYT4
	o7KQVIyZfK7oNKfiTOBWw15lz1XQUif3XXYb8UDAcAkaxW4LdTLAZMekz2ztKte7/iiO
	KLQsrkKULJM7DMx4srpI48F/gBnhHkcWi3+waBoYH0uQvMupcXbIHSwwTpXg7ua3Msph
	lUVYZ1xGayKUEwq3BvowbPEFnitjwpvL+hnVdtdw8j0/Zf1PXyYuP1fWGd5Si8oVf+1Q
	eHqA==
X-Gm-Message-State: ABUngvdol5K3mtDmWelVn/pWUWE3xNa+OPqZgIH9awSB3Jk5G/TsSlkRlYVCBc3tV68GKg==
X-Received: by 10.98.69.151 with SMTP id n23mr53128972pfi.60.1477953262762;
	Mon, 31 Oct 2016 15:34:22 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:2cc8:a0e4:7c5b:437?
	([2601:646:8882:b8c:2cc8:a0e4:7c5b:437])
	by smtp.gmail.com with ESMTPSA id
	xn11sm37780406pac.38.2016.10.31.15.34.21
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Oct 2016 15:34:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <2111229.GbldrazETl@peggleto-mobl.ger.corp.intel.com>
Date: Mon, 31 Oct 2016 15:34:16 -0700
Message-Id: <1A7D1C00-1B1C-40CF-8240-9BC100D0EA8A@gmail.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
	<e1af68e680f3fbf20d7b0a8c55802a9cdd3f404b.1477886344.git.paul.eggleton@linux.intel.com>
	<CAMKF1soshS9nzHZ_OEQ9cJvZNRREnAKQKz6fXUzcJQGBD6nvHA@mail.gmail.com>
	<2111229.GbldrazETl@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] classes/license: fix handling of symlinks pointed to in LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 31 Oct 2016 22:34:25 -0000
X-Groupsio-MsgNum: 88821
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F4CBDE7C-20FC-47F5-BFA6-875E463E5A4E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F4CBDE7C-20FC-47F5-BFA6-875E463E5A4E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 31, 2016, at 12:41 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> Hi Khem,
>=20
> Why wouldn't it be?

Was thinking out loud if the path is expanded to absolute paths then
does it get recorded into task checksums  ?

>=20
> Cheers,
> Paul
>=20
> On Mon, 31 Oct 2016 12:23:04 Khem Raj wrote:
>> Is this sstate safe?
>>=20
>> On Oct 30, 2016 9:11 PM, "Paul Eggleton" =
<paul.eggleton@linux.intel.com>
>>=20
>> wrote:
>>> If you set LIC_FILES_CHKSUM to point to a relative symlink then =
you'll
>>> get "Could not copy license file" warnings in copy_license_files() =
since
>>> the symlink won't be valid after it's copied. If the source is a =
symlink
>>> then we need to dereference it first.
>>>=20
>>> I encountered this when I used recipetool on the sources for =
capnproto,
>>> where the c++ directory contains a LICENSE.txt symlink to the =
LICENSE
>>> file in the parent directory, and this symlink ends up being pointed =
to
>>> in LIC_FILES_CHKSUM.
>>>=20
>>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>> ---
>>>=20
>>> meta/classes/license.bbclass | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>=20
>>> diff --git a/meta/classes/license.bbclass =
b/meta/classes/license.bbclass
>>> index da4fc3e..660b85f 100644
>>> --- a/meta/classes/license.bbclass
>>> +++ b/meta/classes/license.bbclass
>>>=20
>>> @@ -351,6 +351,8 @@ def copy_license_files(lic_files_paths, =
destdir):
>>>             dst =3D os.path.join(destdir, basename)
>>>=20
>>>             if os.path.exists(dst):
>>>                 os.remove(dst)
>>>=20
>>> +            if os.path.islink(src):
>>> +                src =3D os.path.realpath(src)
>>>=20
>>>             canlink =3D os.access(src, os.W_OK) and =
(os.stat(src).st_dev =3D=3D
>>>=20
>>> os.stat(destdir).st_dev)
>>>=20
>>>             if canlink:
>>>                 try:
>>> --
>>> 2.5.5
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


--Apple-Mail=_F4CBDE7C-20FC-47F5-BFA6-875E463E5A4E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgXxu0ACgkQuwUzVZGdMxSbfwCfUjJ4b0oCReOHJFbWoGRpuTo/
W6UAn1FKip5I+Z9aAVzee5ViLIScn5Dq
=SnNk
-----END PGP SIGNATURE-----

--Apple-Mail=_F4CBDE7C-20FC-47F5-BFA6-875E463E5A4E--
