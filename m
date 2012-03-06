Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4yG1-0004hQ-0N
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:33:05 +0100
Received: by mail-gx0-f175.google.com with SMTP id y3so2232112ggc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 09:24:31 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.101.175.2 as permitted sender) client-ip=10.101.175.2; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.101.175.2 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.101.175.2])
	by 10.101.175.2 with SMTP id c2mr10853061anp.73.1331054671203 (num_hops
	= 1); Tue, 06 Mar 2012 09:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=et+n2Ov7ZYjfJmKUmt8vkCtYnHxyJn9ofG8eaQBnFDA=;
	b=ueFpWJ+ULJeq5h3n8pnvR/qNINTMhjOMJOHsoN/wjzCCK5jDQFdSyb8dOScOh+n4nQ
	MiuJpMKO+B+ucYw6l10mIuOwGsMs4cODicNk9f4WYu6EfAjaMxTAuFnJTkbUsind7XBz
	suKGXjLArOTI1NFGdA2EvtulXcWp4m+1Wi3HmVgUVMLQ47nuVqB+jnlFhh9Nska6t/qo
	cNAj1pc+drMbfWi+aBOJe2owiWm0gkV3FD02IfRkcnrJAGEcY4yT9cL789WQbBIKsDHv
	bHxJWUM5wSSqeYghnl/F4KFtuzKPNWFziG2eZ7tdutm1bHB+weGQIOT0UArCq1v7VdAw
	ojgw==
Received: by 10.101.175.2 with SMTP id c2mr8588856anp.73.1331054671140;
	Tue, 06 Mar 2012 09:24:31 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o41sm50620004yhj.7.2012.03.06.09.24.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 09:24:30 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 17:24:15 +0000
Message-Id: <8f6df672e857885126380fdc6a176d41cbd7a83b.1331054558.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1331054558.git.otavio@ossystems.com.br>
References: <cover.1331054558.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1331054558.git.otavio@ossystems.com.br>
References: <cover.1331054558.git.otavio@ossystems.com.br>
Subject: [PATCH v2 5/5] dpkg: rename postinst trigger script
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
X-List-Received-Date: Tue, 06 Mar 2012 17:33:05 -0000

Use 'run-postinsts' as trigger script name as it describes better the
intent of it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/dpkg/dpkg.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 1326994..09bfbbc 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Package maintenance system for Debian."
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
-INC_PR = "r15"
+INC_PR = "r16"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2 \
            file://ignore_extra_fields.patch"
@@ -42,9 +42,9 @@ do_install_prepend () {
 	# this happens at S98 where our good 'ole packages script used to run
 	printf "#!/bin/sh
 dpkg --configure -a
-rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
-" > ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
-	chmod 0755 ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
+rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
+" > ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
+	chmod 0755 ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
 }
 
 do_install_append () {
-- 
1.7.2.5



