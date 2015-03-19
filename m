Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1F765CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 11:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2JBWtc1002003 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 11:32:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YCP7eEbNUISk
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 11:32:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2JBWgMS001992
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 11:32:53 GMT
Message-ID: <1426764762.29168.48.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Mar 2015 11:32:42 +0000
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] scripts/runqemu: Allow FSTYPE to be changed from the environment
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
X-List-Received-Date: Thu, 19 Mar 2015 11:32:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently its not possible to change FSTYPE from the environment but it would
be useful to do so where multiple image types have been generated. This
adds that possibility.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/scripts/runqemu b/scripts/runqemu
index 1277e82..84ece4d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -62,7 +62,7 @@ MACHINE=${MACHINE:=""}
 KERNEL=${KERNEL:=""}
 ROOTFS=${ROOTFS:=""}
 VM=${VM:=""}
-FSTYPE=""
+FSTYPE=${FSTYPE:=""}
 LAZY_ROOTFS=""
 SCRIPT_QEMU_OPT=""
 SCRIPT_QEMU_EXTRA_OPT=""




