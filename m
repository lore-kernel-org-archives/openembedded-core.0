Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2906D6ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 17:25:29 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id hq4so2095231wib.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 09:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cO8/8ahxejr2ndwU9exkb3lJcMIFl/GQiPvM1rRRb0I=;
	b=VzHvPgSR4No81VW2dNVv5z/NoooC4LHab3A5grhNLUVHiaRvsiacKDxE5wDBOTKdH+
	wO3t2g+5qkOAdv9soWKn1UTThycvH1T6uA0ktMweN1ywsmHkKu+pDUKVdutRCnnwc3JN
	NcE4PqcNwbFldVVjCaHqmg83MHe/rGtWzPVD/Kdwojc9nSFn3HsW/8JfYYjaaQXqSMTl
	kPqC1Ebf5JeUIKAIryyrlkrUPloUisPgzaMUssuCG9Lii7DocEqj65nZn/N4hjCeg83w
	lH4NVlCN3ULy42Nf29N7Tcs8PTPz+wYOg59nc3v4C4ZEzqym6wGdWaQlghkpqhkdYn6j
	YGWg==
X-Gm-Message-State: ALoCoQnv/4D66lO1ZbMrQQ6ncHkzUAcrfTvv1XhIKrTbhCCDUBJQJAXVwDb/sl5FYXwBVS6MYnXi
X-Received: by 10.180.102.97 with SMTP id fn1mr13021550wib.32.1384190730319;
	Mon, 11 Nov 2013 09:25:30 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dz5sm12165437wib.7.2013.11.11.09.25.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Nov 2013 09:25:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2013 17:25:23 +0000
Message-Id: <1384190723-21986-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384190723-21986-1-git-send-email-ross.burton@intel.com>
References: <1384190723-21986-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] clutter-gtk-1.0: upgrade to 1.4.4
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
X-List-Received-Date: Mon, 11 Nov 2013 17:25:30 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.2.bb |    6 ------
 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.4.bb |    6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.2.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.4.bb

diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.2.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.2.bb
deleted file mode 100644
index 64eb70c..0000000
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require clutter-gtk-1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-SRC_URI[archive.md5sum] = "842601b584daf4447a46799a4ba88df6"
-SRC_URI[archive.sha256sum] = "dc3ec6e90bc742c8a68ed7fa4c0d25b9b376828f1a7f013c363fbaf14f3a6974"
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.4.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.4.bb
new file mode 100644
index 0000000..37a035c
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.4.bb
@@ -0,0 +1,6 @@
+require clutter-gtk-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRC_URI[archive.md5sum] = "ef50b52ffc2a18704eb62f13dd8d6198"
+SRC_URI[archive.sha256sum] = "bc3108594a01a08bb6d9b538afe995e4fd78634a8356064ee8137d87aad51b2e"
-- 
1.7.10.4


