Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3E960698
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 09:36:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7G9aWAH015654
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 02:36:32 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 16 Aug 2013 02:36:29 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2013 17:36:32 +0800
Message-ID: <cover.1376645731.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 0/1] initscripts: remove the obsolete device_table.txt
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
X-List-Received-Date: Fri, 16 Aug 2013 09:36:30 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit ff10f72abda52315b892c64f711096772d9a4c1c:

  meta-skeleton: Add busybox config fragment example (2013-08-13 23:06:04 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/initscripts-rm-device_table
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/initscripts-rm-device_table

Chen Qi (1):
  initscripts: remove obsolete device_table.txt

 .../initscripts/initscripts-1.0/device_table.txt   |  197 --------------------
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 -
 2 files changed, 199 deletions(-)
 delete mode 100644 meta/recipes-core/initscripts/initscripts-1.0/device_table.txt

-- 
1.7.9.5


