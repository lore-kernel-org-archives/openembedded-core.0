Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6D58174242
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDlQK9006928 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:47:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qTTKNucoWkPE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:47:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDlD1B006902
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:47:24 +0100
Message-ID: <1443620833.5162.83.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 14:47:13 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] meta-selftest: Add qemux86copy machine
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
X-List-Received-Date: Wed, 30 Sep 2015 13:47:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I know Martin finds something like this useful for testing sstate signatures,
this adds one to meta-selftest so we can use it from oe-selftest in the sstate
tests there too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-selftest/conf/machine/qemux86copy.conf b/meta-selftest/conf/machine/qemux86copy.conf
new file mode 100644
index 0000000..bcce2f5
--- /dev/null
+++ b/meta-selftest/conf/machine/qemux86copy.conf
@@ -0,0 +1,3 @@
+require conf/machine/qemux86.conf
+
+MACHINEOVERRIDES .= ":qemux86"



