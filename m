Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id B2EA577226
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 22:28:46 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id j10so7096007wjb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 14:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/DTQbvqMwmRI17JqN02j56saE7ESvGH8foH/xyWtYxc=;
	b=teCW+f5qe1ICNXwmkc+WH1qeofcsGmLy+Ntd0BshK/EtJ+2wbPBmiKpyucqPZoUP2f
	ERQC8K7w5JtpVVnjNs3JM1+aGhGkuzeG1S/imMYsHl635bEbBGlinncG+5vloHVlxtuy
	oE4Lz3mWWXWejjL5NJpz+NBbzajqCqRXpR/vM5kWlyA+ap7wT30JbUM62Klh2YRKSCJI
	1yTbFhg63rj4e9glHPGvmpnggKhNHa7wu++IpMX4tBHVo/nueDGN8VOfJLJrMqsNCBV0
	/6cSO3S7lCvQeiisc6VVbiCkogyZ2/dfuD+PQfiltgNcPA6PaB1K8c4rXbkOurnmbn9Q
	UgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/DTQbvqMwmRI17JqN02j56saE7ESvGH8foH/xyWtYxc=;
	b=FEMbMKqRyDJ0L5S0neoKqij8mR/PPr95U67Lg79EPYDxokJyj7sIU+t9EGT5CccQ7m
	knreuwmnfiubi/9HjLr2027GuxxbViSjaEGv6gD3ZsLa98xfalqgWu8In/lh7lAApFZc
	N4ZmxHmt5MA/tB2ATa6Xu+ayii59mcFoDoqbXiAW/UlKtik08t8vwdIfnh+bc1PflWKs
	p3xvjWp4Y4HII+I86OqR+XjZPwaSSOAneMo135zBbDNCvRNPmvmzXt9RwgFUN6azwH7S
	AJpatysgxbVgZbjNx7MVVLwQUynJ6h5LSMTH96S10Jhv/8x2pjqGUFlcsmZRS0LEDivQ
	ntuA==
X-Gm-Message-State: AKaTC01qwg7VucGY5chIMhDDhRKfFblW7ebGPb2hiMBIvE3994GWdP/g+zAILkoYB3ioiw==
X-Received: by 10.194.109.168 with SMTP id ht8mr91256662wjb.36.1481754527119; 
	Wed, 14 Dec 2016 14:28:47 -0800 (PST)
Received: from localhost.localdomain (p579CE070.dip0.t-ipconnect.de.
	[87.156.224.112]) by smtp.googlemail.com with ESMTPSA id
	f126sm9556513wme.22.2016.12.14.14.28.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 14:28:46 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2016 23:28:24 +0100
Message-Id: <1481754504-28846-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] nspr: set correct version in pkg-config file
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
X-List-Received-Date: Wed, 14 Dec 2016 22:28:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

while we are at it clean up sed

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-support/nspr/nspr/nspr.pc.in |  2 +-
 meta/recipes-support/nspr/nspr_4.13.1.bb  | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/nspr/nspr/nspr.pc.in b/meta/recipes-support/nspr/nspr/nspr.pc.in
index c37d0bc..d74caab 100644
--- a/meta/recipes-support/nspr/nspr/nspr.pc.in
+++ b/meta/recipes-support/nspr/nspr/nspr.pc.in
@@ -6,6 +6,6 @@ includedir=OEINCDIR
 
 Name: NSPR
 Description: The Netscape Portable Runtime
-Version: 4.9.5
+Version: NSPRVERSION
 Libs: -L${libdir} -lplds4 -lplc4 -lnspr4 -lpthread -ldl
 Cflags:
diff --git a/meta/recipes-support/nspr/nspr_4.13.1.bb b/meta/recipes-support/nspr/nspr_4.13.1.bb
index 4a13f39..23f8944 100644
--- a/meta/recipes-support/nspr/nspr_4.13.1.bb
+++ b/meta/recipes-support/nspr/nspr_4.13.1.bb
@@ -160,10 +160,13 @@ do_compile_append() {
 
 do_install_append() {
     install -D ${WORKDIR}/nspr.pc.in ${D}${libdir}/pkgconfig/nspr.pc
-    sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nspr.pc
-    sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nspr.pc
-    sed -i s:OEINCDIR:${includedir}:g ${D}${libdir}/pkgconfig/nspr.pc
-    sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nspr.pc
+    sed -i  \
+    -e 's:NSPRVERSION:${PV}:g' \
+    -e 's:OEPREFIX:${prefix}:g' \
+    -e 's:OELIBDIR:${libdir}:g' \
+    -e 's:OEINCDIR:${includedir}:g' \
+    -e 's:OEEXECPREFIX:${exec_prefix}:g' \
+    ${D}${libdir}/pkgconfig/nspr.pc
 
     mkdir -p ${D}${libdir}/nspr/tests
     install -m 0755 ${S}/pr/tests/runtests.pl ${D}${libdir}/nspr/tests
-- 
2.5.5


