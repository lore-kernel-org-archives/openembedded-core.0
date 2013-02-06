Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U32H5-0002ci-Su
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 11:30:44 +0100
Received: by mail-pa0-f47.google.com with SMTP id bj3so716713pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2013 02:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Oeu03rBc+G/pwk1IXZigHtd61XfCAstla8NERlIumtE=;
	b=Mv27tw0kwpgsZGsZzwgBHzA3Ud7U30RE/x78wTmPX/T1J1PzjPYYWTq8nIonNnk/Zu
	vA5GuSYKXDPlNJ7Z+QtV4H/tj9qEXGPA3JnGZ1XlehPyMoHek8wrIsbUM7yrm3ztVwwu
	1JiqQcaHINaZFashXntOtpJPYubskXV4AURSoFFaCJM6hV07F283JsP+WsJ7ygIgyEgx
	18M1DdBnwHdrsu62aS/HDd+yVbe5D4liRN24SQKsNEefIkBtLt3VKFAvaHit8kDeysTw
	NVXqGUhyhG94CXlVqv9ysjA4TJ+YPGtzxvvQVabI8N9bNvDiHH9jWv9IdSyPZ4/AY2iV
	Z1vA==
X-Received: by 10.66.74.2 with SMTP id p2mr74549107pav.55.1360145691973;
	Wed, 06 Feb 2013 02:14:51 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i6sm36577067paw.19.2013.02.06.02.14.49
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 02:14:50 -0800 (PST)
Date: Wed, 6 Feb 2013 11:14:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20130206101442.GS3271@jama>
References: <1359990723-21304-1-git-send-email-constantinx.musca@intel.com>
	<5110DF13.7010502@mlbassoc.com>
	<CAP9ODKr6tGoU-jYdszVerCvMYn-gR4thnbL4WYnHroFw_ZUmjg@mail.gmail.com>
	<5112293F.4080503@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <5112293F.4080503@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5] netbase: split up in netbase and init-ifupdown
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2013 10:30:45 -0000
X-Groupsio-MsgNum: 35091
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kERJ49nCKmnv470N"
Content-Disposition: inline

--kERJ49nCKmnv470N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 02:58:23AM -0700, Gary Thomas wrote:
> On 2013-02-05 06:14, Otavio Salvador wrote:
> > On Tue, Feb 5, 2013 at 8:29 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> >> On 2013-02-04 08:12, Constantin Musca wrote:
> >>>
> >>> - netbase should only include etc-rpc, etc-protocols, etc-services
> >>> and the hosts file
> >>> - the init script/configuration files should be in another package
> >>> (init-ifupdown)
> >>
> >>
> >> What is the benefit of such an intrusive change?
> >> Why not just have the netbase recipe create a separate package?
> >
> > Many images use different network managers so ifupdown might not be
> > need; thus the split. Is it what you're concerned about?
>=20
> The massive renames and new recipe.  I think it should be possible
> to split the ifup/ifdown functions and keep the 'netbase' recipe.

But ifup/ifdown are sometimes MACHINE_ARCH and the rest is TUNE_PKGARCH.

So it makes sense to split them.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kERJ49nCKmnv470N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlESLRIACgkQN1Ujt2V2gBxC+QCgpy61VX0EiTXRKzNi2SZDJ29K
uz8An27wM67ZpkFAOCZXrxPhTWAuHs1I
=n1lC
-----END PGP SIGNATURE-----

--kERJ49nCKmnv470N--
