Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 73731731BD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 14:51:38 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hh10so5068779pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=R/Zpbx+fi5d5AyMy/CP6secQCzSQCv+QzcUeMrvT+MQ=;
	b=eWpFqd2nUEdNOJ0R3c/y9nIn3KfkbqHPORFDl9Rgc1SkD2/lBVYLk7Ft3LVJudxFK0
	Ke7Yei3EecJJIQOZYKBlBqPgyWFw7Aw8Z4eusKv5bjQ6ng1FGsEUdz8oAwLFwsOYsBxK
	qEji0DNR7OCDRa0BJuDc0WFt0Kv6p+58044KM0mAyINlbvJOR+Dd6CwYxgNFCUwLpkUM
	iB59Ugvt0dWnReMEWOfDtsEnnNRN0ze0CUA0Pu+k/SEElk8dZprJTJYkZV20W6qDBc91
	tKLjfXDHTFheZcI+zeAzXAdaXqcvse67IMx9mORG14jGE0phOK7+ebuZm+M29q1UtjW7
	UEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=R/Zpbx+fi5d5AyMy/CP6secQCzSQCv+QzcUeMrvT+MQ=;
	b=jWgdIgfhodxNJqS2agw0wRVSG/iDNN/EI/w0/lcV2AfzrW6CHbMq3IAWvAaUIl8fx8
	RDaxWocaXSuKtNE8GH3VjRy1CeMMziltG1bQHheaHwwWf8VkMOZQ/7b9PGOMyd02W9uK
	H5dBxaxIZStlc4kBOhM/C9g1deNdIqaNSh2rxm7GKXautUGP82fWYVYMiF2As/VrnMdv
	Np84nnSaKZ2eTKQdoAO6ilr1cSgpPrvK8s1ZFEoyv7YvclvTKVSqAvYUR95R+UVQZClN
	wEbWkQuFaOOfITubUaTPEnS36no0zIMIBY97Y77vBsDIwtT1cEiEhijSl7nLZYFxoo1O
	rkiw==
X-Gm-Message-State: AEkooutiv3PhXIDzfqUVwwgz8tGfm+i7Sw5lIYDVrDwgWIqjFPrKWoiKH85BrWBhth8GHw==
X-Received: by 10.66.164.70 with SMTP id yo6mr24105659pab.47.1471704699274;
	Sat, 20 Aug 2016 07:51:39 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:4511:33bb:3b5e:4f35?
	([2601:646:8882:b8c:4511:33bb:3b5e:4f35])
	by smtp.gmail.com with ESMTPSA id
	l128sm14682548pfl.21.2016.08.20.07.51.38
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 20 Aug 2016 07:51:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1470987751.4987.13.camel@andred.net>
Date: Sat, 20 Aug 2016 07:51:41 -0700
Message-Id: <7A51C236-FD8D-424C-9468-5796F4E54E10@gmail.com>
References: <1470924371-1675-1-git-send-email-git@andred.net>
	<3A0FE7FC-807D-4CED-8673-DA28B5F36A88@gmail.com>
	<1470986810.4987.8.camel@andred.net>
	<CAMKF1sqdpxYYrKnLkJ1VofY=qz5FEKsKWBo_7WrU+Cm_Kp1fDQ@mail.gmail.com>
	<1470987751.4987.13.camel@andred.net>
To: =?utf-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libnl: musl fixes
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
X-List-Received-Date: Sat, 20 Aug 2016 14:51:39 -0000
X-Groupsio-MsgNum: 86015
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4A4BE57D-A825-4143-A501-40642CD9FB2F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4A4BE57D-A825-4143-A501-40642CD9FB2F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 12, 2016, at 12:42 AM, Andr=C3=A9 Draszik <git@andred.net> =
wrote:
>=20
> On Fri, 2016-08-12 at 00:28 -0700, Khem Raj wrote:
>> On Fri, Aug 12, 2016 at 12:26 AM, Andr=C3=A9 Draszik <git@andred.net> =
wrote:
>>>=20
>>> On Thu, 2016-08-11 at 22:45 -0700, Khem Raj wrote:
>>>>=20
>>>>>=20
>>>>>=20
>>>>> On Aug 11, 2016, at 7:06 AM, Andr=C3=A9 Draszik <git@andred.net> =
wrote:
>>>>>=20
>>>>> The libnl+musl combination has two issues at the moment:
>>>>> a) a public header file #include's an incorrect file
>>>>>   (sys/poll.h instead of poll.h), which causes warnings and
>>>>>   potentially errors (-Werror) in a musl based system
>>>>> b) musl only ever provides the XSI version of strerror_r()
>>>>>=20
>>>>=20
>>>> yes so you can check for something like
>>>> (_POSIX_C_SOURCE >=3D 200112L || _XOPEN_SOURCE >=3D 600) && ! =
_GNU_SOURCE
>>>> use XSI version
>>>> else use GNU version
>>>=20
>>> Well, the feature test is supposed to be set by the user (libnl in =
this
>>> case), and evaluated by the c library (musl). libnl explicitly sets
>>> _GNU_SOURCE, i.e. it expects the glibc version.
>>=20
>> I see. It is something which should atleast be brought up with
>> upstream as an issue
>> they may just say, we need GNU version but atleast we will know
>=20
> It's actually quite a bad thing... There might be many users (you =
mentioned
> perf) out there which all are silently breaking because of this =
missing
> interface in musl. If you look at the patch, in the musl case the =
result was
> effectively a printf of an *int* with a *string format* specifier...
>=20
> Maybe it'd be worth to convince musl to implement it (uclibc does), or =
at
> least to emit an #error?

Thinking more on this, there is an alternative to use strerror_l() =
rather
than strerror_r(), that will avoid the non-confirming versions issue, =
moreover
strerror_() is now recommended by posix to replace strerror_r() usage.

see

http://austingroupbugs.net/view.php?id=3D655

I think this is going to be a better solution since its portable.

>=20
> I only noticed by coincidence...
>=20
>=20
> Cheers,
> Andre'
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_4A4BE57D-A825-4143-A501-40642CD9FB2F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle4boEACgkQuwUzVZGdMxQa/QCeLCnFvroDiBA+2qYNVR+Z1K0d
4KMAniJWS1XXIwYI6Ml2440jlhfgMnRH
=TZHn
-----END PGP SIGNATURE-----

--Apple-Mail=_4A4BE57D-A825-4143-A501-40642CD9FB2F--
