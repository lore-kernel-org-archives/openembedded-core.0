Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QceUH-0006bS-Qx
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 16:14:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Jul 2011 07:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,458,1304319600"; d="scan'208";a="25208558"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2011 07:10:43 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 1 Jul 2011 22:10:37 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 1 Jul 2011 22:10:36 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Fri, 1 Jul 2011
	22:10:36 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jul 2011 22:10:35 +0800
Thread-Topic: [OE-core] [PATCH 1/1] busybox: bump PR to enable largefile
	support
Thread-Index: Acw31aKYpfoJBeIKT0y2RSO2tw7qQgAIocgg
Message-ID: <1865303E0DED764181A9D882DEF65FB6A1FA38BB6D@shsmsx502.ccr.corp.intel.com>
References: <cover.1309513694.git.dexuan.cui@intel.com>
	<1aa106d547c9e10d025a011922335cc3ea1bbb69.1309513694.git.dexuan.cui@intel.com>
	<1309514388.2633.36.camel@phil-desktop>
In-Reply-To: <1309514388.2633.36.camel@phil-desktop>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] busybox: bump PR to enable largefile support
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
X-List-Received-Date: Fri, 01 Jul 2011 14:14:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Phil Blundell wrote:
> On Fri, 2011-07-01 at 17:53 +0800, Dexuan Cui wrote:
>> In the previous commit we enable largefile setting in
>> meta-yocto/conf/distro/poky.conf, so we need to re-build busybox to
>> actually enable it.
>=20
> I guess this would be a good case for using something like OE .dev's
> DISTRO_PR.  It would be a bit sad if we end up having to bump PRs all
> over the place in oe-core whenever some random layer changes its
> DISTRO_FEATURES or whatever.
Thanks for the info!=20
I didn't know OE.dev's DISTRO_PR before. I'm going to look at that.

> Also, just on a stylistic issue, it's a bit confusing to talk about
> "the previous commit" if the commit in question was to a different
> file and in a different repo.  If you want to refer to a specific
> commit it's best to mention the actual hash and, if necessary, the
> repo where it can be found.
Thanks for the suggestion!
I'll pay special attention to this and avoid confusion in future.

Thanks,
-- Dexuan=


