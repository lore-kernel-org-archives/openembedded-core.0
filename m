Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 805F079C1C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 09:58:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9P9wdXa025201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 02:58:39 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 25 Oct 2018 02:58:27 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Oct 2018 05:58:25 -0400
Message-ID: <20181025095826.163943-1-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
MIME-Version: 1.0
Subject: [PATCH v3] Weston split out config recipe
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
X-List-Received-Date: Thu, 25 Oct 2018 09:58:38 -0000
Content-Type: text/plain

Adding a cover page to explain the differences.

v3: Rename package from weston-cfg to weston-conf
    Add missing SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
    Add do_configure[noexec] to fix bitbake -c clean

v2: Add missing maintainer entry

v1: original


Mark Hatle (1):
  weston: Split out machine specific configuration

 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/conf/layer.conf                          |  1 +
 meta/recipes-graphics/wayland/weston-conf.bb  | 35 +++++++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_5.0.0.bb |  8 +-----
 4 files changed, 38 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston-conf.bb

-- 
1.8.3.1


