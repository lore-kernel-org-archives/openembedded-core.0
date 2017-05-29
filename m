Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BAA6A77FF9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 19:26:00 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 May 2017 12:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,415,1491289200"; 
	d="asc'?scan'208";a="106791337"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.117])
	([10.219.128.117])
	by orsmga005.jf.intel.com with ESMTP; 29 May 2017 12:26:00 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
	<c8d26bf705a207b8f639c966f811bbb15556038c.1496071841.git-series.patrick.ohly@intel.com>
	<592C48BD.5020107@linux.intel.com>
	<1496085537.16923.133.camel@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <592C75CC.2090708@linux.intel.com>
Date: Mon, 29 May 2017 14:26:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1496085537.16923.133.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] yocto-compat-layer.py: apply test_signatures to all layers
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
X-List-Received-Date: Mon, 29 May 2017 19:26:01 -0000
X-Groupsio-MsgNum: 97891
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="RtgMMwI2cs1PD4esM8jpfN0s4RJQuk118"

--RtgMMwI2cs1PD4esM8jpfN0s4RJQuk118
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 05/29/2017 02:18 PM, Patrick Ohly wrote:
> On Mon, 2017-05-29 at 11:13 -0500, An=C3=ADbal Lim=C3=B3n wrote:
>> On 05/29/2017 10:32 AM, Patrick Ohly wrote:
>>> Software layers were previously allowed to change signatures, but
>>> that's not desired for those layers either. The rule that a layer
>>> which is "Yocto Compatible 2.0" must not change signatures unless
>>> explicitly requested holds for all kinds of layers.
>>
>> If i understand correctly now a software layer can't change a signatur=
e
>> but how do we handle this?, currently if a software layer is added and=

>> has bbappends or newer version of a recipe the signature will change.
>=20
> We've touched on this topic in the "[Openembedded-architecture] Yocto
> Compatible 2.0 + signature changes" mail thread. I had asked about
> software layers and Richard said "I do think we need to do this [strict=

> signature check also for software layers]"

Sorry, i did not see that thread, i need to be more aware on the arch ML.=
 :)

>=20
> For .bbappends, the solution from that mail thread is to turn
> DISTRO_FEATURES into overrides and make changes in the .bbappend depend=

> on that, or include the .bbappend code only for certain features. That
> reminds me, I still need to turn my prototype code for that into a
> specific patch for bitbake.conf...

Yes, sounds good to me.

>=20
> Changing software versions is indeed a bit more problematic. One could
> argue that layers shouldn't fight over who provides a certain recipe in=

> the first place. If they do, perhaps the "additional layers" (=3D the o=
nes
> with lower priority) need to provide explicit .inc files with
> PREFERRED_VERSION assignments without which the overriding recipes
> aren't used?

Yes, so in this case will need to set automatically the preferred
versions to oe-core recipes, and then let the distro layer to change the
preferred version in this way when test a distro layer with oe-core the
signatures not will change only when add the combo of distro layer +
software layer.

>=20
> Also remember that this is only a problem for layers who want to be
> "Yocto Compatible 2.0". Other, private layers can simply ignore the
> rules and do what needs to be done.

Agree,

>=20
> Alternatively, we can make the stricter checking of software layers
> optional in the tool. Not sure what that'll mean for the "Yocto
> Compatible 2.0" - all layers are created compatible, some more than
> others? ;-}

If we have the decision to include this checking in software layers, i
will go to make it as a default mode with the option to disable it.

Cheers,
Anibal
>=20


--RtgMMwI2cs1PD4esM8jpfN0s4RJQuk118
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJZLHXNAAoJEGJqcE9h3glgXREP/i/5fAEP+4Y1mWbrGvNR9svO
dpTnIplQ+i1eiTUVkzb20zwklOWcJa32L3Gi/xOfl1/cg2hxn1OUwVKeVWS26yzq
UAkU3CDVnBr7hxLf0w5xiDlAP2OLJQlu1oiwj8ID22ZxeEp913fuHvXfOs95Cllu
EQrManR4RHZgp6dF3UG0/MdyOe+7yhKypBYTZ6xu5M4mJcOOdSmmqRQ75oHMUGJ7
dkgaUcKUObb48Wf6dtE1U5U7bAnwDZEzr9nixxmAZqCl9M1ZIwDjhatzOmq9pupA
RLcKGn6iYKVw2+teh9hTo01t/O74G6f9r0WGX73m3UFpPdLfXcgs0qtqECJNC0tr
PK3QHNKE4GyFgfQE6vSEKa8fhFAeuIleXkWXhQPSD/mSBxthECu1O9/79yM7QLcL
fiZWLY4FPh8HDaYrMa7H0wjWdEXjmtN02D3sZkbe0d1uyxbAW0Js2sR/unJ6/Z4c
vVOBJVh5vmX5J9R0LWSRuXKrMBKhif81gBxxgyOGuYM1+RWz1mVb3/abJ+Vi2flI
hV6Kz8dYrM5qRY3XMnCM8rzgxXz81dClSP1whDwZakxppef6KFN//zcEeCdiSBgu
kJwwmOnguOHobLLPo0itY5yfe/YxEuNvHXkcNwri9rXK/YWe58kM3F+OryYaPqOh
vwG+keb8oYI0OXJhDG0k
=du1h
-----END PGP SIGNATURE-----

--RtgMMwI2cs1PD4esM8jpfN0s4RJQuk118--
