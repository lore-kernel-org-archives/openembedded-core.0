Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09EE67602E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 06:08:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6C68lCN011958
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 23:08:47 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 11 Jul 2018 23:08:46 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jul 2018 14:12:04 +0800
Message-ID: <ec0d3a1a70505f5eeebc8b03a8c84db285e90341.1531375710.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1531375709.git.Qi.Chen@windriver.com>
References: <cover.1531375709.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] systemd: change SRC_URI back to include musl patches unconditionally
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
X-List-Received-Date: Thu, 12 Jul 2018 06:08:46 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_239.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 99fbfc1..ce8cc9a 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -30,7 +30,7 @@ SRC_URI += "file://touchscreen.rules \
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
 # patches made for musl are only applied on TCLIBC is musl
-SRC_URI += "${@d.getVar('SRC_URI_MUSL') if d.getVar('TCLIBC') == 'musl' else ''}"
+SRC_URI += "${SRC_URI_MUSL}"
 SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.patch \
                file://0002-don-t-use-glibc-specific-qsort_r.patch \
                file://0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
-- 
1.9.1


