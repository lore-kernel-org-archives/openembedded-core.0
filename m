Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4ABED724B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 15:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2VFNU5Y024651 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 16:23:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eYcn-SNhWhEI
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 16:23:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2VFNEDQ024630
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 16:23:25 +0100
Message-ID: <1427815394.14020.359.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Mar 2015 16:23:14 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: insane: Add baremetal mappings to the QA arch test
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
X-List-Received-Date: Tue, 31 Mar 2015 15:23:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Add mappings for i586-elf, x86_64-elf and arm-eabi to binary lookup
table which allows for a variety of baremetal toolchain generation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 061ce5b..d0c6fea 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -53,6 +53,13 @@ def package_qa_get_machine_dict():
             "darwin9" : { 
                         "arm" :       (40,     0,    0,          True,          32),
                       },
+            "eabi" : { 
+                        "arm" :       (40,     0,    0,          True,          32),
+                      },
+            "elf" : { 
+                        "i586" :      (3,      0,    0,          True,          32),
+                        "x86_64":     (62,     0,    0,          True,          64),
+                      },
             "linux" : { 
                         "aarch64" :   (183,    0,    0,          True,          64),
                         "aarch64_be" :(183,    0,    0,          False,         64),



