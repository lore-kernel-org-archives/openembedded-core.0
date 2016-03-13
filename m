Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 22E7A73178
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:48 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l68so11564679wml.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=LfsqYWrWpEAEsmtoQPWLX849yulxDtDDJttBNrsbSYs=;
	b=RGCSGHRi2yVJ7C7ZH0f3bnFxamjxNB8Io2DCe+GPsj6BXfFVJsKZBJ3rLTgNhoggiR
	v36bWmm7qMnNh18wk28o1MtsRMwOvrss1qI1Dgiy54WpJMoJJIIR0DO7CdpVZYtQYEdL
	dfwA/PZFQv/+PJdnh1K2UsEANGVoksZ145r0tolpNeHHIXA5Q2CWZs5P0E8Mvn5f7ivC
	UYZ/vQPK0/+vgsyj/+VLmM1XRsBXE5VKtdXfVLFnOgYpQiVsMi25QhyS1wDC4lyXvpxs
	w+VndG2iZg8kwt5fZihbzJfv2u3G17pe8Y6u8dctyJp4dRvgb+8g77v+S+xlAsxRqM47
	vVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=LfsqYWrWpEAEsmtoQPWLX849yulxDtDDJttBNrsbSYs=;
	b=N3HJnpqrA4i0KRMYrsc9MfKGsA34eXByiJ1s59mzwBlt08cAjL930smUNBprKGd3nM
	ciGQBg0SN4ZZqC6HRUFwe+IN5Mcv2DfastIeXAIN6yGYZzoRMlnn3g7ZfcP35WcRdKEh
	fLO2uT5oXCGSY+gh6PXzba6aXexnQi+Iptg/mVJrePMHhl+ny/sTdVzc93GcJvuRjyiT
	3oHo8FJ7yYnkz7RZUHsOjeA6Q8i5Tn7+/lFjfbpCeQ5PNT+GsQdKoL2iGpSTanZRa+uk
	uxLooH76kcNzLKlIF3vuRQNLHHIXQQEl869NVVwd8serOlvHsM998VmPBUtid545hvTe
	vY9g==
X-Gm-Message-State: AD7BkJKxwi1JiqgitWG2VxJFa5IpZ2nzHjbLz2tQoPfFE82crHciHd5eFBUbqqJvRijcFQ==
X-Received: by 10.28.51.9 with SMTP id z9mr13102929wmz.59.1457896488763;
	Sun, 13 Mar 2016 12:14:48 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:47 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:09 +0100
Message-Id: <c6f8231e619c07a7345cae2e82e90af842ef2fe6.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 11/42] portmap: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:48 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-connectivity/portmap/portmap_6.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/portmap/portmap_6.0.bb b/meta/recipes-connectivity/portmap/portmap_6.0.bb
index 999b4a9..e1d3f1e 100644
--- a/meta/recipes-connectivity/portmap/portmap_6.0.bb
+++ b/meta/recipes-connectivity/portmap/portmap_6.0.bb
@@ -29,7 +29,7 @@ do_install() {
     install -m 0755 ${WORKDIR}/portmap.init ${D}${sysconfdir}/init.d/portmap
     oe_runmake install DESTDIR=${D}
 
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/portmap.service ${D}${systemd_unitdir}/system
-    sed -i -e 's,@BASE_SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}/system/portmap.service
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/portmap.service ${D}${systemd_system_unitdir}
+    sed -i -e 's,@BASE_SBINDIR@,${base_sbindir},g' ${D}${systemd_system_unitdir}/portmap.service
 }
-- 
2.7.1


