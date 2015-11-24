Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id A247D6011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 14:08:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id AD8B3261451
To: "Burton, Ross" <ross.burton@intel.com>
References: <ef26757c2c56efbd37d8577432a8e451399ad245.1448030272.git.andrew.shadura@collabora.co.uk>
	<73c4db7e6c63768735002961feb9c95815d352ea.1448030272.git.andrew.shadura@collabora.co.uk>
	<CAJTo0LYHDtBX6SaQvaOe61Fwwbcw=o4wubQ3s5wDa9ds7dD6bw@mail.gmail.com>
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora Limited
Message-ID: <56546F3E.1010409@collabora.co.uk>
Date: Tue, 24 Nov 2015 15:07:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYHDtBX6SaQvaOe61Fwwbcw=o4wubQ3s5wDa9ds7dD6bw@mail.gmail.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] dbus: add user sessions support
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
X-List-Received-Date: Tue, 24 Nov 2015 14:08:02 -0000
X-Groupsio-MsgNum: 73893
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="joNFL2GscHCHtkFF1Dn0ioSIL6Ma2T16J"

--joNFL2GscHCHtkFF1Dn0ioSIL6Ma2T16J
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 24/11/15 15:03, Burton, Ross wrote:
> On 20 November 2015 at 14:38, Andrew Shadura
> <andrew.shadura@collabora.co.uk> wrote:
>=20
>>    Enable the user-sessions support with a PACKAGECONFIG flag.
>=20
> What is the impact on this if someone is using systemd but doesn't want=

> user sessions?  Should we enable it if the DISTRO_FEATURES contains
> systemd by default?

It is okay to use systemd and not use user sessions. Possibly, we want
to enable it by default in the future, but it should be okay to have it
disabled for now unless it's switched on from elsewhere.

--=20
Cheers,
  Andrew


--joNFL2GscHCHtkFF1Dn0ioSIL6Ma2T16J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWVG8/AAoJEEFnG7NKhJOBgX8QALnHdUPshF1Bjj5tRShZ6n7s
BA/SVqVWliuZg3qBo1PM5uMhmpiP+uHm8luTd3ied4D3vnCeK+bHmukMOBEK74O5
dZI53v1v14QpbZEhUVdVAKX4JBs87+bJbmAGToRPiaDRSVj7sSAj+MFC43hIIUVV
9xHxnSxTBta3R6R2Vwg8IxgpyUyBekavAdXgoKqPb/05N+Qu3PcBouG6wYlyZRDq
BBbr7BRU0lWRDRsGLYyY7ol7oKS4zKp5X2S2q7ZJ3Ti7f5r8QlOsQPAL8BrNAaTr
IV+asNmBtNkSZ8w4MB3arHF9zBbKv5Ef1Qf0qHa/B7JKpPcTj2drAa6xaLT47mUk
XK2IItTjV0p3JtgwPxxSzjUiS6WQIitXtarnY8wROOiJdzqHlLVGTzAWlFGqOT/b
hClbnJREd/J3OZe+Se/4DIzCPNim4ucXxi0pMIByhX/ULwvSQrRRQGhsnS9pOV5L
U8//cus7GueTDUFs0/GlqeAFISXDVCSCc+0hogrnRqVyTyLbrvD/Dq4jn1DPnzCq
Ss7zXyiUmLssm8UGO7hvbmaquaPmH3xIBb/vnLDvXVru1m2V3cX6bVwAmUpS8bYk
iOYCWtHirGjpuaaRvgVnF6oaWAgMzcqlKsUvePS0zYILhIk9J9nyUWtXdxH7ollu
a/OSdroTIXcX/XSaDxwa
=x/Oj
-----END PGP SIGNATURE-----

--joNFL2GscHCHtkFF1Dn0ioSIL6Ma2T16J--
