Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A216871556
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NJ1RTH006871 for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:01:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id S4bHj9k3HwyC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:01:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NJ1P7E006868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:01:26 +0100
Message-ID: <1411498888.15825.58.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Sep 2014 20:01:28 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] layer.conf: Add in useradd dependencies as ABISAFE dependencies
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
X-List-Received-Date: Tue, 23 Sep 2014 19:01:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently allarch recipes using useradd rebuild each time MACHINE
changes which is not desireable. Adding the useradd dependencies
to this list ensures they do not change under these circumstances.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 9143bdb..4deee89 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -31,6 +31,9 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   packagegroup-x11-xserver \
   systemd-serialgetty \
   initscripts \
+  shadow \
+  shadow-sysroot \
+  base-passwd \
 "
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \



