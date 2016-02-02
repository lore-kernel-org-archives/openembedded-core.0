Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 74411772C5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:45:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 02 Feb 2016 13:45:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; 
	d="asc'?scan'208";a="739406973"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by orsmga003.jf.intel.com with ESMTP; 02 Feb 2016 13:45:27 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
	<28521140.LlNaPZzQQi@peggleto-mobl.ger.corp.intel.com>
	<56B121D9.6060100@linux.intel.com>
	<2000408.dJe5DU85LA@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56B123EC.10104@linux.intel.com>
Date: Tue, 2 Feb 2016 15:47:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <2000408.dJe5DU85LA@peggleto-mobl.ger.corp.intel.com>
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
X-List-Received-Date: Tue, 02 Feb 2016 21:45:27 -0000
X-Groupsio-MsgNum: 77373
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="XPbWj3fGlCN1qQNbH4P9tSXOutt14l1QD"

--XPbWj3fGlCN1qQNbH4P9tSXOutt14l1QD
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

I think is better to have the variable because this kind of message is
an information one but what happens if you want to show a warning for
make the test fails the variable gives you this possibility of choice
what hide and what no but if you want to made the redirection is ok for m=
e.

	alimon

On 02/02/2016 03:40 PM, Paul Eggleton wrote:
> On Tue, 02 Feb 2016 15:38:33 An=EDbal Lim=F3n wrote:
>> On 02/02/2016 03:31 PM, Paul Eggleton wrote:
>>> On Tue, 02 Feb 2016 15:30:21 An=EDbal Lim=F3n wrote:
>>>> On 02/02/2016 03:25 PM, Paul Eggleton wrote:
>>>>> On Tue, 02 Feb 2016 15:23:54 An=EDbal Lim=F3n wrote:
>>>>>> Paul Eggleton wrote:
>>>>>>> Rather than adding another variable for this why not just redirec=
t the
>>>>>>> output to /dev/null ?
>>>>>>
>>>>>> Because this is disabled when SDK tests (compatibility) ran using =
eSDK
>>>>>> so sometimes needs to SILENT it when automatic process is working
>>>>>> another times don't like when user uses it.
>>>>>
>>>>> At face value, redirection during automated testing and not when no=
t
>>>>> solves
>>>>> this.
>>>>
>>>> We can't only redirect because is a python test that looks for some
>>>> output in the sdtout, if we redirect to the /dev/null then lose the
>>>> value.
>>>
>>> Well naturally you would need to redirect the output of the SDK
>>> environment
>>> setup script only.
>>>
>>>>>> In this case the SDK tests fails because it looks to stdout and fo=
und
>>>>>> devtool msg.
>>>>>
>>>>> Which test failed and why?
>>>>
>>>> Is this test [1], as i said is an SDK test running on eSDK env.
>>>>
>>>> [1]
>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/lib=
/oeqa
>>>> /sd k/python.py?h=3Dalimon/esdk_testsuite_export#n22
>>>
>>> OK, but where is the bit that actually runs the environment setup scr=
ipt?
>>
>> Here [1] and i set the variable in the testsdkext task [2].
>>
>> [1]
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/lib/o=
eqa/oe
>> test.py?h=3Dalimon/esdk_testsuite#n127 [2]
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/class=
es/tes
>> tsdk.bbclass?h=3Dalimon/esdk_testsuite#n107
>=20
> Right, so you can trivially redirect the output of the env setup comman=
d=20
> (before the ';') to /dev/null. It also won't affect the standard SDK te=
sting so=20
> we should be safe there as well.
>=20
> Cheers,
> Paul
>=20


--XPbWj3fGlCN1qQNbH4P9tSXOutt14l1QD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWsSPuAAoJEGJqcE9h3glgWIEP/Rrw8Iy8nj9uFqh9YHm3llRw
hlGyPuleQGjB+EWIRM3/MK41weJcJiorNfB+AQRKO4omPx0Pi9iM9VjHf07IfnNe
VblHwxDXQdaygqzBbQ6nccPQog4+u2ZCEVQZLo8xof8zc+NWvEYtuRkU1afufSm/
BWRakmFnwnef3Mib2l3TrzhkfzjOBp/HNxdD81XbnN2qxKo8XTg7vwnJiTpI67Eu
NxbmF3pB0/KT7ouSw298sqcWtC9KQh9w/qoWtEVkjH3v+FUsqbBkEk/S1FHnxlB8
7G6n4P2qWgVFKMd6+dFE6B7XbyNZqhXepP7wDfbtYfrINg8PriW//Y+GMNDKiLCB
vKkIwlqfH5KdU4C23GVAwAnoSuungrGf14CxPLYsojFnzlHhAyQi0WblMFRu8/4P
Z8HJLXms8Dyb/7rj4ytER8ReFdUtMJGpUkFbdLS1xL8RvOwrUb+BE7Yo8abhiGdh
ukj1b8ignph9R53kDtAPf9JEupJekK/r9IFvtNC1cwli+p1+2gcZrlOFuxXKOHFy
z6hX6M9NQ92ZL7d8bJTrpaDhVqTbS4VthsGadagMmuvgc7N82cuCPJ2C4ATTHUEb
OoAG12VPUeEQ/+4EjCwccDeQak4T7/yz8dkwO7SpZk+LCE1+3rr6F9n+N0dwmW/w
6k+ro381fGYrlQO6jkRW
=eN5d
-----END PGP SIGNATURE-----

--XPbWj3fGlCN1qQNbH4P9tSXOutt14l1QD--
