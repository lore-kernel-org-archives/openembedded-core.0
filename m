Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3E59A79010
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:00:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N80k0I010223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:00:46 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 01:00:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:11:19 +0800
Message-ID: <cover.1535011774.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/7] Recipes upgrade
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
X-List-Received-Date: Thu, 23 Aug 2018 08:00:45 -0000
Content-Type: text/plain

The following changes since commit 1314a6953aa647706107557faaba8574e307d2bd:

  patch: fix CVE-2018-6952 (2018-08-23 07:45:32 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (7):
  strace: 4.23 -> 4.24
  diffstat: 1.61 -> 1.62
  pciutils: 3.6.1 -> 3.6.2
  dbus: 1.12.8 -> 1.12.10
  dbus-test: 1.12.8 -> 1.12.10
  elfutils: 0.172 -> 0.173
  distcc: 3.3 -> 3.3.2

 .../{pciutils_3.6.1.bb => pciutils_3.6.2.bb}       |  4 +--
 .../{dbus-test_1.12.8.bb => dbus-test_1.12.10.bb}  |  4 +--
 .../dbus/{dbus_1.12.8.bb => dbus_1.12.10.bb}       |  4 +--
 .../diffstat/avoid-check-user-break-cc.patch       | 12 +++++--
 .../{diffstat_1.61.bb => diffstat_1.62.bb}         |  4 +--
 .../distcc/{distcc_3.3.bb => distcc_3.3.2.bb}      |  2 +-
 .../{elfutils_0.172.bb => elfutils_0.173.bb}       |  5 +--
 .../0001-tests-fix-build-with-fresh-glibc.patch    | 42 ----------------------
 .../strace/{strace_4.23.bb => strace_4.24.bb}      |  5 ++-
 9 files changed, 23 insertions(+), 59 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.6.1.bb => pciutils_3.6.2.bb} (92%)
 rename meta/recipes-core/dbus/{dbus-test_1.12.8.bb => dbus-test_1.12.10.bb} (95%)
 rename meta/recipes-core/dbus/{dbus_1.12.8.bb => dbus_1.12.10.bb} (97%)
 rename meta/recipes-devtools/diffstat/{diffstat_1.61.bb => diffstat_1.62.bb} (84%)
 rename meta/recipes-devtools/distcc/{distcc_3.3.bb => distcc_3.3.2.bb} (97%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.172.bb => elfutils_0.173.bb} (95%)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch
 rename meta/recipes-devtools/strace/{strace_4.23.bb => strace_4.24.bb} (90%)

-- 
2.7.4


