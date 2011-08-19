Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QuX7r-0002Jo-Tb
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 00:01:16 +0200
Received: by gyg4 with SMTP id 4so2430398gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 14:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mY+XJ3XlFKH4DISUjgpITBpne+TmRCCe/qNq45py6h0=;
	b=PndwmbYnXN9A+lthVEVBkleeZhGjjiccnhc9+0CmMii0PVoPkLLOW+ma9LK/9jy3ue
	6HMYcL+hVcSt65wnaclaTqBlCUa9ntYse0ZdPHH2gZpFG4mdiDnUuKG08+NYXsZcx18/
	FcdthEcTmpkUtbwsTyHiy7N9H1bo2kXs+Pp/g=
Received: by 10.236.154.228 with SMTP id h64mr1625474yhk.77.1313790994202;
	Fri, 19 Aug 2011 14:56:34 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id f48sm4310342yhh.56.2011.08.19.14.56.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 14:56:31 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2011 14:56:23 -0700
Message-Id: <1313790985-3332-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] libpcre: the generated libtool uses HOST_SYS
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
X-List-Received-Date: Fri, 19 Aug 2011 22:01:16 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/recipes-support/libpcre/libpcre_8.12.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre_8.12.bb b/meta/recipes-support/libpcre/libpcre_8.12.bb
index 9216777..24d91c3 100644
--- a/meta/recipes-support/libpcre/libpcre_8.12.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.12.bb
@@ -30,11 +30,11 @@ EXTRA_OECONF = " --with-link-size=2 --enable-newline-is-lf --with-match-limit=10
 do_compile () {
 	# stop libtool from trying to link with host libraries - fix from #33
 	# this resolve build problem on amd64 - #1015
-	if [ -e ${S}/${TARGET_SYS}-libtool ] ; then
-		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${TARGET_SYS}-libtool
+	if [ -e ${S}/${HOST_SYS}-libtool ] ; then
+		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${HOST_SYS}-libtool
 	else
-		ln -sf ${S}/libtool ${S}/${TARGET_SYS}-libtool
-		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${TARGET_SYS}-libtool	
+		ln -sf ${S}/libtool ${S}/${HOST_SYS}-libtool
+		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${HOST_SYS}-libtool
 	fi
 
 	# The generation of dftables can lead to timestamp problems with ccache
-- 
1.7.3.2.430.g208247



