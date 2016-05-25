Return-Path: <andrew@aj.id.au>
X-Greylist: delayed 43462 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 May 2016 19:05:37 UTC
Received: from hapkido.dreamhost.com (hapkido.dreamhost.com [66.33.216.122])
	by mail.openembedded.org (Postfix) with ESMTP id A7D8E602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 19:05:37 +0000 (UTC)
Received: from homiemail-a15.g.dreamhost.com (sub3.mail.dreamhost.com
	[69.163.253.7])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 09C1980658
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 00:01:16 -0700 (PDT)
Received: from homiemail-a15.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a15.g.dreamhost.com (Postfix) with ESMTP id 2908A76C06E;
	Wed, 25 May 2016 00:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=2qqfZqYhRwsGPUG+xWVN4
	w/1OTY=; b=Z9Rfe0/jnsIGTUQiqXzsMRJiNIix4yCFLla5x/bLcjckUm5RZ7Suo
	LI2l7s+teu3nU08QDLp+X9Q5ILWyldRjAIgvbDdl3RUVV1RXx2h0eiv0+mqsayUN
	9gMwF2WBPq8i2J3X2gf8otNeV7Cmtfv6Ba2X8YbR3zjpBZV45g7gl0=
Received: from keelia (unknown [203.0.153.9])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPSA id 3EF5D76C069; 
	Wed, 25 May 2016 00:01:11 -0700 (PDT)
Message-ID: <1464159653.20948.85.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 25 May 2016 16:30:53 +0930
In-Reply-To: <573E79EA.1090005@windriver.com>
References: <cover.1462867278.git.liezhi.yang@windriver.com>
	<CA+aJhH1hOeD=oj7guxX8_Wm9gU6OS6W=r32WJFgGuLzAjTcw2g@mail.gmail.com>
	<573E770E.9010503@windriver.com> <573E79EA.1090005@windriver.com>
Organization: IBM OzLabs
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/8] [WIP] runqemu/runqemu-internal: refactor it
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
X-List-Received-Date: Wed, 25 May 2016 19:05:38 -0000
X-Groupsio-MsgNum: 82683
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-dKaq7/E007H32XQcPjT3"

--=-dKaq7/E007H32XQcPjT3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-05-20 at 10:43 +0800, Robert Yang wrote:
>=20
> On 05/20/2016 10:31 AM, Robert Yang wrote:
> >=20
> > Hi Nathan,
> >=20
> > Thanks, but I'm sorry to say that this is only a RFC, we may change
> > it a lot, I will talk with RP, and let you when we have progresses.
> Oonce we change it a lot, for example, change runqemu to use python
> rather than shell script, your current work based on these patches
> may not work:-(, I will let you know once we have final decisions.

Any word on what direction these patches will take? I'm also looking to
make use of them in the near future, but will hold off if they will
change so significantly.

Cheers,

Andrew

--=-dKaq7/E007H32XQcPjT3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXRU2lAAoJEJ0dnzgO5LT54hEQAJkPdLE35tJS9pM+ojxfFSQz
EcdfwZBItjKBegs5/0jrwK1e/IHdoTNCy1K2Pvh38k6zkCT+sGPkQRzrLdWS1+97
r8pgt39JZrl79rahFIOEAuGtNlCVz98Bnw8T4uuZBtGPN6H+84CRPCvT9NM9mWML
7xbeJAFJuTcrVhvvOJQxy134WVH724UzB8X/Dqzlpj5HfEJrFaMd+vF01m+REKrg
0S8Bz+l/eEa56rFFVLBIjn3Qi7G/mXRv9CnTI6fj+iLtYfV5HByqUZzOWcCsGkAp
u95oZ/7l22qeTdafcHZvXgl+r9nNByDmimnVjf7ABC+bGTiw3KfC5R7F2abMhKOI
7hlDYYtWMTMQM/omDQPuIlmbZLwIUi67PgeIYwW9/08I4qNs3ryNKsVrAptgXH4O
VFeC4fM5h47iBpBAGnG8rt3aDBcZSvR0nETPd/ckWQwjz6xWaFxtpiefcMSzCcGT
vnSpNkJXRX3MC80mqJiKsBw040PixayQEZ/0XAmEw74hDi1GxUkOoO/oeX4Kyafg
1QUZ4ejw30anxOvSZyjjfe1c+u/OTrU56FMS7r60Yas47L/geWurbMcplPkpexAK
qvIZjSYxbK2Vpwz6LrRxg2XdwpqwElR6c/e/nBvire7euLaj76vRsa6JGYy1KsQp
RMgfy5DX5lezHUBhGvNB
=+4ih
-----END PGP SIGNATURE-----

--=-dKaq7/E007H32XQcPjT3--
