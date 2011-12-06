Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RXpuG-00006o-MG
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 08:57:41 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Dec 2011 23:50:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="83907165"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga002.jf.intel.com with ESMTP; 05 Dec 2011 23:50:41 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 6 Dec 2011 15:49:18 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Tue, 6 Dec 2011
	15:49:16 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 6 Dec 2011 15:49:15 +0800
Thread-Topic: [OE-core] meta-toolchain-gmae can't build: Cannot create
	symlink from ./var/log to 'volatile/log': File exists
Thread-Index: AcyzKDLrCdqbkWxRSoiR7XEIfCFtmwAwxvAw
Message-ID: <1865303E0DED764181A9D882DEF65FB6E8F93B9DC3@shsmsx502.ccr.corp.intel.com>
References: <1865303E0DED764181A9D882DEF65FB6E8EDFF05C0@shsmsx502.ccr.corp.intel.com>
	<1323073824.25960.87.camel@ted>
In-Reply-To: <1323073824.25960.87.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: meta-toolchain-gmae can't build: Cannot create symlink from ./var/log to 'volatile/log': File exists
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
X-List-Received-Date: Tue, 06 Dec 2011 07:57:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote on 2011-12-05:
> On Mon, 2011-12-05 at 15:35 +0800, Cui, Dexuan wrote:
>> Hi, recently, I found meta-toolchain-gmae failed to build on poky
>> master if I use ipk packaging(I didn't try rpm/deb):
>>=20
>> task do_populate_sdk: Failed
>>=20
>> | Configuring avahi-dev. | Configuring
>> task-core-standalone-gmae-sdk-target. | Configuring libtelepathy-dbg. |
>> Configuring task-core-standalone-gmae-sdk-target-dbg. | Configuring
>> util-linux-blkid. | Collected errors: |  * extract_archive: Cannot
>> create symlink from ./var/log to 'volatile/log': File exists. ERROR:
>> Function 'do_populate_sdk' failed
>>=20
>> Now I have no time to look into this issue at once. It would be
>> great, if
> somebody can give some quick hint.
>=20
> Is this with the latest master?
>=20
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Df340e3937fd5ac396 =
3
> de6c6b29d56dd92d962864
>=20
> was added to avoid an error very like this that was showing up with rpm..=
.
Yes. I was using yesterday's latest poky master (9be6d59b78510443d094451350=
3d515df13caa45), so the fix you mentioned above was already in.
There must be some recent change that causes the issue, because IIRC it was=
 fine in my side 2~3 weeks ago.

Thanks,
-- Dexuan




