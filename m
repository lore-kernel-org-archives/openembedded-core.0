Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7608572A4B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 13:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBKDv8ml014483; Sat, 20 Dec 2014 13:57:08 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KY4giVgQpHof; Sat, 20 Dec 2014 13:57:08 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBKDupbu014479
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 20 Dec 2014 13:57:03 GMT
Message-ID: <1419083848.13316.38.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 20 Dec 2014 13:57:28 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] linux-libc-headers: Upgrade 3.17 -> 3.17.7
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
X-List-Received-Date: Sat, 20 Dec 2014 13:57:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Whilst we don't usually take linux-libc-headers point release, 3.17.3
fixes a userspace header issue which caused gdb to fail to build on
mips. We therefore may as well upgrade to the latest point release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.7.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.7.bb
new file mode 100644
index 0000000..7332597
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.7.bb
@@ -0,0 +1,7 @@
+KORG_ARCHIVE_COMPRESSION = "xz"
+
+require linux-libc-headers.inc
+
+SRC_URI[md5sum] = "59cc7d0a236b08de743d6d9421f0f2c6"
+SRC_URI[sha256sum] = "a3c8e6aee912bfd2e69abf9df5a06058434a8771bcaa1784b5980bf1b5298e1c"
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.bb
deleted file mode 100644
index 3417697..0000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-KORG_ARCHIVE_COMPRESSION = "xz"
-
-require linux-libc-headers.inc
-
-SRC_URI[md5sum] = "fb30d0f29214d75cddd2faa94f73d5cf"
-SRC_URI[sha256sum] = "f5153ec93c5fcd41b247950e6a9bcbc63fa87beafd112c133a622439a0f76251"
-



