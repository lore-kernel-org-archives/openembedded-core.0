Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id E593E60088
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 17:31:57 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id wo6so18742433pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 10:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=Yo6hDnzP+8f/tcn/a8EL03vyCUddGNBRqdyWSN38Dyg=;
	b=NuBi2CrTGIfYnkFng23eElkrDYx40i0I7r1Bnv51Oq0XpWq9dOAsiXchuHj5+yDeAH
	Z3qqGy3OE6eUbCzoUd6vUfLlBROqdUZmNo9ZoBkuMUvYS/Qe8TmGlQr04WuegMBIcaQE
	4PB9jfhmZUf84TWTQXOkSJn087/t/g5BKUU+KwLpQ2crY1sSw8MtXAiP4mWEe04krP+k
	rjdNgTgp5fN5hAqijYvZJLk9qqsWsvfzrUmFZYrKTpg9uCeQmUCrqE+7Z6TwCMpDh3qb
	Osl3IO6hAf0SXL0v/tAXZ2BnEOBHGCXBEzN6amcA6h9l1vKv2u1RENEqrxLlS3yyVKPN
	1O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Yo6hDnzP+8f/tcn/a8EL03vyCUddGNBRqdyWSN38Dyg=;
	b=AVqYbYKI9w3cgsxVa+vfl1w+NVspGmUSU5OplxXBzlEaxNWVD1z2qtNjiYpg4Qv+yt
	TQV+4lI2WfdrsR7SZMYwhoU0MpOqKECtiLHfVCS5NBk8hyMz9VfE+5rUGeFIImvetkZ8
	sAvxezvkgFYAEFg2RlA1WWWLqVvR12WzCS45lzdsoUhXgt5WasqXBY7mLegdPXSmx7ri
	bnnUxo0leS4Nkrzzq4wpEqk6zpNoSGSry95jd54sJCetRi6YtKVoJr3e4gNS4kV3zh4D
	qgmRpJhQZh7gcvf5JCIzfyIdHewvImfCFoSzrX/vgjqZRSjl9Zv84xtW+b+of1x8x7BY
	KB5A==
X-Gm-Message-State: ALyK8tL6GQIckb47oiOpKYXTK2hgl0wtnrgTLiQZSs7TuwSTV9+iDZPCzRCadt3KcJAc5Q==
X-Received: by 10.66.253.168 with SMTP id ab8mr3064959pad.77.1466616718314;
	Wed, 22 Jun 2016 10:31:58 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:fcd1:61e:b1e8:f28?
	([2601:646:8882:b8c:fcd1:61e:b1e8:f28])
	by smtp.gmail.com with ESMTPSA id
	w194sm1145130pfd.58.2016.06.22.10.31.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 10:31:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAFUnDm_LEnNqq3ebvHqN8hw1o1XeBvwhH2693tg97d-hmQKytA@mail.gmail.com>
Date: Wed, 22 Jun 2016 10:31:50 -0700
Message-Id: <4A7CD120-C038-4A5D-9CE9-0C9EF6AD51B2@gmail.com>
References: <CAFUnDm_LEnNqq3ebvHqN8hw1o1XeBvwhH2693tg97d-hmQKytA@mail.gmail.com>
To: mubin syed <mubin10@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: LICENCE file for LLVM based recipes
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
X-List-Received-Date: Wed, 22 Jun 2016 17:31:58 -0000
X-Groupsio-MsgNum: 83751
Content-Type: multipart/signed;
	boundary="Apple-Mail=_53BD05A6-C460-4549-A017-ACA15C594EBC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_53BD05A6-C460-4549-A017-ACA15C594EBC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 6, 2016, at 12:32 AM, mubin syed <mubin10@gmail.com> wrote:
>=20
> Hi,
>=20
> I am trying to write recipe for dhrystone benchmarks, it is LLVM =
licensed benchmarks.
> I went through some of the LLVM recipes, they are using NCSA license =
files(not using explicit
> LLVM license files).

LLVM is under University of Illinois/NCSA
thats what you should use.

> Please let me know, which license file  i need to use for =
dhrystone(i.e. LLVM licensed benchmark) recipe.
>=20
> Thanks & Regards,
> Mubin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_53BD05A6-C460-4549-A017-ACA15C594EBC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldqy4oACgkQuwUzVZGdMxRjRwCeL0h7GrTOfU97z85xUTIhslWl
VXYAn3Ha/PxldSdQHgiAJfXaJkBpUN4r
=zLAm
-----END PGP SIGNATURE-----

--Apple-Mail=_53BD05A6-C460-4549-A017-ACA15C594EBC--
