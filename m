Return-Path: <jan.klare@bisdn.de>
Received: from mx.bisdn.de (mx.bisdn.de [185.27.182.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0777E686
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 10:41:05 +0000 (UTC)
Received: from [172.16.250.196] (unknown [172.16.250.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx.bisdn.de (Postfix) with ESMTPSA id 0EA42A46C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 12:41:06 +0200 (CEST)
From: Jan Klare <jan.klare@bisdn.de>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Message-Id: <0CF8F3B7-B1AA-48A8-96CC-F38FBC3CB96A@bisdn.de>
Date: Wed, 28 Aug 2019 12:41:05 +0200
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [v2] systemd: Fix interface bring-up on kernels >= 5.2
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
X-List-Received-Date: Wed, 28 Aug 2019 10:41:05 -0000
X-Groupsio-MsgNum: 128337
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F238DE0A-48FD-4D9D-AC03-A4EBA5D9B96C";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_F238DE0A-48FD-4D9D-AC03-A4EBA5D9B96C
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_090F2561-00E2-49BC-9B47-899AC462F288"

--Apple-Mail=_090F2561-00E2-49BC-9B47-899AC462F288
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

I think this patch is not needed anymore since both patches have already =
been backported to the latest stable version of systemd v242. To include =
these patches in the yocto builds we need to update the SRCREV to the =
latest commit in the v242-stable branch of systemd/systemd-stable =
(07f0549ffe3413f0e78b656dd34d64681cbd8f00).

https://github.com/systemd/systemd-stable/tree/v242-stable =
<https://github.com/systemd/systemd-stable/tree/v242-stable>

The same is done here https://patchwork.openembedded.org/series/19508/ =
<https://patchwork.openembedded.org/series/19508/> for systemd =
v241-stable.

Cheers,
Jan

--Apple-Mail=_090F2561-00E2-49BC-9B47-899AC462F288
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
class=3D"">Hi,</div><div class=3D""><br class=3D""></div><div class=3D"">I=
 think this patch is not needed anymore since both patches have already =
been backported to the latest stable version of systemd v242. To include =
these patches in the yocto builds we need to update the SRCREV to the =
latest commit in the v242-stable branch of systemd/systemd-stable (<span =
style=3D"caret-color: rgb(36, 41, 46); color: rgb(36, 41, 46); =
font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, =
Menlo, monospace; background-color: rgb(255, 255, 255);" =
class=3D"">07f0549ffe3413f0e78b656dd34d64681cbd8f00</span>).</div><div =
class=3D""><br class=3D""></div><a =
href=3D"https://github.com/systemd/systemd-stable/tree/v242-stable" =
class=3D"">https://github.com/systemd/systemd-stable/tree/v242-stable</a><=
div class=3D""><br class=3D""></div><div class=3D"">The same is done =
here&nbsp;<a href=3D"https://patchwork.openembedded.org/series/19508/" =
class=3D"">https://patchwork.openembedded.org/series/19508/</a>&nbsp;for =
systemd v241-stable.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Cheers,</div><div class=3D"">Jan</div></body></html>=

--Apple-Mail=_090F2561-00E2-49BC-9B47-899AC462F288--

--Apple-Mail=_F238DE0A-48FD-4D9D-AC03-A4EBA5D9B96C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEt80lub3VhefUQEYIB81h/G0bP5IFAl1mWkEACgkQB81h/G0b
P5KEmhAAmlmjT1rzBSoxrekHoJUBvgqVJNVm7fy2IBc+JCeGNEQmBkPaemtyIqeT
jI52W4PD5Vjt2vsQvZqgZCoUp6ayN1lWEr87Gnc7pZNxzISPrNsfSmrUcKDRkaeI
sKT0na2QbaKsrnCUsMW47EplSh509E2EFCFcPnvq7D1HL892ExXs5Nfy23t5HSBg
fxiO05Wj4ItQTiHJskhXhHmVS+UjlFHUYB1+TaE50XIs0ntW/+Hk8jYXGqdf48vz
Sg5nUam3TO4PP8pbYtyf7XPVZ250YWk2s3+tCRAFuQAcnCt5V+LguviWsJNRjX2P
PGi+zhBKFP4IvOlg8D60SxgIuyB7CliPbDxZ9LUsH5N7B9b/1PEq8qBEgggVtYco
FTze/igQHiZPG2J695RnRg3r87+qz/xDkLwGCnVK3twogfZ5LvIAgiMe2QlZabaT
LZhQ9yHqMnqJ52Ng2/y6pmMfYkf9Mzvizvajrv7IYQnVxKtQtXpIsGTqVNNdUfpy
6Gyr3GsjCsrCW40g3jIFU0J8sJwfRONCGRYeBbNy+Rx1gQVcC1FayV4Wfr+mPD6v
9iXQSXsMLgEt6Ydx30QfQDUERamq6q4lWp/NAgYFaLH8o9Nxgfp1lOYTVAX+us7E
Nat+Vi6qp3uqIuZTW821ArLoqjcxDapClJlvUzyBm3MW3WUEWGI=
=Wpyx
-----END PGP SIGNATURE-----

--Apple-Mail=_F238DE0A-48FD-4D9D-AC03-A4EBA5D9B96C--
