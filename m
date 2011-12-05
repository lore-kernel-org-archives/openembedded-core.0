Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RXTCl-0001y7-AH
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 08:43:15 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2011 23:36:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="83437039"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga002.jf.intel.com with ESMTP; 04 Dec 2011 23:36:27 -0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 5 Dec 2011 15:35:46 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Mon, 5 Dec 2011
	15:35:45 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 5 Dec 2011 15:35:44 +0800
Thread-Topic: meta-toolchain-gmae can't build:  Cannot create symlink from
	./var/log to 'volatile/log': File exists
Thread-Index: AcyzIH92U6F1JlMCSZuyEihmeeUXDg==
Message-ID: <1865303E0DED764181A9D882DEF65FB6E8EDFF05C0@shsmsx502.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: meta-toolchain-gmae can't build: Cannot create symlink from ./var/log to 'volatile/log': File exists
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
X-List-Received-Date: Mon, 05 Dec 2011 07:43:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, recently, I found meta-toolchain-gmae failed to build on poky master if=
 I use ipk packaging(I didn't try rpm/deb):

task do_populate_sdk: Failed

| Configuring avahi-dev.
| Configuring task-core-standalone-gmae-sdk-target.
| Configuring libtelepathy-dbg.
| Configuring task-core-standalone-gmae-sdk-target-dbg.
| Configuring util-linux-blkid.
| Collected errors:
|  * extract_archive: Cannot create symlink from ./var/log to 'volatile/log=
': File exists.
ERROR: Function 'do_populate_sdk' failed=20

Now I have no time to look into this issue at once. It would be great, if s=
omebody can give some quick hint.

Thanks,
-- Dexuan



