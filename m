Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPZlV-0001W3-5A
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 14:34:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 May 2011 05:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,272,1304319600"; 
   d="scan'208";a="2251569"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 26 May 2011 05:29:45 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 26 May 2011 20:29:44 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 26 May 2011 20:29:44 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Thu, 26 May 2011 20:29:43 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 May 2011 20:29:41 +0800
Thread-Topic: [OE-core] [PATCH 0/5] network based PR service(revised)
Thread-Index: AcwbnYfmjfGGKUxeQpGu33LDy6/kUAAAWtIw
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F232DBFB105@shsmsx502.ccr.corp.intel.com>
References: <cover.1306401007.git.lianhao.lu@intel.com>
	<082D01B5-B66B-471E-B4F8-823F3B6A03C7@dominion.thruhere.net>
In-Reply-To: <082D01B5-B66B-471E-B4F8-823F3B6A03C7@dominion.thruhere.net>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] network based PR service(revised)
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
X-List-Received-Date: Thu, 26 May 2011 12:34:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Koen Kooi wrote on 2011-05-26:
>=20
> Op 26 mei 2011, om 13:55 heeft Lianhao Lu het volgende geschreven:
>=20
>> This is a modification of the original patch to enable network based PR
>> service.
>>=20
>> The main difference between this series of patch to the original one is
>> that this one uses the PKGR/PKGV during the package feed creation. It
>> also made the PR service disabled by default(by leaving the PRSERV_HOST
>> and PRSERV_PORT commented out) and revised some function names.
>>=20
>> The following features from the previous patch comments are not
>> included in this
>> series:
>> 1) automatically launch PR service in localhost use case.
>> 2) respect OVERIDE to allow setting PRSERV_HOST/PORT per recipe
>> basis
>> 3) write permission control in the PR service.
>> 4) way to sync up local PR database witht the central server.
>=20
> Does it support going thru HTTP_PROXY like the bitbake fetchers? It's
> not a must-have, but it would be nice if I can have the internal
> builds consistent with angstrom upstream.
>=20

It doesn't support now. But I think we can have this by implementing a cust=
om transport, by leverage the urllib2.

Best Regards,
Lianhao



