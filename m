Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id D947F7318A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 16:58:49 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id 1so100506071wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yYQlRI9RqQ+U8Cb9jp/rLmvIqc71pJXAavykh08qLxc=;
	b=0c6zb7Fck0A27T4GpR8JEZZnU8pc3b0A04N0PJpLY4dL4wjMlXDueYOuFS3hQVPmzv
	cBbgItUolrRbiyL1epfCJ2GCjpgApfNOOzitzb4hEqEJhjtbLJasbR7/DHqRDzmiFALt
	8Km9JmiT+xskh14XwqZw1KHJqyj8zbe8ZElSYnEeKaWseffP4TxXm9mgB/1B/e1POh4e
	8AvwIZRDsY7uvG30f67OhD8eAAgWDUlc7IRQYQDQFW4knihzhV64sD4daP8eIiXilfnq
	6nxpkRnCrmchK1q+AScpz/hyjyF653DFLDTksQBlU4Tji4QfCZjH7hI9Ba4g0ALuhxu1
	27Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yYQlRI9RqQ+U8Cb9jp/rLmvIqc71pJXAavykh08qLxc=;
	b=f/y8xGDKJAT6fJ1CpEx9phqEziNOZgzeKcALKXA6v7yhVJYV5+1bptOylvHRawvv5+
	CdANSgepuk22gklnE8ch47xmZQmTVKDYYae/HYIRa+QUU24vQCwWvGfUiLLqkcXK+aHo
	Km3FzuWkaBsi69SK/LAr2dexlHpMyNUTwfXzRIE2ng20aWK8xgZmIRG6NIh9EWKKaW1n
	8F+kwJFD2Ww2s8Q6LHiUcqhuXlymZ96Q25FhONAypsGS9XESpAdi6XL6nxI7d1/exotL
	VPdPfZGvdOy1zEh9q9t5DxJyK286+TN6ETB55qGGoOvnmw856kYITdc04CGWoKO98ab+
	6h2Q==
X-Gm-Message-State: AE9vXwPdQ03NFqg55wEEfcLvgLBfFsdCD712S/9bMkkq4J0D4Mo6deZno05uV5jGmACl7tEn
X-Received: by 10.28.168.151 with SMTP id r145mr805726wme.93.1473353929545;
	Thu, 08 Sep 2016 09:58:49 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	lj2sm10085147wjc.38.2016.09.08.09.58.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Sep 2016 09:58:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 17:58:44 +0100
Message-Id: <1473353924-21627-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1473353924-21627-1-git-send-email-ross.burton@intel.com>
References: <1473353924-21627-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] rpm: remove redundant removals
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
X-List-Received-Date: Thu, 08 Sep 2016 16:58:51 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.16.bb | 45 ---------------------------------
 1 file changed, 45 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 55acd25..19734f8 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -554,54 +554,11 @@ do_install_append() {
 	install -m 0755 ${WORKDIR}/pythondeps.sh ${D}/${libdir}/rpm/pythondeps.sh
 	install -m 0755 ${WORKDIR}/perfile_rpmdeps.sh ${D}/${libdir}/rpm/perfile_rpmdeps.sh
 
-	# Remove unpackaged files (based on list in rpm.spec)
-	rm -f ${D}/${libdir}/rpm/{Specfile.pm,cpanflute,cpanflute2,rpmdiff,rpmdiff.cgi,sql.prov,sql.req,tcl.req,trpm}
-
-	rm -f ${D}/${mandir}/man8/rpmcache.8*
-	rm -f ${D}/${mandir}/man8/rpmgraph.8*
-	rm -f ${D}/${mandir}/*/man8/rpmcache.8*
-	rm -f ${D}/${mandir}/*/man8/rpmgraph.8*
-	rm -rf ${D}/${mandir}/{fr,ko}
-
-	rm -f ${D}/${includedir}/popt.h
-	rm -f ${D}/${libdir}/libpopt.*
-	rm -f ${D}/${libdir}/pkgconfig/popt.pc
-	rm -f ${D}/${datadir}/locale/*/LC_MESSAGES/popt.mo
-	rm -f ${D}/${mandir}/man3/popt.3
-
-	rm -f ${D}/${mandir}/man1/xar.1*
-	rm -f ${D}/${bindir}/xar
-	rm -rf ${D}/${includedir}/xar
-	rm -f ${D}/${libdir}/libxar*
-
-	rm -f ${D}/${bindir}/lz*
-	rm -f ${D}/${bindir}/unlzma
-	rm -f ${D}/${bindir}/unxz
-	rm -f ${D}/${bindir}/xz*
-	rm -rf ${D}/${includedir}/lzma*
-	rm -f ${D}/${mandir}/man1/lz*.1
-	rm -f ${D}/${libdir}/pkgconfig/liblzma*
-
-	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/*.a
 	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/*.la
-	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/rpm/*.a
 	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/rpm/*.la
 
-	#find ${D}/${libdir}/perl5 -type f -a \( -name perllocal.pod -o -name .packlist \
-	#	-o \( -name '*.bs' -a -empty \) \) -exec rm -f {} ';'
-	#find ${D}/${libdir}/perl5 -type d -depth -exec rmdir {} 2>/dev/null ';'
-
 	rm -f ${D}/${libdir}/rpm/dbconvert.sh
 
-	rm -f ${D}/${libdir}/rpm/libsqldb.*
-
-	# We don't want, nor need the Mandriva multiarch items
-	rm -f ${D}/${bindir}/multiarch-dispatch
-	rm -f ${D}/${bindir}/multiarch-platform
-	rm -f ${D}/${libdir}/rpm/check-multiarch-files
-	rm -f ${D}/${libdir}/rpm/mkmultiarch
-	rm -f ${D}/${includedir}/multiarch-dispatch.h
-
 	rm -f ${D}/${libdir}/rpm/gstreamer.sh
 	rm -f ${D}/${libdir}/rpm/gem_helper.rb
 	rm -f ${D}/${libdir}/rpm/rubygems.rb
@@ -610,12 +567,10 @@ do_install_append() {
 	rm -f ${D}/${libdir}/rpm/macros.d/kernel
 	rm -f ${D}/${libdir}/rpm/macros.d/gstreamer
 	rm -f ${D}/${libdir}/rpm/bin/mgo
-	rm -f ${D}/${libdir}/rpm/bin/dbconvert
 	rm -f ${D}/${libdir}/rpm/bin/pom2spec
 
 	rm -rf ${D}/var/lib/wdj ${D}/var/cache/wdj
 	rm -f ${D}/${libdir}/rpm/bin/api-sanity-checker.pl
-
 }
 
 do_install_append_class-target() {
-- 
2.8.1


