Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QbuGb-00028f-4k
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 14:53:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2011 05:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,443,1304319600"; d="scan'208";a="21879134"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2011 05:49:21 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 29 Jun 2011 20:49:16 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 29 Jun 2011 20:49:15 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Wed, 29 Jun 2011 20:49:15 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jun 2011 20:49:13 +0800
Thread-Topic: [PATCH 0/1] bump PR to fix the perl-native issue
Thread-Index: AcwsmsnN14k6303KSKKOmWltKanK9QJv73CgAAAF7eA=
Message-ID: <1865303E0DED764181A9D882DEF65FB6A167F0C71C@shsmsx502.ccr.corp.intel.com>
References: <cover.1308278404.git.dexuan.cui@intel.com>
	<1865303E0DED764181A9D882DEF65FB6A167F0C71B@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6A167F0C71B@shsmsx502.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 0/1] bump PR to fix the perl-native issue
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
X-List-Received-Date: Wed, 29 Jun 2011 12:53:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Cui, Dexuan wrote:
> Cui, Dexuan wrote:
>> I did a core-image-sato-sdk and meta-toolchain-gmae building using a
>> commit of May 12 between 605141a9(the perl-native workaround patch)
>> and 3ba6d018(populate perl-native into its own dir), and grepped
>> ${STAGING_BINDIR_NATIVE}/perl in
>> ${STAGING_BINDIR_NATIVE} to find out all the scripts needed to
>> address. Some recipes' PRs have been bumped, so this patch only
>> bumps the omitted ones.=20
>>=20
>> Please review the patch.
>>=20
>> The following changes since commit
>> 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:
>>=20
>>   systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16
>> 22:14:06 +0100)=20
>>=20
>> are available in the git repository at:
>>   git://git.pokylinux.org/poky-contrib dcui/bump_PR
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Ddcui/bump_PR
>>=20
>> Dexuan Cui (1):
>>   glib-2.0,intltool,rpm,sgmlspl-native: Bump PR to resolve
>> perl-native     issue=20
>>=20
>>  meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb      |    2 +-
>>  meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb      |    2 +-
>>  meta/recipes-devtools/intltool/intltool_0.40.6.bb  |    2 +-
>>  meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    2 +-
>>  .../sgmlspl/sgmlspl-native_1.03ii.bb               |    2 +-
>>  5 files changed, 5 insertions(+), 5 deletions(-)
(Sorry for my previous empty reply to this thead. I pressed enter too hasti=
ly...)
Looks the patch was neglected somehow, either? :-)

Thanks,
-- Dexuan=


