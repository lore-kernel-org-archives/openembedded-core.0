Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 39CFE6012C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 19:08:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 0C65C2613AC
To: Patrick Ohly <patrick.ohly@intel.com>
References: <ef26757c2c56efbd37d8577432a8e451399ad245.1448030272.git.andrew.shadura@collabora.co.uk>
	<1449514958.30674.37.camel@intel.com>
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora Limited
Message-ID: <5665D910.8040008@collabora.co.uk>
Date: Mon, 7 Dec 2015 20:08:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1449514958.30674.37.camel@intel.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] dbus: build with systemd support
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
X-List-Received-Date: Mon, 07 Dec 2015 19:08:11 -0000
X-Groupsio-MsgNum: 74418
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="lA37IwWUagIECAJ3T9VIkI5r5mrApsLjl"

--lA37IwWUagIECAJ3T9VIkI5r5mrApsLjl
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07/12/15 20:02, Patrick Ohly wrote:
> On Fri, 2015-11-20 at 15:38 +0100, Andrew Shadura wrote:
>> > It's good to have the extra functionality, such as seat support
>> > provided with systemd support. Not least of all to support
>> > systemd user-sessions.
> Your patch is against D-Bus 1.10.2, which is not yet in OE-core master.=

> I adapted the patch to the current D-Bus 1.8.20, but there the
> advantages turned out to be (IMHO) fairly minor: it only adds logging
> via journald.
>=20
> socket activation via systemd already works even without
> --enable-systemd, because the recipe explicitly installs the systemd
> unit files and the code itself supports it also without
> --enable-systemd.
>=20
> But I like your patches, so perhaps including D-Bus 1.10.x (1.10.6 is
> the latest stable release) can be considered for the next OE-core
> release?

This patch is supposed to be applied after other series of mine adding
1.10.2, see <http://patchwork.openembedded.org/patch/108237/>.

--=20
Cheers,
  Andrew


--lA37IwWUagIECAJ3T9VIkI5r5mrApsLjl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWZdkQAAoJEEFnG7NKhJOBVK4QALyYGGlNpQVJlf5BP7kD2kjf
ucpOOhqn0QUkXGuUuS03OqnODMo1BUxfi6ElFlf4zkpmBGpE2tg1MIPukSUCikuD
V+8pztXOXKXSQ1Aetosp7+YoysHasVPWfB+cDZCt6207jHqTQjfjXD3gjGAgCDcC
PDjvLYR3gKRRo96d/mRNAh0XP52vVpYUE8D0D/mpANVh+qxXfsgTto0YucplFWCp
vf3GFXA3VuUVxAeH8D8gccWpML/c68NZ/H8GuFuHtLmoGx54fCmCCO4hzhjzSGtw
SDmx1+1OQNtG+hiZnP4dlSOI+on1SjYdkhW1573vbzT5da/f0Yi3zALI2PtXicPn
Mqva8G9t4hfDbcw0fiV//sekESXYU9xw++cuaDYeU3jdVQHCkMjGZt87PowUYDNA
eKdCaTGgDBauTz3D3s8eoAczA5ASLdfzHkTP9DCl40FyY905X02yQlo3z19Lq9GS
8AfqgpGxkg749btdGnRdSYxS81050trnKdFPK4nJ/5buQPdVQTq9CsWdCQJdRSSe
QHlXnyAVrK59Xd6kqUIjg3HwY/zC4MjH0KtHZeyFGWk1DHpCuZlASMGdalTWKSid
0OSXUK2p3K6x+6aPeUyAn+UEXOd3PlRKNAI5qFVbJDXni+nIVLuVHxP0JCHPGaTO
lEew1P4Wf+2cnkSvvx2h
=TPX3
-----END PGP SIGNATURE-----

--lA37IwWUagIECAJ3T9VIkI5r5mrApsLjl--
