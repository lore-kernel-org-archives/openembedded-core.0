Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB1C60667
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:40 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p65so11584449wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=TZTeZGs5yzM/YxNFfCwL7bF5gT7ZfOAxQhR6Vslcwsg=;
	b=uYA8Oi2BJr7pabcSD58j7snFb5HWhfRsJQbrh/NWiuLjE01dlJ1dYWa3amCaOy9OvO
	SXvWTkPOKH9cdEuXBo29dYh84XHLJmw7KcEbRk5n2kc9DKyolY18txF1HK/GNfXeQgJx
	YdTfrOBhw65wRoWywXwFLkXZmkWAT+oPI0LaRqAYcoFKxoeT09ZDSyIpCkKluPt4XHgA
	4OsVQv7IS/+dNjPoAjhN/y3+9WKZjHgzYvwz+74CKE28vT/Tn28RGDhO9+tlqdNGDBLo
	w+iM3Dpi7rJg9UssrvmvhN6At1OB8TSd/HRr1XcPV6Spw21eGNCWYNJhDLbU5mztmFI7
	If0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=TZTeZGs5yzM/YxNFfCwL7bF5gT7ZfOAxQhR6Vslcwsg=;
	b=a1PZO7DhTX3TGA00B8/fjghtA7ffm2qzj14lU1TpO+1L86I9E957OuWLEntaw59YgC
	iGkgXPq8ZafEVUlhKp6WbEZks/kobx7jpTeQ+lpKD2AEVMIx1BbQEgHCaNG4eK1+feS5
	MZdDlDmZFsPLA4T+OJGpT1ZhOidhXOyvKBdPDK5Bu40lePKVQr2NUd3C7eOtdviaaQ0r
	nXXNyX7PHTrgcXCZs7tmSGt5+SAF53TJ8slakXwS+bm+Tx607CuPlLyi4B5VaC5q7PdP
	e8tEieyYgfgdmIf+WqY38Q5Z/QsnQIuSy34qqFmMZj6gjsDh1tqA7+7ErczNfVF1qukY
	YpPw==
X-Gm-Message-State: AD7BkJI2qjjX8sNqpFUjrDf24GreDGsxMt+/AzIWMnYH858Lw8l+lQ+AKRaiH29DWLRczA==
X-Received: by 10.28.132.17 with SMTP id g17mr14442197wmd.63.1457896480632;
	Sun, 13 Mar 2016 12:14:40 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:39 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:03 +0100
Message-Id: <7b102587f0de75f395bf32c27c7583fae71d2c40.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 05/42] bind: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:40 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
index da414c0..d6309f6 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
@@ -83,11 +83,11 @@ do_install_append() {
 	install -d ${D}${localstatedir}/cache/bind
 	install -d ${D}${sbindir}
 	install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/named.service ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/named.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 	       -e 's,@SBINDIR@,${sbindir},g' \
-	       ${D}${systemd_unitdir}/system/named.service
+	       ${D}${systemd_system_unitdir}/named.service
 
 	install -d ${D}${sysconfdir}/default
 	install -m 0644 ${WORKDIR}/bind9 ${D}${sysconfdir}/default
-- 
2.7.1


