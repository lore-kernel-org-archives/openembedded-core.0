Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVDH-0000sV-Ux
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 17:28:20 +0100
Received: by mail-ww0-f43.google.com with SMTP id ds11so12054547wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=mrk/f6Vo1l8RDx06fExri7xPsCQGORRMEAd7kvy21Cg=;
	b=ZSHyDJfLXyW56pOPJV2rGrIlVgUGxB8UAzUu2kXatjJlJDGJoE9Ok6oqNdY6IIug1L
	CmGx015I1otc+rhnn9ZvZnQ1g4HcN2X/QCpBbJhzwnaZnnTwBoAiVVxFygShXDB74lWb
	iK9qhG03BZD6I90+YpoKnGhWTkNqqTJwRZfcU=
Received: by 10.227.198.142 with SMTP id eo14mr16991388wbb.28.1323793286562;
	Tue, 13 Dec 2011 08:21:26 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id 28sm27231923wby.3.2011.12.13.08.21.24
	(version=SSLv3 cipher=OTHER); Tue, 13 Dec 2011 08:21:25 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:19:50 +0400
Message-Id: <1323793193-31090-6-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 6/9] libgcc: reintroduce debug package, containing symbols
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
X-List-Received-Date: Tue, 13 Dec 2011 16:28:20 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-devtools/gcc/libgcc_4.6.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index 6ba0339..dd0a7be 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -6,6 +6,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 PACKAGES = "\
   ${PN} \
   ${PN}-dev \
+  ${PN}-dbg \
   "
 
 FILES_${PN} = "${base_libdir}/libgcc*.so.*"
@@ -15,6 +16,8 @@ FILES_${PN}-dev = " \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
 
+FILES_${PN}-dbg += "${base_libdir}/.debug/"
+
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
-- 
1.7.7.3



