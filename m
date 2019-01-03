Return-Path: <roman.stratiienko@globallogic.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 97B7972EB7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 13:38:06 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id i26so23208358lfc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 05:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=B7CR3KxoSqyLvbli3cktuOPXr5ycVAbfGWVnwArHbaI=;
	b=T9ha5nFCqXZAJm+jei1jrgQ8hdppuJPkyo3eAaXE8uxKW9D19DCZqbYRo605aCI+Pa
	kRLVK3Cl79hN7EJ9YkZVssIqlVeUynZWYD5Qzs0b8k8oGdVAalW5vt69Zx7nW3e1TbrL
	m5aocr+wA0WYG/p+31SqpUA8Lr+6Xp1ZM5bdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=B7CR3KxoSqyLvbli3cktuOPXr5ycVAbfGWVnwArHbaI=;
	b=A+GdQK397pV/RoawlT9dApwYtxFfUptoNlCdMs6XtjgBxbQzAgqHgXJpsol26hVkDy
	c/ZgGqe1j7I+6XZzWiqkqjoPooPtBTiADnx+TO99yRA83gqnx3pTlQmD3O79C+MOvkCF
	+28RbmXLgOx+ylTRLmTn1CKGAWERrXLUtCXgXXKtAbPuDSOyxHW3AYoTKhkCKdNGYlv1
	dsxvsvTfS31poX4+r8QSlOUCYKBY25AxdDN5Lys9W246ufbW4+EDgMhDEqKaT9uJGfc1
	eQq0da8lKpqY//XNTUZmV9vGI2tEK/SFIUA+Dq1HFN/hRB7Dnzj0EG2UsMbrsmYta9MF
	Q8eQ==
X-Gm-Message-State: AJcUukclBvreuDWRvFkZmWenadGSQwYepYsMx4HDc5YTnQimoKr/F0JP
	ECDSbwVQygkVR2VPNwxSas5deXyaITZJFg==
X-Google-Smtp-Source: ALg8bN4ckCrGK30sjIkr+zqqoiM9QipdeDQGEhS/8GyKpwHSGicUv6/ku0eKi/4riPYwbXy8ce+31A==
X-Received: by 2002:a19:c413:: with SMTP id u19mr16931708lff.100.1546522686522;
	Thu, 03 Jan 2019 05:38:06 -0800 (PST)
Received: from roman-VirtualBox.synapse.com ([195.238.92.107])
	by smtp.gmail.com with ESMTPSA id
	q10-v6sm8177519ljj.3.2019.01.03.05.38.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Jan 2019 05:38:05 -0800 (PST)
From: roman.stratiienko@globallogic.com
To: openembedded-core@lists.openembedded.org, raj.khem@gmail.com,
	alex.kanavin@gmail.com
Date: Thu,  3 Jan 2019 15:37:56 +0200
Message-Id: <20190103133756.13355-2-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2 2/2] eglinfo: add wayland receipe
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
X-List-Received-Date: Thu, 03 Jan 2019 13:38:06 -0000

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
---
Changes since version 1:
Added maintainer for egl info-wayland recipe
 meta/conf/distro/include/maintainers.inc            |  1 +
 .../eglinfo/eglinfo-wayland_1.0.0.bb                | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-graphics/eglinfo/eglinfo-wayland_1.0.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8e6648d0f8..8d6eb1afc0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -163,6 +163,7 @@ RECIPE_MAINTAINER_pn-e2fsprogs = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ed = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-fb = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-x11 = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-eglinfo-wayland = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-enchant = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster808@gmail.com>"
diff --git a/meta/recipes-graphics/eglinfo/eglinfo-wayland_1.0.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-wayland_1.0.0.bb
new file mode 100644
index 0000000000..87a131aa7b
--- /dev/null
+++ b/meta/recipes-graphics/eglinfo/eglinfo-wayland_1.0.0.bb
@@ -0,0 +1,13 @@
+EGLINFO_PLATFORM ?= "wayland"
+EGLINFO_BINARY_NAME ?= "eglinfo-wayland"
+
+require eglinfo.inc
+
+DEPENDS += "wayland"
+
+inherit distro_features_check
+
+# depends on wayland
+REQUIRED_DISTRO_FEATURES += "wayland"
+
+SUMMARY += "(Wayland version)"
-- 
2.17.1


