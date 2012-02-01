Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RsblQ-0006s5-5U
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 16:06:24 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Feb 2012 06:58:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="102703499"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by orsmga001.jf.intel.com with ESMTP; 01 Feb 2012 06:58:11 -0800
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 1 Feb 2012 22:58:09 +0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 1 Feb 2012 22:58:08 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.142]) with mapi id
	14.01.0355.002; Wed, 1 Feb 2012 22:58:07 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 06/18] iptables: upgrade to 1.4.12.2
Thread-Index: AQHM2UR4JMyt+6nXHE6PTjF4xyQfKJYoMQpg
Date: Wed, 1 Feb 2012 14:58:07 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC0FCE9F8B@SHSMSX102.ccr.corp.intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
	<5da104c33636cbe2d512779de0799f78edbedd37.1327255445.git.shane.wang@intel.com>
	<20120122202916.GA29776@sakrah.homelinux.org>
In-Reply-To: <20120122202916.GA29776@sakrah.homelinux.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 06/18] iptables: upgrade to 1.4.12.2
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
X-List-Received-Date: Wed, 01 Feb 2012 15:06:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Khem Raj wrote on=A02012-01-23:

> On (23/01/12 02:06), Shane Wang wrote:
>> This patch is to upgrade iptables to 1.4.12.2, and introduce a patch
>> not to check unknown symbols. Otherwise, when it is compiled, it will
>> report "libxtables.so.7" from
> LD_PRELOAD cannot be preloaded.
>=20
> you should say dont build 'check' target by default or something on
> those lines

I got you. Thank you, Raj.

--
Shane


