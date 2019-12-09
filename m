Return-Path: <paul.eggleton@linux.intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Dec 2019 11:06:25 UTC
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9B87FC98
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 11:06:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Dec 2019 02:59:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; d="scan'208";a="210078895"
Received: from ntruong2-mobl.ccr.corp.intel.com (HELO shodan.fritz.box)
	([10.255.170.244])
	by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2019 02:59:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2019 23:59:04 +1300
Message-Id: <cover.1575888923.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/5] runqemu/testimage logging fixes
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
X-List-Received-Date: Mon, 09 Dec 2019 11:06:25 -0000
Content-Transfer-Encoding: 8bit

A fix for https://bugzilla.yoctoproject.org/show_bug.cgi?id=13681 along
with some fixes for other minor related issues with the logging when
testimage runs QEMU.

(The "host dump" functionality may be of questionable usefulness, but
at least it now works again.)


The following changes since commit d821415ab09248a894d58f6e5a5749e822d30939:

  wayland: Add PACKAGECONFIG for dtd-validation (2019-12-09 10:21:24 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/runqemu-fixes-oe
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/runqemu-fixes-oe

Paul Eggleton (5):
  oeqa: qemu: ensure that host dump commands can be run properly
  oeqa: qemu: fix width of top output in host dump
  oeqa: qemu: ensure we print runqemu output in the event of failure
  runqemu: log parameters correctly within testimage
  runqemu: handle tap device creation failure properly

 meta/lib/oeqa/utils/dump.py       |  5 ++++-
 meta/lib/oeqa/utils/qemurunner.py |  4 ++--
 scripts/runqemu                   | 33 ++++++++++++++++++-------------
 3 files changed, 25 insertions(+), 17 deletions(-)

-- 
2.20.1


