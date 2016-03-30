Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CB93A60053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 19:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2UJn0T6023161 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 20:49:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6asiPCFn2Jqc
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 20:49:00 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2UJmwO3023149
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 20:48:59 +0100
Message-ID: <1459367338.21672.53.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 20:48:58 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] uninative: Switch md5sum -> sha256
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
X-List-Received-Date: Wed, 30 Mar 2016 19:49:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There are various concerns about md5 so use sha256 instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 0798717..89cec07 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -60,7 +60,7 @@ python uninative_event_fetchloader() {
             localdata.setVar('FILESPATH', "")
             localdata.setVar('DL_DIR', tarballdir)
 
-            srcuri = d.expand("${UNINATIVE_URL}${UNINATIVE_TARBALL};md5sum=%s" % chksum)
+            srcuri = d.expand("${UNINATIVE_URL}${UNINATIVE_TARBALL};sha256sum=%s" % chksum)
             bb.note("Fetching uninative binary shim from %s" % srcuri)
 
             fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 122a944..6ac67ac 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,5 +7,5 @@
 #
 
 UNINATIVE_URL = "http://downloads.yoctoproject.org/releases/uninative/0.95/"
-UNINATIVE_CHECKSUM[i686] ?= "dd09aebeda3eac4e9140cdc327f28ed1"
-UNINATIVE_CHECKSUM[x86_64] ?= "4b6fb2106c2f18b8f9c8ac67e1cf9e57"
+UNINATIVE_CHECKSUM[i686] ?= "5f27d7e0f4dd2ed80a7ff6a0d88af107b08e00765b31ed3aa180cc5ce15b0811"
+UNINATIVE_CHECKSUM[x86_64] ?= "26d46c61ad88cc245e31c88549717c0092a838d111b93ec169d88b08cc027581"



