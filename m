Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E432E6FB41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 08:28:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2P8SR3T014212
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 01:28:28 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 25 Mar 2014 01:28:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Mar 2014 16:34:15 +0800
Message-ID: <61ab69c4164c193083f541ce0912b6e3cb4d41a2.1395736394.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1395736394.git.liezhi.yang@windriver.com>
References: <cover.1395736394.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] perl-native: fix path in Config.sh for sstate
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
X-List-Received-Date: Tue, 25 Mar 2014 08:28:31 -0000
Content-Type: text/plain

We need fix the path in *.pm, *.pod, *.h, *.pl and *.sh as we have done
for target perl.

[YOCTO #6035]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/perl/perl-native_5.14.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl-native_5.14.3.bb b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
index e664e24..2ef0a51 100644
--- a/meta/recipes-devtools/perl/perl-native_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
@@ -118,3 +118,6 @@ EOF
 	chmod 0755 ${SYSROOT_DESTDIR}${bindir}/../nativeperl
 	cat ${SYSROOT_DESTDIR}${bindir}/../nativeperl
 }
+
+# Fix the path in sstate
+SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"
-- 
1.8.3.1


