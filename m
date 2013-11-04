Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD2E6D68F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 14:38:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA4EcAAm012744
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Nov 2013 06:38:10 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 4 Nov 2013 06:38:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Nov 2013 06:40:05 +0800
Message-ID: <cover.1383604532.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/4 V2] sanity.bbclass: TMPDIR and sanity_info related fixes
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
X-List-Received-Date: Mon, 04 Nov 2013 14:38:08 -0000
Content-Type: text/plain

* V2:
- Move ${TOPDIR}/conf/sanity_info to ${TMPDIR}, we need update the document for
  this change.

// Robert

The following changes since commit 9160f376065752e2e92c8b37ee9a80d0eb86b53b:

  bitbake: toaster: enable required classes in the toaster startup script (2013-11-04 09:36:22 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbty/nfs_check
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbty/nfs_check

Robert Yang (4):
  sanity.bbclass: move conf/sanity_info into TMPDIR
  sanity.bbclass: check that TMPDIR is not located on nfs
  sanity.bbclass: remove the obsolete variable last_tmpdir
  build-perf-test.sh: cleanup conf/sanity_info

 meta/classes/sanity.bbclass        | 26 ++++++++++++++++++++------
 scripts/contrib/build-perf-test.sh |  2 +-
 2 files changed, 21 insertions(+), 7 deletions(-)

-- 
1.8.3.1


