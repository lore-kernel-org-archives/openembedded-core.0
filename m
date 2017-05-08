Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7B72F71AEB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 15:14:16 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 08:14:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,309,1491289200"; 
	d="asc'?scan'208";a="965846510"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.122])
	([10.219.128.122])
	by orsmga003.jf.intel.com with ESMTP; 08 May 2017 08:14:17 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <1487625169-22282-1-git-send-email-anibal.limon@linux.intel.com>
	<1494250575.4241.328.camel@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <59108B51.1000507@linux.intel.com>
Date: Mon, 8 May 2017 10:14:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1494250575.4241.328.camel@intel.com>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] yocto-compat-layer.py: Add script to YP Compatible Layer validation
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
X-List-Received-Date: Mon, 08 May 2017 15:14:17 -0000
X-Groupsio-MsgNum: 97008
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="LQ57mKhPqdcXLHPv1cTjQXT49Ewdlb2js"

--LQ57mKhPqdcXLHPv1cTjQXT49Ewdlb2js
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 05/08/2017 08:36 AM, Patrick Ohly wrote:
> On Mon, 2017-02-20 at 15:12 -0600, An=C3=ADbal Lim=C3=B3n wrote:
>> +    try:
>> +        ldata =3D bb.parse.handle(lconf, ldata, include=3DTrue)
>> +    except BaseException as exc:
>> +        raise LayerError(exc)
>=20
> Anibal, where is this LayerError class in compatlayer/__init__.py
> supposed to come from? It doesn't get imported, leading to:
>=20
>   File
> "/fast/work/intel-iot-refkit/openembedded-core/scripts/lib/compatlayer/=
__init__.py", line 45, in _get_layer_collections
>     raise LayerError(exc)
> NameError: name 'LayerError' is not defined

This code is based on kergoth ones from oe-tests-scripts [1], i forget
to include the definition sorry for that but only extends exception to
determine if there is a problem on parsing the layer conf.

	Anibal


[1]
https://github.com/kergoth/oe-test-scripts/blob/726fef692c7464932c2ded0fa=
b22a875df78a31f/bb-determine-layers#L111

>=20


--LQ57mKhPqdcXLHPv1cTjQXT49Ewdlb2js
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJZEItTAAoJEGJqcE9h3glgnhYP/ijbdOOselc8N6Odi/zRFSzL
Xdhu9BZybbn2GVTHuAXWy3W2TD7hPUqCdLGbLdwxX9RbRvSRRnKOi/AJcUyQbk8A
BNDYWuw59KRpmP0UoxRZpuJihwAQoviKGKEKz3PUWezWgNAhM0bxLLoKkyazkmoI
LYLW1mbbpRPYL9q16Ua2peFrmYYlmx7Qpww6Gn5VOgaOjFht0dI6xlZ5huI2e1IP
/XPXYYwecBuBKg6kLgVjk9ZVdUA5qvP8Mj2driFZW0vegnIZZSlUeWL2qFvzPucS
Mm8WiHOT8B8b6N+VTMvMaEtTkSaaWOfeAP2UEWtVjl0/UkEPxTndysA+V48MeWtc
LRV8nwN4o45ACR3b7qSd1KsVqih9+lmHTxzcqwiDUqhcDjkUm872SigEC9eKDuyn
W0zD7Sspdlz4+fnVIR+99j8nqc+T4vs9RwWZZUoxbyiK/HM46Hs5j5AZoDqUkY8x
Rg3xKJe1kN4suPB73B9Ri0MXKHrmqF9p2mZXACzG/vf83Yh605wS7nIrqnjGtAxI
VwYIfL+pFUkNYdztYnG/WMOq2JqCYy1KuqO2QnsBm0ndwfoXPNZM0OaG0fmOy78A
HmAiDLCEX2OHOL+Gg4yBapyGZjd2V9epkLgKGzn1Awpk6+Y/UnWe/V4rLggyAC0Z
dlFtQ8yfnglCpnOQ/9Zo
=9b3V
-----END PGP SIGNATURE-----

--LQ57mKhPqdcXLHPv1cTjQXT49Ewdlb2js--
