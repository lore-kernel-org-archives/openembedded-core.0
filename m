Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 24C956A8D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 16:44:28 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y10so715550wgg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 09:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Yi/7VXJofVH3hYJe51kqbebUvZDIWtfkxM6AKTNRoyI=;
	b=Fm0u7ZM1yjqiRGujDMM0joBEvVvAiGQuqkKbmdcb5pwAyz0xeF7sK3j/YshykjrR9C
	RMvLVvbNbAp+Nj06DeZfEZC1VzPR3rIOYh1lZHwaHkt2Go6RBmt6pXTFiuCid2PYT3G4
	wCiW9g07/RTARgnqyH32FwRWbyBroE5lphCIy8whUwxkRneRoOYUahoADvzXtZlQpndj
	8//yvwDr7+9roj/3hm2bdHDo1wjYy+cxr13M47pbYsux37UkApyCg7WjyilLj9A923tV
	qTzClryZA89QmBP4/Ug3eBaeNp/vOq8g4cEpelH6nim5vMdGWkEErpZSndLdyk5ETSH0
	foDg==
X-Received: by 10.194.108.6 with SMTP id hg6mr6983757wjb.50.1372351469521;
	Thu, 27 Jun 2013 09:44:29 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id j20sm4719162wie.7.2013.06.27.09.44.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Jun 2013 09:44:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2013 17:40:49 +0100
Message-Id: <1372351251-13677-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmd/QnbbgIhgTilM1Sl4b3VNdTpJ7e5oLtIIbbdw2XZjz1Nco8MKrKybkCfH08xV2oPTFVE
Subject: [PATCH 1/3] clutter: fix out-of-tree builds
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
X-List-Received-Date: Thu, 27 Jun 2013 16:44:29 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index f51c740..edc6081 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -42,5 +42,5 @@ FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
 
 do_configure_prepend() {
 	# see https://bugzilla.gnome.org/show_bug.cgi?id=661128 for this
-	touch -t 200001010000 po/clutter-1.0.pot
+	touch -t 200001010000 ${S}/po/clutter-1.0.pot
 }
-- 
1.7.10.4


