Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id E363F795F3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:48 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id k14-v6so8444107edr.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=da3pT/ma1xKhaW5Mg9mdrjCENGHaMd1QDlIsh4VsUdE=;
	b=P6AXOk83/oM/aVS6R+BMizDhFeIgBE3kcnV1zT5l5SFGcrKxFpfSU/ANFnWiwOKxvt
	NU+kfEVgXupY87CoB07nQ2qB7/D1PpPNUIwsaT3eB0NevyzpuXWFTW8/9M4RLHK8h95q
	rwCr4lcwvNN8Zh9QeLzqhxTso2HGkk5MHh5N9OI/ZfbKWtP56/cNTe00VOUgsiPkwr5e
	+c4O1jXVD3pLB2PjIIIC+1+zK4WSBBL4yrwsAWfEanYk8yaOwABHvJAKTum7qlN8hQnD
	uTsAB+Gop/8Gy1h4iqK75chTiWGu/MCRKI3dsUSuEZNVJ5/XXuLGgKClLiz9O896ZCyO
	gAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=da3pT/ma1xKhaW5Mg9mdrjCENGHaMd1QDlIsh4VsUdE=;
	b=WB1lzXRFKN0yrv6q3nsbxApzz9+9atglmvrRdbi3n6jXXfbamUI8piPJCC1TqGAHxD
	gpfDE/IpZfXWAO4cIdkeEjYcGXZivolP8KQA3uWLKjTaH2c1xhyX0wUTlpyMH7ZVHjPI
	Yu6JX8GxVUmopD4BBgqmPSwUk1jP4BbXPn4kQ4uURc7xPUkJJqo5dphjaKXhwYR+Iu0E
	YwWBIxN4z7vpA9FgU/hVwFjpX5bLm2nLbBsFdDPf6cYkoWiaOaS/YFPXWrCmUE+fY29B
	txFC7o7hRGLX8p7d+LmuXhzjLpMl6QrudW9kqc2ob4FyUy5SKgAFnOYIq0oG5HHBmF2j
	rT2g==
X-Gm-Message-State: APzg51ARQM4CfrGYaAXvZ/4Qv2leTbOCJtyVZPvMdqYUBKs5hHTcN2H1
	sXFXPucF/B6M3KbQTxq7ajQh5j40W/U=
X-Google-Smtp-Source: ANB0VdZYI6e64yIJ7euyW5TEqj3HoY28tSgr/KhfzPXG5wgMWAPh68479fPU5klyhreB92WX1ECv0Q==
X-Received: by 2002:a50:96c4:: with SMTP id z4-v6mr2875621eda.14.1536229789499;
	Thu, 06 Sep 2018 03:29:49 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:19 +0200
Message-Id: <1536229770-29600-10-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 10/21] iso-codes: update to 4.1
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:49 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/iso-codes/iso-codes_3.79.bb | 19 -------------------
 meta/recipes-support/iso-codes/iso-codes_4.1.bb  | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-support/iso-codes/iso-codes_3.79.bb
 create mode 100644 meta/recipes-support/iso-codes/iso-codes_4.1.bb

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.79.bb b/meta/recipes-support/iso-codes/iso-codes_3.79.bb
deleted file mode 100644
index 68d8fdc..0000000
--- a/meta/recipes-support/iso-codes/iso-codes_3.79.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "ISO language, territory, currency, script codes and their translations"
-HOMEPAGE = "https://salsa.debian.org/iso-codes-team/iso-codes"
-BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http"
-SRCREV = "c1d5dd96b33cb815ebc21d2708bc045b1545249d"
-
-# inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
-# are inhibited by allarch
-DEPENDS = "gettext-native"
-
-S = "${WORKDIR}/git"
-
-inherit allarch autotools
-
-FILES_${PN} += "${datadir}/xml/"
diff --git a/meta/recipes-support/iso-codes/iso-codes_4.1.bb b/meta/recipes-support/iso-codes/iso-codes_4.1.bb
new file mode 100644
index 0000000..1761ded
--- /dev/null
+++ b/meta/recipes-support/iso-codes/iso-codes_4.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "ISO language, territory, currency, script codes and their translations"
+HOMEPAGE = "https://salsa.debian.org/iso-codes-team/iso-codes"
+BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http"
+SRCREV = "164802d5fd8c7a8167816fd86a62b286680619f0"
+
+# inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
+# are inhibited by allarch
+DEPENDS = "gettext-native"
+
+S = "${WORKDIR}/git"
+
+inherit allarch autotools
+
+FILES_${PN} += "${datadir}/xml/"
-- 
2.7.4


