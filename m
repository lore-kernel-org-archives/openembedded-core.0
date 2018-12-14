Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 823DC6D2AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:08:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q26so6480247wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ohGxemBkQAiUJqdFgw/ZqxZ0QO/Raq3u4OhuQe/D/YQ=;
	b=H6y4Gzjia+WAtqQQN8iSRcTarqOXW52B/5WPy7Qk1UQupYwd9GNF02SN6t1CIIJStq
	P/y9XP9hl9mWsjIG2OQCdNQ+eFfocg2F8VvdJM0vVAUaKVejPj0GVGTZSlZVgsiz+srb
	sbVyDwfG/tHOSw68ZPXxscvpSfG+A7SJPUKKNJIMzaEgUAWVWvpSzzoSL80LweYERI5E
	KMdIAc9+CCIBbWzN8DB1rrzwHOcdtabzYCQ0iqv5HodTDDPb27kq9sLeoVqWCwm7ZCA3
	qmvDdoMT7cYnevS/VXv//i2HLbbyo5BP9SlqQAcNDLX7HNfLae6mgJpkwrxijqZRgX2x
	wxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ohGxemBkQAiUJqdFgw/ZqxZ0QO/Raq3u4OhuQe/D/YQ=;
	b=t5cg42863IT1GB1eS5zY43u1plEk8g8in5ls2sgIQrHS3VWlVz1CBuYDykbn9JOb8D
	JMGUoJB1rZ54v1l5k+eGsZSPiSZpY6+pTT27xDqGzOt+XcifM9xJdD6xSOrbphKx6nAl
	aeaLAbXD+GIJ+ErWBwC7iSxF4rR/kCNNqNa+2vZCKhlTC9irL+4s9d9NVhqGDL0698wc
	PTbLRvRTnX6VYmQS6sLJ9xAUl725nsvo/z0BEksQzD3ai1bfY8Go31PmfxckphzHzDCF
	5mPzGkOLnllPLcj6MqBw2jSHPKYqnvtmrEz43JuOb3ADZUVfv8XduMht9ab6zpWyR6yn
	Nlnw==
X-Gm-Message-State: AA+aEWY7PS3f6/xELwLTGv7AUCzYlZwu7xJeGor25dY2m8toAFrMgucj
	coJGJI/8oX4QWqS/ktVR+Bsz6lhpULk=
X-Google-Smtp-Source: AFSGD/XIsfP/Z7B5UPlYeRX7xOCWf453QHBRmN+7UCLzCRjdp+H5AE93d6eB+LOXA7JelcqS2268pA==
X-Received: by 2002:a1c:a6cd:: with SMTP id p196mr3929951wme.142.1544807336758;
	Fri, 14 Dec 2018 09:08:56 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id b7sm5489022wrs.47.2018.12.14.09.08.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 09:08:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 17:08:54 +0000
Message-Id: <20181214170854.1678-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libsoup: upgrade to 2.64.2
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
X-List-Received-Date: Fri, 14 Dec 2018 17:08:56 -0000

Add new build dependency libpsl.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libsoup/{libsoup-2.4_2.62.3.bb => libsoup-2.4_2.64.2.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.62.3.bb => libsoup-2.4_2.64.2.bb} (89%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.62.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
similarity index 89%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.62.3.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
index aaa3cc51036..9f852d5c054 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.62.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
@@ -5,13 +5,13 @@ SECTION = "x11/gnome/libs"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native"
+DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native libpsl"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[md5sum] = "dfbf30af5fb6190bfafc5aa6abcc9dce"
-SRC_URI[sha256sum] = "d312ade547495c2093ff8bda61f9b9727a98cfdae339f3263277dd39c0451172"
+SRC_URI[md5sum] = "cac755dc6c6acd6e0c70007f547548f5"
+SRC_URI[sha256sum] = "75ddc194a5b1d6f25033bb9d355f04bfe5c03e0e1c71ed0774104457b3a786c6"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.11.0


