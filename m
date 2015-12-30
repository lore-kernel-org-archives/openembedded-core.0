Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 4FFBD60118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 10:53:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id EB40B261090
To: "Burton, Ross" <ross.burton@intel.com>
References: <CAJTo0LZ4eNqiyX0JzPEb=FLAk=k=2p2c2+c5mKd77a0zquepAw@mail.gmail.com>
	<94093E93-77C6-403A-9E9F-69C02C6C8D11@collabora.co.uk>
	<CAJTo0Lada89cW8Hs=P65aHfRKiiZuu13jDu3PO=3NkJq_Wt7xA@mail.gmail.com>
	<c64105ff4adca9a4e05280aa52644919d646d660.1445449278.git.andrew.shadura@collabora.co.uk>
	<11321f065e34ca094a0aff494291662852f05805.1445522417.git.andrew.shadura@collabora.co.uk>
	<CAJTo0LbyG07bauQnVJeHYCcZ9=zhjFZdj44E1vS-kXHMVuq0BQ@mail.gmail.com>
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora Limited
Message-ID: <5683B790.7000905@collabora.co.uk>
Date: Wed, 30 Dec 2015 11:53:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbyG07bauQnVJeHYCcZ9=zhjFZdj44E1vS-kXHMVuq0BQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 Dec 2015 10:53:14 -0000
X-Groupsio-MsgNum: 75322
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="V0qID7McMUwOuupWTrHl1c3UqkXdJ4txc"

--V0qID7McMUwOuupWTrHl1c3UqkXdJ4txc
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/12/15 22:39, Burton, Ross wrote:
> Sorry for the delay in looking at this.  buildhistory-diff reports this=
:
>=20
> packages/corei7-64-poky-linux/cups/cups: FILELIST: removed
> "/etc/rc2.d/S81cups /lib/systemd/system/cups.service /etc/rc5.d/S81cups=

> /etc/rc5.d/K36cups /etc/rc0.d/K36cups /etc/rc2.d/K36cups
> /etc/rc3.d/S81cups /etc/rc3.d/K36cups /lib/systemd/system/cups.socket
> /lib/systemd/system/cups.path /etc/init.d/cups" added
> "/lib/systemd/system/org.cups.cupsd.socket
> /lib/systemd/system/org.cups.cupsd.service
> /lib/systemd/system/org.cups.cups-lpd@.service
> /lib/systemd/system/org.cups.cupsd.path
> /lib/systemd/system/org.cups.cups-lpd.socket"
>=20
> Looks like if systemd is enabled it removes the sysvinit files, but we
> still need those installed if sysvinit is in DISTRO_FEATURES.

I just had a look at the recipe, and it seems it removes those files on
its own even without my patch. I guess fixing that makes sense in a
separate patch then?

--=20
Cheers,
  Andrew


--V0qID7McMUwOuupWTrHl1c3UqkXdJ4txc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWg7eQAAoJEEFnG7NKhJOB5KkP/AtqoXHS1zEFNUwcEFrtjzQb
YDYHN9jrjjln1gUzdcbR6eTXn62FuQt4P+8jifw9dyOa6FRGylLJzv4KjYgLfUPp
lBgg1qC2FMKBH57O0UQRiUn5bfTm+nNPs3YZqpEPhIOXrKeQmT34s4UmuuCCrsm3
LXEGj0igsA+J3cTJNMGkA8XDgzinsSQ5zUSEawvdbdKr0XTQp8Z06ELL1IV8i5Rs
jdSNcYcK4oeeWFrTeBnXuuDDRTjZo0dGw6JdBGhkHRLB2IJckHg4FhzgSbUcSoWo
O7LYV0tU3TsqH54MKLolazJTKsVEJeMgYYwVYfJrGBekB7MV5jhfFjMgi27nXnZy
/JGEUaoddMHJL5c7avSVI8Ew7/otxcmfFbgT/X5N59EtbGDClJWODujCsVhhnZUz
6dCeKoDGE2HhLICzDrsjVsuz6cpRHDDeA98O7yQMUsvBJ28lYbWfDo667Kzl+EMD
OcOTtFm3VH13LrPJHhXyb7AwgZRI15gMyviPnqbVSG/snXbIPNr8NIQK2SvaJVtf
NqGZ6egYOBSDhBCKwFWQEnOSln3nnQcITOQ8qsf0+uYw5r9MzzNCL9LmlxfdPdOV
0d8/bbyzu8kGmkLJg/NrN3zGtW08e9zeWq95D/rtBo6fmsvVhbT0ZrzAR6P05cFO
k0PJh9SA6FmEbQMKevIM
=1BwI
-----END PGP SIGNATURE-----

--V0qID7McMUwOuupWTrHl1c3UqkXdJ4txc--
