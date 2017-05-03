Return-Path: <Andreas.Reichel@tngtech.com>
Received: from proxy.tng.vnc.biz (zimbra-vnc.tngtech.com [83.144.240.98])
	by mail.openembedded.org (Postfix) with ESMTP id D2CD071ADD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 08:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id C7F2E1E1992;
	Wed,  3 May 2017 10:47:04 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 tagged_above=-10 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-0.5, LOCAL_FROM_TNG=-0.001]
	autolearn=ham autolearn_force=no
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id MwvZJIQK5jUm; Wed,  3 May 2017 10:47:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id 770E71E198A;
	Wed,  3 May 2017 10:47:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8swPwIBenc8L; Wed,  3 May 2017 10:47:03 +0200 (CEST)
Received: from localhost (p578a821c.dip0.t-ipconnect.de [87.138.130.28])
	by proxy.tng.vnc.biz (Postfix) with ESMTPSA id 1CFB31E1A10;
	Wed,  3 May 2017 10:47:03 +0200 (CEST)
Date: Wed, 3 May 2017 10:49:02 +0200
From: Andreas Reichel <Andreas.Reichel@tngtech.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20170503084902.GC1431@tng>
References: <20170421121145.9797-1-andreas.reichel@tngtech.com>
	<20170502143731.GA17616@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170502143731.GA17616@linux.intel.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Andreas Reichel <andreas.reichel.ext@siemens.com>,
	Daniel Wagner <daniel.wagner@siemens.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [wic patch 0/5] Add option to wic and use argparse
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
X-List-Received-Date: Wed, 03 May 2017 08:47:04 -0000
X-Groupsio-MsgNum: 96856
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KN5l+BnMqAQyZLvT"
Content-Disposition: inline

--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=iso-8859-1
Content-Description: message
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2017 at 05:37:31PM +0300, Ed Bartosh wrote:
> On Fri, Apr 21, 2017 at 02:11:40PM +0200, Andreas J. Reichel wrote:
> >     * wic uses optparse and a rather complicated approach of its
> >         initialization. It is much easier to switch from the
> >         deprecated optparse to the argparse library, which also
> >         supports sub-commands, which wic heavily makes use of.
> >         The second patch replaces optparse by argparse.
>=20
> Thank you for the patchset!
>=20
> I'm going to fix failing test case and test argparse-related patches
> as a separate patchset.
>=20
> Feel free to update and re-send the rest of the patches.
>=20
Thank you. So then I wait until argparse is successfully integrated
and rebase the option-patch.

Andreas
> --
> Regards,
> Ed

--=20
Andreas Reichel=20
Dipl.-Phys. (Univ.)=20
Software Consultant

Andreas.Reichel@tngtech.com=20
+49-174-3180074

TNG Technology Consulting GmbH, Betastr. 13a, 85774 Unterf=F6hring
Gesch=E4ftsf=FChrer: Henrik Klagges, Christoph Stock, Dr. Robert Dahlke
Sitz: Unterf=F6hring * Amtsgericht M=FCnchen * HRB 135082

--KN5l+BnMqAQyZLvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEESCAi86kD+H79vFKkuq/cYNuJpbQFAlkJmX4ACgkQuq/cYNuJ
pbQ/yA//bGGQaJ86DzTywKd2oBBgWtCJykpHRkWibgXqJSHWsZZV3bj1bugKoWS2
uWqks33yNh0lN1wyzN6T6wdpwFbpms30lGq3dSyCpZ/bbX9Bbvt+b5c+Lg7BLW20
J9zNT4KcFs8CT8qjB5hcEu166WRaJP5Lz3yVYNsI9S+cv6/MYNMlPBjSZ6Rjk6N9
kujW1wmY/xuLmSIePoxS7OUB3Ev8Cs6dhBrp26t3FKcq/MoECuNYC4Gba6iIybYD
Um239S5U6sNXtM5eo2ceBXuhz/xptuOlo8FWRr0MgddhAGzjUGCqeTFrshN8cVGS
I8fdCqq2uzooNO4evTnTQ1ojbwW5D8M/eJpFXzdY8cv3IAiyLIrA7zOi+PLxVc4G
OfSebhEjMt0jmvwv31TuuXAmyFcv4yJTxxjiZ1y5VZYZfvcvpT8OWeOCTeEtHAZd
dNKAZnQXAk5bPvaqxrtwiVW4L0uTcuvTgVifsDOtONlS/bxcC8pf+VHVXMlC9+Ij
0I3sPWpwh+1DEtS7NJ7O/L1XPt9zXgOSxXsWBiv8lS8Lke8sE4fdGYIPPFNecHS1
4mlpQPUcXvtmVKMk/UrMSlQD4b2w6Fyuuj/30ygti4PuNUuq45ZyzT98VpeXbkWI
8AX8JIXXFl+yjvOvw3/mJmwCeN/n+PPuZUT3qWODiZ2OrY0YKo8=
=gXBg
-----END PGP SIGNATURE-----

--KN5l+BnMqAQyZLvT--
