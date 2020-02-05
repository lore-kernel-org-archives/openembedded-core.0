Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D73AA61081
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 02:42:48 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m10so3447432wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 18:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uLleXJr2BuVUv561WyNIw2uCklGz4dK46sFscMQZjY0=;
	b=OJZRgbxWG96mgdrGxZrXzCsPY3usBCZx1Bm0Oh7F4v3LO7nmlpWRxiMh+eSvWWndRI
	ZAf5STldBZ0/PstjRTsRrq8b/YahjS4CVIc59q4WJfFptkUCmqrkUEezqOedOAbo/UB/
	mLsKL05ugbQx74Y+cmGLh4Rzm1sX/AgkzsBGvz6lfN0KyW3ljmZ5TMUiEpYOfAgl4eDS
	meHpcIrduJGgdArs57Xh5pInWN19ie9AFmGPL4MZVzLkdMllZ3qsZtMWx88gO/86nX/h
	0JTSVMmejwcoBXZg//LZiIOWa2zMiok5kEgMaCEdXC553HVVJlhU1Ii8zjc3VlcBl7Ys
	84Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uLleXJr2BuVUv561WyNIw2uCklGz4dK46sFscMQZjY0=;
	b=gPa6v6qzYhACHTHYtduvcdY2kLBpe8iSS30hJpZSuNYjNSDIP6hEugGabCv/jsXn0u
	LtPV3jDAqCCovTg7z0+V3Gwq0KjS1zhEXJdmgPLec7tQuu6egR5xtIR+9h4/5PB1jR58
	EGci64lqE7cPo0aGmmXLOzlTR0WhMy5KibVzVsbw/KXlJjsUU4haI5qRjSQoSlD7vf3G
	25jLEBIkqX6SMOqlkVIfkxZFRmAy0zJ+ryWqZubtH6EZdOYtwxN0UBxlsTljMBABVfMe
	qUzf70Ud5VxCE4nYvo0KwC266HzVqSa/X8tLcJO6iUjyLrIP6bPNQDHbyaiCoa75POR8
	HmOg==
X-Gm-Message-State: APjAAAXk88HBF20Dh1QvKuNzOG044txZRG6EbD01gMov807eByEbpMNP
	etPnBgzC6UgwMfsIwFpnlFiV5tCY
X-Google-Smtp-Source: APXvYqylszSFwThns6Im7USW7O9OOA5Sr3mOWc7HHuV5iIJPJZnYA+EaaTxufWPmfYYmcoEO3GXMZg==
X-Received: by 2002:a1c:4d08:: with SMTP id o8mr2467224wmh.86.1580870569261;
	Tue, 04 Feb 2020 18:42:49 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	k8sm24699143wrq.67.2020.02.04.18.42.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 18:42:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 03:42:41 +0100
Message-Id: <20200205024241.27828-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200205024241.27828-1-Martin.Jansa@gmail.com>
References: <20200205024241.27828-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] kern-tools-native: use more common S value and oe_runmake
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
X-List-Received-Date: Wed, 05 Feb 2020 02:42:49 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../kern-tools/kern-tools-native_git.bb               | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 8053483355..28080e510f 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,16 +11,19 @@ PV = "0.2+git${SRCPV}"
 inherit native
 
 SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git"
-S = "${WORKDIR}"
+S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
 
+do_configure() {
+	:
+}
+
 do_compile() { 
 	:
 }
 
 do_install() {
-	cd ${S}/git
-	make DESTDIR=${D}${bindir} install
+	oe_runmake DESTDIR=${D}${bindir} install
 }
 
-SRC_URI += "file://0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch;patchdir=git"
+SRC_URI += "file://0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch"
-- 
2.20.1


