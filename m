Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4937F73289
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:36:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 02 Feb 2016 13:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; 
	d="asc'?scan'208";a="904198297"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 13:36:36 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
	<3922884.O19QKotbn0@peggleto-mobl.ger.corp.intel.com>
	<56B11FED.9000709@linux.intel.com>
	<28521140.LlNaPZzQQi@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56B121D9.6060100@linux.intel.com>
Date: Tue, 2 Feb 2016 15:38:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <28521140.LlNaPZzQQi@peggleto-mobl.ger.corp.intel.com>
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
X-List-Received-Date: Tue, 02 Feb 2016 21:36:37 -0000
X-Groupsio-MsgNum: 77368
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="TiiuVVL9Oi4jbROGfQRbkUvhI2mtq0M39"

--TiiuVVL9Oi4jbROGfQRbkUvhI2mtq0M39
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 02/02/2016 03:31 PM, Paul Eggleton wrote:
> On Tue, 02 Feb 2016 15:30:21 An=EDbal Lim=F3n wrote:
>> On 02/02/2016 03:25 PM, Paul Eggleton wrote:
>>> On Tue, 02 Feb 2016 15:23:54 An=EDbal Lim=F3n wrote:
>>>> Paul Eggleton wrote:
>>>>> Rather than adding another variable for this why not just redirect =
the
>>>>> output to /dev/null ?
>>>>
>>>> Because this is disabled when SDK tests (compatibility) ran using eS=
DK
>>>> so sometimes needs to SILENT it when automatic process is working
>>>> another times don't like when user uses it.
>>>
>>> At face value, redirection during automated testing and not when not
>>> solves
>>> this.
>>
>> We can't only redirect because is a python test that looks for some
>> output in the sdtout, if we redirect to the /dev/null then lose the va=
lue.
>=20
> Well naturally you would need to redirect the output of the SDK environ=
ment=20
> setup script only.
>=20
>>>> In this case the SDK tests fails because it looks to stdout and foun=
d
>>>> devtool msg.
>>>
>>> Which test failed and why?
>>
>> Is this test [1], as i said is an SDK test running on eSDK env.
>>
>> [1]
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/lib/o=
eqa/sd
>> k/python.py?h=3Dalimon/esdk_testsuite_export#n22
>=20
> OK, but where is the bit that actually runs the environment setup scrip=
t?

Here [1] and i set the variable in the testsdkext task [2].

[1]
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/lib/oeqa=
/oetest.py?h=3Dalimon/esdk_testsuite#n127
[2]
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/classes/=
testsdk.bbclass?h=3Dalimon/esdk_testsuite#n107

>=20
> Cheers,
> Paul
>=20


--TiiuVVL9Oi4jbROGfQRbkUvhI2mtq0M39
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWsSHbAAoJEGJqcE9h3glgbUYP/0n8arTFC84LPmmzPs56ybr4
8oJXJ+/vjXpQaq14TGa81VBUzHmzDOJYFglEUBfqjS4i0QdJVf+SdSMIzEI0gvWU
14bowrtVt+4vTW8MTw8lIpjZ7NAXC+idf0lR7syQoUTNhr0FziWDoVgbjZYd+7TA
pV1v0feXQWvlhTQ3me6vM9BDazYFQ/11xf9WDo6tUcGqvVmXdmAtBUlJSs2YeOuV
uBKjMDeqm84MPB2vaMWJxZju9QVR/R8qMXq/duQ4fJiJNJ+JWfh9B7IWsyiVFQd3
anWMrhuSJhRo1VtYytxJok8YXPNcLp0GedBjHvX1OjPRxyJ5/oRJuIE31oywL+AX
ABUGZJ1uVk27v9xgrMgoQnFDWbgC8A3w/45HcKd7AdVTP6fhiwvhycnStvhQtdSG
qa5XxpkCwCz1a19ItPwiVRXd6XwzR8XjUpXe4qtDBkh2mMfOlYz9gb5gx7IZmDHb
JF0Dm7cL+rAngAauyRZQQAt4mcs+4X8wYSxEcDWNUFKKd/HHJbZE4/hafpUm6QPh
FQ6a3TF6Ibh4ge2NLGQEBFLMBTkRNNkm/6hhoXIN0w4lYZkLDppS0tSgzWV7F2H0
woZmwQCBBBdPfZ9hlGyYjWv4tgABiv+erRzu2vv+csoUh9pejLuRfvg+l8LEbiYe
sBYYagbDyc6F9v4nQStM
=W57k
-----END PGP SIGNATURE-----

--TiiuVVL9Oi4jbROGfQRbkUvhI2mtq0M39--
