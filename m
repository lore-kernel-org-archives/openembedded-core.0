Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 94D1F610AB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 11:26:37 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id s10so4413640wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mMLz8Fmcx9smEf3bnUX/Z2rrqGb9olA+Y0bgJ5gm6ls=;
	b=VxPukZ7KObXyjLWO+lhP+HavT1bmXR8vjnQO76xe6q/Tmw8MbvaIq8ZqJk7Zoo6QOv
	+DzfC44xp7p4T2aeS+BDFS9iiVv/TY7334HxMkVAQBbvcdZKMe5oIEb5xLRI05VnaLyg
	twhnevlTTDOu1yaQduiF67WyZkaUUYVSClD1rNrs9Pj8Av+Yc+Ps5qPjFI+RcsTfF63b
	pxVILbb49cP+XO8XLDq/HAk6zYNZaZxbXqKe0iQRmffWWOZm0mEmLYvlJC/3zeIitwSL
	ddNmkkJBHHCcRoQUWzywZVYLp0EkIWQdIad4xR7YFylT3eYJkyXJ3HZhBNVWxDQ4oaRb
	bwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mMLz8Fmcx9smEf3bnUX/Z2rrqGb9olA+Y0bgJ5gm6ls=;
	b=AzxrnKgMhZOPv7YP4OLto5qGBSynVv4g3X+13Yv/AoZTiKcDYirswR3WfsFpRbV3Ea
	Oor48ZqXFIpnj46K6w2pFK82peedt8Tfn8QbA5CYdE/Hl3knLdU28SKf1jgYAEIU8qt7
	Y8hc7FwS5inGPdX5UPTDGOZCN4HbSpwiOSquAco2J586Ujd/QIy5L6KDbQJm3Cf847tL
	kdLm+IAlAO+ekeeeYzaCGhpNfJGmyQq4linwYQGMf7FvzJf+9tLUlwul+rQy28TOruS/
	hqlxLmTV5rkRf0TMjs21pBX6So/t/BPo3Yqp2584qyB7tjamfkI4DrcGPrxaiCZe5skk
	7MIQ==
X-Gm-Message-State: APjAAAWWWqAkRDjP89r3gereyhkGFrqc//awthNMP12GBs5BRqqcflT3
	6PC7ff7ixz4m7PCD8lwXoLkrPEwa3Fg=
X-Google-Smtp-Source: APXvYqwlDlHhGS3x/CRXgXbMxUXQOU1DxkmcVo/kbwJn9EJ/Xp/91k0narQ8vKuqZcMgQTXwhbDBXw==
X-Received: by 2002:a1c:9602:: with SMTP id y2mr9628721wmd.23.1582370797864;
	Sat, 22 Feb 2020 03:26:37 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0C8C050F56E8630BE1AA5D.dip0.t-ipconnect.de.
	[2003:f0:7f0c:8c05:f56:e863:be1:aa5d])
	by smtp.gmail.com with ESMTPSA id
	h128sm7759405wmh.33.2020.02.22.03.26.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 03:26:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2020 12:26:27 +0100
Message-Id: <20200222112627.17589-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] webkitgtk: enable gobject-introspection for armv7a
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
X-List-Received-Date: Sat, 22 Feb 2020 11:26:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested with cortex-a9 machine

* before this patch -> no gir
* after: gir was built without issues

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index a1dba73c51..a48a976f94 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -124,9 +124,5 @@ ARM_INSTRUCTION_SET_armv7a = "thumb"
 ARM_INSTRUCTION_SET_armv7r = "thumb"
 ARM_INSTRUCTION_SET_armv7ve = "thumb"
 
-# qemu: uncaught target signal 11 (Segmentation fault) - core dumped
-# Segmentation fault
-GI_DATA_ENABLED_armv7a = "False"
-
 # Can't be built with ccache
 CCACHE_DISABLE = "1"
-- 
2.21.0


