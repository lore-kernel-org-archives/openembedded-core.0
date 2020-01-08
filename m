Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id F038F7FE96
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:21 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p9so2485471wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+3vigbIjhwtfhRG6sNtjcSKDqGa2J55WJ5rma/JNxqE=;
	b=fHli8m0gbrzaOybR35P5GD46qkUnqVLb/c5pL1JWzAYzEwDgPJUo3b8dPneMAXucUk
	xGIxqiVPMo+9p3iErO4txkCP3WUMEa4kJGXUW8UELZ48EEgelklsNik/1hj+3Yrf+ZX7
	ldPdZkpgN4XmvWyzS56CcymauI82drxvREe+RFv6GuWDZeA8FjMiTLGzp2MydB+txP1z
	QgoJ4Isqx8Q+ZFyutcQ3h4mJYbgCa5t9n9mxCON5Pmpe4lzr9+jh0hrshsqJVtBZ2PeW
	5c8X1Qwen3NJJqpkYX4S7toolmCeAnw74JvZZ8BrFwIS3vBO+kU+PwUmnxtwkSyOkj9k
	8frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+3vigbIjhwtfhRG6sNtjcSKDqGa2J55WJ5rma/JNxqE=;
	b=OcgSUTfU7OIPQUR0PEga7A/kvmPtm+QMf5tO/IgYuCnUH2X5bgEf8repYhcep1K6pl
	yZUBNryNsNX2LWTIpf8W0sMoPX/dz4bRryVRqkLaXwKICJkOQ1dcYuiG42L9fd46rB/n
	MIR3NmY1c4mdIdXjosx06sgy5TUCXACo9M6QM/mcHq9LvzQ3x2bolJOmLrUtVEnDc2D3
	4lEdVdWroh/UUFewrB0cn9/WcgjZ81M2IUlvm6wZ4b8zf2OWqHtXyVFutGf2vdiPWWKJ
	YMYkfTzEZoMF8S/e3oAzY9LQQ21LUbCW7/x5ay8z5PSCH/AtTNuA83Bc64hQhZnHSfgH
	11zw==
X-Gm-Message-State: APjAAAWjAGWDqHrXD4hJLuwm5pv7sQ7eemRYjr3UaH6y9qFVkUNBbgfL
	B3I/w3OGJO6eejMvOY35jIwDpiO2FnU=
X-Google-Smtp-Source: APXvYqxTw3IwaUnjA4rFeJGlu3M0Wx3JINky88aC14cfdDlNb9qfDwcYxMkBob/FdN5iGDCXqrJhig==
X-Received: by 2002:a1c:dc08:: with SMTP id t8mr4054632wmg.139.1578490102512; 
	Wed, 08 Jan 2020 05:28:22 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:47 +0100
Message-Id: <20200108132759.95603-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 16/28] systemtap: remove the unneeded patch
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:22 -0000

As the problem is now fixed with a backported patch to
gettext itself, the patch is no longer needed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-LINGUAS-drop-the-polish-translation.patch | 27 -------------------
 .../systemtap/systemtap_git.inc               |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-po-LINGUAS-drop-the-polish-translation.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-po-LINGUAS-drop-the-polish-translation.patch b/meta/recipes-kernel/systemtap/systemtap/0001-po-LINGUAS-drop-the-polish-translation.patch
deleted file mode 100644
index b2114abc379..00000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-po-LINGUAS-drop-the-polish-translation.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b9ba80a22bd4ac3438ad38819cbe550ec9e8a3f8 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 16 Dec 2019 13:59:47 +0100
-Subject: [PATCH] po/LINGUAS: drop the polish translation
-
-There are no actual translated strings, and newer gettext (0.20)
-fails in this case.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- po/LINGUAS | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/po/LINGUAS b/po/LINGUAS
-index 6f927b706..aa01eb56e 100644
---- a/po/LINGUAS
-+++ b/po/LINGUAS
-@@ -1,5 +1,4 @@
- en
--pl
- fr
- cs
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 85c204ed238..116e83fe0ff 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -7,7 +7,6 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
-           file://0001-po-LINGUAS-drop-the-polish-translation.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
-- 
2.17.1


