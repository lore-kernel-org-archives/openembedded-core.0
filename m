Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 751646060F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 17:48:31 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id n67so52968382wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 10:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=pH/4X+g10PRtUnGS57ma9NuqfSJuYsQLN9Ofidp6Igc=;
	b=AQBK85le5QTLCV+YEGN4fLV7hwUTWVloPHIUU9C9lf70gLMkvXaEfWX8ZhQWaLbJdt
	DbP5YvmBp/0+M8pTOLovS2coCO7U7dNZwhQwq3nrtS0KNEH82x1kSBYUdIr/+vV/zedi
	5fM9k1mECms3LpkFEGN3B9C+mejUEFfqEPRrgHPMbFfEiNDE+/G+yjJblz0izn6CCHy/
	IsKfKb0YPcDgB292mLphGV1rL+RCbtDweuPS04DFJoSOytt4euw1qxspjZNM2CczX9qV
	cet0rqMwCD43pBOGpgURn4q6zrSxaKXpz7br5y/dEF8Tuwac7Z+9NT+bEzctHYl3JFia
	CBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pH/4X+g10PRtUnGS57ma9NuqfSJuYsQLN9Ofidp6Igc=;
	b=Assrb6P+a4UAE9L5v++6x/keh0ZBs7axDHwudTB/KREGTJZojr+ZsRZ+8gz0OJ+KxM
	qV8aFc1ZYVcGiSMdGziJseBybX9FpAbSdMTVfvEpTmodOEQqVVv14uAB1mxnjq/Vc2El
	cit0KDfOc/w+sJ5MxLkhFdv1u5vYlY6/UKNXjNxcd3BsD0dOliIEdTEgxTo1+8XItqNK
	1ILa43mwX+FtO80Pw30VoP19ZrMaknotr42UB/OpKY9fl0Xuum3g5/CUUWEgDYsouS9G
	abAppj6FGERCgw8Bf8HBGqAKim8zbyhPXOge35vDuB0iXLb7bwQ7RBrWaTJdP9kb6fYX
	xsNA==
X-Gm-Message-State: ABUngvcpshnzpxZei1xJPCXYBIAwP/otH4cFdGA4DEGKlNHgyjWPdnbAdN4i+UBL2ZMx59s5
X-Received: by 10.194.157.9 with SMTP id wi9mr3838712wjb.143.1478108912780;
	Wed, 02 Nov 2016 10:48:32 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r4sm4507089wmb.19.2016.11.02.10.48.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Nov 2016 10:48:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 17:48:28 +0000
Message-Id: <1478108908-9140-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] db: remove pointless documentation
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
X-List-Received-Date: Wed, 02 Nov 2016 17:48:32 -0000

db-doc has an installed footprint of 94MB, but 60MB of that is the documentation
for the Java and C# bindings which are not part of this recipe.  Remove them and
the for-print PDF manuals to massively reduce the footprint of db-doc.

Also improve the fix for the documentation install path, and put the
documentation under ${docdir}/db instead of just ${docdir} (which is
/usr/share/doc by default).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/db/db_6.0.35.bb | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-support/db/db_6.0.35.bb b/meta/recipes-support/db/db_6.0.35.bb
index 32afbe8..f60edf9 100644
--- a/meta/recipes-support/db/db_6.0.35.bb
+++ b/meta/recipes-support/db/db_6.0.35.bb
@@ -87,7 +87,7 @@ MUTEX_arm = "${ARM_MUTEX}"
 MUTEX_armeb = "${ARM_MUTEX}"
 EXTRA_OECONF += "${MUTEX}"
 EXTRA_OEMAKE_append_class-target = " LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
-EXTRA_OEMAKE += "STRIP=true"
+EXTRA_OEMAKE += "STRIP=true docdir=${docdir}/db/"
 
 do_compile_prepend() {
 	# Stop libtool adding RPATHs
@@ -101,14 +101,12 @@ do_install_append() {
 	ln -s db60/db.h ${D}/${includedir}/db.h
 	ln -s db60/db_cxx.h ${D}/${includedir}/db_cxx.h
 
-	# The docs end up in /usr/docs - not right.
-	if test -d "${D}/${prefix}/docs"
-	then
-		mkdir -p "${D}/${datadir}"
-		test ! -d "${D}/${docdir}" || rm -rf "${D}/${docdir}"
-		mv "${D}/${prefix}/docs" "${D}/${docdir}"
-	fi
+	# Prune the documentation to remove large (PDF) or pointless (Java) files.
+	find ${D}${docdir} -name *.pdf -delete
+	rm -rf ${D}${docdir}/db/java
+	rm -rf ${D}${docdir}/db/csharp
 
+	# The makefiles use cp -p, so we need to chmod until that is fixed.
 	chown -R root:root ${D}
 }
 
-- 
2.8.1


