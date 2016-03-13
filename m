Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 11A0E73175
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:52 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n205so11549706wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=l0cJvOvunebKTYK45CM65mjSlDfHJ9tAPsLSVIfy084=;
	b=rHNag5kQtrPd6F2hKKpjSA2xboNL4AkuuNxlLtDkl9gih5WUdlDCZUqfJGN+syy1kl
	oQTzixEHURJuHN8qTH9+omfQDYBD8GogqWx4yU1mQdz2DYzSV3QHcUawm6U7ri5MJDTK
	IgKjrQaIu6R98meOx3X6eaH3u/YW2RLWFIn4V/qlAukrLYkTjgj3T7GLRxqoIn3qj56U
	Mw10whqSwST6DlsBHcwOTZJSZRo4Ui5FOT2mIgl4e9cycTFbEUqkV51yui0bElhUebR/
	NI4sdQy5Ej2zy4lKzxXxf2UiDXOl5+rTY25T4VfKDEMmxBtcenNg6/7UwjcZ2CR7GGCZ
	2osA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=l0cJvOvunebKTYK45CM65mjSlDfHJ9tAPsLSVIfy084=;
	b=HkvhCQWFBQEZK4aNuTHmMvBG7dnrz1OEsdONpC/YqP2SXXukJrIP/9wEa+a46HHRwo
	zHwsia71tEgwOmEVifAeWNcJMt/n9pAkg85FNX2OaZsl6pVnFDvSAE/FvOPs3gCUbnQu
	MJ1YwuYLyAEDt9axHa8JIdtgLpVFnGbQcazrYkKHhGZC5RaEoSiv4ZpBio0bpSJQJSTe
	95Tq7mC3mJD0IfL/0fQ44IdxZuGWtvK+qtDBmtv+11WD5E8aF3dAY/4tvlLDepeUCi57
	butgXm+bjOzEpDDn9j/YDwfo+CN5hIOF+9G/Q2i/n6VFaGKI9vHpv/PbB6qb+5e5oy8Z
	rQIA==
X-Gm-Message-State: AD7BkJKefSHI0b/+KzKeBtNYQKM1Gyf3U3m9g0NeaSNTS/xaLFm8iQFpXD2nfMrB9bPQCw==
X-Received: by 10.194.192.36 with SMTP id hd4mr19333920wjc.85.1457896493397;
	Sun, 13 Mar 2016 12:14:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:52 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:13 +0100
Message-Id: <fcbe6b256a1c7ba40588e4c3b604910ad30ac3ec.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 15/42] dropbear: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:53 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-core/dropbear/dropbear.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 1dce2a5..a34125c 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -76,14 +76,14 @@ do_install() {
 	fi
 
 	# deal with systemd unit files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 		-e 's,@BINDIR@,${bindir},g' \
 		-e 's,@SBINDIR@,${sbindir},g' \
-		${D}${systemd_unitdir}/system/dropbear.socket ${D}${systemd_unitdir}/system/*.service
+		${D}${systemd_system_unitdir}/dropbear.socket ${D}${systemd_system_unitdir}/*.service
 }
 
 inherit update-alternatives
-- 
2.7.1


