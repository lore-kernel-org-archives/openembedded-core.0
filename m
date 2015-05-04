Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1EF972120
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 08:47:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t448lb9d021707
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 May 2015 01:47:37 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 4 May 2015 01:47:37 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 May 2015 16:43:38 +0800
Message-ID: <cover.1430727318.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2][v2] upgrade bind to 9.10.2, and fix the building failure
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
X-List-Received-Date: Mon, 04 May 2015 08:47:38 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The following changes since commit 7a8f37daa7b42905233c31366915b897886a957a:

  dev-manual: Updates to add Luna support for Eclipse (2015-05-03 11:49:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/bind-9.10.2-1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/bind-9.10.2-1

Roy Li (2):
  bind: upgrade to 9.10.2
  dhcp: fix a building failure when upgrade bind

 .../bind/bind/bind-CVE-2012-3817.patch             |  40 -
 ...d-crosscripts-search-path-for-xml2-config.patch |   2 +-
 .../bind/bind/bind-subdirs-run-serially.patch      |  35 -
 .../bind/bind/bind9_9_5-CVE-2014-8500.patch        | 990 ---------------------
 .../bind/bind/cross-build-fix.patch                |  21 -
 .../bind/bind/dont-test-on-host.patch              |   4 +-
 .../bind/{bind_9.9.5.bb => bind_9.10.2.bb}         |  10 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            |   7 +-
 .../dhcp/dhcp/0001-search-libxml2.patch            |  35 +
 9 files changed, 47 insertions(+), 1097 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/bind-CVE-2012-3817.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/bind-subdirs-run-serially.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2014-8500.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/cross-build-fix.patch
 rename meta/recipes-connectivity/bind/{bind_9.9.5.bb => bind_9.10.2.bb} (87%)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-search-libxml2.patch

-- 
1.9.1


