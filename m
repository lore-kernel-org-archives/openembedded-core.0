Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 64EC760C14
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 10:37:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s34AbPPp004048
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Apr 2014 03:37:25 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 4 Apr 2014 03:37:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Apr 2014 18:44:08 +0800
Message-ID: <cover.1396608025.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] util-linux: fix parallel build issue
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
X-List-Received-Date: Fri, 04 Apr 2014 10:37:27 -0000
Content-Type: text/plain

The following changes since commit aa94e142fb06cf36be603f6d9a9f1009c8b4f319:

  useradd_base.bbclass: avoid the traffic crowding (2014-04-04 15:36:09 +0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/util-linux
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/util-linux

Robert Yang (1):
  util-linux: fix parallel build issue

 .../util-linux/util-linux/fix-parallel-build.patch | 35 ++++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.24.1.bb  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/fix-parallel-build.patch

-- 
1.8.3.1


