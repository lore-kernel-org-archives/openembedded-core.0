Return-Path: <anders.roxell@linaro.org>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id DE5FB6BEC8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2013 20:34:13 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id x18so3885022lbi.17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Sep 2013 13:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jDrsTchisSc7P43kICgSajToPXZSFMcHTmShsji0JzU=;
	b=UhTusJIKl8TTPjdpAldAHjEcJQ0nwya/SHfCbX30A5ivkt8CY9fgf2eEOQZ/rlWii1
	P1S+nlH6l+AnydajOzHslSUKWPVEwrgPR6b5CC3N1dJCtDhA2wQ8Srmln5nABBBJteOh
	I4KDY7LpllMqzN7kAyU+Njo+CVUf6nIWzf8x5onD9ji4/DnkOpr9opZ26ttByfLHuQQh
	NgFjz9ijR9EFlwg2dCeWkWKRSAg2t/BlxkGTv6mgPRC2Mk5Ja+TsO37FDpNiYMke42GE
	bjtPJk0Lr6Eg6x/l5vyht1sVcEhikE26tAij9nfjD9WvnBNAJSuH1qCcU+VjbpvuHfSv
	+pjQ==
X-Gm-Message-State: ALoCoQmXHR12Re5/ilJP6u0zj64xvJLnlSCdPs8KkXlIuP41y7OBZLx1X5sqnwKI/mmWgLljPmMP
X-Received: by 10.152.6.97 with SMTP id z1mr3403912laz.26.1378586053827;
	Sat, 07 Sep 2013 13:34:13 -0700 (PDT)
Received: from localhost (c-853670d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.112.54.133])
	by mx.google.com with ESMTPSA id n15sm2199830laa.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 07 Sep 2013 13:34:12 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Sep 2013 22:33:48 +0200
Message-Id: <1378586028-6613-1-git-send-email-anders.roxell@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1378401050-30782-1-git-send-email-anders.roxell@linaro.org>
References: <1378401050-30782-1-git-send-email-anders.roxell@linaro.org>
Cc: linaro-networking@linaro.org, patches@linaro.org
Subject: [PATCH] ltp: update to new release 20130904
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
X-List-Received-Date: Sat, 07 Sep 2013 20:34:14 -0000

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 .../ltp/{ltp_20130503.bb => ltp_20130904.bb}                | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20130503.bb => ltp_20130904.bb} (93%)

diff --git a/meta/recipes-extended/ltp/ltp_20130503.bb b/meta/recipes-extended/ltp/ltp_20130904.bb
similarity index 93%
rename from meta/recipes-extended/ltp/ltp_20130503.bb
rename to meta/recipes-extended/ltp/ltp_20130904.bb
index 387826d..4f2b9e7 100644
--- a/meta/recipes-extended/ltp/ltp_20130503.bb
+++ b/meta/recipes-extended/ltp/ltp_20130904.bb
@@ -21,17 +21,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS = "attr libaio libcap acl openssl"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
+SRC_URI = "git://github.com/linux-test-project/ltp.git"
 
-SRC_URI[md5sum] = "d448d9e9731d7ef45352fc74633cc97f"
-SRC_URI[sha256sum] = "afdb1479e73d4da7f0d4d5d3fe1570bc5fc96e3317d4a5c10c59c046d3dfa4a0"
+SRC_URI[md5sum] = "c8a5f6f397d2c021a0d21ad28992aa7d"
+SRC_URI[sha256sum] = "4c13e00c1bed8f1b85daf934cd7b54a08b7b7e31874085ab9277ee563af87139"
+
+SRCREV = "${PV}"
+S = "${WORKDIR}/git"
 
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
 
 inherit autotools
 
-RDEPENDS_${PN} = "perl"
+RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
 
 FILES_${PN}-dbg += "/opt/ltp/runtest/.debug"
 FILES_${PN}-dbg += "/opt/ltp/testcases/bin/.debug"
@@ -62,7 +65,7 @@ do_extract_tarball() {
 do_install(){
 	install -d ${D}/opt/ltp/
 	oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
-	
+
 	# Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
 	cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
 
-- 
1.8.1.2


