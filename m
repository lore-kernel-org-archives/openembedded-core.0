Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 93F1C60746;
	Wed, 27 Jul 2016 21:13:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 27 Jul 2016 14:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; 
	d="asc'?scan'208";a="854796328"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.54]) ([10.219.5.54])
	by orsmga003.jf.intel.com with ESMTP; 27 Jul 2016 14:13:48 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <5798ECAD.1060109@linux.intel.com>
	<69a74e8b-5c4f-27d2-6563-0307f9c74dae@windriver.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57992432.4000200@linux.intel.com>
Date: Wed, 27 Jul 2016 16:14:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <69a74e8b-5c4f-27d2-6563-0307f9c74dae@windriver.com>
Subject: Re: Busybox drop systemd support
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
X-List-Received-Date: Wed, 27 Jul 2016 21:13:47 -0000
X-Groupsio-MsgNum: 85020
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="Quh9qLwBJ1dBAp5pmv2bxG5mE9jL7eTSl"

--Quh9qLwBJ1dBAp5pmv2bxG5mE9jL7eTSl
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 07/27/2016 12:58 PM, Mark Hatle wrote:
> On 7/27/16 12:17 PM, An=EDbal Lim=F3n wrote:
>> Hi folks,
>>
>> I was working debugging an issue for missing /var/log/messages in
>> systemd/busybox images [1] and then i found that busybox drop support
>> for systemd from 1.25 version [2].
>>
>> This ends in a set of questions of what we need to do in systemd/busyb=
ox
>> images since the next version of busybox will not support systemd,
>>
>> I have a couple of ideas,
>>
>> - Remove the support of busybox in systemd images?, this is the hard
>> one, we need an sw alternative here may be toybox...
>> - Maintain the systemd support in busybox?, the patch [2] is small atm=

>> but in the future may be this will cause problems for maintain it.
>=20
> I know we've had customers who want a 'busybox free' system.  In YP 2.0=
 there
> were still a few items provided by busybox, so just disabling it (black=
list)
> wasn't easy.
>=20
> This sounds like a good opportunity to make sure that you can make a sy=
stem that
> works with and without busybox.
>=20

I agree, currently we have the option to use core-image-{full-cmdline,
lsb} that don't come with busybox but comes with standard linux
utilities may me not targeted for embedded systems. Will be good if we
could provide support for toybox or another busybox like implementation
of shell, tools.

> With that said, looking at [2] below.  I don't see that busybox ever re=
ally
> supported or not systemd (contrary to what it says.)

The support was very basic for enable busybox-syslog start/stop with
systemd.

>=20
> It just means if systemd is selected, and the user is using busybox -- =
you
> should not use syslogd out of busybox.  I think this is a reasonable re=
quirement
> -- and something that should be fairly easy to implement.  (With system=
d, I'm
> not sure why you would want to use the busybox syslogd anyway.. it's to=
o limited
> IMHO.)

Yes that's an option to mantain to get rid of busybox-syslog and only
use systemd journald.

>=20
> --Mark
>=20
>> Best regards,
>> 	alimon
>>
>> [1]
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dali=
mon/debug_times2&id=3Daa143dbe3cb233ee50944ebb62c541c823179a04
>> [2]
>> https://git.busybox.net/busybox/commit/?id=3Daccd9eeb719916da974584b33=
b1aeced5f3bb346
>>
>>
>>
>=20


--Quh9qLwBJ1dBAp5pmv2bxG5mE9jL7eTSl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXmSQ1AAoJEGJqcE9h3glgGm8P/1+yhawFxZCAe/rxuv2Pjcog
GzQ+jJ4hWipcGEZk2Ci8MEbfZoOHJi7RUKGQxAd3Rf4gGQG2qwiWph/MW044NlBm
3sbjaEm0qpWNsqUZXzOZZWF78uY8PEUhIkzXH/TN8t8l5HSiCoJGqdOiCfW3byGV
4eg/KIgVzrLmknEFiYufVfMdBp/T1ghQPvRj82/kXpRYIRBANf+uW1V5oncAyhsd
PtqxPOKYX/Vp6B/He4odSMWRRG7KhdTDGgkqtiazmnKYRbxU0rrDILzjKn4NJF7c
NfYwH7BeS+junjhShmGURUwehf2gWyYOlJssKGS1Yt25qWYNFMYLL8IGeq0ZW16/
EMlpP8csoGXv0GEOfzexFJBgU0Rik/27+ZmO9U8hDUfna/BHqqaqwlJUnaDvLSRb
9TySjWdNVwgkbp3OWxEEUyokFB1ntSlMsF15N4uwVP0J8zEZboKdxNrSB5NOozUM
BTpZmHjnUSRbfqLs7LiP9VjaCVKzgDP8Q0MQlVy/q2iJGpLm52uDBLBSiZqe6n5T
hnJdAt4hB+Fi1EVir7HwdFBPApPC70AWX1SMZqzzqzuFOYGlCm/RoreUGfRx58OS
prjbFq2MivVhMOO4xOub4cgyKWfwnXaCk9Pl+UZpDVQS53NZs3Q36IWKI5ZeWTOH
ilgSdtQ/wPH89c9y8lJi
=U5BF
-----END PGP SIGNATURE-----

--Quh9qLwBJ1dBAp5pmv2bxG5mE9jL7eTSl--
