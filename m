Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RZ0xf-0001mo-9b
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 14:58:03 +0100
Received: by wgbds11 with SMTP id ds11so4950568wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 05:51:09 -0800 (PST)
Received: by 10.227.200.71 with SMTP id ev7mr7004841wbb.24.1323438669408;
	Fri, 09 Dec 2011 05:51:09 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w8sm13296872wiz.4.2011.12.09.05.51.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 05:51:08 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 9 Dec 2011 14:51:07 +0100
In-Reply-To: <4EE21138.8070609@emagii.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>	<6c65669e1c223d59020c581750599c11ee222063.1323286080.git.elizabeth.flanagan@intel.com>	<20111207215306.GE6351@sakrah.homelinux.org>	<4EE170C6.2070201@emagii.com>
	<1323431158.5309.126.camel@ted> <4EE21138.8070609@emagii.com>
Message-Id: <6376A851-2DD2-4F74-B085-1E9DAA404105@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 4/8] Add copyleft compliance class --- MAJOR BREAKAGE!!!!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2011 13:58:03 -0000
X-Groupsio-MsgNum: 13937
Content-Type: multipart/signed;
	boundary="Apple-Mail=_945ECC8E-20FB-4AC5-B780-5354ADE8FDBF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_945ECC8E-20FB-4AC5-B780-5354ADE8FDBF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 9 dec. 2011, om 14:46 heeft Ulf Samuelsson het volgende geschreven:

> On 2011-12-09 12:45, Richard Purdie wrote:
>> On Fri, 2011-12-09 at 03:21 +0100, Ulf Samuelsson wrote:
>>> On 2011-12-07 22:53, Khem Raj wrote:
>>>> On (07/12/11 11:34), Beth Flanagan wrote:
>>>>> From: Christopher Larson<kergoth@gmail.com>
>>>>>=20
>>>>> Deploys sources for recipes for compliance with copyleft-style =
licenses
>>>>> Defaults to using symlinks, as it's a quick operation, and one can =
easily
>>>>> follow the links when making use of the files (e.g. tar with the =
-h arg).
>>>>>=20
>>>>> By default, includes all GPL and LGPL, and excludes CLOSED and =
Proprietary.
>>>>>=20
>>>>> Signed-off-by: Christopher Larson<kergoth@gmail.com>
>>>>> ---
>>>>>   meta/classes/copyleft_compliance.bbclass |   94 =
++++++++++++++++++++++++++++++
>>>>>   1 files changed, 94 insertions(+), 0 deletions(-)
>>>>>   create mode 100644 meta/classes/copyleft_compliance.bbclass
>>>>>=20
>>>>> diff --git a/meta/classes/copyleft_compliance.bbclass =
b/meta/classes/copyleft_compliance.bbclass
>>>>> new file mode 100644
>>>>> index 0000000..5d9ab11
>>>>> --- /dev/null
>>>>> +++ b/meta/classes/copyleft_compliance.bbclass
>>>>> @@ -0,0 +1,94 @@
>>>>> +# Deploy sources for recipes for compliance with copyleft-style =
licenses
>>>>> +# Defaults to using symlinks, as it's a quick operation, and one =
can easily
>>>>> +# follow the links when making use of the files (e.g. tar with =
the -h arg).
>>>>> +#
>>>>> +# By default, includes all GPL and LGPL, and excludes CLOSED and =
Proprietary.
>>>>> +#
>>>>> +# vi:sts=3D4:sw=3D4:et
>>>>> +
>>>>> +COPYLEFT_SOURCES_DIR ?=3D '${DEPLOY_DIR}/copyleft_sources'
>>>>> +
>>>>> +COPYLEFT_LICENSE_INCLUDE ?=3D 'GPL* LGPL*'
>>>>> +COPYLEFT_LICENSE_INCLUDE[type] =3D 'list'
>>>>> +COPYLEFT_LICENSE_INCLUDE[doc] =3D 'Space separated list of globs =
which include licenses'
>>> If the Ampersand is not accepted in the LICENSE string, then the =
recipes
>>> below are broken.
>>>=20
>>>  =46rom my latest build, at least recipes with "&&" fail...
>>> This means that nothing really completes that I have tested.
>>>=20
>>> MAJOR BREAKAGE!!!!
>>>=20
>>> I think it would be better FIRST to fix the recipes, and then =
introduce
>>> checking.
>> I think the single ampersand is accepted, the double might no longer =
be.
> Yes, the single ampersand works, but the double ampersand will break =
the build
> as well as the slash '/'.
>=20
>=20
>> Certainly oe-core does continue to work. I hadn't realised there were
>> incompatibilities introduced by this patch :(
>>=20
>> Not sure what we should do about this at this point, probably fix the
>> layers :/.
>>=20
> True, question is who and when ?

The people complaining about it and right now.=

--Apple-Mail=_945ECC8E-20FB-4AC5-B780-5354ADE8FDBF
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7iEksACgkQMkyGM64RGpEPYQCeMpX884EmuwpUaIdFrvJ4Pp09
aPoAn08cOAO5X2JMPXSoOEcFBPzDt+0V
=LDRp
-----END PGP SIGNATURE-----

--Apple-Mail=_945ECC8E-20FB-4AC5-B780-5354ADE8FDBF--
