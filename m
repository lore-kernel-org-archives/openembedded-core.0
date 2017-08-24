Return-Path: <clopez@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 9337E78306
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=hKGwRV/eeW/5REibm4II6Il9cm0haskUKbIKN3rkzEI=; 
	b=bTjmEwH9G7vWsuz/7+aKjdUtCfvTniSOWp6X8t3OOHW8Z6J+ZkbfFyKN74jnTlA4leowjqR8U0v1ZobMBASlZ8qm/v97n3lVS/ziGz23ZjfNh5Md0AVz3cZmSD7FKNzkaT0TSOhTALgy3U3EiOtkw029q0LmVqk/fgD3kuh1yO4QfnPQ7g1+A2BRWDM4iGSdjQdeqEjU/BJ1dM6s7UUzalGXFUDKw8lwiJUZpfzXySb2whVTRV5VR+xlH6nOX8Cwv6lBSqBy+ew7TlkPx1HEikI0cUQfB03ntwcsdf5rHbhsXWEi3NETkXNl79Q4cVIDEp983pOspHWU6aYvX2W5uw==;
Received: from [192.168.10.149] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1dkt8j-0000iq-Qi for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 16:29:45 +0200
To: openembedded-core@lists.openembedded.org
References: <20170821190501.19909-1-clopez@igalia.com>
	<b1beb393-07fa-7061-eb8f-1cb4e51475fd@igalia.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
Organization: Igalia S.L.
Mail-Followup-To: openembedded-core@lists.openembedded.org
Message-ID: <d7f9208e-36a8-2d3b-2e4a-2da56362c6f6@igalia.com>
Date: Thu, 24 Aug 2017 16:29:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <b1beb393-07fa-7061-eb8f-1cb4e51475fd@igalia.com>
Subject: Re: [PATCH] systemd: don't symlink /etc/resolv.conf if resolved is disabled
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
X-List-Received-Date: Thu, 24 Aug 2017 14:29:45 -0000
X-Groupsio-MsgNum: 101977
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="NUmTNhuMe7cKFfs9eqFE0jU2sOpf3c23S"

--NUmTNhuMe7cKFfs9eqFE0jU2sOpf3c23S
Content-Type: multipart/mixed; boundary="Lb3UAhd5b9lSgChR4AMn9Lr2T5xSQeG83";
 protected-headers="v1"
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <d7f9208e-36a8-2d3b-2e4a-2da56362c6f6@igalia.com>
Subject: Re: [OE-core] [PATCH] systemd: don't symlink /etc/resolv.conf if
 resolved is disabled
References: <20170821190501.19909-1-clopez@igalia.com>
 <b1beb393-07fa-7061-eb8f-1cb4e51475fd@igalia.com>
In-Reply-To: <b1beb393-07fa-7061-eb8f-1cb4e51475fd@igalia.com>

--Lb3UAhd5b9lSgChR4AMn9Lr2T5xSQeG83
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 22/08/17 02:43, Carlos Alberto Lopez Perez wrote:
> On 21/08/17 21:05, Carlos Alberto Lopez Perez wrote:
>>  * symlinking /etc/resolv.conf to /run/systemd/resolve/resolv.conf
>>    when resolved is not enabled is wrong, as this prevents network
>>    manager from handling the resolv.conf file itself and breaking
>>    DNS resolution.
>>
>>    See: NetworkManager.conf manpage or https://git.io/v5UJQ
>>
>> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
>> ---
>>  meta/recipes-core/systemd/systemd_234.bb | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-c=
ore/systemd/systemd_234.bb
>> index 4560cf4175..dddad62941 100644
>> --- a/meta/recipes-core/systemd/systemd_234.bb
>> +++ b/meta/recipes-core/systemd/systemd_234.bb
>> @@ -235,12 +235,7 @@ do_install() {
>>  	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
>>  		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "=
\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tm=
pfiles.d/systemd.conf', d)}
>>  	fi
>> -	if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'fals=
e', d)}; then
>> -		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/r=
esolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
>> -		echo 'd /run/systemd/resolve 0755 root root -' >>${D}${exec_prefix}=
/lib/tmpfiles.d/systemd.conf
>> -		echo 'f /run/systemd/resolve/resolv.conf 0644 root root' >>${D}${ex=
ec_prefix}/lib/tmpfiles.d/systemd.conf
>> -		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-c=
onf.systemd
>> -	else
>> +	if ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false'=
, d)}; then
>>  		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ..=
/run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc=
=2Econf
>>  		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-c=
onf.systemd
>>  	fi
>>
>=20
> Looking at the previous history it seems symlinking /etc/resolv.conf
> when not enabling resolved was done originally to allow updating
> resolv.conf on read-only-rootfs filesystems ( commit 7f087f161e ).
>=20
> So the above patch is not right, as it will break that.
>=20
> An idea is to symlink /etc/resolv.conf to a different filename in /run
> when resolved is not enabled.
>=20
>=20
>=20

FTR; I reported this issue at:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11969


--Lb3UAhd5b9lSgChR4AMn9Lr2T5xSQeG83--

--NUmTNhuMe7cKFfs9eqFE0jU2sOpf3c23S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIzBAEBCgAdFiEEtdK1C8SOx/HukNmrllCJzmuV+IIFAlme4tkACgkQllCJzmuV
+II8nxAAp7ExvACg1pzmK15WPL/pnubBg4+xWqODsZ2AnhVVQqLBDIzOd4WOycPd
soD3gZyhNGTS1R3FO5gTIkeJPdQkinj4jYzExioffoySvLs/vBOsL/G45RNcDHg/
DGBRG7Xo1w/yMOUkIAirAGHrQRG7pzHnjHRACAcqyOLzWKcUMzdYG3ClyYhNbeG/
cKXN8dMCy5Fvcx/8/O0Gu8xK9vVZLTw7i75V2gjgL/UwomygCwFU5V8Txe5rYr8n
8T/tlN6F7xETnzfXs4lgnI6/DLlemut3p4vzz2/O29EjtnHi0wWXPgif3JClsfaJ
+w8kshN+4FV93Oh5WeIZShAkpjKOCCIcEeufmTTf2MAPK4dTacQVlzPhOqS3StLX
TphAUq3UpMPqa5Hy1wd8Fr3QMCTqM0S8FPO0r4+UhxI0pCUmUokvhakx55oYOaDf
0r1RImIRhsSjSRzF6VO3wptbQ3DGhCLryncWs5LvaEnX66Z/x8WMXwFyEZKDxU3I
7orNr0wDx+UgNS/uQkqOHa06F9K88m5phlEhOW51BID2qER8H5Tk2E5tmwDYB/My
KzjZsHbbh6tzkdZ6TUkpWrCkc2BuxysTMI+W4OudnK9vHLTMtN9qPxwDIUqAFiHw
6q1BSe95o7am4oY+gz62/udIbr/c2lpHKRNW5WBBn56NHg/YiGc=
=5BuE
-----END PGP SIGNATURE-----

--NUmTNhuMe7cKFfs9eqFE0jU2sOpf3c23S--
