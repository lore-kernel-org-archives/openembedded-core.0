Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 81C376E6B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 17:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u05HnvC4007875 for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jan 2016 17:49:57 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ssfHnlD3IXFh
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 17:49:57 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u05Hnp89007871
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jan 2016 17:49:52 GMT
Message-ID: <1452016191.7598.52.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 05 Jan 2016 17:49:51 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] image: Remove pointless rootfs lock
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
X-List-Received-Date: Tue, 05 Jan 2016 17:49:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It was added in aa3141e979326a9d931ff03bad75923faa1d9dc6 back in 2008
but I don't see why multiple images would need this now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index d2f8105..8242c56 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -227,7 +227,6 @@ LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IM
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
 
 do_rootfs[dirs] = "${TOPDIR}"
-do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
 do_rootfs[cleandirs] += "${S}"
 
 # Must call real_do_rootfs() from inside here, rather than as a separate



