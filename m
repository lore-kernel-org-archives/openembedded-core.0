Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id C42176A9C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 13:51:26 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so7832731wiv.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=i6sChGKqPlyeBpBa3q5KgShEZjPgfX3BzIFY73/FpW0=;
	b=GgraC4od3hZiTCW46hpVLM7D2BDftOYrqqI8ZWDEt/nbe0FFozUzsH9pQ2cQnWUMN8
	+1j2hhptuO/oFNQYfoCs3jVJfGbQI1T3UIfQQAomn1RngJx1j5xm5IhEAjpfGSsHWCKg
	kUymkzVLLZqZQDev1kY1MKf2RSBSjpR5zMVCuHP6Q/Yt0WasRy+M4MUC9B+sSgK4fbOD
	U6ZsAhWLsHm4NOy+TFduEsQV2xm2JJdm01v6OO/L6d00D5So7OHcCXDA+1JyylZlVxXA
	8Z2xrG4bm2sfZVdcD4ydzCk4IkA79Ei/cnei4bWXdG2T97IvO27QaUToDLEvISaQsYA8
	dgaw==
X-Received: by 10.194.185.238 with SMTP id ff14mr2084267wjc.9.1406123486865;
	Wed, 23 Jul 2014 06:51:26 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id w10sm9443668wie.22.2014.07.23.06.51.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 06:51:26 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Wed, 23 Jul 2014 13:51:23 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Message-ID: <20140723135123.GA32767@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: gpgme-config
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
X-List-Received-Date: Wed, 23 Jul 2014 13:51:33 -0000
X-Groupsio-MsgNum: 55423
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm trying to build opkg with 'gpg' added to PACKAGECONFIG on the master br=
anch
of OE. The gpg support for opkg is provided by gpgme, which uses 'gpgme-con=
fig'
to determine CFLAGS and LIBS when building. After recent changes, the
gpgme-config script is now just a dummy and doesn't do anything.

Upstream gpgme do not provide a pkg-config file and an upstream issue about=
 this
raised in 2012 was resolved WONTFIX (https://bugs.g10code.com/gnupg/issue14=
14).

Our options are:

1) Add a .pc file to gpgme and maintain it within OE as it is very unlikely=
 to
   be accepted upstream. Then I need to modify configure.ac in opkg to supp=
ort
   both this pkg-config file (for OE) and the gpgme-config utility (for all
   other users of opkg).

2) Make an exception to the policy on -config scripts for gpgme.

I haven't really followed the discussion on why -config scripts needed to be
removed so I'll put this question to other OE developers. Would option (2) =
cause
more problems in the long run? If so, is it worth the extra effort to follow
option (1)?

I'll probably need someone to bounce a few autoconf and pkg-config question=
s off
if I implement option (1) as I'm not very familiar with either system.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJTz73bAAoJEBwoJlo7UPQDeoAH/2xqzHBDpF/DIokOj2ljeEp9
N60h322Yvwhis5d9d5N/SCtpvVuBP513/l+TL6mfi9SNnffhDH+AWfJtVTIziNs2
d/1LoCQ7BSTfL0o53rsyU1mV+1p9sR3AVjDRWdzTRz9gIky/ObR99qjMPNuZibpM
xc3URBa9mF8WWYpPMu2PEUbQ4vUChaSFMN+yepwRdXHRXrFLc6UGz0F/Cdnd0oky
z+5jmHuQy6LSU4tOB/CoC6TVAMd0jsMse/YvhZ4DGHtVlhYPyk5RTyHVOLqlQj8D
m8baxBUwfv3mNrILQct/nBvAD3+cifcF4KBvbOXmtdOAinVTAUbr4QkJ84vDunE=
=7bgv
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
