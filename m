Received: from mail-wi0-f180.google.com ([209.85.212.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TxDSw-0004wV-SZ
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 10:14:55 +0100
Received: by mail-wi0-f180.google.com with SMTP id hj13so4709034wib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 00:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=wrv2MoCOi54hZ2BiB8Zpt1Nigt2IEXgFCadjq1KSNyM=;
	b=rcDhQM3c9HYikjJDLoelPzfah8R3ML8jXbCWFhk95u0NWlizmGOa/zFHR6K7tnHaxb
	i7hlwkwNzN7BYXllb6ixinp5lybI6pFs3dzxs7GECSrgS/7JpB+44kkzC53vVZ6voQIZ
	q2Nu4mLolAcCeyqGX1L6Ms4BYrJfnKkMqcUEN0xi3MBw0t2vfqJggUMS6s7ggLD5GFxk
	cBnQ7ADaW22hG9HCSOG45+b7oZBG9NhPMKdW3m1yPQ1Oy+jRI+nuYsXyi3uuHgl5CDPc
	FGbQBwvtrA2LdcgLxbRSenWduQvfYdn6f5hdtPRto8fcW/u2qSYdTKQmBXI3SwMXWedP
	dc4w==
X-Received: by 10.194.108.101 with SMTP id hj5mr24992982wjb.6.1358758766607;
	Mon, 21 Jan 2013 00:59:26 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ex6sm17648540wid.3.2013.01.21.00.59.25
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 00:59:25 -0800 (PST)
Date: Mon, 21 Jan 2013 09:59:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130121085928.GL29386@jama.palm1.palmone.com>
References: <cover.1358635193.git.ross.burton@intel.com>
	<50FC3899.5000202@linux.intel.com>
	<CAJTo0LaL3vCw52_h-Ab3J9oBHwZwxn_WjUj3D8iivundKypfHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaL3vCw52_h-Ab3J9oBHwZwxn_WjUj3D8iivundKypfHQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Initial systemd integration
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
X-List-Received-Date: Mon, 21 Jan 2013 09:14:57 -0000
X-Groupsio-MsgNum: 34134
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xb8pJpF45Qg/t7GZ"
Content-Disposition: inline

--Xb8pJpF45Qg/t7GZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 20, 2013 at 08:21:18PM +0000, Burton, Ross wrote:
> On 20 January 2013 18:34, Saul Wold <sgw@linux.intel.com> wrote:
> > This change introduced a new warning about un-packaged files:
> >
> >> WARNING: QA Issue: connman: Files/directories were installed but not
> >> shipped
> >>   /lib
> >>   /lib/systemd
> >>   /lib/systemd/system
> >>   /lib/systemd/system/connman.service
>=20
> That will be connman detecting the systemd pkgconfig files in the
> sysroot and enabling the integration automatically.  To avoid either
> a) enabling systemd integration in every service that does this or b)
> disabling systemd in every service that does this, can we ignore these
> warnings knowing that they'll be resolved when the rest of the
> integration lands?

Why weren't changes from
meta-systemd/oe-core/recipes-connectivity/connman/connman_1.10.bbappend
merged to oe-core?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Xb8pJpF45Qg/t7GZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD9A3AACgkQN1Ujt2V2gBxW5gCfWvvbudlyydSqasvv+BGx0OF+
WGIAn0ewnvH2AzEUNLq940F1rckRP5AQ
=SI+L
-----END PGP SIGNATURE-----

--Xb8pJpF45Qg/t7GZ--
