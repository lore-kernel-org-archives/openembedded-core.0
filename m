Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 34EE06093E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 21:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8LLU5A4027722 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 22:30:05 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DoKRu08d-uhr
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 22:30:05 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8LLU3Ko027719
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 22:30:04 +0100
Message-ID: <1474493403.7207.341.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Sep 2016 22:30:03 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] base.bbclass: Drop unnecessary dirs setting
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
X-List-Received-Date: Wed, 21 Sep 2016 21:30:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

${D} is listed in cleandirs so no need to list it in dirs as well.
The default directory is ${B} so this is a cleanup which should have
no changes to the execution.

[YOCTO #10017]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 9502a68..e34e25b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -304,7 +304,7 @@ base_do_compile() {
 }
 
 addtask install after do_compile
-do_install[dirs] = "${D} ${B}"
+do_install[dirs] = "${B}"
 # Remove and re-create ${D} so that is it guaranteed to be empty
 do_install[cleandirs] = "${D}"
 



