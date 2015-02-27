Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 27CAB737C3;
	Fri, 27 Feb 2015 13:20:58 +0000 (UTC)
Received: by widem10 with SMTP id em10so139919wid.0;
	Fri, 27 Feb 2015 05:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3l/pA/nG60jjDKeTzJG476g/AnTkrmfGgSlwvgIi3sc=;
	b=ZHcDK1fRVaOOQ4tw2sXj6UQi0aUyzUQQU0+uP3TunXCxBI4Oc1lgcWenSgJznscBXm
	o1uR1FYT2PdwIY352g1cLKlMd3OcYPnjyMXgGcSkWLBas3hh6P+g4lDe1dc4f001S2HU
	lprOdMECdJdg3oQ9FEdlL675xZY1IiZN9k8T/pzB5Udrwyv/gv8KQAKlf7RBv1zSNtjk
	L3q/gW15WTp3sqOMeyM8JE8peWT+cFEidU38gyhvgKbsVsj26/hyWmGlEF9+5Slh9Pw0
	BGPEjqss/2q5tQsRKTjWQbWLNkn+ECFFPvnSGePFz7oyoyQ3Px7Z/ntXn0Gl5jrydHG7
	eO1w==
X-Received: by 10.194.200.1 with SMTP id jo1mr27145533wjc.64.1425043259140;
	Fri, 27 Feb 2015 05:20:59 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lb6sm5049424wjb.22.2015.02.27.05.20.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 05:20:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Feb 2015 14:21:17 +0100
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-ID: <20150227132117.GL2309@jama>
References: <20150227074233.1D2E3502AE@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150227074233.1D2E3502AE@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : systemd: Upgrade 218 -> 219
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
X-List-Received-Date: Fri, 27 Feb 2015 13:21:01 -0000
X-Groupsio-MsgNum: 62804
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UK1lfQXsnwKrySH9"
Content-Disposition: inline

--UK1lfQXsnwKrySH9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2015 at 07:42:33AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 041570e584b98b580cc75f9ee23372da74a84377
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D041570e584b98b580cc75f9ee23372da74a84377
>=20
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Wed Feb 25 02:55:57 2015 +0000
>=20
> systemd: Upgrade 218 -> 219
>=20
> 219 has been in the docks for sometime, the older patch got merged
> this patch is now upgrading 218 to 219
>=20
> Make all patches using git

Fails to build in world builds, looks like missing dependency:

| checking for MOUNT... no
| configure: error: *** libmount support required but libraries not found
| Configure failed. The contents of all config.log files follows to aid deb=
ugging
| ERROR: oe_runconf failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/systemd/1_219+gi=
tAUTOINC+a88abde721-r0/temp/log.do_configure.18534)
NOTE: recipe systemd-1_219+gitAUTOINC+a88abde721-r0: task do_configure: Fai=
led


> Change-Id: Ib0350144592aba26cad56c13c9a5522515915c58
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  ...r-getty-to-agetty-in-console-setup-system.patch |  44 +++++++++
>  ...ed-missing.h-fall-back-to-insecure-getenv.patch |  25 +++++
>  ...t-install-dependency-links-at-install-tim.patch |  74 ++++++++++++++
>  ...eck-for-additional-features-that-uclibc-.patch} |  26 ++++-
>  ...n-Use-execvpe-only-when-libc-supports-it.patch} |  32 ++++--
>  ...al-Use-posix-fallocate-only-if-available.patch} |  48 +++++----
>  ...til-Use-mkostemp-only-if-libc-supports-it.patch |  42 ++++++++
>  ...unimplemented-_SC_PHYS_PAGES-system-conf.patch} |  29 ++++--
>  ...or-add-support-for-executing-scripts-und.patch} |  43 ++++----
>  ...-Make-root-s-home-directory-configurable.patch} | 108 +++++++++++----=
------
>  ...011-systemd-user-avoid-using-system-auth.patch} |  12 ++-
>  .../systemd/systemd/binfmt-install.patch           |  57 -----------
>  .../systemd/systemd/optional_secure_getenv.patch   |  19 ----
>  .../systemd/systemd-pam-fix-getty-unit.patch       |  35 -------
>  .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  30 ------
>  .../systemd/{systemd_218.bb =3D> systemd_219.bb}     |  37 ++++---
>  16 files changed, 384 insertions(+), 277 deletions(-)
>=20
> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dcommi=
tdiff;h=3D041570e584b98b580cc75f9ee23372da74a84377
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UK1lfQXsnwKrySH9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTwb00ACgkQN1Ujt2V2gBwlqQCgrpBYx2kWTRtqSBPFDCCzL35a
DmIAoIIEYM8S+uAysQdFqRkslxFc1KCu
=B1eI
-----END PGP SIGNATURE-----

--UK1lfQXsnwKrySH9--
