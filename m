Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8C56273DF0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 06:03:24 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so58287493pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 23:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=6fphdivtBPba5liw1zBzrSVK+MdqiNrf273gZJO+i1Q=;
	b=Wf77SEy1noxYMzVWv68WyfNDmxLsEaPBuGEwIt4pL5bKiQvkLoHk9+KxvpM3wnCeu4
	BSCJf460OgYTNuOfUVYmzfKwlA3CetvJYrIR2coCrFtg4X/F/rmpClY4+VhITiFf3sfS
	4MbPeUkwlwp25ZFTd1qbIdNaIbvG/wUll5M8sr9QtxtaiOFA2j6ZN5+Gt/i59jHSH8+3
	Zgf6f5ZyBiZg+czWqPUa8sjc1TN86P007aMtabi2HRsau1YUK9S6OxVt3mTy6R7LJ2Rh
	QeQ5MEM1oE0pjsaQ4Qcdr6x7+4BrC8j02WFRLGBEkP5Jq5XR/Yz6aQFp4Mmpgi8EaZHP
	FbvA==
X-Received: by 10.68.57.234 with SMTP id l10mr24715947pbq.143.1440223404515;
	Fri, 21 Aug 2015 23:03:24 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	pt3sm9763696pbb.38.2015.08.21.23.03.22
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 21 Aug 2015 23:03:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKrEBfBH-+Z2VYg3qG5Bpi7aDozn6F1Z9r7MP3qC8Zs+RQ@mail.gmail.com>
Date: Fri, 21 Aug 2015 23:03:17 -0700
Message-Id: <F5709C6C-5297-49D4-B2BD-931B59837210@gmail.com>
References: <1440193082-508-1-git-send-email-otavio@ossystems.com.br>
	<2ADD7CA4-0184-4D54-9E0B-8A58ACB51DC1@gmail.com>
	<CAP9ODKrEBfBH-+Z2VYg3qG5Bpi7aDozn6F1Z9r7MP3qC8Zs+RQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Mailer: Apple Mail (2.2104)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Rename 'BRANCH' variable to 'SRC_BRANCH' for clearness
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
X-List-Received-Date: Sat, 22 Aug 2015 06:03:26 -0000
X-Groupsio-MsgNum: 69848
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FA67A954-4FEC-4560-A299-D010D3D56A48";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FA67A954-4FEC-4560-A299-D010D3D56A48
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 21, 2015, at 2:58 PM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>=20
> On Fri, Aug 21, 2015 at 6:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Aug 21, 2015, at 2:38 PM, Otavio Salvador =
<otavio@ossystems.com.br> wrote:
>>>=20
>>> The 'BRANCH' variable name has no explicit relation with the
>>> SRC_URI. Using 'SRC_BRANCH' makes it more obvious and easier to
>>> identify.
>>=20
>> Look good to me, just may be avoid =E2=80=98_=E2=80=99 and call it =
SRCBRANCH
>=20
> I did this initially but looking at how it looks in the source code,
> it seems SRC_BRANCH makes easier to spot the relation with SRC_URI. So
> I took the second.

since bitbake use =E2=80=98_=E2=80=99 as a override separator, its less =
confusing if variables don=E2=80=99t have underscore in them
for future collision.

>=20
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


--Apple-Mail=_FA67A954-4FEC-4560-A299-D010D3D56A48
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXYEKkACgkQuwUzVZGdMxTj1gCfbL1Em7B2bVg6K9G2crwfJ3q8
ffkAnR3Rg9Lx1vZAJ2XTONgD+Wxny1ay
=rLGc
-----END PGP SIGNATURE-----

--Apple-Mail=_FA67A954-4FEC-4560-A299-D010D3D56A48--
