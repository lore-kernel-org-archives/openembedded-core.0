Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2A16171633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 15:11:10 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so65560816pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=1CCG8BgK+8hbwx711DbbtYFCWBderyu2E1LtPqUzks8=;
	b=XKq7cw8JSMtuJ1lQ5NMn746pmbGmrlRzrDBzKNfJkKgF3cXxmR0ltU7DChn1lOnobn
	reeDzjMgWzT1TqTJbv+mxJlY2fkl0YsD8sxG700d8uxLw90Kv/5i7xN8ik2TgY7+TecS
	7SdGLV3ykFJx8YTBShx4Z6Q6QFjh8BiGuQqNEav013Y+VKSnKBBo68bxFHIBVdlnO0FK
	XHySW1wln47Gun3l7wvtd95HKlx++pwfnGmmHwqXVW52og9j2srDMWRSGwTK4cLPYmO7
	oUxzRHdPrCWl4OIw5nvTVbVSWH2NDvyd3D94UnQcxgeyLA7OuypTLPnQeWIRtgWeoLge
	hjoQ==
X-Received: by 10.67.30.232 with SMTP id kh8mr16728404pad.36.1440774670741;
	Fri, 28 Aug 2015 08:11:10 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:a198:973e:c045:c666?
	([2601:646:8601:4580:a198:973e:c045:c666])
	by smtp.gmail.com with ESMTPSA id
	pe5sm6092208pac.17.2015.08.28.08.11.08
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Aug 2015 08:11:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <14855649.MLpkRK5kp1@peggleto-mobl.ger.corp.intel.com>
Date: Fri, 28 Aug 2015 08:11:04 -0700
Message-Id: <71B6299C-4F9A-428A-A599-7E44264AC16E@gmail.com>
References: <cover.1440678731.git.paul.eggleton@linux.intel.com>
	<762e79dfb769e885758bdcc627fadbe4dc6454fd.1440678731.git.paul.eggleton@linux.intel.com>
	<26B844B8-BE69-427B-8DA7-B649C46A5632@gmail.com>
	<14855649.MLpkRK5kp1@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Fri, 28 Aug 2015 15:11:14 -0000
X-Groupsio-MsgNum: 70243
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A6DEB24B-C412-47C1-B1DE-BD2313EBDCD0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A6DEB24B-C412-47C1-B1DE-BD2313EBDCD0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 28, 2015, at 1:34 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Thursday 27 August 2015 23:07:44 Khem Raj wrote:
>>> On Aug 27, 2015, at 5:36 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com>
>>> wrote:
>>>=20
>>> Allow restricting recipes brought from a layer to a specified list. =
This
>>> is similar in operation to blacklist.bbclass, but instead specifies =
a
>>> per-layer whitelist of recipes (matched by PN or BPN) that are able =
to
>>> be built from the layer - anything else is skipped. This is =
potentially
>>> useful where you want to bring in a select set of recipes from a =
larger
>>> layer e.g. meta-oe.
>>=20
>> For the record, I am not in favor of such feature in OE, Distros can =
still
>> use BBMASK if they wish to
>=20
> This is significantly easier to use than BBMASK though. (Perhaps =
that's why you
> don't like it?)

I don=E2=80=99t think its about technical merits of the patch. I =
understand its pretty well writter.
Its if we want to provide more tools
and ways which can be bad for layer health in general which are besides =
oe-core.

>=20
> I think we need to be realistic here as I said in my most recent reply =
to the
> other thread - people will do this using whatever mechanism is =
available
> whether we like it or not. And what are they saying by doing so? =
They're
> effectively telling us that they can't consume the recipes in the way =
we are
> currently collecting them together. We know what the proper fix for =
the problem
> is (increased splitting of large layers such as meta-oe), it may not =
be easy
> but other than workarounds like this I don't see an alternative.
>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


--Apple-Mail=_A6DEB24B-C412-47C1-B1DE-BD2313EBDCD0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXgegsACgkQuwUzVZGdMxSDIwCgjoACbeisCHCqv4tk6z9iUUrO
XSwAniacv/SdlbFI5Zi2xHujL3+erb8+
=i6yw
-----END PGP SIGNATURE-----

--Apple-Mail=_A6DEB24B-C412-47C1-B1DE-BD2313EBDCD0--
