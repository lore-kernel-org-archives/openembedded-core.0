Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 579DB72022
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 05:08:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Nov 2014 21:08:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,324,1413270000"; d="scan'208";a="627443301"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.89])
	by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2014 21:08:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Nov 2014 21:08:49 -0800
Message-Id: <1415250534-16350-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/5][daisy] Additional patches and CVE issues
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
X-List-Received-Date: Thu, 06 Nov 2014 05:08:55 -0000

Richard,

Here are 5 more late breaking 1.6.2 patches for CVE that Paul and I have identified.

Thanks
	Sau!


Paul Eggleton (3):
  python: force off_t size to 8 to enable large file support
  openssh: avoid screen sessions being killed on disconnect with systemd
  libarchive: avoid dependency on e2fsprogs

Saul Wold (2):
  wget: Fix for CVE-2014-4887
  readline: Patch for readline multikey dispatch issue

 .../openssh/openssh/sshd@.service                  |  1 +
 .../readline-6.3/readline-dispatch-multikey.patch  | 32 +++++++++
 meta/recipes-core/readline/readline_6.3.bb         |  3 +-
 meta/recipes-devtools/python/python_2.7.3.bb       |  3 +
 .../libarchive/libarchive_3.1.2.bb                 | 11 +++
 .../wget/wget-1.14/wget_cve-2014-4877.patch        | 78 ++++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.14.bb            |  1 +
 7 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch
 create mode 100644 meta/recipes-extended/wget/wget-1.14/wget_cve-2014-4877.patch

-- 
1.8.3.1


