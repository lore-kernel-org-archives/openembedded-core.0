Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPakk-00088P-MP
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 16:42:02 +0200
Received: by bkcjm2 with SMTP id jm2so541647bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 07:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t2svcYfZBKSumGN3Thq+2x3fDt2482KGZggcpurJh5g=;
	b=D+9Hl0WGj8Ax+HV8INYGhKDer3PowMKPAPPHMokp1OiOz2HPq91rW2B61slDDS86W8
	4H2je+VxFZoKI0WGEw4lziU1xo/lWPmQIQLvT/gTrfIZnzlvfzr+9ysYUhNDCacxjhfS
	INKAod1wd8706vSZedJFvVVcTPbeu+9IIsiDMyBx88huqYSYI2nghmFts1l6vsfwflCK
	izdpPdpJszaUP0JnR9y43QVsepMWj3FFPzQPTbQv1ZO/x20bCi23/a1bkaOHEt7K9JR+
	48zJVuj99AR5JOApbiB95lLmwDbvGdFqub0Uoqk0aYbayWOigRka6dvZfe6j6Kdh4eHz
	bGgQ==
Received: by 10.204.151.211 with SMTP id d19mr9829924bkw.63.1335969138430;
	Wed, 02 May 2012 07:32:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u8sm4322026bks.0.2012.05.02.07.32.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 07:32:17 -0700 (PDT)
Date: Wed, 2 May 2012 16:32:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120502143218.GC3682@jama.jama.net>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<DE7E5733-CC28-46DD-A4BC-C1AA663F925B@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <DE7E5733-CC28-46DD-A4BC-C1AA663F925B@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2012 14:42:03 -0000
X-Groupsio-MsgNum: 21469
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline

--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 02, 2012 at 04:29:54PM +0200, Koen Kooi wrote:
>=20
> Op 2 mei 2012, om 16:23 heeft Jason Wessel het volgende geschreven:
>=20
> > The user mode NFS server does not get built by default when you are
> > using a purely command line driven development environment without SDK
> > tools.  In order to accommodate simple test configurations and have
> > all the tools built for the minimal validation with qemu-native,
> > simply add the dependency to unfs-server-native.
>=20
> So all images I build for e.g. qemux86 now have an nfs-server? Can we ple=
ase move settings like that to the specific images?

with qemu-native qemu-helper-native if possible :)

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+hRXIACgkQN1Ujt2V2gBxMVQCcC0gi/vMf78bFakje/L4lzKPb
BuAAn3c/V06C8SqhpzSr0x/fIrkbH/M2
=D7i1
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
