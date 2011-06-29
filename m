Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QbxT7-00061c-US
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 18:18:26 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2011 09:14:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,443,1304319600"; d="scan'208";a="24335800"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2011 09:14:38 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 30 Jun 2011 00:14:37 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 30 Jun 2011 00:14:37 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Thu, 30 Jun 2011 00:14:35 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jun 2011 00:14:34 +0800
Thread-Topic: [OE-core] [PATCH 1/1] base.bbclass: show layer's
	branches/revisions in the banner info
Thread-Index: Acw1+BlhBeZOFmjRT0qjie4W41L66gAfpuQw
Message-ID: <1865303E0DED764181A9D882DEF65FB6A167F0C724@shsmsx502.ccr.corp.intel.com>
References: <cover.1309239001.git.dexuan.cui@intel.com>
	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>
	<3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
	<201106281207.23516.paul.eggleton@linux.intel.com>
	<4E0A794C.5060303@gmail.com>
In-Reply-To: <4E0A794C.5060303@gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] base.bbclass: show layer's branches/revisions in the banner info
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
X-List-Received-Date: Wed, 29 Jun 2011 16:18:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Khem Raj wrote:
> On 06/28/2011 04:07 AM, Paul Eggleton wrote:
>> On Tuesday 28 June 2011 07:45:09 Koen Kooi wrote:
>>> So it works as expected, but the output is a bit confusing. I have
>>> a few (conflicting) suggestions:=20
>>>=20
>>> 1) replace _BRANCH and _REVISION with ' branch' and ' revision',
>>> e.g.:=20
>>>=20
>>> 	meta-archos branch          =3D "master"
>>> 	meta-archos revision        =3D
>>> "413933fb5f62574e38a9a1e38905ba6e9c1be4ad"=20
>>>=20
>>> 2) for the extra layers put branch and revision on a single line:
>>>=20
>>> 	meta-archos          =3D
>>> "master/413933fb5f62574e38a9a1e38905ba6e9c1be4ad"=20
>>=20
>> I'd go with option 2 over 1, personally - the list gets rather long
>> on something like Angstrom, better to keep it short.
>=20
> I would say to do it uniformly and treat oe-core as one of layers too
> when emitting this info
Ok. I'll make a new version for this.
BTW: meta and mete-yocto belong to the same git repo actually, so do you th=
ink showing them in one line like this

meta,meta-yocto   =3D "master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"

is better than showing 2 lines like this:

meta             =3D "master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"
meta-yocto    =3D "master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"

?

Thanks,
-- Dexuan=


