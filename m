Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EFDD371A5A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 15:06:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 18 Jan 2017 07:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,249,1477983600"; 
	d="asc'?scan'208";a="810383188"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.5.142])
	([10.219.5.142])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2017 07:06:17 -0800
To: openembedded-core@lists.openembedded.org
References: <2683342.SVnRAGIE1W@peggleto-mobl.ger.corp.intel.com>
	<CAHiDW_F=ybZibjGyjMpg4Gi+sEhSQPw6eVmGm7yxeUAj9mqFtQ@mail.gmail.com>
	<981c058a-c2ca-ac37-f160-192c9c820563@linux.intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <70d81353-d5f9-6d36-ed40-7b5eedf1ad26@linux.intel.com>
Date: Wed, 18 Jan 2017 09:06:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <981c058a-c2ca-ac37-f160-192c9c820563@linux.intel.com>
Subject: Re: [yocto] [Openembedded-architecture] Patchwork and incoming patch testing
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
X-List-Received-Date: Wed, 18 Jan 2017 15:06:18 -0000
X-Groupsio-MsgNum: 91866
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="qVAfsPgn0DEHaQeovJRbcgesSg5MOE2b2"

--qVAfsPgn0DEHaQeovJRbcgesSg5MOE2b2
Content-Type: multipart/mixed; boundary="o3CsX3HIvNRUpX0XeixdaQPkFlF3B7wsD";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <70d81353-d5f9-6d36-ed40-7b5eedf1ad26@linux.intel.com>
Subject: Re: [OE-core] [yocto] [Openembedded-architecture] Patchwork and
 incoming patch testing
References: <2683342.SVnRAGIE1W@peggleto-mobl.ger.corp.intel.com>
 <CAHiDW_F=ybZibjGyjMpg4Gi+sEhSQPw6eVmGm7yxeUAj9mqFtQ@mail.gmail.com>
 <981c058a-c2ca-ac37-f160-192c9c820563@linux.intel.com>
In-Reply-To: <981c058a-c2ca-ac37-f160-192c9c820563@linux.intel.com>

--o3CsX3HIvNRUpX0XeixdaQPkFlF3B7wsD
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 01/18/2017 08:52 AM, Leonardo Sandoval wrote:
> + Jose Lamego
>=20
>=20
> Jose is doing recent work on the patchwork UI, perhaps there are alread=
y
> bugs for the items you are asking.
>=20
>=20
> On 01/18/2017 02:40 AM, Jussi Kukkonen wrote:
>> This looks great, thanks.
>>
>> On 17 January 2017 at 20:05, Paul Eggleton
>> <paul.eggleton@linux.intel.com <mailto:paul.eggleton@linux.intel.com>>=

>> wrote:
>>
>>     In any event we are now finally in the
>>     position where our patchwork instance can be relied upon to
>>     collect emails,
>>     and the UI is much improved. This should give us a bit more
>>     visibility into
>>     where patches are at in the process, although we are still working=

>>     on a few
>>     places where patch series status needs to be updated (e.g. when a
>>     patch goes
>>     into testing).
>>
>>
>> What's the plan for these status updates -- is the idea that you go to=

>> patchwork UI to see the state of a specific patch set?
>> Or maybe a reply to either patch sender or even the ML?
>>
There is a request to enable email notifications to submitter for patch
status changes in the future:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7684

The idea is that users should have the option to use what they prefer:
either the email notifications, or the patchwork web interface.

>>     On top of patchwork we have built a simple smoke-testing framework=

>>     called
>>     "patchtest" [5] along with a suite of corresponding tests for OE
>>     [6]. These
>>     tests are fairly simplistic at this point but check the basics
>>     such as whether
>>     a patch has been properly signed off, etc. We should soon start
>>     seeing replies
>>     sent to the mailing list and to submitters with results if there
>>     are any
>>     failures, saving us from noticing and pointing out some of the
>>     more obvious
>>     classes of mistakes.
>>
>>
>>  Is there a reason for patchwork only showing "success" or "failure"
>> in the web ui, instead of linking to test results at least in in the
>> failure case?
>=20
> Jussi, that is a good idea. Right now we need to click into the series,=

> then into the patches and then one can see the patch test results,
> obviously, not the best way.
>=20
>>
>>
>>
>>  - Jussi
>>
>>
--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--o3CsX3HIvNRUpX0XeixdaQPkFlF3B7wsD--

--qVAfsPgn0DEHaQeovJRbcgesSg5MOE2b2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJYf4RtAAoJEFJAtowlSEbncbMH/20SGgufkiyGxhXaoJKogmGz
rd245QmLcPZR/lkkInVG6wnGwsdcrTwXa3kbqDJt+T9rSRYt5SYWYeVQKbjFwM26
Yh/Gv8HCEQtsCofCxoE6i96TakSxfiggkQA2Uzh+eqA1u7OZK8Ig8iJIlxXgTaew
9wwpXQho39Aj0R0hLJ7JvwMvur3ir08uMHDl3yH9kb5t8u1UpUiiDj2s+Tc3AdVc
Vf3R7oNePGYWTZBG+lbuk1kDDG+bBi2Q7gqleAjovfRtIeZD0zbpc8qnBlvVVOsJ
TR2HKEI2gGCitKTJePRlFNFjZSjNlmZI53wpyUkan4eZPRI9nyeS6es1BSRxgYA=
=u403
-----END PGP SIGNATURE-----

--qVAfsPgn0DEHaQeovJRbcgesSg5MOE2b2--
