Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCE26EE0D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 11:25:58 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id g15so289113eak.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 03:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pKLr6XCqNUEEGlv4w59e2R31hBBu1zsSI3pkygQ/DAE=;
	b=Nn/G0fzUSUKqTNdj0/g2yw7axtOcF1peFT5cpnPWjollqp8PkSxZYy/CoNyFKEhAwN
	ybMDCyZaUfAKJ7CIZF4XruFlRiblmRtKgXFOyWu9sIZZTueodgTpPXKVt7Gz8AI/zLIU
	dRTdthC/1VFwUQpdBCKKnERk4jYHISh4fjTRYFHS3ZPwsfBC8xo+e1s5Pp7PdnEJJDhX
	OxrDol0PYK+NHzZdY0EFv8O0Lq3E5Eh1Zjcwg3QxqWuT1rglmOfK0FyEE7Tkne/8+l9n
	7PphGIoQhhYwuZ/jUoZX59PW/CYtWMsndrb2V/M6TExX02ZqYEAXtyuH98vbMnphBrs6
	UTVA==
X-Received: by 10.14.93.199 with SMTP id l47mr14937959eef.58.1392809159033;
	Wed, 19 Feb 2014 03:25:59 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u6sm81987480eep.11.2014.02.19.03.25.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Feb 2014 03:25:57 -0800 (PST)
Date: Wed, 19 Feb 2014 12:26:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140219112630.GC3854@jama>
References: <1392807290.14081.267.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1392807290.14081.267.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd version - release or git?
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
X-List-Received-Date: Wed, 19 Feb 2014 11:25:59 -0000
X-Groupsio-MsgNum: 50335
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Content-Disposition: inline

--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2014 at 10:54:50AM +0000, Richard Purdie wrote:
> As anyone looking at the autobuidler will know, we've been having a lot
> of issues with instability with systemd tests under qemu.
>=20
> I believe these are real world issues, most likely races in systemd
> itself.
>=20
> The last release of systemd, 208 was five months ago. There have been a
> ton of changes since including many bug fixes.
>=20
> Fedora 20 uses systemd 208 (the last release) with 200+ patches on top.
>=20
> I'm therefore wondering if we shouldn't bite the bullet and add a git
> recipe rather than trying to patch 208 into some form of life.
>=20
> The proposal is therefore to add a more recent git recipe and make that
> the default.
>=20
> I have such a patch in master-next. I've debugged the toolchain issues,
> missing kernel config and other issues with systemd master, it always
> now seems to pass the autobuilder tests. I need to check on one
> remaining automated QA test result to ensure its not a regression in
> systemd.
>=20
> Any objections to defaulting to a git version?

I think we can wait few more days for new release:
https://www.mail-archive.com/systemd-devel@lists.freedesktop.org/msg16738.h=
tml

but otherwise I don't have strong objections for switching to git
version temporary (if it really makes QA test results better).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMElOYACgkQN1Ujt2V2gBwFMACdEwhUGiCcvMnfc9uAbPRfXjGG
6zkAniKrGstZyzp2k6maiog8liqyslKI
=04Rv
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
