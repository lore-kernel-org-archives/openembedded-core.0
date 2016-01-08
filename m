Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 2A41660620
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 15:37:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 95E34265DD0
To: Martin Jansa <martin.jansa@gmail.com>
References: <CAJTo0LZ4eNqiyX0JzPEb=FLAk=k=2p2c2+c5mKd77a0zquepAw@mail.gmail.com>
	<94093E93-77C6-403A-9E9F-69C02C6C8D11@collabora.co.uk>
	<CAJTo0Lada89cW8Hs=P65aHfRKiiZuu13jDu3PO=3NkJq_Wt7xA@mail.gmail.com>
	<c64105ff4adca9a4e05280aa52644919d646d660.1445449278.git.andrew.shadura@collabora.co.uk>
	<11321f065e34ca094a0aff494291662852f05805.1445522417.git.andrew.shadura@collabora.co.uk>
	<CAJTo0LbyG07bauQnVJeHYCcZ9=zhjFZdj44E1vS-kXHMVuq0BQ@mail.gmail.com>
	<5683B790.7000905@collabora.co.uk> <20160108153451.GA2573@jama>
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora Limited
Message-ID: <568FD7B7.7010703@collabora.co.uk>
Date: Fri, 8 Jan 2016 16:37:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160108153451.GA2573@jama>
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
X-List-Received-Date: Fri, 08 Jan 2016 15:37:32 -0000
X-Groupsio-MsgNum: 75723
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="dSishjk7mtAN6damV6fn2NsGnd8NMq71W"

--dSishjk7mtAN6damV6fn2NsGnd8NMq71W
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08/01/16 16:34, Martin Jansa wrote:
> On Wed, Dec 30, 2015 at 11:53:04AM +0100, Andrew Shadura wrote:
>> > On 11/12/15 22:39, Burton, Ross wrote:
>>> > > Sorry for the delay in looking at this.  buildhistory-diff report=
s this:
>>> > >=20
>>> > > packages/corei7-64-poky-linux/cups/cups: FILELIST: removed
>>> > > "/etc/rc2.d/S81cups /lib/systemd/system/cups.service /etc/rc5.d/S=
81cups
>>> > > /etc/rc5.d/K36cups /etc/rc0.d/K36cups /etc/rc2.d/K36cups
>>> > > /etc/rc3.d/S81cups /etc/rc3.d/K36cups /lib/systemd/system/cups.so=
cket
>>> > > /lib/systemd/system/cups.path /etc/init.d/cups" added
>>> > > "/lib/systemd/system/org.cups.cupsd.socket
>>> > > /lib/systemd/system/org.cups.cupsd.service
>>> > > /lib/systemd/system/org.cups.cups-lpd@.service
>>> > > /lib/systemd/system/org.cups.cupsd.path
>>> > > /lib/systemd/system/org.cups.cups-lpd.socket"
>>> > >=20
>>> > > Looks like if systemd is enabled it removes the sysvinit files, b=
ut we
>>> > > still need those installed if sysvinit is in DISTRO_FEATURES.
>> >=20
>> > I just had a look at the recipe, and it seems it removes those files=
 on
>> > its own even without my patch. I guess fixing that makes sense in a
>> > separate patch then?
> My latest bitbake world build shows new QA issue:
>=20
> cups-2.0.4: cups: Files/directories were installed but not shipped in
> any package:
>   /lib/systemd/system/org.cups.cupsd.path
>   /lib/systemd/system/org.cups.cupsd.service
>   /lib/systemd/system/org.cups.cupsd.socket
>   /lib/systemd/system/org.cups.cups-lpd@.service
>   /lib/systemd/system/org.cups.cups-lpd.socket
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.
>=20
> I'm not sure if it's caused by this change, but it would be good to fix=

> it.

Hmm, the whole point of my change is precisely fixing this issue, are
you sure you have applied my patch?


--=20
Cheers,
  Andrew


--dSishjk7mtAN6damV6fn2NsGnd8NMq71W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWj9e3AAoJEEFnG7NKhJOBb/IQAM/6oFwZbfR/sWukVfxqdmbF
/oCig0EHt78Eg/kapP2JzXwjMO0IjYVIFRsO6k0oJYnoKuok5bCq8Zdu8/9gz5j3
ni7BxzF91AOS/N6Ejoyk7eYr2/EnVxzrk7v15wuNg4AwEBdk9qU1QxNdqgRf7TBU
EME6rFrDco0lhe1+Hmu6y7BKHEnRhWZTTsfH9ypIGuSdlPLgZQuu19oHQm2R2VKe
63Kc4larHNR8Bc/4YZDb0dS/c20rAPFc1FSkC2vBMGAiHliktHN6AyOLh8PST45i
goa+vWe2NXAkDPV1OJXKz1e55e6/P+j7eD/nKABAnF4oC80UoIJliZyf7pNeHOxh
SYDY2wlpb6+jzhG566DhGU0Yi2od8hXpSgybdUPm2Yvcz6NDpdh6ldLWbnQPnCLB
Xo9D7tvmaSZaZNOj+LqdD10xi8+zHx2vMQMyYjaNDjDMiuR2zR4OcVszqmUC8T7Y
ISfFxRShE3HKNVudeUJl60NKS0Qb7M8ihNxLnpsLT9X6cCDjTDrXsUWAQY2xekhF
bCCkt9k7rqhT92H9g8dd50pn3pmNcdbaBwK8pT+P8YMWShaWHEtNK8k2svUP8tEZ
F1AwCvAQNczm47N8KozIgRzseaicNCHPmWnthRz2LfbvOd2qHGPGYZkFtx2VC0UV
Mwim6O8OBAbbojeGPldu
=BdmU
-----END PGP SIGNATURE-----

--dSishjk7mtAN6damV6fn2NsGnd8NMq71W--
