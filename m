Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SErf8-0006gN-8g
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 02:31:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Apr 2012 17:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="126334758"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 02 Apr 2012 17:22:44 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 2 Apr 2012 17:22:43 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.142]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Tue, 3 Apr 2012 08:22:42 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 4/5] eglibc-nativesdk: Set GCC_ADDONS.
Thread-Index: AQHNDwsCwvj0Z6EWUkysk9K8OcaCuZaD892AgAAASICABEyH4A==
Date: Tue, 3 Apr 2012 00:22:41 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FD1A2D4@SHSMSX101.ccr.corp.intel.com>
References: <cover.1333176251.git.lianhao.lu@intel.com>
	<d33b7d21b1cc23f7c20743d85a261c4d610e2f41.1333176251.git.lianhao.lu@intel.com>
	<eb2bbe99f15183d5c82ab5c12178a1e336a7c5ce.1333176251.git.lianhao.lu@intel.com>
	<CAMKF1srXwcC9s_wOb3OuSEt+QWeSOfn3yR6R6VGtGP3mhhRASw@mail.gmail.com>
	<CAMKF1sosTMMM0AUhPy6=4P7CQBAO2WJ3VCfObAb-+0g2+25mig@mail.gmail.com>
In-Reply-To: <CAMKF1sosTMMM0AUhPy6=4P7CQBAO2WJ3VCfObAb-+0g2+25mig@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 4/5] eglibc-nativesdk: Set GCC_ADDONS.
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
X-List-Received-Date: Tue, 03 Apr 2012 00:31:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've recreated the patches per Richard's comment. However, removing nptl fr=
om the add-on settings resulted an eglibc configure error saying that it is=
 an required add-on.=20

-Lianhao

Khem Raj wrote on 2012-03-31:
> On Sat, Mar 31, 2012 at 7:39 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> nptl is bogus now a days. so please delete it completely.
>=20
> heh I must have said in GLIBC_ADDON context its bogus. Since its _the_
> only thread implementation in eglibc/glibc
>=20
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core





