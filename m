Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 45C826C17B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 22:58:04 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s11so1898873wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 14:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4+ZC3TMrvAWLRxBts30qQhjRjvHFTd8qdWEVZmGi+2c=;
	b=gsoUQDGDCeRkTS5sJB28dAQfpxFwRfUVREDx7PeOd8nKrT0Sq+0DJDMbHggDsr6zip
	ZlMUcQ/yYhgFrywnZbG4CPj1ld4oc3IPtxUYIZr8udPISSdT1HHtyp2ikUJ3tNu5csaH
	V0m+7TxqLM2aPM6EyjOM++NzRED0xNLEc0LpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4+ZC3TMrvAWLRxBts30qQhjRjvHFTd8qdWEVZmGi+2c=;
	b=mdCLui1QLiVHs54d8ugzZWvuSJanjhqzCb74t9ohenQZPzZvV8pZewi/bq+4y7JaDf
	95mKqndtqz7VwpduKLaw8O6GSnnG6opH8dlKU9+eJ/S9P+qQpGfY+lv+V4opDlgWJG/X
	eldQVSVt4OtFq6TsqO524chyH/wiA5Y2Ifkz0wE2qbMTsrF2cKd83eVDk/FlNlxg8hwu
	2SzF2VSixxGUNxwKFaOTZvOPGCXRMl7FHZ9z3Ita1XrlYDXDPOeziGLTy/m8Dt4KilXj
	1by1bD0ifSQUYaSX3gWWeTSCrZncq79g0QzGmIWVhB9XozB4KhZAOjGxw2p1nTDNlEYJ
	VPSA==
X-Gm-Message-State: AA+aEWY7gSv1zXL/k/6Omn0lmnS1nWcyU+bxFnccJOXVXYp8It9ZuDiM
	r0fbk8WAoutOXANeWGzhbwD8ZPVDGLk=
X-Google-Smtp-Source: AFSGD/W9H5Yp/BBWf7O94JzifE4xk7/Rq+y9s3bA8fGmcffc19o3Yfanfc/E8gbKIrgnTm4i2ZGg2A==
X-Received: by 2002:a1c:7209:: with SMTP id n9mr2553455wmc.5.1542495484520;
	Sat, 17 Nov 2018 14:58:04 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l15sm12658470wrw.4.2018.11.17.14.58.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Nov 2018 14:58:03 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Nov 2018 22:57:53 +0000
Message-Id: <20181117225753.15733-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
References: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 9/9] ofono: upgrade 1.24 -> 1.25
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
X-List-Received-Date: Sat, 17 Nov 2018 22:58:04 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/ofono/ofono_1.24.bb | 9 ---------
 meta/recipes-connectivity/ofono/ofono_1.25.bb | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.24.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb

diff --git a/meta/recipes-connectivity/ofono/ofono_1.24.bb b/meta/recipes-connectivity/ofono/ofono_1.24.bb
deleted file mode 100644
index be7d9ea85d7..00000000000
--- a/meta/recipes-connectivity/ofono/ofono_1.24.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ofono.inc
-
-SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-  file://ofono \
-  file://use-python3.patch \
-"
-SRC_URI[md5sum] = "be24e80f6551f46fea0c5b5879964d6c"
-SRC_URI[sha256sum] = "9c8e351b7658f4b43f9a4380b731c47d2d7544a89987c48c3f227e73636c87ae"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.25.bb b/meta/recipes-connectivity/ofono/ofono_1.25.bb
new file mode 100644
index 00000000000..3688b9d2fcc
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.25.bb
@@ -0,0 +1,9 @@
+require ofono.inc
+
+SRC_URI  = "\
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+  file://ofono \
+  file://use-python3.patch \
+"
+SRC_URI[md5sum] = "31450cabdd8dbbf3f808ea2f2f066863"
+SRC_URI[sha256sum] = "eb011fcd3080e93f3a56f96be60350b6595a8b5f36b61646312ba41b0bcb0d75"
-- 
2.17.1


