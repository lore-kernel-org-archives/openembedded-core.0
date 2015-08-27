Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id C20B576DE5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 18:47:42 +0000 (UTC)
Received: by wicgk12 with SMTP id gk12so836809wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 11:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=tDS3s3UGEkWVvdKaWBEyL4/VIPxOtftF2OHJgZIxukA=;
	b=hiPfhvhYPOiI+AcfwB7lZ7Np9X1Ezrv6j8BFLxCy9YUwzuh7uP+JQhXAnYsq2gxQDv
	NZaST1JO369R5s/tkUi9WDVGs3kAwf7gxil6GWS3Csj6u3DfjeMxgMkVPwO/1EuSI8eb
	LqfKPWpEV0OJSCD+N/OQGMXV5++4e2otEUVws57MzXAJBQkeObC+BnKNroPjFAqje5KY
	KuJ+LxIGUiTKeDgIzcZBhFIHg1/qWlGAqkwthNxtXRcm1ucC06XATLtq0VJSQbdIC4j1
	xai4bLUTh56eweaG/uNB2ERavDwWdYGrHDHCt9sIg8ByGjCE9qC+j+QldViAaN2+KnED
	VTVQ==
X-Received: by 10.195.11.3 with SMTP id ee3mr6622560wjd.89.1440701262874;
	Thu, 27 Aug 2015 11:47:42 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	ul1sm4326362wjc.30.2015.08.27.11.47.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 11:47:41 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 11:48:26 -0700
Message-Id: <e427971a8ab319670b5c76c7a54b42cefad1076f.1440700983.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440700983.git.chris_larson@mentor.com>
References: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440700983.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440700983.git.chris_larson@mentor.com>
References: <cover.1440700983.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/5] iw: obey our target path variables
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
X-List-Received-Date: Thu, 27 Aug 2015 18:47:43 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-connectivity/iw/iw_4.1.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/iw/iw_4.1.bb b/meta/recipes-connectivity/iw/iw_4.1.bb
index 556af2b..8e27862 100644
--- a/meta/recipes-connectivity/iw/iw_4.1.bb
+++ b/meta/recipes-connectivity/iw/iw_4.1.bb
@@ -18,8 +18,12 @@ SRC_URI[sha256sum] = "14bfc627b37f7f607e4ffa63a70ded15fa2ea85177f703cb17d7fe36f9
 
 inherit pkgconfig
 
-EXTRA_OEMAKE = ""
+EXTRA_OEMAKE = "\
+    'PREFIX=${prefix}' \
+    'SBINDIR=${sbindir}' \
+    'MANDIR=${mandir}' \
+"
 
 do_install() {
-    oe_runmake DESTDIR=${D} install
+    oe_runmake 'DESTDIR=${D}' install
 }
-- 
2.2.1


