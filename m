Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4D6780E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 17:39:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4OHdsRA016568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 10:39:54 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 24 May 2017 10:39:54 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 May 2017 10:39:52 -0700
Message-ID: <1495647593-19100-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 0/1] ghostscript: move to version 9.21
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
X-List-Received-Date: Wed, 24 May 2017 17:39:55 -0000
Content-Type: text/plain

Updated to apply over recent ghostscript recipe changes...

Joe Slater (1):
  ghostscript:   move to version 9.21

 .../ghostscript/ghostscript/CVE-2016-10219.patch   | 49 -------------------
 .../ghostscript/ghostscript/CVE-2016-10220.patch   | 55 ----------------------
 .../ghostscript/ghostscript/CVE-2016-8602.patch    | 47 ------------------
 .../ghostscript/ghostscript/CVE-2017-7975.patch    | 23 ++++-----
 ...t-9.21-native-fix-disable-system-libtiff.patch} | 22 ++++-----
 ... => ghostscript-9.21-prevent_recompiling.patch} | 25 +++++-----
 .../{ghostscript_9.20.bb => ghostscript_9.21.bb}   | 13 ++---
 7 files changed, 39 insertions(+), 195 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10219.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10220.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-8602.patch
 rename meta/recipes-extended/ghostscript/ghostscript/{ghostscript-native-fix-disable-system-libtiff.patch => ghostscript-9.21-native-fix-disable-system-libtiff.patch} (67%)
 rename meta/recipes-extended/ghostscript/ghostscript/{ghostscript-9.02-prevent_recompiling.patch => ghostscript-9.21-prevent_recompiling.patch} (81%)
 rename meta/recipes-extended/ghostscript/{ghostscript_9.20.bb => ghostscript_9.21.bb} (88%)

-- 
2.7.4


