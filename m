Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id E92E773183
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 18:27:21 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id 65so103638905pff.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 10:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=AWI2QRiGgMxOqjUdc7u4sHuXtGitK/4S6OaF7qg5cqk=;
	b=OawH4/j1Nzays9Qpa9XPvhQkYox0qsIjVaYSQ1xOiaOfKFsgekUnUbgRkRiV0mg4By
	4x5P8v0mpv3ONtktFzxdROVpTvKcl7FRhe31nJTwgvMLsLWAj8lgpTukNDxqwulwiP6J
	0jdF/OGM0iRLmKd2JolFGssmhv8BPTKzUKqOV6w8LECu77Nee0SCVT81BXbc7Nh1+5Rf
	Qyu3ttvwGGphevO/Xfdhq/zlC8Zx+vNxbUGfP1vEx4YFffcF8wuXPW9LVvRxQkmJuacO
	PnBsIUVa4XRWO3IyPaaiUjGlyUMCf8x+9vS6WLqdUe/n9vsAqgrPF4WKSoX+mXi+6OgX
	qOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=AWI2QRiGgMxOqjUdc7u4sHuXtGitK/4S6OaF7qg5cqk=;
	b=WhEXo8RlRJ5p7S1HQmc8yOhW5Odp6jVNAvpNeIxXcyQGxR7JKFvglkaHsBn5fKG6Wk
	9Mb3KwRKPQqXXAuSPCBNz+l+Da4F9uu4A2WZRD+MewfF96cW4FmHR+VxUwxQme+n9UFq
	ILvTEkDm6BoR+2QG+jNuNL7pcfg/E50dVuX7Ui39BsBVv7aHH938P9xF3kjKmRmfaQZY
	ssWm4eXx/juvCIszP4hsfsSl5SJNCzxNew3pg3Fv35NyR5JEG5xjG0cXRw0jizGnWlHL
	RyWsgUF7S0BQ6eOLjxiiOuo+16KUV5mQYzVWxvHtamBZ4GBJI04utRqwYfXkjbwzg3Wt
	2MjA==
X-Gm-Message-State: ALoCoQnwWV8F1i1pHryrZzXCUzxNhw0DY1go3zAPsCZ7tYGi258GJsXyWqKf4Q0vBiQElt1dtb/nZr72dZMn68uV/T/JXt0nUQ==
X-Received: by 10.98.74.9 with SMTP id x9mr8281953pfa.14.1452796042749;
	Thu, 14 Jan 2016 10:27:22 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:4c4c:5f92:7d4d:1d28?
	([2601:646:8802:5d5c:4c4c:5f92:7d4d:1d28])
	by smtp.gmail.com with ESMTPSA id
	g87sm10883997pfj.1.2016.01.14.10.27.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jan 2016 10:27:21 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55F751DA.1020903@igalia.com>
Date: Thu, 14 Jan 2016 10:27:21 -0800
Message-Id: <3FF112F9-6E3D-4A9E-9A1D-AA30AF596FD6@gmail.com>
References: <1441975783-21782-1-git-send-email-clopez@igalia.com>
	<1441983077.31676.17.camel@pbcl.net>
	<E1DF44AB-9219-4848-9031-60846FC2BF7B@gmail.com>
	<55F751DA.1020903@igalia.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] matchbox-keyboard: Fix build failure with ld-is-gold
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
X-List-Received-Date: Thu, 14 Jan 2016 18:27:24 -0000
X-Groupsio-MsgNum: 76075
Content-Type: multipart/signed;
	boundary="Apple-Mail=_52EE5500-FADD-43A2-9EF4-CDAD7398DDC8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_52EE5500-FADD-43A2-9EF4-CDAD7398DDC8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252

Carlos

Can you try this fix

=
https://github.com/kraj/openembedded-core/commit/0e35ad5a35262cfb7a6249ce1=
58f76d1399d6cb4


This should help with this issue.


> On Sep 14, 2015, at 4:01 PM, Carlos Alberto Lopez Perez =
<clopez@igalia.com> wrote:
>=20
> On 14/09/15 09:24, Khem Raj wrote:
>>=20
>>> On Sep 11, 2015, at 7:51 AM, Phil Blundell <pb@pbcl.net> wrote:
>>>=20
>>> On Fri, 2015-09-11 at 14:49 +0200, Carlos Alberto Lopez Perez wrote:
>>>> * When ld-is-gold is enabled in DISTRO_FEATURES, matchbox-keyboard
>>>>   will fail to build with this error:
>>>>=20
>>>>   ld: error: matchbox-keyboard-image.o: requires unsupported =
dynamic
>>>>              reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
>>>=20
>>> This is only an issue for ARM (and only for Thumb2 at that).  I =
don't
>>> think it's necessarily appropriate to force -fPIC on all targets.
>>>=20
>>> Also, before adding this sort of hack it would be worth verifying
>>> whether this is in fact a toolchain bug and, if it is, fixing it =
there.
>>>=20
>>=20
>> This may not be a toolchain bug if there is a MOVW_ABS relocation =
being emitted
>> into an object that is eventually linked into shared library. Using =
-fPIC seems to be right fix
>> I know bfd linker silently ignored these relocations and generated =
bad .so files but that was fixed
>> several years ago. So I think what needs to be looked at is why does =
same .o links ok with bfd linker
>> is it some linker trampoline code thats in question here which may be =
different between gold and ld
>>=20
>> Carlos
>>=20
>> Can you check the linker cmdline of failing link step and see if its =
generating a shared object there ?
>> if thats the case and I assume gcc is generating this relocation into =
both
>>=20
>=20
> It looks is generating an executable (matchbox-keyboard).
>=20
> Full log: http://sprunge.us/VPIN
>=20


--Apple-Mail=_52EE5500-FADD-43A2-9EF4-CDAD7398DDC8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaX6IkACgkQuwUzVZGdMxQ9pQCgi81W7C7OmgIDnLREwHzF6qzP
lccAoI5Fd+9wCINRR2GFpVwaxxSTeiFm
=0TE/
-----END PGP SIGNATURE-----

--Apple-Mail=_52EE5500-FADD-43A2-9EF4-CDAD7398DDC8--
