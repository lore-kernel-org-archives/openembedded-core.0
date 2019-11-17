Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id BDC077F969
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 03:35:21 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d29so7523880plj.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 19:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7ehyXh9sqotNCVqVDMx8XOnbOoeRP/y5w4DkPX5wR20=;
	b=kvzx7qtEiDWGc4xYGW662Xc/+MK28OzUDHTJpMsxCNx8aEpyEnbJFzYQ4E9ddPaLBp
	1PqK8HUKD7plmyYRiQ3jxAJJSKMl2JD9E8AUQE4vebk6INv0bXF2lHgy0GGTlVkLOwHz
	R1rCyWm3l0oC5C3ah78a3wu30hiqnlFciURJuejvRQ5Hr62+Yn6Lcv+GeGe3KqUs2bLL
	m+F0k5F0BN7nzSWu49oVXxnK/9kDMl/nOzIJht184v+W9TAH08Uf/R8bj15IsxCGGskw
	oTMW9TliQDTKIASTZxbMVi9MmT3RB5rzVCJJMTfskFZLD36npN5DDxxLFMs8L9cJCdB8
	yd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7ehyXh9sqotNCVqVDMx8XOnbOoeRP/y5w4DkPX5wR20=;
	b=bewahrr1sNcVVT/Af9psJCHX60pinVIBSwVHPvnwG1b5mzShWAPSVgLsj7LLTljtTP
	zBnT//ZvfQoPmxBUeE7A89D8356uwT60f4opa2P4kY3dGXPcyeBsySVHwSjU1wi4YxEO
	tjZ2ixKgVxL7vG/oB3AmBftYIBJeGD2Ft3o0goQOReMbSM9DooobCO9huAZ9FcES0BTh
	Im0IHWy+NogBDJraJ6BoLW8dOo75pfug+ZibQPhwhDbd/jn2XeVgxkpyhLOsjVMKfyzl
	tgYT8Si+8B9Hud7ogX7tzXM5xZ1V4/tiXbLMB8GeUTwSsjJhvtk0kkWfbRs4LIZvql8m
	KntQ==
X-Gm-Message-State: APjAAAUvwYn4NmV9PZTkO3KUwJhxGtVBK0UVj7YAkIMHXitAq1vdbvrB
	jKD2nPi4nPxHdl4+khDgoTujsuDa
X-Google-Smtp-Source: APXvYqwRZFX5aEAQqrYbondxE7+KT/8Qmu7kwdWSOvd+Qi5811EGwjFtjidZ361g3gXstZFb40zYgg==
X-Received: by 2002:a17:90a:9b87:: with SMTP id
	g7mr30485780pjp.64.1573961722675; 
	Sat, 16 Nov 2019 19:35:22 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:a049:e40e:fb9e:4d3d])
	by smtp.gmail.com with ESMTPSA id
	71sm16666402pfx.107.2019.11.16.19.35.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Nov 2019 19:35:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Nov 2019 19:35:15 -0800
Message-Id: <1573961720-4099-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573961720-4099-1-git-send-email-akuster808@gmail.com>
References: <1573961720-4099-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/7] oeqa/manual/bsp-hw: remove rpm -ivh test
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
X-List-Received-Date: Sun, 17 Nov 2019 03:35:21 -0000

done via runtime

def test_rpm_install(self):

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 28 +---------------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 18cec22..2ab7dda 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -1,32 +1,6 @@
 [
     {
         "test": {
-            "@alias": "bsps-hw.bsps-hw.rpm_-__install_dependency_package",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Get a not previously installed RPM package or build one on local machine, which should have run-time dependency.For example, \"mc\" (Midnight Commander, which is a visual file manager) should depend on \"ncurses-terminfo\".   \n\n$ bitbake mc  \n\n\n",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Copy the package into a system folder (for example /home/root/rpm_packages).  \n\n\n",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Run \"rpm -ivh package_name\" and check the output, for example \"rpm -ivh mc.rpm*\" should report the dependency on \"ncurses-terminfo\".\n\n\n\n",
-                    "expected_results": "3 . rpm command should report message when some RPM installation depends on other packages."
-                }
-            },
-            "summary": "rpm_-__install_dependency_package"
-        }
-    },
-    {
-        "test": {
             "@alias": "bsps-hw.bsps-hw.boot_and_install_from_USB",
             "author": [
                 {
@@ -1283,4 +1257,4 @@
             "summary": "Boot_from_JFFS2_image"
         }
     }
-]
\ No newline at end of file
+]
-- 
2.7.4


