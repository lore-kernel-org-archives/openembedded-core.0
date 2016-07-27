Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 82086606BF;
	Wed, 27 Jul 2016 17:16:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 27 Jul 2016 10:16:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,430,1464678000"; 
	d="asc'?scan'208";a="1030245316"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.54]) ([10.219.5.54])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2016 10:16:53 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <5798ECAD.1060109@linux.intel.com>
Date: Wed, 27 Jul 2016 12:17:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Subject: Busybox drop systemd support
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
X-List-Received-Date: Wed, 27 Jul 2016 17:16:56 -0000
X-Groupsio-MsgNum: 85012
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="RsmhhDq555cSCnefCfvbg534FoSXtt2Wf"

--RsmhhDq555cSCnefCfvbg534FoSXtt2Wf
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi folks,

I was working debugging an issue for missing /var/log/messages in
systemd/busybox images [1] and then i found that busybox drop support
for systemd from 1.25 version [2].

This ends in a set of questions of what we need to do in systemd/busybox
images since the next version of busybox will not support systemd,

I have a couple of ideas,

- Remove the support of busybox in systemd images?, this is the hard
one, we need an sw alternative here may be toybox...
- Maintain the systemd support in busybox?, the patch [2] is small atm
but in the future may be this will cause problems for maintain it.

Best regards,
	alimon

[1]
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dalimon=
/debug_times2&id=3Daa143dbe3cb233ee50944ebb62c541c823179a04
[2]
https://git.busybox.net/busybox/commit/?id=3Daccd9eeb719916da974584b33b1a=
eced5f3bb346


--RsmhhDq555cSCnefCfvbg534FoSXtt2Wf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXmOyvAAoJEGJqcE9h3glgrXEP/27NIdzwxLP2TWZXCCohrSbH
eZkJe5/6R6V5DJ+ifUDYVtfaNaNFkuS3m/uTpiAIqbYxjRut322mSV/Y1jTV8usb
OK7dOmfAehOmLlWVUspXB+Xd0/FbKlKtwxG2QQC3vHO5vYkOlTDMec5mJtMONRjF
VEiPugLWJHbfG6dxIfxtFokGAJa0KMnFCjxx5ww/69aleyiJJSvK1KTyR/0bClio
wHHZeEIl7QBLPBkuFs1ClqLP5OpIjAJPUNEUl8pK3sigBkkQ9VpqLl5idjpQ7gzF
q71YkWdzld1NOS6m+lz8GZl68L/ChO1Uw9L0NZVzPxVupmjkeEsku5O0wp8/SolH
tReRlO2Oic/x9muWaVXart5AwAPSOz46s+9/azgYA+6XSzFUaublPu2+3MCH4/et
Ms9kIMD3PE8fEcpAykK/dhk61M28/4g5kuXJzV1tU3ecgenNs4HIPj4+BPAJQxOw
rpOQ7dTQUHStpEae9Vsw0baL+7Xurbg5HNLtN+FW9J4BF1tnS+xYxdrwfhZI1aE2
I7enIKhCr0YdJl62hmqI3t7+uJuCKdI6Ix2/W7SbdtZpLLZBLmqPLi098avErtrc
WQfPMYPFKMwY4T1lbOMAhJMJqn0Cxpi/D/QkRWug3iWxeEOb2pN1yRay1HsscpDg
v4U1DKOISk2dqSAL2qBH
=O2Bd
-----END PGP SIGNATURE-----

--RsmhhDq555cSCnefCfvbg534FoSXtt2Wf--
