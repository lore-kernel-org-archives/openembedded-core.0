Return-Path: <clopez@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 9E5797198F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 18:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:Subject;
	bh=I7Ll2EZjo1FOINfEEsZPwhYxcV4X/GfHG7Ixrn3tVoU=; 
	b=Ks9qJ/CIB8ErtitITr5OS2cKhBl0gYP3FpySdTyMP8X35LEnq+c56N7O3MKJpWeha1qG6ouGgK9BykH0lxsXsLPaAsrve1W2D/h4GyKKnqqj1C4NXb5FaWEQExvqIGQMkWoO+h2Y6Ke0I5MlcvQLg0MpOeuaXKiR5mvoR2af6614ItcphDaUkzj4J9GPJp9TKXm8ykGsXCm0w4Yur+bsUXVjeSUU+IYwXt2u2WYBvMtV44rCN2eYcZ+p0N33xYlSp2xyZM5FLy+Iq/YD4d4gXkTULrl2Hs5WahylCRPixcQDx+MyN7Lg/1FAJeOth+oOlnSA1FrI40K3D5sWreaJKQ==;
Received: from [192.168.10.149] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1dnTlt-00072y-WC for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 20:00:54 +0200
Cc: openembedded-core@lists.openembedded.org
References: <20170831122335.6864-1-clopez@igalia.com>
	<CAP9ODKq4Jb4HfhHCpNgg+zwwqc0E21t3cmGGMHm9jfOmqVpg2g@mail.gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
Organization: Igalia S.L.
Mail-Followup-To: openembedded-core@lists.openembedded.org
Message-ID: <d9f6a958-7cb4-c3e8-9d90-25a10204d685@igalia.com>
Date: Thu, 31 Aug 2017 20:00:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKq4Jb4HfhHCpNgg+zwwqc0E21t3cmGGMHm9jfOmqVpg2g@mail.gmail.com>
Subject: Re: [PATCH] initramfs-live-boot: disable systemd-update-done.service on live images
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
X-List-Received-Date: Thu, 31 Aug 2017 18:00:53 -0000
X-Groupsio-MsgNum: 102250
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="l5u5CwuWAhPMSL062iWJjkOWvSpcjfAWg"

--l5u5CwuWAhPMSL062iWJjkOWvSpcjfAWg
Content-Type: multipart/mixed; boundary="KucOaog3ei59qDosneodFq6DnxsWc8Rg1";
 protected-headers="v1"
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <d9f6a958-7cb4-c3e8-9d90-25a10204d685@igalia.com>
Subject: Re: [OE-core] [PATCH] initramfs-live-boot: disable
 systemd-update-done.service on live images
References: <20170831122335.6864-1-clopez@igalia.com>
 <CAP9ODKq4Jb4HfhHCpNgg+zwwqc0E21t3cmGGMHm9jfOmqVpg2g@mail.gmail.com>
In-Reply-To: <CAP9ODKq4Jb4HfhHCpNgg+zwwqc0E21t3cmGGMHm9jfOmqVpg2g@mail.gmail.com>

--KucOaog3ei59qDosneodFq6DnxsWc8Rg1
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 31/08/17 19:26, Otavio Salvador wrote:
> On Thu, Aug 31, 2017 at 9:23 AM, Carlos Alberto Lopez Perez
> <clopez@igalia.com> wrote:
>> When systemd is used, it will invoke a service on first boot that trig=
gers
>> a rebuild of ldconfig caches (rebuild dynamic linker cache).
>>
>> This is fine on the first boot of a system that has been installed, bu=
t it
>> makes no sense on a live system. The worst part is that rebuilding thi=
s
>> caches is slow and it causes the live system to take longer to boot.
>> (I measured this in 30 seconds longer on a standard PC system booting
>> core-image-sato live from an USB memory).
>>
>> Disable this by touching /etc/.updated and /var/.updated on the live i=
nitramfs.
>>
>> For more details see https://bugzilla.redhat.com/show_bug.cgi?id=3D120=
1725 and
>> https://www.freedesktop.org/software/systemd/man/systemd-update-done.s=
ervice.html
>>
>> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
>=20
> This should be done to the live boot module of initramfs-framework as w=
ell.
>=20
>=20

I'm not really familiar with the modules there.

What is the use case of doing this there as well?
live systems without an initramfs? is that possible?

Where should this exactly be done there?
I don't see the boot_live_root() equivalent.


--KucOaog3ei59qDosneodFq6DnxsWc8Rg1--

--l5u5CwuWAhPMSL062iWJjkOWvSpcjfAWg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIzBAEBCgAdFiEEtdK1C8SOx/HukNmrllCJzmuV+IIFAlmoTtUACgkQllCJzmuV
+IIaPBAAt5m6QuZnfF76DLOTBu+Z5KckHeaC6r72qdcIFboG8qgnqdRt+47H2XIu
8pb6YSHkjW3ZB0SbRgdKb99vs8OlMWLz/TbAm0oHdSE0lQtHvcC3ksnJiAx5MDCM
tXEabsi0s40BTcQCdqUXc+U9/iUsVdXoZaG89VzaDOF23fJ+GRXDUrcWeHU72MYW
oW5Z6Ly7WBqIh3yTfG3Pjpdc+hHlnLfzemcHgdNK/ZrXACLgBc/qoXMecMQl9kYA
gL7S1OuvafkT0ziBNXO8uyfmBGrS5BsEJjB+hQ9mhB7g4cstKHtEO7jheFd8v6cv
Uhdzkb5FPXLXKUYcWHoGUZ1ElszIEptQUtbBLZPniGehRdwtGfOmd6Gy8bjA7/Vf
E4Md9ThXUmfoWAbChBIlacew4dlA7U+18Hj5Zo53w/BG++RK9K7mmgwIWI8Xd97K
wopMKKm+odpIN+Ilh6UBOZU0JFpJo8xHdgI1zMqVT1Gug9rftOk/a+bdFIxFeupk
HKSvdkCRmiLiSnT7v64wT75IqHWXI6VYdc2T6oY/KBE2waeCApcARrxDk49bJ/Ln
CLw+3eu+7844DTWNBocmOb5QbXxOJnLnAs8dS4xrJ1Wzr50KmbXu85/LUlmkWPch
7O3IEtJfVXBYgW7Vav5YThoQBlYJ2AeEHhouZC3FFjl9i1j1o7A=
=4hbQ
-----END PGP SIGNATURE-----

--l5u5CwuWAhPMSL062iWJjkOWvSpcjfAWg--
