Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 832E7606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 17:20:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 25 Jul 2016 10:20:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,420,1464678000"; 
	d="asc'?scan'208";a="853113103"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.54]) ([10.219.5.54])
	by orsmga003.jf.intel.com with ESMTP; 25 Jul 2016 10:20:47 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1468358990-14377-1-git-send-email-anibal.limon@linux.intel.com>
	<1468358990-14377-3-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LZ_jV7BoyhGAn_xjydZMCFsbcdp_5dvaGTgbNy5MDsfqg@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57964A92.1070204@linux.intel.com>
Date: Mon, 25 Jul 2016 12:21:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ_jV7BoyhGAn_xjydZMCFsbcdp_5dvaGTgbNy5MDsfqg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] classes/testimage: When image is systemd enable debug log level
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
X-List-Received-Date: Mon, 25 Jul 2016 17:20:47 -0000
X-Groupsio-MsgNum: 84868
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="q9FxsL7hw8SG1LfM8EvwWr0IQRe6CGqUd"

--q9FxsL7hw8SG1LfM8EvwWr0IQRe6CGqUd
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 07/15/2016 02:34 PM, Burton, Ross wrote:
> On 12 July 2016 at 22:29, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.in=
tel.com> wrote:
>=20
>> +            bootparams =3D 'systemd.log_level=3Ddebug systemd
>> .log_target=3Dconsole'
>>
>=20
> The problem with this is that it appears that logger output then goes
> *only* to the console and not the journal or syslog, which breaks selft=
est
> (and expected behaviour).
>=20
> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/b=
uilds/851
> for example, which goes green if I revert this patch.
>=20
> If this is the case then it would be great if there was a
> journal-and-console log_target I guess.

I'll review the issue i guess the journal test is failing for something
else but if we change the backend to journalctl systemd starts to fail
with timeout, seems that create a log of I/O writing in the journal
database.

	alimon

>=20
> Ross
>=20


--q9FxsL7hw8SG1LfM8EvwWr0IQRe6CGqUd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXlkqXAAoJEGJqcE9h3glgg8UP/i+WmE5AUrbXU/fEfI/J6bmK
vSLK/kaUpwj6Do2RzaX9AJSUWQc4Fy4pLQYeTaROH8Nf5SM6JUlq5J4iiXJhWbnE
O9XZngSsrsf785U5rMRTVRD2Jqr3CN7zAY20i1Fj5mMd4dacpsQFIrUQwTJLl/j6
6EBa5Tl313ghBIfly17/Gl0jXcg8Bm926ZZzSg2gFg0VSHsdDFHqlRnI6Pi/dX2G
EMvRMmUtMs9qiWrpY7znL+1fUuH0haIXlvQzOOViKFhjYKjJSuU463PobhkRK8T0
TmW9m9I7nshSOQl5ePktdElI90Anx1E08KuDxlrPRHmHP0COnfpCmiaJJmQAETqg
Pp+BieTBQUaU4gYgrq/KJGcMTt3RaRFJeWnbchGxWTKNe6yarUdKcDsczFI9aFZn
vPWKSzVws3W7VjD9FIP2cTjo4hckduzfGzhCkwrKrSvamytDBxuq/dUAqzGKsadE
9VZUboMP8CfyCKE3zGPNtsuWOKm75cy0Mq4fCf8G2BMNRnpj1/XYOscggA0Aangy
H3samaXqdHx0N+Frd50Lko3jX/Gf1uOCoHcfrhAn9HKJbSwu2ZecJF7CmAH7V5V3
uqXwtdyzGdP1YHS3zF2UEBCxxRoYOZbw5x3WPy3dKPq+LZkMQ9HrZVNkiHwhQQOu
38PRFTmBkpb8nx8vf59j
=DZhN
-----END PGP SIGNATURE-----

--q9FxsL7hw8SG1LfM8EvwWr0IQRe6CGqUd--
