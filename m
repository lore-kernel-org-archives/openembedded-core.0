Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 505307E66F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 11:26:30 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 7so7443583wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 04:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wUBHxkrlRmGKzm9L7YZHg5PANsdkdsOexbuCPUbK1Yc=;
	b=kX4td0CCY7JkEwOZUsflDKZD+hm/OOyKmpAv1r3+OZrIAF7IBt71O6USBF8LyXH8VS
	sbiBvMuvpAYVr+GHYRiIpsl5HYFyANXCxNmC7GCKS2rE4iSlB255/h7C7tzYKb3o5iFY
	kM+fxG7N/4IDqV+LK2F+TOVXzcmzf/aRbG3hpDjC71auQDTt4Nqptk1atXpNlS36svUf
	vajtgzL59eqt/HFP4CcQCyKq68CFU+QpVRrAtGJNeZ7zuKQ8CpqbjwL5LjBZSH8PJlzm
	JykGTjosZrEv7OQWaZsWARMcneL9K06+Dg5VPW0Ojx5vURjaCEc9e//uRSO9U2WReDzF
	bqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wUBHxkrlRmGKzm9L7YZHg5PANsdkdsOexbuCPUbK1Yc=;
	b=c44lOK2CJxfapo8S1HL1FBhxONwa65JMffwYoZcTABTbNINXFqq0ENrFqxjh9Th0nX
	lKh43BUAB9Xmgm9x8g5TDHVgxLxnXj0xhohAGjdKAhiD6PzYgJfGBTpTxm71h/HJ7J2D
	oHFv9ZoYqrrbw8sDheJ2PQI+Ulnakg7hHpwaAZ/6gaTfLRhPrJkL1vDw+xIT7/kBfSNF
	BgITpWGmj2EsT4Or/hmnHHUgUHcMsopkBBCRRfZ3a8DwOx/lMtdTWjKAKee9xDsi0IcO
	NHCNzuEXXeMOROo+MU9Uv0ukCFCH8P3IKHvJebOWifpLwCVhvawLr74jGPPX3g4AuAQD
	SVbw==
X-Gm-Message-State: APjAAAVUcpvr8rImBPZ0YKBiu9wdEPlBOl65/Ie4G4h+QP6OKoJTsBnF
	eaUK4DfhaUNTd97xmSCWn1QMiVzxV04=
X-Google-Smtp-Source: APXvYqw8k3pe8qz1wJTtI4RoWgKap7C7+/1GAtAWxxgaKRyBQq2baTs8PcnhLx7xSV46elRkysL2Bw==
X-Received: by 2002:a1c:7405:: with SMTP id p5mr8654969wmc.80.1559388390648;
	Sat, 01 Jun 2019 04:26:30 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y2sm16270606wra.58.2019.06.01.04.26.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jun 2019 04:26:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jun 2019 13:26:21 +0200
Message-Id: <20190601112623.80424-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190601112623.80424-1-alex.kanavin@gmail.com>
References: <20190601112623.80424-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/5] libpsl: fix the gtk-doc 1.30 build
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
X-List-Received-Date: Sat, 01 Jun 2019 11:26:30 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...k-doc-do-not-include-tree_index.sgml.patch | 28 +++++++++++++++++++
 meta/recipes-support/libpsl/libpsl_0.21.0.bb  |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libpsl/libpsl/0001-gtk-doc-do-not-include-tree_index.sgml.patch

diff --git a/meta/recipes-support/libpsl/libpsl/0001-gtk-doc-do-not-include-tree_index.sgml.patch b/meta/recipes-support/libpsl/libpsl/0001-gtk-doc-do-not-include-tree_index.sgml.patch
new file mode 100644
index 00000000000..2331a766a16
--- /dev/null
+++ b/meta/recipes-support/libpsl/libpsl/0001-gtk-doc-do-not-include-tree_index.sgml.patch
@@ -0,0 +1,28 @@
+From 8691105e1808ec9b031b6c25f70204a0908ae9c1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sat, 1 Jun 2019 13:09:41 +0200
+Subject: [PATCH] gtk-doc: do not include tree_index.sgml
+
+gtk-doc 1.30 no longer generates the file if the object tree is empty
+
+Upstream-Status: Submitted [https://github.com/rockdaboot/libpsl/pull/137]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ docs/libpsl/libpsl-docs.sgml | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/docs/libpsl/libpsl-docs.sgml b/docs/libpsl/libpsl-docs.sgml
+index 1eca9a2..1c38dbc 100644
+--- a/docs/libpsl/libpsl-docs.sgml
++++ b/docs/libpsl/libpsl-docs.sgml
+@@ -22,10 +22,6 @@
+         </para>
+         <xi:include href="xml/libpsl.xml"/>
+   </chapter>
+-  <chapter id="object-tree">
+-    <title>Object Hierarchy</title>
+-     <xi:include href="xml/tree_index.sgml"/>
+-  </chapter>
+   <index id="api-index-full">
+     <title>API Index</title>
+     <xi:include href="xml/api-index-full.xml"><xi:fallback /></xi:include>
diff --git a/meta/recipes-support/libpsl/libpsl_0.21.0.bb b/meta/recipes-support/libpsl/libpsl_0.21.0.bb
index f545ba076fb..fc2417fc2fc 100644
--- a/meta/recipes-support/libpsl/libpsl_0.21.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.21.0.bb
@@ -4,7 +4,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5437030d9e4fbe7267ced058ddb8a7f5 \
                     file://COPYING;md5=f41d10997a12da5ee3c24ceeb0148d18"
 
-SRC_URI = "https://github.com/rockdaboot/${BPN}/releases/download/${BP}/${BP}.tar.gz"
+SRC_URI = "https://github.com/rockdaboot/${BPN}/releases/download/${BP}/${BP}.tar.gz \
+           file://0001-gtk-doc-do-not-include-tree_index.sgml.patch \
+           "
 SRC_URI[md5sum] = "171e96d887709e36a57f4ee627bf82d2"
 SRC_URI[sha256sum] = "41bd1c75a375b85c337b59783f5deb93dbb443fb0a52d257f403df7bd653ee12"
 
-- 
2.17.1


