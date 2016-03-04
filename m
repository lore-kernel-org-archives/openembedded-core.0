Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC7E7316B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 16:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24GUxCA002419 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2016 16:30:59 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id klZZBEQagGFc
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 16:30:59 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24GUv6P002415
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2016 16:30:58 GMT
Message-ID: <1457109057.2804.46.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Mar 2016 16:30:57 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] yocto-uninative: Add common include for uninative
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
X-List-Received-Date: Fri, 04 Mar 2016 16:31:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

uninative has some specific setup requirements. Rather than have everyone
doing this themselves, do this centrally and allow people to opt into it
based on some Yocto Project builds of the uninative tarballs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
new file mode 100644
index 0000000..f0f1975
--- /dev/null
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -0,0 +1,11 @@
+#
+# This include points at uninative tarballs generated and maintained
+# by the Yocto Project. These file can be included by distros if they
+# want to use/maintain a unified sstate feed for native/cross artefacts
+# rather than the feeds having native/cross artefacts which are specific
+# to the distro running on the build machine.
+#
+
+UNINATIVE_URL = "http://downloads.yoctoproject.org/releases/uninative/0.9/"
+UNINATIVE_CHECKSUM[i686] = "d74d476bfcf9b82d8e8befb98b87068b"
+UNINATIVE_CHECKSUM[x86_64] = "2b727b6a8e47999ff58da7d7db16fc2f"



