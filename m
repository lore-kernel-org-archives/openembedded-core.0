Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id BA4EE71B1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 17:29:02 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 20 Feb 2017 09:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,187,1484035200"; 
	d="asc'?scan'208";a="936093523"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.120])
	([10.219.128.120])
	by orsmga003.jf.intel.com with ESMTP; 20 Feb 2017 09:29:02 -0800
To: Christopher Larson <kergoth@gmail.com>
References: <1487366767-28347-1-git-send-email-anibal.limon@linux.intel.com>
	<CABcZANksgFTdb52szMJVWo4EWxDT9ZA6hpnznHAfGH-KB15CnA@mail.gmail.com>
	<CABcZANmXhMdui8xP67uE7LzVibJa+kmWC5CaC7zNA6wV84EVbg@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <58AB2827.5060400@linux.intel.com>
Date: Mon, 20 Feb 2017 11:32:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CABcZANmXhMdui8xP67uE7LzVibJa+kmWC5CaC7zNA6wV84EVbg@mail.gmail.com>
Cc: yocto <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] yocto-compat-layer.py: Add script to YP Compatible Layer validation
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
X-List-Received-Date: Mon, 20 Feb 2017 17:29:03 -0000
X-Groupsio-MsgNum: 93594
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="dUmeE5h5iHRum3VrEATw1vn87eoIdk9Tw"

--dUmeE5h5iHRum3VrEATw1vn87eoIdk9Tw
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 02/17/2017 04:41 PM, Christopher Larson wrote:
> On Fri, Feb 17, 2017 at 3:39 PM, Christopher Larson <kergoth@gmail.com>=

> wrote:
>=20
>> On Fri, Feb 17, 2017 at 2:26 PM, An=C3=ADbal Lim=C3=B3n <
>> anibal.limon@linux.intel.com> wrote:
>>
>>> +    parser.add_argument('-l', '--layer', metavar=3D'LAYER_DIR',
>>> +            help=3D'Layer to test compatibility with Yocto Project',=

>>> +            action=3D'store', required=3DTrue)
>>>
>>
>> The behavior of this argument is quite unintuitive. First, this path i=
sn=E2=80=99t
>> actually used as the layer directory, detect_layers searches down from=
 that
>> path to *find* layers in that subdirectory, so the argument isn=E2=80=99=
t what it
>> says it is. Second, why are you making an option mandatory rather than=
 just
>> using arguments?
>>
>> That is, why `layer-compat-layer.py -l layerpath` rather than
>> `layer-compat-layer.py layerpath`. If you change the call to
>> `parser.add_argument(=E2=80=98layer=E2=80=99, =E2=80=A6)` it=E2=80=99d=
 change to the latter behavior.
>>
>=20
> Worth noting that you could, and probably should, also use nargs=3D=E2=80=
=98+=E2=80=99 to let
> the user specify multiple layers to check, rather than a single path, i=
f
> you go the latter route, and if not, you could change it to an append s=
tyle
> (for the =E2=80=98action=E2=80=99) argument to accomplish the same.

Yes, it's better to change the -l option to use a positional argument
with nargs +.

The detect_layers functionality is used because i want to cover cases
when the user clones a repository that comes with multiple layers like
meta-openembedded.


Best regards,
	alimon


>=20


--dUmeE5h5iHRum3VrEATw1vn87eoIdk9Tw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYqygqAAoJEGJqcE9h3glgOBQP/R7oD3jfrLBkaEbAfLY8jjMc
6Sy5kj8msTcl6tc/5dD6vmqIw9LFdtiPqLq9rjByOXuv3pGLm2i0ByyHHk18OP57
ZiEvPwhfE01wvaK0yMCofpDKOV40qLR/PsUBkziji2cJeEiJrPxXuxZj0N2NWNv5
/4CSHU0VpRcJjRCDNgczJZvVS6SU6gfEwxli1jAMVztuNoIuTMdOGqFLM3adFCWq
+BZ55KBseu+wv0eyRsMRLvx4oIOtQUwqqhSK/dE0ezH++DJVu0FvUVhqyi4kbWR2
spKRO094ZJJDRrKxtGDSd2RBsYNIDnblQF2uDSCkSlNLL/dpzW+RXWFLHyOirF6z
iUSW6FuEDbJDGSB9F9mexQCH7/bV97q6kZNxddCX53Ovvkyw7r6wGD+MkYmdrr2B
5A4MG3eyELbcR0QVKiyD3y5wRN5VboVOk3Hk/ZFRIcnKSHxHNPEFWtBfItb7Z19o
ALbkMAujRTgieukwofaR9b/ASVdrKqJATDf7PYeDouKqpz7fV0taKMTToSFkhvFT
jLDINGBcfaW/0edZrDuDHSgFkMlLSaz4uRAvW8kBFd3KWM23/jP9RJnYuebiDT8J
3eJefMuGsgEhmstDVZ6bStKTvuGsyOI+pnjnhDsZj4xyinKa7vVarXPAYk3OlPQ8
Bpo24g8OzTd5GW+Dnds/
=nyHL
-----END PGP SIGNATURE-----

--dUmeE5h5iHRum3VrEATw1vn87eoIdk9Tw--
