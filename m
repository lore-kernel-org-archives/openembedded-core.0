Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id D0CA9601E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 16:49:57 +0000 (UTC)
Received: by wizk4 with SMTP id k4so86839707wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 09:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QMi8GvfB810geLbKRi5Uz+OKdyMaEuewOxY0/iIe0BU=;
	b=Wf2QeD8tUA/Fdy4rMBXqLSEAXk5ZW75mIpm8Y0sYKVxiuES6MaSE9hSOhyR3zTAcab
	Nb4KqCef5ls2DvcWC1IZ9xj3uCQmxqXD6XxgMZtdV+H5blVjVDTiTST4H0OLVdVPxl6+
	kVBC/ij3XIySHSC0yxLMYOU8aW2ybhujBX36bDRdZWPmFKG7HbU7LyegOYIxeXjxybmC
	W1Qg3hTn7I7Qg77Wd96y+dDk1C1F8pVZXQyG0NRPMIcmscUXJrtCgQ5oc/XlzmC19klJ
	reLJzhPYsgCI0YOAt39HKoMiI3nzm1HW9iaBRhxNubwneTUhxVtJ7+tP8sLRPkNgAK/Q
	PCYQ==
X-Gm-Message-State: ALoCoQlxvH8OiUcAxbbWqYiKSR7kwG+fsExNginHM1iDWJ7vzWNqeS06ikDfWZfugm+lUTpi7lMP
X-Received: by 10.180.38.70 with SMTP id e6mr23235792wik.91.1431967798587;
	Mon, 18 May 2015 09:49:58 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id y7sm17725705wjw.16.2015.05.18.09.49.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 09:49:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:45:22 +0100
Message-Id: <1431967531-25163-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
References: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 04/13] libxdmcp: upgrade to 1.1.2
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
X-List-Received-Date: Mon, 18 May 2015 16:49:58 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/{libxdmcp_1.1.1.bb => libxdmcp_1.1.2.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxdmcp_1.1.1.bb => libxdmcp_1.1.2.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb
rename to meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb
index 3529ead..7471b9a 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb
@@ -22,5 +22,5 @@ XORG_PN = "libXdmcp"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "b94af6cef211cf3ee256f7e81f70fcd9"
-SRC_URI[sha256sum] = "9ace6d4230f9dce4ed090692f82f613253ada8f887b23b3d8ff3dd4e3a7c118e"
+SRC_URI[md5sum] = "18aa5c1279b01f9d18e3299969665b2e"
+SRC_URI[sha256sum] = "81fe09867918fff258296e1e1e159f0dc639cb30d201c53519f25ab73af4e4e2"
-- 
2.1.4


