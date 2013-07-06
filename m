Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id CFC326AE18
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 12:29:28 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id c4so1917535eek.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bXhv0B8PVVaUp9psiNFNT/ElGDmIHiMm8NEsmAoCFRU=;
	b=B1qVYDup7Jj1w2+u71p2dxzmCUQbU8a6xtP1/sqzcP79SU1YI0tnnWPB+wHLMSnBCF
	QyBMgHThQ57LSnPiNxvWgz+NB83YMjoP5DpzZywVewWvMhYy/98tcItDCxRevm5ZG+oP
	yvLirl+Jjp7DZ9q7Vhdv4Pa2pUTg1seqkXYDinWTRWxs5tgO+/F2L1BhEqdfy8loa76V
	HR3o8ZWoRAgxje4FSFZZtdp73qhir6ejGmErogQwQk2SbbRWEUE9GmUFFM50z7vZgJ8H
	Qko7V4OT6+fbJ6FqDTxjMm8AVypTK0ihYphlh5PpNAkE0Hfc9gCeQiqTcpQXQ5e2rWlO
	O4qQ==
X-Received: by 10.14.8.197 with SMTP id 45mr16459698eer.66.1373113768656;
	Sat, 06 Jul 2013 05:29:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm23129218eeh.11.2013.07.06.05.29.27 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 05:29:28 -0700 (PDT)
Date: Sat, 6 Jul 2013 14:29:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130706122934.GC3288@jama>
References: <cover.1372987648.git.Martin.Jansa@gmail.com>
	<1458807.Cif2MtSWk2@helios>
MIME-Version: 1.0
In-Reply-To: <1458807.Cif2MtSWk2@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] Missing deps discovered in per-recipe builds
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
X-List-Received-Date: Sat, 06 Jul 2013 12:29:29 -0000
X-Groupsio-MsgNum: 41549
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Content-Disposition: inline

--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2013 at 04:28:24PM +0100, Paul Eggleton wrote:
> On Friday 05 July 2013 03:28:21 Martin Jansa wrote:
> > I was using simple script to build each component alone:
> >=20
> > #!/bin/bash
> >=20
> > rm -rf tmp-eglibc/abi_version tmp-eglibc/buildstats tmp-eglibc/cache
> > tmp-eglibc/deploy tmp-eglibc/log tmp-eglibc/pkgdata pseudodone
> > tmp-eglibc/saved_tmpdir tmp-eglibc/sstate-control tmp-eglibc/stamps
> > tmp-eglibc/sysroots tmp-eglibc/work-shared tmp-eglibc/work/* rm -rf log=
=2E*
> >=20
> > ls -d buildhistory/packages/*/* | xargs -n 1 basename | sort -u >
> > component.list ncomponents=3D`cat component.list | wc -l`
> > i=3D1
> > for component in `cat component.list`; do
> >   echo "Building component: ${component} ($i/$ncomponents)"
> >   bitbake -c cleansstate ${component} | tee log.${component};
> >   bitbake ${component} | tee -a log.${component};
> >   rm -rf tmp-eglibc/abi_version tmp-eglibc/buildstats tmp-eglibc/cache
> > tmp-eglibc/deploy tmp-eglibc/log tmp-eglibc/pkgdata pseudodone
> > tmp-eglibc/saved_tmpdir tmp-eglibc/sstate-control tmp-eglibc/stamps
> > tmp-eglibc/sysroots tmp-eglibc/work-shared tmp-eglibc/work/* i=3D`expr =
$i +
> > 1`
> > done
>=20
> A cleaned up form of this would be a great addition to the scripts/contri=
b=20
> directory if you have time...

I'm working on improved version of this script which will detect
automagically enabled dependencies. Once I get it working I'll clean it
and send patch with script.

Unfortunately running it takes very long time (even on fast server),
normal "bitbake world" is done in +- 24 hours, but with repopulating
tmp-eglibc so many times (even from sstate-cache) it's almost 48 hours.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHYDa4ACgkQN1Ujt2V2gBxYqwCffv3MBoo3mNQMDGPDmMikblE0
8fUAn20Dl89M6XrMEyIy9S3DZYwLvTQB
=yXc8
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--
