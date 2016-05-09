Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 34CCD60670
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 09:32:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u499WYak014143
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 May 2016 02:32:34 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 9 May 2016 02:32:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 May 2016 02:32:32 -0700
Message-ID: <cover.1462786325.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/1] linux-dummy: set INHIBIT_DEFAULT_DEPS
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
X-List-Received-Date: Mon, 09 May 2016 09:32:35 -0000
Content-Type: text/plain

The following changes since commit ece101be5158beee709cdfbb85ecdbdc8d9fb864:

  test-empty-image: Fix LIC_FILES_CHKSUM typo (2016-05-06 10:47:59 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/dummy
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/dummy

Robert Yang (1):
  linux-dummy: set INHIBIT_DEFAULT_DEPS

 meta/recipes-kernel/linux/linux-dummy.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.8.0


