Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TPxr2-0003Rz-16
	for openembedded-core@lists.openembedded.org;
	Sun, 21 Oct 2012 17:54:20 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so1416024wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2012 08:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=//eGvn99NcjlnJ5Uq6DXxXWZuS9SdN9xGagSxuAVIdA=;
	b=LO8j0mrwDhkgqBfXp3wE4LDOkDqNwsGXYFWXLZ7aQK73kl/G6PdPHucScBq7XJDODW
	iuCE5bllkihb05NCdHeXv2ZNxmAvs/WKkjoiE9/NTY8hkf2io2tBM3LAFHobMfJI7ic+
	cbgLKwGMEYnSaUZ95iUhxPYefphA4wIKq2C7xxK/6QA97gE7602MKpbTQOCua12tZjos
	ODyx8jhS4Ik+wusKRwV+QENqet6iOS3bgLkbDH/nV334KOIz/U+Q9KCkSgy4/+85y3ux
	MW8WLfTJX5TyWqG4TPL+7jgHMJto1DIEUFRL/ycuUqbzFuuXT9dRJHgTZak5TpYsXG50
	CVYA==
Received: by 10.216.193.158 with SMTP id k30mr4107973wen.89.1350834057285;
	Sun, 21 Oct 2012 08:40:57 -0700 (PDT)
Received: from localhost.localdomain (5-13-211-28.residential.rdsnet.ro.
	[5.13.211.28])
	by mx.google.com with ESMTPS id j8sm46423462wiy.9.2012.10.21.08.40.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 21 Oct 2012 08:40:56 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Oct 2012 18:40:43 +0300
Message-Id: <7297499fba5f1bbb6228f90a3be8a6a9aedcb36c.1350833713.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350833713.git.andrei@gherzan.ro>
References: <4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350833713.git.andrei@gherzan.ro>
In-Reply-To: <cover.1350833713.git.andrei@gherzan.ro>
References: <cover.1350833713.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQl/qsoqM92jtjcQCc8yGVapoTkwhQcfbiCT/9/gROTcW46B9yaS4zy3IVGZsqsmGIfWJu9U
Subject: [PATCH V2 5/5] rootfs_ipk.bbclass: Some extra spaces / tabs were removed / formated
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Oct 2012 15:54:20 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/rootfs_ipk.bbclass |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 25f15ee..f69cc0e 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -115,7 +115,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 		fi
 	fi
 	set +x
-	log_check rootfs 	
+	log_check rootfs
 }
 
 rootfs_ipk_write_manifest() {
@@ -134,8 +134,8 @@ rootfs_ipk_write_manifest() {
 
 remove_packaging_data_files() {
 	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
-        # We need the directory for the package manager lock
-        mkdir ${IMAGE_ROOTFS}${opkglibdir}
+	# We need the directory for the package manager lock
+	mkdir ${IMAGE_ROOTFS}${opkglibdir}
 }
 
 list_installed_packages() {
-- 
1.7.9.5



