Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3Lh-0007eD-I5
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:37 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1373227wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=oLUuGXCmzagQjY7JqZhBupmpwypOE4yJloSWN9wvdwE=;
	b=kr3Jbmbjdo5bXJFShY979ymupTNU+GbVxDJGzB4wBcKfUN/tMXp6v7kkrmJiGZca6g
	2KKrnhvJqIE+w1kFIFSoDo9rRvj+MUS7Ds2HBDijvGeAurrnZGcCQl1yjprPA7whUx/B
	inVMr2SZCOtcj4tKQOQw+H+m04VznXvEaf/jzoU1X9p2LqVn/IGfimZGQLDRwf2VZIZu
	1UQpp22Nri4KHWGKb5mSWH+FIxonV0xcE1E1NjzBlUoClVP7jSvm1Ue6l2EyMZ8ESb1C
	Uz390IIJHXviPIHA9iBJQZ+LhH3MGWF7knMVULzYcFPRIkUDPFuPXnNp3tGmrQiW/jnq
	D4Jw==
Received: by 10.216.138.200 with SMTP id a50mr4203844wej.155.1344182096358;
	Sun, 05 Aug 2012 08:54:56 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.54.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:54:55 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:53:54 +0200
Message-Id: <1344182057-15981-8-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQnufyeiVifJFrqzmYR7FyPMUGAOL7BpELC5jZ1GGjJbHqmbN51Zl9IXBAqjVyITSIdOQCD5
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/30] useradd-example: use ${datadir} instead of /usr/share for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:37 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 .../recipes-skeleton/useradd/useradd-example.bb    |   34 ++++++++++----------
 1 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
index b10c1d0..8315dc0 100644
--- a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -43,32 +43,32 @@ GROUPADD_PARAM_${PN} = "-g 880 group1; -g 890 group2"
 GROUPADD_PARAM_${PN}-user3 = "-g 900 group3"
 
 do_install () {
-	install -d -m 755 ${D}/usr/share/user1
-	install -d -m 755 ${D}/usr/share/user2
-	install -d -m 755 ${D}/usr/share/user3
+	install -d -m 755 ${D}${datadir}/user1
+	install -d -m 755 ${D}${datadir}/user2
+	install -d -m 755 ${D}${datadir}/user3
 
-	install -p -m 644 file1 ${D}/usr/share/user1/
-	install -p -m 644 file2 ${D}/usr/share/user1/
+	install -p -m 644 file1 ${D}${datadir}/user1/
+	install -p -m 644 file2 ${D}${datadir}/user1/
 
-	install -p -m 644 file2 ${D}/usr/share/user2/
-	install -p -m 644 file3 ${D}/usr/share/user2/
+	install -p -m 644 file2 ${D}${datadir}/user2/
+	install -p -m 644 file3 ${D}${datadir}/user2/
 
-	install -p -m 644 file3 ${D}/usr/share/user3/
-	install -p -m 644 file4 ${D}/usr/share/user3/
+	install -p -m 644 file3 ${D}${datadir}/user3/
+	install -p -m 644 file4 ${D}${datadir}/user3/
 
 	# The new users and groups are created before the do_install
 	# step, so you are now free to make use of them:
-	chown -R user1 ${D}/usr/share/user1
-	chown -R user2 ${D}/usr/share/user2
-	chown -R user3 ${D}/usr/share/user3
+	chown -R user1 ${D}${datadir}/user1
+	chown -R user2 ${D}${datadir}/user2
+	chown -R user3 ${D}${datadir}/user3
 
-	chgrp -R group1 ${D}/usr/share/user1
-	chgrp -R group2 ${D}/usr/share/user2
-	chgrp -R group3 ${D}/usr/share/user3
+	chgrp -R group1 ${D}${datadir}/user1
+	chgrp -R group2 ${D}${datadir}/user2
+	chgrp -R group3 ${D}${datadir}/user3
 }
 
-FILES_${PN} = "/usr/share/user1/* /usr/share/user2/*"
-FILES_${PN}-user3 = "/usr/share/user3/*"
+FILES_${PN} = "${datadir}/user1/* ${datadir}/user2/*"
+FILES_${PN}-user3 = "${datadir}/user3/*"
 
 # Prevents do_package failures with:
 # debugsources.list: No such file or directory:
-- 
1.7.7.6



