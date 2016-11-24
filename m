Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 80BA671AD2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 14:03:53 +0000 (UTC)
Received: (qmail 2458 invoked by uid 1003); 24 Nov 2016 14:03:54 -0000
Received: from unknown (HELO ?192.168.1.59?) (philip@opensdr.com@174.63.39.132)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	24 Nov 2016 14:03:54 -0000
To: Martin Jansa <martin.jansa@gmail.com>,
	Mark Hatle <mark.hatle@windriver.com>
References: <20161123174209.211349-1-mark.hatle@windriver.com>
	<20161123174209.211349-2-mark.hatle@windriver.com>
	<20161123181039.GF3265@jama>
	<c06ab920-517b-b6b8-f2c8-e9ec8ae8714c@windriver.com>
	<20161123185617.GH3265@jama>
From: Philip Balister <philip@balister.org>
Message-ID: <fa116937-6c95-06a5-c63d-345cedcb304b@balister.org>
Date: Thu, 24 Nov 2016 09:03:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161123185617.GH3265@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta/conf/layer.conf: Add recommended download layer
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
X-List-Received-Date: Thu, 24 Nov 2016 14:03:54 -0000
X-Groupsio-MsgNum: 89821
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="fnVjgbIciQi8QAtBfqthwarDmLlKdhwPJ"

--fnVjgbIciQi8QAtBfqthwarDmLlKdhwPJ
Content-Type: multipart/mixed; boundary="4uFe0mlQ0A7HHARUVs7QMbFd5gq0fifW8";
 protected-headers="v1"
From: Philip Balister <philip@balister.org>
To: Martin Jansa <martin.jansa@gmail.com>,
 Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <fa116937-6c95-06a5-c63d-345cedcb304b@balister.org>
Subject: Re: [OE-core] [PATCH] meta/conf/layer.conf: Add recommended download
 layer
References: <20161123174209.211349-1-mark.hatle@windriver.com>
 <20161123174209.211349-2-mark.hatle@windriver.com>
 <20161123181039.GF3265@jama>
 <c06ab920-517b-b6b8-f2c8-e9ec8ae8714c@windriver.com>
 <20161123185617.GH3265@jama>
In-Reply-To: <20161123185617.GH3265@jama>

--4uFe0mlQ0A7HHARUVs7QMbFd5gq0fifW8
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 11/23/2016 01:56 PM, Martin Jansa wrote:
> On Wed, Nov 23, 2016 at 12:38:42PM -0600, Mark Hatle wrote:
>> On 11/23/16 12:10 PM, Martin Jansa wrote:
>>> On Wed, Nov 23, 2016 at 11:42:09AM -0600, Mark Hatle wrote:
>>>> This is a Wind River specific patch and not generally applicable.
>>>
>>> Then why is it sent to oe-core ML?
>>
>> As noted in the cover letter, I'm required to by Yocto Project complia=
nce
>> requirements.
>>
>> As indicated LAST time I got scolded, I was told to indicate this in t=
he patch
>> summary email -- which I did.
>=20
> Sorry I've noticed the cover letter only after the response.
>=20
> So it's only because of this requirement from Yocto Project compliance?=

>=20
> "Have all patches applied to BitBake and OpenEmbedded-Core (if present)=

> been submitted to the open source community?"
>=20
> Shouldn't the wording be change to something like "all applicable
> patches" or "all generally useful patches"?
>=20
> It seems strange to send project specific patches together with cover
> saying that they aren't generally applicable and shouldn't be merged,
> just because of this requirement.

It is useful for the larger community to see what vendors have to do.
Possibly we could decide vendor specific patches code benefit the larer
community. I'd much rather vendors over publish then under publish.

Philip

>=20
> Regards,
>=20
>>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>>> ---
>>>>  meta/conf/layer.conf | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
>>>> index 24b4df0..a94e524 100644
>>>> --- a/meta/conf/layer.conf
>>>> +++ b/meta/conf/layer.conf
>>>> @@ -11,6 +11,8 @@ BBFILE_PRIORITY_core =3D "5"
>>>>  # cause compatibility issues with other layers
>>>>  LAYERVERSION_core =3D "9"
>>>> =20
>>>> +LAYERRECOMMENDS_core =3D "oe-core-dl-2-2"
>>>> +
>>>>  BBLAYERS_LAYERINDEX_NAME_core =3D "openembedded-core"
>>>> =20
>>>>  # Set a variable to get to the top of the metadata location
>>>> --=20
>>>> 2.9.3
>>>>
>>>> --=20
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>=20
>=20
>=20


--4uFe0mlQ0A7HHARUVs7QMbFd5gq0fifW8--

--fnVjgbIciQi8QAtBfqthwarDmLlKdhwPJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQExBAEBCAAbBQJYNvNGFBxwaGlsaXBAYmFsaXN0ZXIub3JnAAoJEMDJd4rr0mer
tGAH/1E+1Oww0SH8Hdrhr8kXK5ihV5wD1M3f0G2FecEXO0dFrlAqZt+20By1nkG5
JSJ424rAp5a4rjVpnR5UiZnCFGa5K430azvk2Cc55dOXKuOerL1PNswDI0XxUBja
5lqYCxr4iFI8DTg8MRKHMOacuK/AZLBGjy4ZSVd9VWsO6Xh6fA6Hot5y+3fvQWAr
xAWvXDoMhvie3CiaJqRCnslRdd4fDL5eFduNM1Oc+YczItcwPlSPraR8WUH/h10b
69qIG0N2LZCIdckAhk6cQqcGLEa6susN75NSdrPwfeR21ZyMUVGqHPv287bKHETl
dPGWvKc1PplgeS/L/G+Cg6psFbU=
=wWY+
-----END PGP SIGNATURE-----

--fnVjgbIciQi8QAtBfqthwarDmLlKdhwPJ--
