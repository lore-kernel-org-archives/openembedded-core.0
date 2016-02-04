Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C935C771E1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:10:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 04 Feb 2016 12:10:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; 
	d="asc'?scan'208";a="896563786"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2016 12:10:46 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
	<4c3c25336a50cffb7579340eaa5d5bed61dc67ff.1454459362.git.anibal.limon@linux.intel.com>
	<2011452.Q9kTNeH3mx@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56B3B0B8.3010600@linux.intel.com>
Date: Thu, 4 Feb 2016 14:12:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <2011452.Q9kTNeH3mx@peggleto-mobl.ger.corp.intel.com>
Cc: benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 23/28] Revert "classes/populate_sdk_ext: Add OE_SDK_EXT_SILENT env variable"
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
X-List-Received-Date: Thu, 04 Feb 2016 20:10:45 -0000
X-Groupsio-MsgNum: 77533
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="1v2nCua3P9o2wrI3iK9LxHjtraA8vrBg6"

--1v2nCua3P9o2wrI3iK9LxHjtraA8vrBg6
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 02/04/2016 12:34 PM, Paul Eggleton wrote:
> On Tue, 02 Feb 2016 18:30:35 An=EDbal Lim=F3n wrote:
>> This reverts commit 303985d3f402013c7c4a3355f19d48b1cef1c12f.
>>
>> As discussion with Paul Eggleton, he don't want to have env variables
>> to change the behaviour of what the env script needs to print,
>> i'll redirect the output in oeSDK.run() method.
>>
>> I didn't agree because it can hides another messages like error ones
>> and with the variable you can control what prints or not.
>>
>> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
>=20
> We don't want to add this and revert it in the same series.

Ok, then i'll send another series without this commit and this revert in
another commit.

That's ok?

	alimon

>=20
> Cheers,
> Paul
>=20


--1v2nCua3P9o2wrI3iK9LxHjtraA8vrBg6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWs7C+AAoJEGJqcE9h3glgW+gP/26ksEm/fVuUV+YNyU/WzWxE
qnWtmKfSivNCNyD14yhc9QZmhxNdtghk2YrJUzYY4zEvrELDNdVn5hhHl+yEavjD
hmV2clmatHT98n0of34Fezi6x8Aw3FhfwksG0WdNdH60j4pDhJSthpVa+77g+Cht
obyNl2v6I7eXKysk9yaGeMnlN7xCtzgPtBz5DKpq7n9oONDqrAk2WK2IxoER1CxF
JvAOoZ2r4GQO0xx89zoL513LBpstgPhbne6jCfpAc5rZof8NbOkRGkCfNw8gWUpO
cdtb10k/ZWV6IOs9AhQ0ZbLhzfK8HJzMCyp2x3r3L4hYOtztobJkLDtVX77syC8a
VhM1v6Ck5kOUfqRK/VwrEZ+UVoB8pd+Sq6q7XfTQU5yV35SyhlRbNItEZcbjnLR7
Ghpf8FL2UNWxusEKTwI4D+Qchu8vSHlQNBQNV8koS7XNuJbCYKV8kQQQMfJUH3L8
Hn5McauY8YTKzBpstRETBdEDjoAnZymA7g5KfCapDgwzJ8ws0A36bP+laIALT0RY
skE/ht2Jm78xso9kcD5tUSUHJJ/h8312grH483HIzZvikFGialO5wnCYAt6imiag
tqoE89N73pWTL3sbcTvhDUgK1dyFlKG63dTEjM/neTMM8iT753HUlNpGJw7mv/Ts
L7mH4F8BToNdvHyvNTXu
=uaHS
-----END PGP SIGNATURE-----

--1v2nCua3P9o2wrI3iK9LxHjtraA8vrBg6--
