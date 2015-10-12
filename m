Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 522FE65C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 18:36:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 12 Oct 2015 11:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,674,1437462000"; d="scan'208";a="662819987"
Received: from linux-vcyq.jf.intel.com ([10.7.198.81])
	by orsmga003.jf.intel.com with ESMTP; 12 Oct 2015 11:36:23 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Oct 2015 11:30:23 -0700
Message-Id: <1444674624-9191-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435660700.7287.84.camel@intel.com>
References: <1435660700.7287.84.camel@intel.com>
Cc: richard.purdie@intel.com
Subject: [daisy][PATCH v2 0/1 ] OpenSUSE 13.2 qemu configuration
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
X-List-Received-Date: Mon, 12 Oct 2015 18:36:32 -0000

Modified patch to fix
https://bugzilla.yoctoproject.org/show_bug.cgi?id=7469

Juro Bystricky (1):
  qemu: OpenSUSE 13.2 configure error

 .../qemu/files/qemu-libcrypt-search-path-fix.patch | 37 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.7.0.bb           |  2 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/files/qemu-libcrypt-search-path-fix.patch

-- 
2.1.4


