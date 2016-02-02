Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A7BF473175
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:28:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 13:28:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; 
	d="asc'?scan'208";a="875505938"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2016 13:28:25 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
	<35476879.65FcALFN4F@peggleto-mobl.ger.corp.intel.com>
	<56B11E6A.6080005@linux.intel.com>
	<3922884.O19QKotbn0@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56B11FED.9000709@linux.intel.com>
Date: Tue, 2 Feb 2016 15:30:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <3922884.O19QKotbn0@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org, benjamin.esquivel@intel.com,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Subject: Re: [PATCH 15/20] classes/populate_sdk_ext: Add OE_SDK_EXT_SILENT env variable
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
X-List-Received-Date: Tue, 02 Feb 2016 21:28:30 -0000
X-Groupsio-MsgNum: 77364
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="mimAITvHtfr4NB00FSqGiVkt4V0XR750s"

--mimAITvHtfr4NB00FSqGiVkt4V0XR750s
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 02/02/2016 03:25 PM, Paul Eggleton wrote:
> On Tue, 02 Feb 2016 15:23:54 An=EDbal Lim=F3n wrote:
>> Paul Eggleton wrote:
>>> Rather than adding another variable for this why not just redirect th=
e
>>> output to /dev/null ?
>>
>> Because this is disabled when SDK tests (compatibility) ran using eSDK=

>> so sometimes needs to SILENT it when automatic process is working
>> another times don't like when user uses it.
>=20
> At face value, redirection during automated testing and not when not so=
lves=20
> this.
>=20

We can't only redirect because is a python test that looks for some
output in the sdtout, if we redirect to the /dev/null then lose the value=
=2E

>> In this case the SDK tests fails because it looks to stdout and found
>> devtool msg.
>=20
> Which test failed and why?

Is this test [1], as i said is an SDK test running on eSDK env.

[1]
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/lib/oeqa=
/sdk/python.py?h=3Dalimon/esdk_testsuite_export#n22

>=20
> Cheers,
> Paul
>=20


--mimAITvHtfr4NB00FSqGiVkt4V0XR750s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWsR/wAAoJEGJqcE9h3glgSNwP+wcxmS40LSvRUrQUQEwVVZi7
VnuyzQ5xj/9X7LNVLiLrY1rFYtkGX0H3ayTDafRn4l6EcxZIggS5YPHqDgy2jmxE
Y101VbrgBFK+502/fD31ZKxs8kcNk0CIRFUxTvq5mQCWsTN57wNFrzRbq7P4GSW0
Y97h0mc7DeoH3BOvN9PJpoKiIP/s4v4crbNrrIPiRvoncj9eJybQEZ5fmu50MByL
YVQZOq9KIjW231bb4Z311EZAVlDWskT+1rPB6jst8Rh7TDvkmRjozk3BFylh9HEU
teTI9Mn1tDUaK/jZOXOkYum4N9i5ywvq/BPf3Emlqn0BHwW7OHmAV2HbvfyJ7rkx
40SBBG3kemdSh2jJWIfsE6agCBCqJImhI1XXQKAQIDuVKaoeTsYDSpJaSZe6EFqN
CW02tP3t155IUj8PTmkoOLM02ESdZ45YQ1S1ir9aN4ByOILfzbU+hGYpuKwqnYil
/HJYTN+6Ze2XDQEEyBfhEyUym9VaA6pEMRbU01EYk/kviQI8jr4aHAPFP+yfjdVN
rAHJEakYMvcJQSxKA9GTPK+aPXnmGQih8ZoiPen787t1VNLPYahr1sIqIY3L04u2
BnDbZFoBiAvyyjCwbVCuWgQOAFgBWl4TinWe/m5x/djc8ZpBcnHuOOfbAlUTX0S8
daKjEMW6kLy1hjrZjgH0
=IvDP
-----END PGP SIGNATURE-----

--mimAITvHtfr4NB00FSqGiVkt4V0XR750s--
