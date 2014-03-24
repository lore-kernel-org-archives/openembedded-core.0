Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 31CF56EFFF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 05:33:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2O5XiaS027116
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 23 Mar 2014 22:33:44 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Sun, 23 Mar 2014 22:33:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 13:39:25 +0800
Message-ID: <cover.1395639298.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/3] archiver.bbclass: make it can filter the license
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
X-List-Received-Date: Mon, 24 Mar 2014 05:33:50 -0000
Content-Type: text/plain

After talked with Chris, we use the copyleft_filter.bbclass which is
from copyleft_compliance.bbclass to filter the license for both
archiver.bbclass and copyleft_compliance.bbclass, and we may remove
copyleft_compliance.bbclass in post 1.6, but we will keep it now.

// Robert

The following changes since commit 4a47c943a76e79af82d47d8fa83c6687e0d915a0:

  busybox: disable fsck.minix and mkfs.minix (2014-03-23 09:08:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/archiver_license
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/archiver_license

Robert Yang (3):
  archiver.bbclass: make it can filter the license
  archiver.bbclass: emit patch series files for original src
  local.conf.sample.extended: update it for the archiver

 meta/classes/archiver.bbclass            | 40 +++++++++++++++++++--
 meta/classes/copyleft_compliance.bbclass | 56 +----------------------------
 meta/classes/copyleft_filter.bbclass     | 62 ++++++++++++++++++++++++++++++++
 meta/conf/local.conf.sample.extended     | 10 +++++-
 4 files changed, 110 insertions(+), 58 deletions(-)
 create mode 100644 meta/classes/copyleft_filter.bbclass

-- 
1.8.3.1


