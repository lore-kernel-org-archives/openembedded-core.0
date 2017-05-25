Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 449DE780BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 14:21:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 May 2017 07:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,391,1491289200"; 
	d="asc'?scan'208";a="1152722466"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.128.138])
	([10.219.128.138])
	by fmsmga001.fm.intel.com with ESMTP; 25 May 2017 07:21:12 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <9f9ebf2e1ba6eda48fb5e3f20d4ca5bbabe3dad4.1494837087.git-series.patrick.ohly@intel.com>
	<237a1d6e-7c01-2488-c6a2-e5d0c95aff53@linux.intel.com>
	<1494851042.1179.246.camel@intel.com>
	<CAJTo0La_VMBTkXKD2Df5RAEWtEO5NFcQu29j-yO_PS-qZoT5bA@mail.gmail.com>
	<3a84eeba-58d0-bf74-61c3-b3b0d5292ad6@linux.intel.com>
	<128b693d-588c-e1be-0720-6c6954b4651c@linux.intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <ce2310fc-0545-b739-2328-cef74ab84fed@linux.intel.com>
Date: Thu, 25 May 2017 09:21:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <128b693d-588c-e1be-0720-6c6954b4651c@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] manpages.bbclass: avoid QA warning when "manpages" feature not supported
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
X-List-Received-Date: Thu, 25 May 2017 14:21:14 -0000
X-Groupsio-MsgNum: 97720
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Botb1sKKSeq7Am2FW8mIldMiQM5E0gnMi"

--Botb1sKKSeq7Am2FW8mIldMiQM5E0gnMi
Content-Type: multipart/mixed; boundary="iAtq67IePT5VQAXPlX5omgBnwggnf1tVs";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
 "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <ce2310fc-0545-b739-2328-cef74ab84fed@linux.intel.com>
Subject: Re: [OE-core] [PATCH] manpages.bbclass: avoid QA warning when
 "manpages" feature not supported
References: <9f9ebf2e1ba6eda48fb5e3f20d4ca5bbabe3dad4.1494837087.git-series.patrick.ohly@intel.com>
 <237a1d6e-7c01-2488-c6a2-e5d0c95aff53@linux.intel.com>
 <1494851042.1179.246.camel@intel.com>
 <CAJTo0La_VMBTkXKD2Df5RAEWtEO5NFcQu29j-yO_PS-qZoT5bA@mail.gmail.com>
 <3a84eeba-58d0-bf74-61c3-b3b0d5292ad6@linux.intel.com>
 <128b693d-588c-e1be-0720-6c6954b4651c@linux.intel.com>
In-Reply-To: <128b693d-588c-e1be-0720-6c6954b4651c@linux.intel.com>

--iAtq67IePT5VQAXPlX5omgBnwggnf1tVs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 05/25/2017 03:06 AM, Alexander Kanavin wrote:
> On 05/24/2017 11:54 PM, Jose Lamego wrote:
>> Sorry is miss this message.
>>
>> The command line is missing the squared brackets (the following should=

>> do the work since I may have permissions):
>>
>> [Patchwork-Status: Rejected]
>>
>> Guys: Do you believe we should drop the brackets requirement?
>=20
> You can support both brackets and no-brackets.
>=20
> The problem is that this feature is not documented, nobody knows about
> it, and we lack established practices around it. Who should be using it=
?
> I'd say only the author of the patch or people with commit rights to
> master (RP, Ross).

I've added an entry to the OE-Patchwork wiki:

https://www.openembedded.org/wiki/Patchwork#Update_the_state_of_patches

>=20
> Alex
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--iAtq67IePT5VQAXPlX5omgBnwggnf1tVs--

--Botb1sKKSeq7Am2FW8mIldMiQM5E0gnMi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJZJuhhAAoJEFJAtowlSEbnWuIH/028L8X2NIxhkv+1jkpnLjys
sfpiuf5rTQ7J944q+JAQNRJwWcncbq8qBIXR/2/NJsz1YYKD/ac4zwGoFTqgAx90
zH2AjzAk2smvcBQATLm8lw0Rh3LjY+8fgzJtUwSCoDYvqtjV6ZbqCklVerwz1I9Z
qWq1y+Ag86SAgJzY0dbrRZ51Tx9KqHvgi4UpyS9JKohKBYwMlNU512K249st1Q6j
46CQu0mUukwf0V2JnxAaPulZPsu6DFjX0JxqKNXTrQSNcZSjU0wXPIhyxsQfMnmE
e/DF8HZKPnGlDZn7+B0pMDZe+YbXQdgdXxg1BAuYOdjDsKUVZOWEDRh8cNIQJZ8=
=q5aB
-----END PGP SIGNATURE-----

--Botb1sKKSeq7Am2FW8mIldMiQM5E0gnMi--
