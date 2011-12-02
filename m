Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RWJjh-0006ps-6x
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 04:24:29 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2011 19:17:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="82372145"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by orsmga002.jf.intel.com with ESMTP; 01 Dec 2011 19:17:44 -0800
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 2 Dec 2011 11:17:11 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 2 Dec 2011 11:17:11 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Fri, 2 Dec 2011
	11:17:10 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 2 Dec 2011 11:17:09 +0800
Thread-Topic: [OE-core] [PATCH 0/8] [Dexuan]: upgrades for 7 recipes
Thread-Index: Acyvrf3rIKf4AXLOSQy5pMUBu6oPKAA8DyuA
Message-ID: <1865303E0DED764181A9D882DEF65FB6E8EDF3A845@shsmsx502.ccr.corp.intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
	<1322691475.17484.61.camel@ted>
In-Reply-To: <1322691475.17484.61.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 0/8] [Dexuan]: upgrades for 7 recipes
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
X-List-Received-Date: Fri, 02 Dec 2011 03:24:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote on 2011-12-01:
> On Wed, 2011-11-30 at 22:12 +0800, Dexuan Cui wrote:
>> The following changes since commit
>> 00d121aad3a4263bc0e3a004a3a479e6352e063d:
>>=20
>>   clutter-box2d: drop unbuildable clutter-box2d-1.6_0.10.0
>> (2011-11-30 22:06:00 +0800)
>>=20
>> are available in the git repository at:
>>   git://git.pokylinux.org/poky-contrib dcui/master
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Ddcui/master
>> Dexuan Cui (8):
>>   pixman: upgrade from 0.22.0 to the latest stable 0.24.0
>>   libxrandr: upgrade from 1.3.1 to the latest version 1.3.2
>>   lzo: upgrade from 2.05 to the latest version 2.06
>>   libxfont: upgrade from 1.4.3 to 1.4.4
>>   libxcursor: upgrade from 1.1.11 to 1.1.12
>>   xcb-util: upgrade from 0.3.6 to 0.3.8
>=20
> I merged these, thanks.
>=20
>>   inputproto: upgrade from 2.0.2 to the latest stable 2.0.99.1
>=20
> I was a bit worried about this one - is 20.0.99.1 stable or a prerelease =
version?
> Should we just wait for the final release of that one?
Thanks for the remind!=20
It's a development snapshot of 2.1.
2.1.x (like 2.1.99.1) is not stable yet, either.
So, I think we can use the current 2.0.2 until 2.2 is out.
I'll update the RECIPE_NO_UPDATE_REASON field in distro_tracking_fields.inc=
.

>=20
>>   distro_tracking_fields.inc: update the info
>=20
> This failed to apply. Could you rebase and resubmit please?
I don't know the cause, but it did apply in my side, against poky master, o=
r oe-core master.
Anyway, I'll rebase it against poky master(I'll also ensure it can apply fi=
ne against oe-core master).

Thanks,
-- Dexuan




