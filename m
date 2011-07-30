Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QmxyZ-0000Mu-Qb
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 03:04:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Jul 2011 18:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,290,1309762800"; d="scan'208";a="33195820"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 29 Jul 2011 18:00:04 -0700
Received: from pgsmsx103.gar.corp.intel.com (10.221.44.82) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 30 Jul 2011 09:00:03 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX103.gar.corp.intel.com (10.221.44.82) with Microsoft SMTP Server
	(TLS) id 14.1.289.1; Sat, 30 Jul 2011 09:00:02 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Sat, 30 Jul 2011 09:00:02 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jul 2011 09:00:01 +0800
Thread-Topic: [OE-core] [RFC BUG #1236 2/2] eglibc: Modify ldd script
	according to multilib config.
Thread-Index: AcxOBZBKkeiDeFeOTmOnMAFS+LzrKwATk8Lw
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F2C41168D29@shsmsx502.ccr.corp.intel.com>
References: <86e74f97a7eea07d74dafa632c053da2d37e03eb.1311950827.git.lianhao.lu@intel.com>
	<8d920461c0a2d050b30d99d5a5ce464af6209f40.1311950827.git.lianhao.lu@intel.com>
	<1311953900.30326.495.camel@phil-desktop>
In-Reply-To: <1311953900.30326.495.camel@phil-desktop>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [RFC BUG #1236 2/2] eglibc: Modify ldd script according to multilib config.
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
X-List-Received-Date: Sat, 30 Jul 2011 01:04:29 -0000
X-List-Received-Date: Sat, 30 Jul 2011 01:04:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Friday, July 29, 2011 11:38 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [RFC BUG #1236 2/2] eglibc: Modify ldd script acco=
rding
> to multilib config.
>=20
> On Fri, 2011-07-29 at 22:57 +0800, Lianhao Lu wrote:
> > +		"x86": ["ld-linux.so.2", "FLAG_ELF_LIBC5"],
>=20
> That looks a bit weird to me.  Are you sure that's right?
>=20
Oops, it should be FLAG_ELF_LIBC6.

-Lianhao=20


