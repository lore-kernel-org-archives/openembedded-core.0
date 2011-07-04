Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QdXHj-0006Nq-Mz
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 02:45:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2011 17:25:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,469,1304319600"; d="scan'208";a="21184298"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2011 17:25:16 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 4 Jul 2011 08:23:23 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Mon, 4 Jul 2011
	08:23:22 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2011 08:23:20 +0800
Thread-Topic: [OE-core] [Draft design][RFC] Running postinst at rootfs
	generation time
Thread-Index: Acw1odrxQHzg0B5iS2KnXHcujJUxywAEb9UgAPbZfZA=
Message-ID: <1865303E0DED764181A9D882DEF65FB6A200B1C937@shsmsx502.ccr.corp.intel.com>
References: <1865303E0DED764181A9D882DEF65FB6A167F0C70B@shsmsx502.ccr.corp.intel.com>
	<4E095480.3070001@windriver.com><1309266943.20015.290.camel@rex>
	<4E09E8B7.1070901@windriver.com>
	<0C757E680E33864AB113392C7E83F910BE518E@GSX300A.mxchg.m.corp>
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE518E@GSX300A.mxchg.m.corp>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: "'Hauser, Wolfgang \(external\)'" <Wolfgang.Hauser.external@cassidian.com>
Subject: Re: [Draft design][RFC] Running postinst at rootfs generation time
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
X-List-Received-Date: Mon, 04 Jul 2011 00:45:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hauser, Wolfgang (external) wrote:
> Beside the discussed changes, the postinst scripts should be executed
> in the dependency order.
> At the time, the scripts are executed in alphabetic order, which
> breaks the image generation if depended packages are not in
> alphabetic order.=20
>=20
> e.g. busybox and busybox subpackages (busybox-mdev).
>=20
> Regards
> Wolfgang Hauser
>=20

Thank all for the suggestions!
I created a wiki page to summarize the mail threads:
https://wiki.yoctoproject.org/wiki/Run_postinst_during_rootfs_generation

Thanks,
-- Dexuan


