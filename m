Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7113F7F266
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 21:20:16 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id l2so57868171wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 14:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ndutl2nD/0hwnXXAOzSqNzejBiMCMVkn4qlFGBscqBw=;
	b=yvDi8Y80vsdgF8rvmZ6EwOCJ7IRMhNubPznJiyH2bu6uWCBIE4/2ps1r4mWMRdJ9Nt
	ZGXfJa/uNSryfExV0rlTbPdYKWEPYSlsLKctRgCe9fdv1QmQqRiCo7ztlhVeQFOmX/N3
	FCMIMn2BgHNTv78TY2kZksQC4AsX6H1IJqHvcnhiG7SB40yIfVF7xxMFB2dNVqnTDwsf
	+lwCJUXG+qYx+oxU6xap/t7lKlMRyMa5pvTIFw4s+S2+bJTjYK6rPOD9hzr592k0uK6A
	vNYzlwpxoW+vj2TiUhs8lWBK8cOI3KZjrcwZCk13tTuq/vZyAkXwDV/qamouyFTlZ1D4
	RwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ndutl2nD/0hwnXXAOzSqNzejBiMCMVkn4qlFGBscqBw=;
	b=LL2KFZ1EFgRyuNqQuaLcE9MI2iUYEji83ZBWtap8uXQ1zUhG5o5EmUVO4ky4adobT7
	ZQVjhNhrSZmHqV470MWvPNA8YeCnwqn8DZTQFq1VRJFDLTyeTZSm7jqdS+t1dmf5sRIn
	AaNmR0SAfGYQFpmnZJ/qLjWC+8DrSHhL7tklA9CIAU7i0Cf5wDxz6w+Z4q5q1igJXDK2
	BYHjR6w3TeBnOPrchyJ3Mia48CGsY71PBHtpt7k/zHppq1LDoG2VBevambJXqihwwYTU
	SkbISY9AVfdvImrEj4tG9hobDAyJ9ppUDHPcjPDJjHFdyurqDYWUbD8aEL92DqMtPoaG
	2b8A==
X-Gm-Message-State: APjAAAV5adlqupNwFS/PNTM2MzrJcrj+HlRjeZfUcpu50+j4WX3nq04F
	o+BbP9sdG76FZXHuHDUupvu5TjiNeEE=
X-Google-Smtp-Source: APXvYqxVpgOuk4HJe2r3rmwDAzoFh/+WfYfZYanfRNu7TgC+AD5y2INiLTDqIrA5fQg5TmtmA/3xBg==
X-Received: by 2002:a1c:c742:: with SMTP id x63mr112563024wmf.0.1564521616902; 
	Tue, 30 Jul 2019 14:20:16 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y16sm66737943wrw.33.2019.07.30.14.20.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 30 Jul 2019 14:20:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 22:20:12 +0100
Message-Id: <20190730212012.24115-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190730212012.24115-1-ross.burton@intel.com>
References: <20190730212012.24115-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] perl: add PACKAGECONFIG for db
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
X-List-Received-Date: Tue, 30 Jul 2019 21:20:16 -0000
Content-Transfer-Encoding: 8bit

perl-cross makes it easy to cleanly disable the use of Berkeley DB if desired,
so add a PACKAGECONFIG for this.

More of the dependencies (such as gdbm) can be controlled in the same way, but
Berkeley DB is a prime contender: it's a large library which we have to ship an
old release for due to licensing issues, so there are users who may want to
strip it out of builds entirely.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/perl/perl_5.30.0.bb | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.0.bb b/meta/recipes-devtools/perl/perl_5.30.0.bb
index ce280cb1cbd..a221bce52bd 100644
--- a/meta/recipes-devtools/perl/perl_5.30.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.0.bb
@@ -35,10 +35,13 @@ S = "${WORKDIR}/perl-${PV}"
 
 inherit upstream-version-is-even
 
-DEPENDS += "db gdbm zlib virtual/crypt"
+DEPENDS += "gdbm zlib virtual/crypt"
 
 PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
 
+PACKAGECONFIG ??= "bdb"
+PACKAGECONFIG[bdb] = ",-Ui_db,db"
+
 # Don't generate comments in enc2xs output files. They are not reproducible
 export ENC2XS_NO_COMMENTS = "1"
 
@@ -56,7 +59,8 @@ do_configure_class-target() {
     -Duseshrplib \
     -Dsoname=libperl.so.5 \
     -Dvendorprefix=${prefix} \
-    -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux
+    -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
+    ${PACKAGECONFIG_CONFARGS}
 
     #perl.c uses an ARCHLIB_EXP define to generate compile-time code that
     #adds the archlibexp path to @INC during run-time initialization of a
@@ -79,7 +83,8 @@ do_configure_class-nativesdk() {
     -Duseshrplib \
     -Dsoname=libperl.so.5 \
     -Dvendorprefix=${prefix} \
-    -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux
+    -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
+    ${PACKAGECONFIG_CONFARGS}
 
     # See the comment above
     sed -i -e "s,${STAGING_LIBDIR},${libdir},g" config.h
@@ -91,7 +96,8 @@ do_configure_class-native() {
     -Duseshrplib \
     -Dsoname=libperl.so.5 \
     -Dvendorprefix=${prefix} \
-    -Ui_xlocale
+    -Ui_xlocale \
+    ${PACKAGECONFIG_CONFARGS}
 }
 
 do_configure_append() {
-- 
2.20.1


