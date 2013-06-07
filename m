Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id E6EBB6A53C;
	Fri,  7 Jun 2013 22:20:32 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b57so1885404eek.8
	for <multiple recipients>; Fri, 07 Jun 2013 15:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ygp0E46pzQEOXnDcaI843RFR+UO2KScsM/2drk3RTw8=;
	b=VaF5yanzPimSrlZuXMjPLJXAB7mSaUG22JFrq2zkciovWh5Da2MANjOav7y3NjpKDp
	uJGCgnT1vjvLm89VR4KomTEmxiy6KdDYRihS3wk0VeM5hbVDVqok137hgnBJq9TcCcsi
	myC8JQnFbNZ4qNVukAMc6LLPLwSdagBOPvkUY9Ij6GCzzgVQa2auDOf+YKW5H7BXIcQM
	Er0qPRhPQX1h096yaK3OIYatpHWc8YkY/CFtkqn/+i00J92wegGW4QNJ2lZtvHGU6Dcb
	ufmsjZdq16H1Lbd4UwX27A9VNHDWmg7HhhN0M+5IAgXBbLjVrHCYPuLrjoXHLcmAuw9O
	q40g==
X-Received: by 10.14.224.201 with SMTP id x49mr726503eep.14.1370643633475;
	Fri, 07 Jun 2013 15:20:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bo9sm1438430eeb.9.2013.06.07.15.20.32 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 07 Jun 2013 15:20:32 -0700 (PDT)
Date: Sat, 8 Jun 2013 00:20:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20130607222052.GN22710@jama>
References: <CA+YB3rZ+pWVzy6_=PAa9QRTdsu+Y5OEGwdW7sLpLphnWZ-89yw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+YB3rZ+pWVzy6_=PAa9QRTdsu+Y5OEGwdW7sLpLphnWZ-89yw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: OE TSC Minutes 4 June 2013
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
X-List-Received-Date: Fri, 07 Jun 2013 22:20:33 -0000
X-Groupsio-MsgNum: 40338
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CPn8Wy5ME997YUMW"
Content-Disposition: inline

--CPn8Wy5ME997YUMW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> a. oe-classic recipe migration status
> drop from agenda after this

Not sure why I got this idea now when it's "over" but would it be
possible to populate new layerindex with at least recipe names from
OE-classic?=20

I guess it would be hard to parse it completely as proper layer,=20
but it would be nice to search for "foo" and see that it's available in
OE-classic ready to be migrated to some layer - otherwise people will
just start from scratch which isn't always best way.

Even just names from migration wiki page would be enough to give people
heads-up that something similar is in OE-classic.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CPn8Wy5ME997YUMW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGyXMQACgkQN1Ujt2V2gBzUdgCfbrD5EM0FQGP7iBGtiLSIo8sI
H2kAoJyH7+Lk3g9S9/oP2EWm+VNyNMw0
=WdIR
-----END PGP SIGNATURE-----

--CPn8Wy5ME997YUMW--
