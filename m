Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SS4kR-0006Lj-EH
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 13:08:02 +0200
Received: by bkcjm2 with SMTP id jm2so122977bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 03:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ImObui6zRGRg5pjln+2zjHTKyzP3lwAfW/Bj0y1ZVwE=;
	b=kwD5VcaOgnsIypUrIMoYHE5axVQT74LT5OZAyBmCth3sFzmUpCoTXbnQ4dUYGyN6ZE
	kqN6e5s6Ok57iT84Vj3aHdKHlaDr9Ry1kDgnFxN79IGmeh+BZAT0vvvDIx2JgsCjpXLb
	cAayzbW3/XNz8SX0m9HU3z87wEnGAlFX0sPoS9oO4M9mqjGGRCc+BYxGDsxAAM4X29WO
	HnO6AgBznAmppfUP7FhJvWW1DjU767ddQ1tAD2hyF7/y3g9yzpiIfykd0OBQHD9qOT3w
	0I+q5lDSM9MF7cwMHPrJWzxApZc/xxuItp7TM2veWMI/dL0hstaYtXLLnGcXuZPjfWmg
	f/qg==
Received: by 10.204.152.203 with SMTP id h11mr8060708bkw.122.1336561083228;
	Wed, 09 May 2012 03:58:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n19sm4173102bkv.14.2012.05.09.03.58.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 03:58:02 -0700 (PDT)
Date: Wed, 9 May 2012 12:58:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120509105803.GC12898@jama.jama.net>
References: <20120508151411.C836310218@opal>
MIME-Version: 1.0
In-Reply-To: <20120508151411.C836310218@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Bruce Ashfield : kern-tools: integrate minor fixes
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
X-List-Received-Date: Wed, 09 May 2012 11:08:11 -0000
X-Groupsio-MsgNum: 21891
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline

--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 08, 2012 at 03:14:10PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 043871d7e5d2d19c2ff43e54d2ff180c09e8903e
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D043871d7e5d2d19c2ff43e54d2ff180c09e8903e
>=20
> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> Date:   Mon Apr 30 00:02:17 2012 -0400
>=20
> kern-tools: integrate minor fixes
>=20
> Updating the SRCREV to pick up two minor fixes:
>=20
> 1/2:
>     kgit-init: correct spelling of createme
>=20
>     kgit-init copies the kern-tools scripts and intends to copy createme.
>=20
>     The typo is in the usage() of updateme as well.
>=20
>     Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
>=20
> 2/2:
>     kconf_check: fix bad quoting around missing_required.cfg
>=20
>     missing_required.cfg won't have it's path truncated (if applicable), =
since
>     the quoting it wrong.
>=20
>     Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

No idea if this is new issue or just old issue now revealed by those
fixes, but linux-yocto-3.2 now fails to build for qemux86-64 (at=20
least here).

NOTE: package linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f03827b7efbccfc=
ec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1: task do_patch: Started
ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/qemux86_=
64-oe-linux/linux-yocto/linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f0382=
7b7efbccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1/temp/log.do_pa=
tch.32134 for further information)
ERROR: Logfile of failure stored in: /OE/shr-core/tmp-eglibc/work/qemux86_6=
4-oe-linux/linux-yocto/linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f03827=
b7efbccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1/temp/log.do_pat=
ch.32134
Log data follows:
| ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/qemux8=
6_64-oe-linux/linux-yocto/linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f03=
827b7efbccfcec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1/temp/log.do_=
patch.32134 for further information)
| WARNING: addon feature "features/netfilter" was not found
| WARNING: addon feature "features/taskstats" was not found
| WARNING: addon feature "cfg/sound" was not found
| ERROR: required features were not found. aborting
| ERROR. Could not update standard/default/common-pc-64/base
NOTE: package linux-yocto-3.2.11+git10+6b3d4e09aa2531e9649f3f03827b7efbccfc=
ec03_7+00e5ec2393bada6723bd9a07ded3d001c02fa727-r1: task do_patch: Failed

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+qTbsACgkQN1Ujt2V2gBw6oACePuy7GzCgXROfehed+Q06Fpm8
bewAoJDFWjBuzQ/+nYV2X5DYr+9RkRIe
=3Mhk
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
