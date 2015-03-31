Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 61AB9724B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 15:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2VFMK6F024566 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 16:22:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UhxJZRpi6vdi
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 16:22:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2VFM94E024563
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 16:22:20 +0100
Message-ID: <1427815329.14020.358.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Mar 2015 16:22:09 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] siteinfo: Add x86_64-elf support
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
X-List-Received-Date: Tue, 31 Mar 2015 15:22:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Teach siteinfo about x86_64-elf so that baremetal toolchains parse/build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 2c1f9d0..5fd99bf 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -95,6 +95,7 @@ def siteinfo_data(d):
         "x86_64-linux": "bit-64",
         "x86_64-linux-musl": "x86_64-linux bit-64",
         "x86_64-linux-uclibc": "bit-64",
+        "x86_64-elf": "bit-64",
         "x86_64-linux-gnu": "bit-64 x86_64-linux",
         "x86_64-linux-gnux32": "bit-32 ix86-common x32-linux",
         "x86_64-mingw32": "bit-64",



