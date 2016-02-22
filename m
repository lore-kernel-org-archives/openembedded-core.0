Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6996FFCC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 17:02:54 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 22 Feb 2016 09:02:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,485,1449561600"; 
	d="asc'?scan'208";a="52561156"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.35]) ([10.219.5.35])
	by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2016 09:02:47 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1456153260.git.anibal.limon@linux.intel.com>
	<99d32b8b8e7d0422dfa5f89a30e86668d88ef77f.1456153260.git.anibal.limon@linux.intel.com>
	<56CB2F1D.4050605@linux.intel.com> <56CB32C1.9040308@linux.intel.com>
	<56CB35E8.6060301@linux.intel.com> <56CB3949.5030804@linux.intel.com>
	<CAJTo0LZ+onCXJXw74VJSJkaOGdYi=qwBeXCnBtz0jvkpdrybJQ@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56CB3FBE.50906@linux.intel.com>
Date: Mon, 22 Feb 2016 11:05:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ+onCXJXw74VJSJkaOGdYi=qwBeXCnBtz0jvkpdrybJQ@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] classes/testsdk: Move the removal of bitbake PATH to eSDK context only
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
X-List-Received-Date: Mon, 22 Feb 2016 17:02:54 -0000
X-Groupsio-MsgNum: 78487
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="4s5rpXle5IbKWa4rC9kk69HAgtECbMEaI"

--4s5rpXle5IbKWa4rC9kk69HAgtECbMEaI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 02/22/2016 10:48 AM, Burton, Ross wrote:
> On 22 February 2016 at 16:37, An=C3=ADbal Lim=C3=B3n <anibal.limon@linu=
x.intel.com>
> wrote:
>=20
>> I agree with you to modify avoid_paths_in_environ for return the new
>> PATH variable is better than only modify it internally but for
>> simplicity i will maintain the os.environ['PATH'] set/restore instead =
of
>> generate the environment line.
>>
>=20
> Totally agree with Randy here for what it's worth.  The environment-mun=
ging
> code in avoid_paths... should return the strings instead of manipulatin=
g
> the current environment so the caller has the choice whether to modify =
the
> current environment or pass a new environment to subprocess.  And in
> general I'd say that passing modified environments to subprocess is a
> cleaner solution as it means that there's no way cleanup can fail to
> happen.  Whilst that's just a try/except now, the code could get copied=
 and
> extended and end up with codepaths that don't hit the right cleanup.  B=
y
> having an explicit environment passed in, this isn't possible.

Agree, now modified at,

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dalimon=
/esdk_update_v2&id=3D3143bf09130c52cd71e3f2f9795208e17152005d

Cheers,
	alimon

>=20
> Ross
>=20


--4s5rpXle5IbKWa4rC9kk69HAgtECbMEaI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWyz/BAAoJEGJqcE9h3glgN2MP+QH8plSp5MpQBttcZgILsF4O
SuVRg8uUPY66bdvTCeAZmkmEysiU2ACKzFcNgtqBHlhhM+hHrAdLqa+mhrNVw/ci
yZDmNzkL09VQJmafK1D0IY32iyOlVBtiKfE1DVFIpjrhCXpyjpVs61miOwefMSYa
cm/1RvBYlGb2Jv0wMRgRJLtLTiJH1JVYRnYkCuY86pHpzB1suqBySTc8PZXThV/8
oFy07LbAzv2xSZTtCd1mPPFNCPz4+4Z4Gs9mZG8V9xPjqXCgnur99UhKKjZ3FJ/z
U4OVG1RBAsBfKNegWoU1H7jfl8vOBL6j+2LPhb+bx70WUTxLAS7xea562QcOY7Yh
uEm2l/SGXAisxX2kqHk6mxIdjbrOAyEO/koCKNc0sa8cG79YJCZSH3wQHia2Vklv
jIFDxML7JAEtRfgTm+BsfXs/P2CkU+JbbU5OBYvJCCjjdqKRTOg0Aa6Tst0Kmupl
tf+GFae/Xqz+4828op0xpTux+mapMu11bfPetku3XqdYolHk12PTcNIDn6VtpchR
LubLz5ZDaU1OgmHC0AOlONg7M+zs9P16El7EWX1o38rLtq3GGyLe8jTN/LHhrmzq
wym+f+vHV3uJtJtE5S0/45ihLzLKva1l/BdrENMueNb+PpSSB8w9LSGuXQVzWmPv
i1wTMvDhF1urw4iTHhhx
=zdod
-----END PGP SIGNATURE-----

--4s5rpXle5IbKWa4rC9kk69HAgtECbMEaI--
