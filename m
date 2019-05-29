Return-Path: <trini@konsulko.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7497D7D3A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 21:25:58 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id h1so4497749qtp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 14:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JKKkJcxc0BKEilae6y8MvsOcrJ2M643pm2U4IOigJdQ=;
	b=YZHs8fq8+SHN8035zyZzWP/zJ4bPimEQb1zt0Wi0nbVQOOs5RZAyeJkkm33GAS8MdC
	Jf+AwU33iG+2hlGZyJxjCToohVtodgsrmNiRscFZBxwA4vIqyNMo3M4WneoRiRhouVNS
	2e9xPBqZbM/3JnfKZ6wmofrNA5siMuWNiumPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JKKkJcxc0BKEilae6y8MvsOcrJ2M643pm2U4IOigJdQ=;
	b=dnTXfZvRCO1gYuyLNxLzG3yOO+Dak0n4fAipSlFlgl6IM7oAUiqYs8y6hp1A0KxvRL
	TTLpNf9R/vea7mUENkxPDcTXBaXOBcfPyvpQ/dal3/bt9LzQvNa+Lixs43L+/07bHGe7
	Z5WkQ4LR4fqPOTZgU6DiAYpFgCV7HDHSNPza7vXNk1M369lBj/4rNY7W740siKkv+/WS
	2/7J4vftWvnwqB57ZZNmAbBlDTi54/qIdKigoCQqzb/rG1DZdvscWVP5E6BzF2GxVG63
	v944UDGcNuPEJqH0Tvf2/5lLTDeIxvQSes1+XTsc0H2dZ6bblth6QdEtByZa+mSOTxpl
	G6EA==
X-Gm-Message-State: APjAAAXEQgFUNssZBk/uAh1mb4wRckXGk/i2DyE6kwAhjADRipqyRRLS
	BOt5J6BooUWYKZYG1jOJaDuYBw==
X-Google-Smtp-Source: APXvYqyOhWLo3TmoykZm+q4m3OaawbVPwxP3wThHhONp3ARVVRRu10RHA1J2s869BMsJh4HDglr9hQ==
X-Received: by 2002:a0c:d2a1:: with SMTP id q30mr172473qvh.202.1559165159517; 
	Wed, 29 May 2019 14:25:59 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1401-82DE-F9EA-E538-B09C-E631.dyn6.twc.com.
	[2606:a000:1401:82de:f9ea:e538:b09c:e631])
	by smtp.gmail.com with ESMTPSA id x7sm375335qth.37.2019.05.29.14.25.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 14:25:58 -0700 (PDT)
Date: Wed, 29 May 2019 17:25:56 -0400
From: Tom Rini <trini@konsulko.com>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190529212556.GO20781@bill-the-cat>
References: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
	<20190529184328.28470-2-richard.purdie@linuxfoundation.org>
	<4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
	<8798dc0e5d91991953720388b601c9c5b3174c42.camel@linuxfoundation.org>
	<321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Wed, 29 May 2019 21:25:59 -0000
X-Groupsio-MsgNum: 125129
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nuo1Zh/CIvGoxni"
Content-Disposition: inline

--+nuo1Zh/CIvGoxni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2019 at 09:50:22PM +0100, richard.purdie@linuxfoundation.or=
g wrote:
> On Wed, 2019-05-29 at 13:39 -0700, akuster808 wrote:
> >=20
> > On 5/29/19 12:26 PM, richard.purdie@linuxfoundation.org wrote:
> > > On Wed, 2019-05-29 at 12:21 -0700, akuster808 wrote:
> > > > On 5/29/19 11:43 AM, Richard Purdie wrote:
> > > > > (From OE-Core rev: 29fc9210b973be68de474e75068e4c72371afe5a)
> > > > >=20
> > > > > Signed-off-by: Richard Purdie <
> > > > > richard.purdie@linuxfoundation.org>
> > > > With back port to warrior and Thud too?
> > > Yes, we'll need to do that if we bring fedora 30 workers online on
> > > the
> > > autobuilder.
> > I know the uninative update is required for FC30 but changing the
> > compression does not.
> >=20
> > This question is about the compression extension question.
> >=20
> > Does this mean YP will no longer be providing bz2 uninatives?
>=20
> Correct, the patch should be straight forward to include with the
> upgrade.

Does that in turn mean we must have host xz-utils?

--=20
Tom

--+nuo1Zh/CIvGoxni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJc7vjkAAoJEIf59jXTHXZSvCwQAMC0uhoirz4Vp+IfXnFQer5M
gF+zip7xqHeVGR5IS/dW0ig6v5fHcicjRMxfSyzg4XdJEkoU2EJVfSbce+fWs92l
zR4+Tj7uJFtJ1KU62WucTO/kvjVEfEOR6a6ZCIMQmql1/30WawL+NdCimrHTqiwd
+Ry0VSKBq/ThT7r7nSdeioVOqQfsdJBfPLB1k7hSI9gNxwsKpVt2yWeSgSLxlKvQ
+ObgDZ4vA16MW9lyPGeOYQx4PVEIQpJrAMUg1TxbiEt/En7xVTjTeQcsGONaVgIy
JkNDMACpFSaHKJE0f3HedHEkJYxySIoWm+wJIjh0a5PrgmBq8uTNcbkRpRRm66M5
rWJvLAw1OLiBl3aRAQATmzr5TxYkZYPzn72mBGK1Vzi6KK/sW6zFCHEbkJPK2gb/
s673niBGkardXzecgjqvqKfuzTjU6Ef5dq9pS4NO3FZQlmd21vWXcx5TRP/NKMX8
qqEcrwOecT2EXh2s17vcqthO8KcdOTHUHr+6cke3C4qpwg9+hpngxG/5AqDjednt
qYiMA+fFWsTUr5RlgF9QBAHuqmPd90+YrazD9a2EJKySgYSbgX4buC12PxTUEp/1
w8smm1TREotVLv3BsSCuHE7jdr7ukl6Y1YOsH745hgPqf4NIdiztEVGeO9KMfBN6
RCgqy8NpFtrd/JuhXK4t
=hxjR
-----END PGP SIGNATURE-----

--+nuo1Zh/CIvGoxni--
