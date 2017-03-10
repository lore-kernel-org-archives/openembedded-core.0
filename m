Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 160717770A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 12:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2ACx6Mx002614; Fri, 10 Mar 2017 12:59:06 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JPlQSoevH8kB; Fri, 10 Mar 2017 12:59:06 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2ACwWln002564
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 10 Mar 2017 12:58:33 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cmK7s-0000Qm-Fp; Fri, 10 Mar 2017 12:58:32 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 12:58:31 +0000
Message-Id: <1489150711-1608-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489150711-1608-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1489150711-1608-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] runqemu-gen-tapdevs: Improve help text with an example
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
X-List-Received-Date: Fri, 10 Mar 2017 12:59:08 -0000

Figuring how the correct commandline isn't trivial, improve the help
text with RSS in mind.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu-gen-tapdevs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index bfb60f4..9e5e5b9 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -28,6 +28,8 @@ usage() {
 	echo "Where <gid> is the numeric group id the tap devices will be owned by"
 	echo "<num> is the number of tap devices to create (0 to remove all)"
 	echo "<native-sysroot-basedir> is the path to the build system's native sysroot"
+	echo "e.g. $ bitbake qemu-helper-native -c addto_recipe_sysroot"
+	echo "$ sudo $0 1000 1000 4 tmp/work/x86_64-linux/qemu-helper-native/*/recipe-sysroot-native/"
 	exit 1
 }
 
-- 
2.7.4


