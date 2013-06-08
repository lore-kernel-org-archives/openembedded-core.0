Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC426A8E9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2013 07:22:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r587M8dq008486
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Jun 2013 00:22:08 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sat, 8 Jun 2013 00:22:07 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 8 Jun 2013 15:22:05 +0800
Message-ID: <cover.1370676050.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] latencytop: Deprecate tracing_enabled for tracing_on
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
X-List-Received-Date: Sat, 08 Jun 2013 07:22:07 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit 0810ea2a72bdea67a3d8002c4e12fb20f45cf1d5:

  base/useradd/sstate: Ensure do_package setscene has correct fakeroot dependencies (2013-06-07 17:51:13 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/latencytop
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/latencytop

Roy.Li (1):
  latencytop: Deprecate tracing_enabled for tracing_on

 .../latencytop-0.5/latencytop-fsync.patch          |   49 ++++++++++++++++++++
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   |    3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync.patch

-- 
1.7.10.4


