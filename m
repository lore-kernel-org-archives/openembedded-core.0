Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3A00373BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 20:14:05 +0000 (UTC)
Received: by wgkl9 with SMTP id l9so66926960wgk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 13:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kElk3LMg8Pz9seWXjIUXq1yEnM8nyJFBP2rP/hLWyRM=;
	b=YHXs/j+ImW0fIyLkKUm9hytQBPvGXoJARzwo6Szut65yByVgs9Wd+n+lmKOkCej6AM
	meRHYZ6kO46P7kywaThxDObGxrnPHacT5CxzhPyycxDM0E/MNP5ouQ71g2XTfvVZm21n
	2ob7iRMIQ6WjQCMser92+8dx898Ju7dRrMexWOS675e9+lGiMXvbUBb4GYkeHGwwxadD
	e6n0tVRgU2FmCUZm7R6HyciPXT6pZGSDiiYV34M8oglkxH7CS3Ii7gWa6t9ZVGh8JMa6
	zWc1hwpmr1inhO9UP6UF5FPx8Q3BJDR8RyvtpgA/JdekVdm4DzgYi9fXK97upAt6uFLM
	f2CQ==
X-Received: by 10.180.75.78 with SMTP id a14mr10379978wiw.68.1437077645612;
	Thu, 16 Jul 2015 13:14:05 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pf4sm14788405wjb.23.2015.07.16.13.14.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jul 2015 13:14:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Jul 2015 22:14:33 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150716201433.GA23000@jama>
References: <1432207395-31589-1-git-send-email-Martin.Jansa@gmail.com>
	<20150701132356.GJ2409@jama> <20150716142027.GD2134@jama>
	<1437076030.3310.135.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1437076030.3310.135.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 16 Jul 2015 20:14:06 -0000
X-Groupsio-MsgNum: 68062
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 08:47:10PM +0100, Richard Purdie wrote:
> On Thu, 2015-07-16 at 16:20 +0200, Martin Jansa wrote:
> > On Wed, Jul 01, 2015 at 03:23:56PM +0200, Martin Jansa wrote:
> > > On Thu, May 21, 2015 at 01:23:15PM +0200, Martin Jansa wrote:
> > > > * build unsqaushfs, useful when debuging corrupt squashfs from
> > > >   mksquashfs
> > > > * squashfs-4.2-fix-CVE-2012-4025.patch fixes CVE in unsquashfs whic=
h we
> > > >   weren't building and it actually breaks building it, because some=
one
> > > >   missed squashfs_fs.h change from the original change
> > > > * add git headers in all patches and fix references to new github
> > > >   repository
> > >=20
> > > Ping
> >=20
> > PING (It's almost 2 months :/)
>=20
> I've just gone ahead and merged it.

Thank you.

> If we want to get better at this, it would help if backport patches list
> whether they're needed on other releases. E.g. here, listing "master,
> fido, dizzy use 4.3" would speed things up from my perspective.

This was sent together in group of patches for all other releases as
well, but I agree that after a while it's harder to see that dizzy, fido
and master were fixed by different patches.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWoEKgACgkQN1Ujt2V2gBx5AQCggCVa1kKzFfEjyeDKTN6p8Vj7
qzcAn3zIZOPditoHGLgwG7bJL/MzzitG
=A7wk
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
