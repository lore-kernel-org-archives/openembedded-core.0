Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2340A60746
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 02:20:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5C2Kexg024186
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2016 19:20:40 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.144) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sat, 11 Jun 2016 19:20:39 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 10:20:58 +0800
Message-ID: <cover.1465697985.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/9] Package Upgrades -- 20160612
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
X-List-Received-Date: Sun, 12 Jun 2016 02:20:40 -0000
Content-Type: text/plain

The following changes since commit 207dba5b6eb04c1ae2081bac06724b3b6a198cb3:

  oe-pkgdata-util: fix AttributeError (2016-06-07 21:36:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/PU-20160612
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/PU-20160612

Chen Qi (9):
  grep: upgrade to 2.25
  sysstat: upgrade to 11.3.4
  sudo: upgrade to 1.8.16
  gzip: upgrade to 1.8
  byacc: upgrade to 20160324
  curl: upgrade to 7.49.1
  tar: upgrade to 1.29
  pciutils: upgrade to 3.5.1
  resolvconf: upgrade to 1.79

 .../{pciutils_3.4.1.bb => pciutils_3.5.1.bb}        |  4 ++--
 .../{resolvconf_1.78.bb => resolvconf_1.79.bb}      |  6 +++---
 .../byacc/{byacc_20150711.bb => byacc_20160324.bb}  |  7 ++++---
 .../grep/{grep_2.23.bb => grep_2.25.bb}             |  4 ++--
 .../gzip/{gzip_1.6.bb => gzip_1.8.bb}               |  0
 .../sudo/{sudo_1.8.15.bb => sudo_1.8.16.bb}         |  4 ++--
 meta/recipes-extended/sysstat/sysstat_11.2.0.bb     |  8 --------
 meta/recipes-extended/sysstat/sysstat_11.3.4.bb     |  8 ++++++++
 meta/recipes-extended/tar/tar/remove-gets.patch     | 21 ++++++++++++++-------
 .../tar/{tar_1.28.bb => tar_1.29.bb}                |  4 ++--
 .../curl/{curl_7.47.1.bb => curl_7.49.1.bb}         |  4 ++--
 11 files changed, 39 insertions(+), 31 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.4.1.bb => pciutils_3.5.1.bb} (92%)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.78.bb => resolvconf_1.79.bb} (90%)
 rename meta/recipes-extended/byacc/{byacc_20150711.bb => byacc_20160324.bb} (58%)
 rename meta/recipes-extended/grep/{grep_2.23.bb => grep_2.25.bb} (88%)
 rename meta/recipes-extended/gzip/{gzip_1.6.bb => gzip_1.8.bb} (100%)
 rename meta/recipes-extended/sudo/{sudo_1.8.15.bb => sudo_1.8.16.bb} (90%)
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_11.2.0.bb
 create mode 100644 meta/recipes-extended/sysstat/sysstat_11.3.4.bb
 rename meta/recipes-extended/tar/{tar_1.28.bb => tar_1.29.bb} (73%)
 rename meta/recipes-support/curl/{curl_7.47.1.bb => curl_7.49.1.bb} (94%)

-- 
1.9.1


