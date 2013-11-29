Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B8E0C6D77B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 12:48:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rATCm0su028284
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 04:48:00 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 29 Nov 2013 04:48:00 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 20:48:15 +0800
Message-ID: <59c5bab6c119d8ea7e6b7fc6241318f0e260a566.1385728901.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385728901.git.Qi.Chen@windriver.com>
References: <cover.1385728901.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/18] dtc: make dtc-misc rdepend on bash
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
X-List-Received-Date: Fri, 29 Nov 2013 12:48:00 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Make dtc-misc explicitly rdepend on bash so that the rootfs task will
not fail for the reason of implicit runtime bash dependency.

[YOCTO #5555]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/dtc/dtc.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index de375d7..a8c24c1 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -15,4 +15,5 @@ EXTRA_OEMAKE='PREFIX="${prefix}" LIBDIR="${libdir}"'
 S = "${WORKDIR}/git"
 
 PACKAGES =+ "${PN}-misc"
+RDEPENDS_${PN}-misc = "bash"
 FILES_${PN}-misc = "${bindir}/convert-dtsv0 ${bindir}/ftdump ${bindir}/dtdiff"
-- 
1.7.9.5


