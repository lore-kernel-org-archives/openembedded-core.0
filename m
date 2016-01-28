Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59D89771CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 09:46:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0S9kc5d010658
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 01:46:38 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 28 Jan 2016 01:46:37 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jan 2016 01:46:34 -0800
Message-ID: <cover.1453974352.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] meta: 3 fixes
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
X-List-Received-Date: Thu, 28 Jan 2016 09:46:42 -0000
Content-Type: text/plain

The following changes since commit 2a6e061712cfe9cb4738806a0c351a64e0d30144:

  cmake: update to 3.4.2 (2016-01-26 22:48:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/3fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/3fixes

Robert Yang (3):
  gdb-common.inc: add PACKAGECONFIG for readline
  autotools_stage.bbclass: remove it
  perf.bb: add python scripts corresponding packages

 meta/classes/autotools_stage.bbclass     |    2 --
 meta/recipes-devtools/gdb/gdb-common.inc |    8 ++++++--
 meta/recipes-kernel/perf/perf.bb         |    8 ++++++--
 3 files changed, 12 insertions(+), 6 deletions(-)
 delete mode 100644 meta/classes/autotools_stage.bbclass

-- 
1.7.9.5


