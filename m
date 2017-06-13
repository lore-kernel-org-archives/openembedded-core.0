Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 67AA978299
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 18:32:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5DIWS38026042
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 11:32:30 -0700
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 13 Jun 2017 11:32:27 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Jun 2017 11:32:23 -0700
Message-ID: <1497378747-30702-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [-oe-core][v2][PATCH 0/3] *** ghostscript 9.21 ***
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
X-List-Received-Date: Tue, 13 Jun 2017 18:32:30 -0000
Content-Type: text/plain

Resolve issue with not using CUPSCONFIG.  Also, set up PACKAGECONFIG
to allow X11 support, but do not enable it.  Use of X11 has been
minimally verified.

Joe Slater (3):
  ghostscript:   move to version 9.21
  ghostscript: add X11 PACKAGECONFIG info
  ghostscript: specify CUPSCONFIG

 .../ghostscript/ghostscript/CVE-2016-10219.patch   | 49 -------------------
 .../ghostscript/ghostscript/CVE-2016-10220.patch   | 55 ----------------------
 .../ghostscript/ghostscript/CVE-2016-8602.patch    | 47 ------------------
 .../ghostscript/ghostscript/CVE-2017-7975.patch    | 23 ++++-----
 .../ghostscript/avoid-host-contamination.patch     | 19 ++++++++
 ...t-9.21-native-fix-disable-system-libtiff.patch} | 22 ++++-----
 ... => ghostscript-9.21-prevent_recompiling.patch} | 25 +++++-----
 .../ghostscript/ghostscript/mkdir-p.patch          | 36 ++++++++++++++
 .../{ghostscript_9.20.bb => ghostscript_9.21.bb}   | 37 +++++++++++----
 9 files changed, 116 insertions(+), 197 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10219.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10220.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-8602.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
 rename meta/recipes-extended/ghostscript/ghostscript/{ghostscript-native-fix-disable-system-libtiff.patch => ghostscript-9.21-native-fix-disable-system-libtiff.patch} (67%)
 rename meta/recipes-extended/ghostscript/ghostscript/{ghostscript-9.02-prevent_recompiling.patch => ghostscript-9.21-prevent_recompiling.patch} (81%)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.20.bb => ghostscript_9.21.bb} (76%)

-- 
2.7.4


