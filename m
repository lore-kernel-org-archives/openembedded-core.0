Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q88at-00013p-L5
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 12:07:13 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Apr 2011 03:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,322,1299484800"; d="scan'208";a="625469234"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by orsmga002.jf.intel.com with ESMTP; 08 Apr 2011 03:05:01 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 8 Apr 2011 18:04:55 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Fri, 8 Apr 2011
	18:04:55 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Fri, 8 Apr 2011 18:04:54 +0800
Thread-Topic: [OE-core] [PATCH 0/2] PULL: fixes to bug 961, 964
Thread-Index: Acv11CTCpjC737F6RO2GA0/OTHq9FAAABFWQ
Message-ID: <1865303E0DED764181A9D882DEF65FB68A77210FCB@shsmsx502.ccr.corp.intel.com>
References: <cover.1302256139.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302256139.git.dexuan.cui@intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] PULL: fixes to bug 961, 964
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
X-List-Received-Date: Fri, 08 Apr 2011 10:07:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dexuan Cui wrote:
> From: Dexuan Cui <dexuan.cui@intel.com>
>=20
> [YOCTO #964]:
> A recent commit 25a6e5f9(sstate: use only unique set of SSTATETASK)
> breaks the ordered mapping between SSTATETASKS and SSTATETASKNAMES.
> As a result, in sstate_cleanall, the line
> taskname =3D tasks[namemap.index(name)]
> gets an incorrect result, and "bitbake -c cleanall" doesn't really
> remove the files populalted by do_populate_sysroot.
>=20
> BTW: the bernard branch doesn't need this fix since commit 25a6e5f9
> wasn't pulled into it.
>=20
>=20
>=20
> [YOCTO #961]:
> lsbsetup: Fix LIC_FILE_CHKSUM
> We need to pull this fix asap since nightly's lsb builds have been
> blocked by this for 2 days.

Sorry, I didn't notice Saul had sent out a fix for this (bug #961). :-)
Please ignore mine.=20

Thanks,
-- Dexuan=


