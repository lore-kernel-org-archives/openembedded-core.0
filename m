Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A879F6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 09:42:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u819gCXp023511
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Sep 2016 02:42:12 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 1 Sep 2016 02:42:11 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Sep 2016 05:42:09 -0400
Message-ID: <cover.1472708502.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] busybox: fix "sed n (flushes pattern space, terminates early)" testcase failure
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
X-List-Received-Date: Thu, 01 Sep 2016 09:42:13 -0000
Content-Type: text/plain

The following changes since commit 2fedd226c3385f1ac160b3aa0bfadbded85e288c:

  ref-manual: Fixed small wording in PKGR in the glossary (2016-08-25 23:09:29 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/busybox-fix-sed-n-testcase-failure
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/busybox-fix-sed-n-testcase-failure

Dengke Du (1):
  busybox: fix "sed n (flushes pattern space, terminates early)"
    testcase failure

 ...-n-flushes-pattern-space-terminates-early.patch | 72 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch

-- 
2.8.1


