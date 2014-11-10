Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52AEE65CED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 08:56:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAA8up8s000272
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 00:56:51 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 10 Nov 2014 00:56:50 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Nov 2014 16:58:44 +0800
Message-ID: <39ef850dcb83f0a71fbc0dca6777fc62dc1bd532.1415609871.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415609871.git.Qi.Chen@windriver.com>
References: <cover.1415609871.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: add PACKAGECONFIG for 'audit'
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
X-List-Received-Date: Mon, 10 Nov 2014 08:56:54 -0000
Content-Type: text/plain

Add PACKAGECONFIG for 'audit', otherwise there would be warnings like
below which would possibly lead to do_rootfs failure.

WARNING: QA Issue: systemd-analyze rdepends on audit, but it isn't a build dependency? [build-deps]
WARNING: QA Issue: systemd rdepends on audit, but it isn't a build dependency? [build-deps]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_216.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 27a5d92..eaf3a5d 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -64,6 +64,7 @@ PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
 PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
 PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
 PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
+PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
-- 
1.9.1


