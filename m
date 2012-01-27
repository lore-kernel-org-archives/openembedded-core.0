Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RqpUa-0005Ya-0B
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:21:40 +0100
Received: by yenr5 with SMTP id r5so841869yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iRzk1MZqEdL1hZavKE7UW2ECO3WI5zs18pe7pTWkKhQ=;
	b=wFfD5I1eLVXvfNL039jvR94hdnlY1ltWf6gw5DWnl6B7QVaE4mKoR+SLirkQpSdB1n
	REaTW38MptGiTp7bOyRw6NYHTT4Ky8mEMePWgMXbCwY1XV51vtlOxStzIL1jWZsuCDFd
	6x9rm7+1Hq7Hxxw7ihfZoi7Rh+DF//klRi3eI=
Received: by 10.236.148.46 with SMTP id u34mr11655764yhj.124.1327684430623;
	Fri, 27 Jan 2012 09:13:50 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id f47sm14547996yhh.8.2012.01.27.09.13.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 09:13:49 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 11:13:40 -0600
Message-Id: <50e4e429330f8b48ef84eda03deffe87fd6c01b1.1327684024.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 02/10] eglibc-package.inc: don't include debug files in -pic
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2012 17:21:41 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index e5a9b9d..870b95d 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -42,7 +42,7 @@ FILES_libcidn${PKGSUFFIX} = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.
 FILES_libmemusage${PKGSUFFIX} = "${base_libdir}/libmemusage.so"
 FILES_eglibc-extra-nss${PKGSUFFIX} = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
 FILES_sln${PKGSUFFIX} = "/sbin/sln"
-FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
+FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
 FILES_libsotruss${PKGSUFFIX} = "${libdir}/audit/sotruss-lib.so"
 FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*_nonshared.a \
 	${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
-- 
1.7.8.rc4



