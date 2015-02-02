Return-Path: <mail@timomueller.eu>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 74BD56E600
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 14:03:18 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id k48so39196970wev.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Feb 2015 06:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=lwqjj7RA3BkaIkPwfCcK4hec0G3ohtfaOlT2Wkf2Iqo=;
	b=jdJDG3M0Lr4l1J0MwgBFyyD/OjcwxFxApwaU5Qne4b2od7w/sUQZzSjxBGtgMfd9Fr
	lOCMcB9/ImRZVq9s1R9NSDax+MdLCkEpJ0M0ALW/AYk/f0e3zJJ8kT19Nw8GFwtEXkcc
	Y4nITeVxn/ODQ1JO3V/jAFi0gRiMa9/VKrcTq5CivZTMpe9I7cuhfR3brADrYdexdPBj
	7WK1/eBGuv0w4pYiDDNXmsau6sfgnHJvBz83bk5hYTq/WWxALD52q2GP7Y7WzkoGrOdB
	hlVm87ul+/qVuWAZQl1ktpFl5naVO/uYnLbhjq7ynNDPO35ZBPmRp1Q5wQ3zl8RtLCwh
	6KFg==
X-Gm-Message-State: ALoCoQkU6Bq5I40Q6i22WfOwQcpIbHO7Gr07/DtkkQczU+ol6noVPzDElMjCDGCq/7pzoLOuYEfd
X-Received: by 10.194.77.75 with SMTP id q11mr45128382wjw.116.1422885799041;
	Mon, 02 Feb 2015 06:03:19 -0800 (PST)
Received: from localhost (mail.bmw-carit.de. [62.245.222.98])
	by mx.google.com with ESMTPSA id
	dn2sm19986701wib.14.2015.02.02.06.03.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Feb 2015 06:03:18 -0800 (PST)
From: Timo Mueller <mail@timomueller.eu>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Feb 2015 15:03:08 +0100
Message-Id: <a5726f608827c0a0325705eae8dadbf90edd7c5f.1420813096.git.timo.mueller@bmw-carit.de>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <49e336fde7b762f9e00013cf7adf53618fbb4f2a.1420813096.git.timo.mueller@bmw-carit.de>
References: <49e336fde7b762f9e00013cf7adf53618fbb4f2a.1420813096.git.timo.mueller@bmw-carit.de>
In-Reply-To: <49e336fde7b762f9e00013cf7adf53618fbb4f2a.1420813096.git.timo.mueller@bmw-carit.de>
References: <49e336fde7b762f9e00013cf7adf53618fbb4f2a.1420813096.git.timo.mueller@bmw-carit.de>
Cc: Timo Mueller <timo.mueller@bmw-carit.de>
Subject: [PATCH 2/2] apr-util: Allow use in SDK
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
X-List-Received-Date: Mon, 02 Feb 2015 14:03:19 -0000

From: Timo Mueller <timo.mueller@bmw-carit.de>

This adds 'nativesdk' in the BBCLASSEXTEND.

Building apr-util for the SDK requires that some paths in the rules.mk
file are fixed to point to the actual enviroment. These include pointing
the apr configuration variables to the actual apr builddir and
correcting the name of the libtool.

Signed-off-by: Timo Mueller <timo.mueller@bmw-carit.de>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta/recipes-support/apr/apr-util_1.5.4.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr-util_1.5.4.bb b/meta/recipes-support/apr/apr-util_1.5.4.bb
index 1cd47b1..49d4d6c 100644
--- a/meta/recipes-support/apr/apr-util_1.5.4.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://apr.apache.org/"
 SECTION = "libs"
 DEPENDS = "apr expat gdbm"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=519e0a18e03f7c023070568c14b077bb \
@@ -46,6 +46,17 @@ do_configure_append_class-native() {
 	sed -i "s#LIBTOOL=\$(apr_builddir)#LIBTOOL=${STAGING_BINDIR_NATIVE}#" ${S}/build/rules.mk
 }
 
+do_configure_prepend_class-nativesdk() {
+	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
+}
+
+do_configure_append_class-nativesdk() {
+	sed -i "s#\(apr_builddir\)=.*#\1=${STAGING_DATADIR}/build-1#" ${S}/build/rules.mk
+	sed -i "s#\(apr_builders\)=.*#\1=${STAGING_DATADIR}/build-1#" ${S}/build/rules.mk
+	sed -i "s#\(top_builddir\)=.*#\1=${STAGING_DATADIR}/build-1#" ${S}/build/rules.mk
+	sed -i "s#\(LIBTOOL=\$(apr_builddir)\).*#\1/libtool#" ${S}/build/rules.mk
+}
+
 FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
 FILES_${PN}-dev += "${libdir}/aprutil.exp ${libdir}/apr-util-1/apr_dbm_gdbm.so* ${libdir}/apr-util-1/apr_dbm_gdbm.la"
 FILES_${PN}-dbg += "${libdir}/apr-util-1/.debug/*"
-- 
2.1.0


