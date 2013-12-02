Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id A2F0F6D86B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 16:27:57 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so9255836eak.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2013 08:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UMQU9WMCN9r9Y1MbY5+BrslcBtQFUnHs+Yih2yc6Ob4=;
	b=q0GMWe7/CacHlXP/ZzSRNf8i4KsXvqumYiMCcmcDJ7k813kTFFxSTk/Fk72O35pVeM
	d2vquhRV1/g0VT4Bncu9qVoGxDq2YL4CpbWxKN7h0pLjZCq+daqcWjqP7P4YGXkm0cf8
	+ak7xSful0q/ToGpDIuJGvOi9acaAPZ6ku7/QpJSmM7K2iIvom6APU/iNRa/pwZaLRz1
	cZ5zKUDu7SSOBwAvK7nZZUbYbtrzuZd8CYnV8Ajm3CU0zHX4eFSDDHHhcWX+Tbr0j3JJ
	1rQgUk1D+5Ae1k3DurrOY+nRwhAWk0VW2z7jHVBXUPFSEN9+eEbj4fpj40ldl2XSbTfk
	dylA==
X-Received: by 10.14.108.6 with SMTP id p6mr7464827eeg.31.1386001676830;
	Mon, 02 Dec 2013 08:27:56 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id g1sm72498111eew.1.2013.12.02.08.27.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Dec 2013 08:27:55 -0800 (PST)
Date: Mon, 2 Dec 2013 17:28:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20131202162804.GB3714@jama>
References: <1471026.rDxeBhQvgN@helios>
MIME-Version: 1.0
In-Reply-To: <1471026.rDxeBhQvgN@helios>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: external toolchain recipes in OE-Core
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
X-List-Received-Date: Mon, 02 Dec 2013 16:27:58 -0000
X-Groupsio-MsgNum: 47786
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline

--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2013 at 04:18:52PM +0000, Paul Eggleton wrote:
> Hi all,
>=20
> Currently we have an external-sourcery-toolchain recipe in OE-Core; one o=
f the=20
> main reasons we have it there is as an example of how to create a working=
=20
> external toolchain recipe for those that need to create their own. Since =
the=20
> creation of the meta-sourcery layer however, this recipe has been left la=
rgely=20
> unmaintained. Even assuming nobody tries to use it as-is with the CodeSou=
rcery=20
> toolchain, without testing and maintenance the recipe can bitrot (and has=
=20
> broken as a result of changes elsewhere in OE-Core), and thus any externa=
l=20
> toolchain recipe created based upon it may end up not working either. We =
need=20
> to come up with a plan for what to do with this recipe - here are some=20
> possibilities:
>=20
> A) Keep it in OE-Core and ensure it is tested and maintained
>=20
> B) Remove it and just point to meta-sourcery as a maintained and working=
=20
> example of how to write an external toolchain recipe

This looks best to me. Maybe with another link to external linaro
toochain which is probably used by many people and to show that it's
just an example and recipes for external toolchain + tcmode need to be
adjusted to specific toolchain.

> C) Replace it with a less concrete example recipe in meta-skeleton that w=
e=20
> maintain going forward

I fear that less concrete example will bitrot even faster and won't be
easy to test and fix without creating concrete recipe from it.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKctRQACgkQN1Ujt2V2gBx9nwCeJFTnDL9CuWKXqzlrEP77IpaA
EiQAn2frbOQd8sNEMhe/9iM8fkwdqFG7
=OIYE
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
