Return-Path: <Sean_Hudson@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2D50177C22;
	Wed, 26 Apr 2017 15:36:54 +0000 (UTC)
Received: from svr-orw-mbx-01.mgc.mentorg.com ([147.34.90.201])
	by relay1.mentorg.com with esmtp 
	id 1d3Ozw-0007hT-9I from Sean_Hudson@mentor.com ;
	Wed, 26 Apr 2017 08:36:56 -0700
Received: from [172.30.13.179] (147.34.91.1) by svr-orw-mbx-01.mgc.mentorg.com
	(147.34.90.201) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 26 Apr 2017 08:36:53 -0700
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Sean Hudson <sean_hudson@mentor.com>
Organization: Mentor Graphics - Embedded Software Division
Message-ID: <ef4ba70f-8f97-139a-1b26-c32fd526d348@mentor.com>
Date: Wed, 26 Apr 2017 10:36:36 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
	svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Subject: Bitbake shell wrapper script
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
X-List-Received-Date: Wed, 26 Apr 2017 15:36:55 -0000
X-Groupsio-MsgNum: 96716
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="oO7AUcON9CIXI75ERnGGFn1FIkmsUMa4K"

--oO7AUcON9CIXI75ERnGGFn1FIkmsUMa4K
Content-Type: multipart/mixed; boundary="ntHdGEcqKcAB4QUp1kBHoLjvsVxRSppr7";
 protected-headers="v1"
From: Sean Hudson <sean_hudson@mentor.com>
To: openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>,
 openembedded-core <openembedded-core@lists.openembedded.org>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Message-ID: <ef4ba70f-8f97-139a-1b26-c32fd526d348@mentor.com>
Subject: Bitbake shell wrapper script

--ntHdGEcqKcAB4QUp1kBHoLjvsVxRSppr7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I created a bash wrapper script some time ago to help prevent host shell
contamination from OE environment vars and also to isolate the OE build
environment.  I know I've mentioned it to a few of you before, so, I've
finally posted it for folks to look at.  I don't claim that it's
completely tested for corner cases, so, as always, YMMV.  Take a look
and let me know what you think.

Source can be found here:
  https://github.com/MentorEmbedded/bbsh

--=20
Sean


--ntHdGEcqKcAB4QUp1kBHoLjvsVxRSppr7--

--oO7AUcON9CIXI75ERnGGFn1FIkmsUMa4K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZAL6TAAoJEC2KalNZVFwREssQAJoM0/dl+AQoV0qcq6thw1PP
a/iMUKMgJbL8R0UmjMIk/7vAdL0mbUKLA6SViO4uMTz7TwhEmYF9OQAmk/qwEocN
7HtP7q3eIx/N8N22Rfcx/4l8/GdI+ea+hHC8g6+CUoU3bRA0tLK9lyOlBCcmkYSS
BL8TYyifLLxNVJdrvMb0BqBZ9GvLAsyhEkYirEFjzFV1CLsO/5OQdKbwrRPTJ/WH
S+fHk2N1fVbtpXrxB/HKYdAfovBbf63my/bYD9zbHq0Y0LpWX58NVmh4DJ0cZzve
anNeqiWKHOl/OX7LF4pYNW3Cg7t9gvhgVQWFsuqgCz1I4Zm9ErBGKzDgWFcZQYLw
99tCwJ2BtOmaJybZdniC1wF3bDOL+I4OhbRM7VeWuJFjmfp48JWa4St8e35/0dnZ
YeaVBrFCt4hZAHUukgIKqyE2TFBieLXSSeme64QehPyGrc9b3fyWFsaqoep+pYbh
q7a4MXCS8y9iQlJ4Jwnnflm8WQwAnCHbWpnpatzJFvBNu+qrgj7EKcqEJlC+YNKE
yX/dQRAZYPFnOW/VIISCnDiM6NTvaobSn/1A7osrO3+UVlvAydmtDAgbOe0d5fcT
Fi2X4+4ZUaSqTSyr/qtR3IfvjIOcq23zXsQNNCxv1ViC8xWJO7JDxjuos4WhFhMR
rMSFvPeT/C0aq0/Q34jW
=3K16
-----END PGP SIGNATURE-----

--oO7AUcON9CIXI75ERnGGFn1FIkmsUMa4K--
