Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07F24760AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 08:00:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7J80PPI020626
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 01:00:25 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 19 Aug 2016 01:00:24 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2016 16:00:36 +0800
Message-ID: <cover.1471593530.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Package Upgrade -- 20160819
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
X-List-Received-Date: Fri, 19 Aug 2016 08:00:26 -0000
Content-Type: text/plain

The following changes since commit 5dca6cc2fcdb2799c19b1697f0647a16ce296290:

  systemd-compat-units: Only enable for systemd in DISTRO_FEATURES (2016-08-18 16:52:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/PU-20160819
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/PU-20160819

Chen Qi (3):
  util-linux: upgrade to 2.28.1
  diffutils: upgrade to 3.4
  kmod: upgrade to 23

 .../util-linux/{util-linux_2.28.bb => util-linux_2.28.1.bb}           | 4 ++--
 .../0001-Unset-need_charset_alias-when-building-for-musl.patch        | 0
 .../diffutils/{diffutils-3.3 => diffutils-3.4}/run-ptest              | 0
 .../recipes-extended/diffutils/{diffutils_3.3.bb => diffutils_3.4.bb} | 4 ++--
 meta/recipes-kernel/kmod/kmod.inc                                     | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.28.bb => util-linux_2.28.1.bb} (86%)
 rename meta/recipes-extended/diffutils/{diffutils-3.3 => diffutils-3.4}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 rename meta/recipes-extended/diffutils/{diffutils-3.3 => diffutils-3.4}/run-ptest (100%)
 rename meta/recipes-extended/diffutils/{diffutils_3.3.bb => diffutils_3.4.bb} (87%)

-- 
1.9.1


