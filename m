Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QS15x-0004cp-IV
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 08:09:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Jun 2011 23:06:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,307,1304319600"; 
   d="scan'208";a="8265822"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 01 Jun 2011 23:06:12 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 2 Jun 2011 14:04:59 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 2 Jun 2011 14:04:59 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Thu, 2 Jun 2011
	14:04:57 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jun 2011 14:04:57 +0800
Thread-Topic: [OE-core] [RFC v1 PATCH 01/16] native.bbclass: allow a native
	package to be populated into its own dir
Thread-Index: AcwgYosnsw/zVwtFRHqyjNjICtOOawAiBOrQ
Message-ID: <1865303E0DED764181A9D882DEF65FB697F1A027A0@shsmsx502.ccr.corp.intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
	<806387a97c6c01bb724c29f51de511ed43688bb0.1306931848.git.dexuan.cui@intel.com>
	<1306935653.2529.88.camel@phil-desktop>
In-Reply-To: <1306935653.2529.88.camel@phil-desktop>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [RFC v1 PATCH 01/16] native.bbclass: allow a native package to be populated into its own dir
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
X-List-Received-Date: Thu, 02 Jun 2011 06:09:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Phil Blundell wrote:
> On Wed, 2011-06-01 at 21:18 +0800, Dexuan Cui wrote:
>> +PACKAGE_OWN_DIR =3D ""
>> +bindir .=3D "${PACKAGE_OWN_DIR}"
>> +libdir .=3D "${PACKAGE_OWN_DIR}"
>> +libexecdir .=3D "${PACKAGE_OWN_DIR}"
>=20
> I think the general idea of this patch is a good one but I'm not
> terribly fond of the name of that variable.  If this is meant to be a
> path suffix that you can optionally set for native packages then how
> about calling it something like NATIVE_PACKAGE_PATH_SUFFIX?

Hi Phil,
Thanks a lot for the suggestion.
Surely NATIVE_PACKAGE_PATH_SUFFIX is a much better naming! :-)
I'll change to use it.

Thanks,
-- Dexuan



