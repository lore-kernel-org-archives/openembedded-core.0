Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E944785EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 08:04:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2Q84be6024241
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 01:04:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 26 Mar 2018 01:04:36 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2018 16:05:20 +0800
Message-ID: <54a7cbe4b4fadf428ff8249041bd009cdec0f16f.1522045990.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1522045990.git.Qi.Chen@windriver.com>
References: <cover.1522045990.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: fix typo in sulogin-path setting
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
X-List-Received-Date: Mon, 26 Mar 2018 08:04:36 -0000
Content-Type: text/plain

Fix typo in sulogin-path setting. It should be ${base_sbindir} instead of
just {base_sbindir}.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_237.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index 7ef42b2..1d04796 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -189,7 +189,7 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
                   -Dmount-path=${base_bindir}/mount \
                   -Dquotacheck-path=${sbindir}/quotacheck \
                   -Dquotaon-path=${sbindir}/quotaon \
-                  -Dsulogin-path={base_sbindir}/sulogin \
+                  -Dsulogin-path=${base_sbindir}/sulogin \
                   -Dumount-path=${base_bindir}/umount"
 
 do_install() {
-- 
1.9.1


