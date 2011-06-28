Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QbaXS-0001o6-D4
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 17:49:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2011 08:45:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,437,1304319600"; d="scan'208";a="21504811"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2011 08:45:35 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 28 Jun 2011 23:45:34 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Tue, 28 Jun 2011 23:45:33 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2011 23:45:32 +0800
Thread-Topic: [OE-core] [PATCH 1/1] base.bbclass: show layer's
	branches/revisions in the banner info
Thread-Index: Acw1qL02uZM7RxtmT7OgYbhGp3GlRAAAXhGA
Message-ID: <1865303E0DED764181A9D882DEF65FB6A167F0C717@shsmsx502.ccr.corp.intel.com>
References: <cover.1309239001.git.dexuan.cui@intel.com>
	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>
	<3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
	<4E09E4E6.9040703@windriver.com>
	<1865303E0DED764181A9D882DEF65FB6A167F0C715@shsmsx502.ccr.corp.intel.com>
	<B2EC960E-7F9F-49BB-BFB0-18C98A7FDE12@dominion.thruhere.net>
	<1865303E0DED764181A9D882DEF65FB6A167F0C716@shsmsx502.ccr.corp.intel.com>
	<4E09F43E.508@windriver.com>
In-Reply-To: <4E09F43E.508@windriver.com>
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
X-List-Received-Date: Tue, 28 Jun 2011 15:49:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Mark Hatle wrote:
> On 6/28/11 10:21 AM, Cui, Dexuan wrote:
>> Koen Kooi wrote:
>>> Op 28 jun 2011, om 16:52 heeft Cui, Dexuan het volgende geschreven:
>>>=20
>>>> Hi, thank you very much for the suggestions!
>>>> I worked out a vesion 2 patch that combines 2 and 3:
>>>> http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/b=
anner_v2&id=3D2c2d9d7c0e942b6748bc8bd7d5980113bae9a836
>>>=20
>>> Could you in the future please base them on oe-core instead of poky?
>>> I just did 'git merge 2c2d9d7c0e942b6748bc8bd7d5980113bae9a836' and
>>> git blew up.
>> Sorry... but to basing them on oe-core,  do I need the permission to
>> push my commits to my own branch in
>> git://git.openembedded.org/openembedded-core-contrib? I suppose so
>> and I should put my public key somewhere into the server?  =20
>=20
> You can push oe-core (based) changes to the poky-contrib tree.  Many
> of us do this regularly.
>=20
> I base my changes usually on oe-core, unless they contain poky
> specific code.. I push both types to the same poky-contrib repository
> (in different branches of course).
>=20
> (I also always avoid "merge", and always use cherry-pick when pulling
> code from someone else's branches into my own..)

Thank Mark and Phil a lot for the explanation! I'll base my change to oe-co=
re in future.
=20
Thanks,
-- Dexuan


