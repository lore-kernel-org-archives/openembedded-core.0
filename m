Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA6C6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 14:20:00 +0000 (UTC)
Received: by widjy10 with SMTP id jy10so17176650wid.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vbtzCLA5kvEwfuhi0FZmP2yk1Z9QWczLt85UV9MICYI=;
	b=sJLPrksz/ti1wfaJcbtl1oPHQ2raxEH77a0js3I1TBi5qRZMDnWXiojdyuGmJY1iTD
	7/G8xy6RsrDyT4Coh2dGlOErUft4lXHX+Swj9hMg2bVrZWxajGdSDJR4K1hMoVwEvXxU
	mTirNUeiTZOYggm3eNaPvTUwGoPzwqvE3lORlL3OJbvfFeXeTGg92PHwh1XI+c7RQKMV
	PqwBhxQuXjFCxN0W1sBYq05oDrUscSXP3Nos0CAvoi0i7DzsvuZfzzZBb4x6kEH8EcoX
	hLoikXelBu8pWqWzN732dYUlAtUWNl0OXrIZjhSylSnforsfpgTlOw3jvoT36+1v4dyV
	iWhQ==
X-Received: by 10.194.23.194 with SMTP id o2mr19938532wjf.63.1437056400420;
	Thu, 16 Jul 2015 07:20:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id n6sm3503011wix.1.2015.07.16.07.19.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jul 2015 07:19:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Jul 2015 16:20:27 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150716142027.GD2134@jama>
References: <1432207395-31589-1-git-send-email-Martin.Jansa@gmail.com>
	<20150701132356.GJ2409@jama>
MIME-Version: 1.0
In-Reply-To: <20150701132356.GJ2409@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [daisy][PATCH] squashfs-tools: enable building unsquashfs and fix squashfs-4.2-fix-CVE-2012-4025.patch
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
X-List-Received-Date: Thu, 16 Jul 2015 14:20:03 -0000
X-Groupsio-MsgNum: 68041
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline

--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2015 at 03:23:56PM +0200, Martin Jansa wrote:
> On Thu, May 21, 2015 at 01:23:15PM +0200, Martin Jansa wrote:
> > * build unsqaushfs, useful when debuging corrupt squashfs from
> >   mksquashfs
> > * squashfs-4.2-fix-CVE-2012-4025.patch fixes CVE in unsquashfs which we
> >   weren't building and it actually breaks building it, because someone
> >   missed squashfs_fs.h change from the original change
> > * add git headers in all patches and fix references to new github
> >   repository
>=20
> Ping

PING (It's almost 2 months :/)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWnvaoACgkQN1Ujt2V2gBwr/QCfakwnzzQdxjgUkQcy/Zo0n5yy
Fl0AoLYDyDh7VTBkUTStgRDe13AmtILh
=s+5+
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
