Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 243557FE32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 16:00:23 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b6so11918506wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 08:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y01mHckQgZ3l7rTxfGi4Mqt1NCUbZVFFVXFzQsgRXjs=;
	b=hXg2fViLmIl1iNX2/dwm4IHnJ8a6pa0uR/cjKsZmXho8kNpdFoJ+tbBwt2mwy/PWzm
	sEhBfP+euR0H6Vbn8plzqomA3qe+JET9NKWhd4LQDRGkqlugVPVpfrAQyChHC0LT+W/j
	IyTNbu+j74a6S1RclUlkjgIpLM61WuE2iv+ZNXJ0D3aOZMfVUZ0LofA/yzWS8ixfsxoU
	A1nhL2v5lsFwD/5xQXXfkAXcZLNBrYx5VndubsUF9uaYePNIm1X/Cs3xYwXTGacxIr66
	JrW8HiHSiZpuMb9JKhZkRx4Q13t02NaSmIny6WCPCwFkg8/LHU71uNeRf7MKYZpg+E+0
	4zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y01mHckQgZ3l7rTxfGi4Mqt1NCUbZVFFVXFzQsgRXjs=;
	b=LRlJYbUvDXdV16W8q5EjVH4fPp1qeSDKt6BafDP2G8JTuhQsk7S/2opWBihUB+vyyB
	h5sIt06KE4lvAl/SwOKOrlmQkCz3oxUZ+DVcCmXSCqaRYuk9sYXgPImu6UxjAfEK5GbO
	bvU7IgTBP6Kge5Kf28AIQcsmtIiT7N/dqCS1IfonzTazrsBLs7dhV2no/5wgAW6la7VO
	z/RVPIQCbtF95aDmOuJiz/giGHuLGBpzxEmGWV74i7A81k6RCAFlS9OtDY8Yo/TSYfUz
	6fopWS6LqmkutJQF5TWVgFUE609gdWepnRP6jg3S7tIvK61IIqFYGbPINa4oac/u+d9E
	96tQ==
X-Gm-Message-State: APjAAAUD29X0xZNJ3m7L1NwQO+HZ/E/e1xovwi3YatMqz9tDhA1dS9At
	oM9DNYjUZiBtfj9ylJKiM/npIpTZHKk=
X-Google-Smtp-Source: APXvYqxJltO4OqxJ3g8xi5IOnR4QirMmrk3NcbCtoDrra4wkuFkpdY0eD6OchzzfclTPjk052tv8Jw==
X-Received: by 2002:a5d:6748:: with SMTP id l8mr38680313wrw.188.1576598423687; 
	Tue, 17 Dec 2019 08:00:23 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id v62sm3451864wmg.3.2019.12.17.08.00.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Dec 2019 08:00:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2019 17:00:12 +0100
Message-Id: <20191217160012.42152-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217160012.42152-1-alex.kanavin@gmail.com>
References: <20191217160012.42152-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/5] systemtap: fix builds with newer gettext
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
X-List-Received-Date: Tue, 17 Dec 2019 16:00:23 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-LINGUAS-drop-the-polish-translation.patch | 27 +++++++++++++++++++
 .../systemtap/systemtap_git.inc               |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-po-LINGUAS-drop-the-polish-translation.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-po-LINGUAS-drop-the-polish-translation.patch b/meta/recipes-kernel/systemtap/systemtap/0001-po-LINGUAS-drop-the-polish-translation.patch
new file mode 100644
index 00000000000..b2114abc379
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-po-LINGUAS-drop-the-polish-translation.patch
@@ -0,0 +1,27 @@
+From b9ba80a22bd4ac3438ad38819cbe550ec9e8a3f8 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 16 Dec 2019 13:59:47 +0100
+Subject: [PATCH] po/LINGUAS: drop the polish translation
+
+There are no actual translated strings, and newer gettext (0.20)
+fails in this case.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ po/LINGUAS | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/po/LINGUAS b/po/LINGUAS
+index 6f927b706..aa01eb56e 100644
+--- a/po/LINGUAS
++++ b/po/LINGUAS
+@@ -1,5 +1,4 @@
+ en
+-pl
+ fr
+ cs
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 116e83fe0ff..85c204ed238 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -7,6 +7,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
+           file://0001-po-LINGUAS-drop-the-polish-translation.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
-- 
2.17.1


