Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5D43F783C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:23:46 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id s66so499189pfs.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/G+L+C8lSckgIQ5TL9j0q8Ciq7nfqq+0Smivzze7NUM=;
	b=peLbNT7i7jtMdg87ZZdYB8pFp7wxEKKzWdooYmNXu27Lwq3F3jmCxaoQC/GlrrOxU/
	xquZeBlmiO4J908JziXzcp8/FBAI5UVkDKPUOd5w1Q3VVqfAW5IgQO7f6JHinvfwzCzG
	XQ9KQhpNsg9ShpzYVcuuk/1tFw2y/STOwJZ2tX6KDuoAP9+0WD5u+ajWsweFxhE16knJ
	zqu+yWSyHyhXW/2+etV+21Q6gdWJ8gyqY/+8XW+N6eMo8RLbPibgxK7DgUNLBuUTLOWr
	ew+djVzAKWojVta74FF4Nx1fx9KBBeQxGK1uJyJD1Ky0H31THdgIZ8GO5Ab22sVP5NFR
	ffRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/G+L+C8lSckgIQ5TL9j0q8Ciq7nfqq+0Smivzze7NUM=;
	b=QGi3PlE8NLd7K1PikocEhiRwc0oIkLivzEf5Nt5/lb4Dzuf7pUcjKA/bGuXa53Spu3
	tT6axjUIYpvYIELDLxoFDoswx/iSh6yCmCENRnlie8pt9wc/tuL7jSkWnjh/UdoNtprm
	zZ3XBDV8IbEvx+cYa7O9n7Mjq9VTj9FvLOz1q/dfR8dMizwXDSMQzjouyQV7jWwgv/QJ
	xPbkbE4l+AyAjlV3KK/Lj2FSS3D21Gde8ad4CFjpbZyqOpLBOoDvSCgPbjvSYUzUYM+5
	PuroJl9/hFjNcKiI74vfC0nReHrSYCgpP7gBjg86LwbTkXPUkEqs5yyXVDUED6HD3vS+
	hp5A==
X-Gm-Message-State: AKS2vOxAWDDLsd0FauMx39L0MJ17EzzAm0/+Qfcy3jBfD+ideU2SxpA+
	EmykzvnA1J1klOWo
X-Received: by 10.98.81.199 with SMTP id f190mr572165pfb.109.1497453827440;
	Wed, 14 Jun 2017 08:23:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id i2sm502948pfe.89.2017.06.14.08.23.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jun 2017 08:23:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 08:23:25 -0700
Message-Id: <a3a93d83aedccd02ebf1b130861fec46ac9a08c6.1497453168.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497453168.git.raj.khem@gmail.com>
References: <cover.1497453168.git.raj.khem@gmail.com>
Subject: [PATCH 06/10] zlib: Pass pre-calculate uname enable re-entrant flags
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
X-List-Received-Date: Wed, 14 Jun 2017 15:23:46 -0000

Fix ptest generation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/zlib/zlib_1.2.11.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index d4a81820df..ba216f679a 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -17,20 +17,22 @@ UPSTREAM_CHECK_URI = "http://zlib.net/"
 SRC_URI[md5sum] = "85adef240c5f370b308da8c938951a68"
 SRC_URI[sha256sum] = "4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066"
 
+CFLAGS += "-D_REENTRANT"
+
 RDEPENDS_${PN}-ptest += "make"
 
 inherit ptest
 
-do_configure (){
-	./configure --prefix=${prefix} --shared --libdir=${libdir}
+do_configure() {
+	uname=GNU ./configure --prefix=${prefix} --shared --libdir=${libdir}
 }
 
-do_compile (){
-	oe_runmake
+do_compile() {
+	oe_runmake shared
 }
 
 do_compile_ptest() {
-	oe_runmake static shared
+	oe_runmake test
 }
 
 do_install() {
-- 
2.13.1


