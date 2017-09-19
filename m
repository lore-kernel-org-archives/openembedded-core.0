Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 176BE77EA7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 18:27:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Sep 2017 11:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,418,1500966000"; d="scan'208";a="901938604"
Received: from swold-mobl2.jf.intel.com ([10.24.10.67])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2017 11:27:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 19 Sep 2017 11:27:31 -0700
Message-Id: <20170919182734.15741-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH 0/3] Disable systemd-boot from building with x32 IA Machine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Sep 2017 18:27:34 -0000

systemd-boot has to be build for the native IA instruction set size, this
patch series is needed to disable it from building or being depended on 
by WIC when building x32 as DEFAULTTUNE and not just as multilib.

Sau!

Saul Wold (3):
  arch-x86: Add x86-x32 to MACHINEOVERRIDES
  wic: remove systemd-boot for x32
  systemd-boot: Should not build x32

 meta/classes/image_types_wic.bbclass          | 1 +
 meta/conf/machine/include/x86/arch-x86.inc    | 1 +
 meta/recipes-core/meta/wic-tools.bb           | 1 +
 meta/recipes-core/systemd/systemd-boot_234.bb | 1 +
 4 files changed, 4 insertions(+)

-- 
2.11.0


