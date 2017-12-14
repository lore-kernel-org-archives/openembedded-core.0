Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6CA787E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 06:46:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBE6kwaf003022
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 22:46:59 -0800 (PST)
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 13 Dec 2017 22:46:57 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Dec 2017 14:45:03 +0800
Message-ID: <1513233904-17502-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513233904-17502-1-git-send-email-yi.zhao@windriver.com>
References: <1513233904-17502-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [PATCH 1/2] ltp: add tar as runtime dependency
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
X-List-Received-Date: Thu, 14 Dec 2017 06:46:58 -0000
Content-Type: text/plain

The tar from busybox lacks some options that cause the tar01 case
failed. Add tar as runtime dependency.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20170929.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20170929.bb b/meta/recipes-extended/ltp/ltp_20170929.bb
index aaa7c93..1a7e869f 100644
--- a/meta/recipes-extended/ltp/ltp_20170929.bb
+++ b/meta/recipes-extended/ltp/ltp_20170929.bb
@@ -104,6 +104,7 @@ RDEPENDS_${PN} = "\
     unzip \
     util-linux \
     which \
+    tar \
 "
 
 FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/* /opt/ltp/testcases/data/nm01/lib.a /opt/ltp/lib/libmem.a"
-- 
2.7.4


