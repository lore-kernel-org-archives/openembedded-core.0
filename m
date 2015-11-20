Return-Path: <andrew.shadura@collabora.co.uk>
X-Greylist: delayed 540 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 Nov 2015 13:57:21 UTC
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 877B660112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 13:57:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id AF0D96015D7
To: Ross Burton <ross.burton@intel.com>
References: <c64105ff4adca9a4e05280aa52644919d646d660.1445449278.git.andrew.shadura@collabora.co.uk>
	<CAJTo0LZ4eNqiyX0JzPEb=FLAk=k=2p2c2+c5mKd77a0zquepAw@mail.gmail.com>
	<94093E93-77C6-403A-9E9F-69C02C6C8D11@collabora.co.uk>
	<CAJTo0Lada89cW8Hs=P65aHfRKiiZuu13jDu3PO=3NkJq_Wt7xA@mail.gmail.com>
	<11321f065e34ca094a0aff494291662852f05805.1445522417.git.andrew.shadura@collabora.co.uk>
	<562EAA43.8020604@collabora.co.uk>
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora Limited
Message-ID: <564F24A3.2090403@collabora.co.uk>
Date: Fri, 20 Nov 2015 14:48:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <562EAA43.8020604@collabora.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] cups: update systemd support
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
X-List-Received-Date: Fri, 20 Nov 2015 13:57:23 -0000
X-Groupsio-MsgNum: 73730
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ep2ohOi6c05tpSVvaO3f3cc4lXKlKPtk7"

--ep2ohOi6c05tpSVvaO3f3cc4lXKlKPtk7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 26/10/15 23:33, Andrew Shadura wrote:
> On 22/10/15 16:00, Andrew Shadura wrote:
>> Add PACKAGECONFIG for systemd, enable it when systemd is enabled
>> in DISTRO_FEATURES. Pass the correct path to systemd units,
>> ensure they're installed into the package.
>=20
> Ross, could you please review an updated version of the patch?

Any news on this patch since then? Comments, critique, anything?

--=20
Cheers,
  Andrew


--ep2ohOi6c05tpSVvaO3f3cc4lXKlKPtk7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWTySjAAoJEEFnG7NKhJOByswQAIVzK2ohNhaOO+tqe7BnzvjG
iYK2UMFiI6Ersu/K1VNdarI7SVPlgXFW4NM/0But5I+Z+de4Eu3zL+5DkXN5dpb0
uXFK+LDk74BiBNspMg3kkbVMqV9MMRI4Cja4XXMk3olbVCDaaJM9FzvboB8O1Jbk
icoWnMsBj3WerfxM+kPQMqnzPcVU2xhWHiIVkXRqQZ9IEriyuQJ3ZPNn8Obrw5pM
fllmcSPz4++pOUrErDuRNeiz8A40moT17LcP2ZAbFhQaWcIkp5T55NNGtYwuuNS/
fjzXx6Se/UzdaRnosbU+GcaFFulo1dMkcIZVjr7xK/z+l94JoebZKA9OaoIMz603
08FCIgh0aKo4PhmrQPMsyqTkjS13BXSBtTmogu+1dlnTbjYfqyWTKVzNJS+Gq2Kx
VdQfaPBQq5aDy0l5R0hUd+rVt4vv/3ZnXnz3U4SrruxLJ21cMAzEayoEkdIXvWhq
uRjZpXJ3DEoxdLyWnvIdHzxKFMLbeBb2RU92a8+22S6ax7ZjOkrNeaBoT/xMNQ8T
oxnORGfjCjRMiDeOz+twCIyQV4ds9DYps6cjn2yXmGGuW3vq+W9+ksWJr8DPRt0R
TElRF8BXEs9ttkNrg65luP6SUZZas7O0/XroJm+s8ousfmGgBXa2KFkvWGtzufDm
Z9oIBzbZ8joxNSFRgVhy
=pY7i
-----END PGP SIGNATURE-----

--ep2ohOi6c05tpSVvaO3f3cc4lXKlKPtk7--
