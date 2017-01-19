Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AD96871E10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrUqX005765; Thu, 19 Jan 2017 22:53:31 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id U7QOqCbU-p86; Thu, 19 Jan 2017 22:53:31 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrNIM005663
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 22:53:24 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cULa7-0004iA-PM; Thu, 19 Jan 2017 22:53:23 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 22:52:57 +0000
Message-Id: <1484866395-17971-15-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 15/33] ca-certificates: Add PACKAGE_WRITE_DEPS for postinst
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
X-List-Received-Date: Thu, 19 Jan 2017 22:53:35 -0000

The postinstall needs ca-certificates-native, mark the dependency

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/ca-certificates/ca-certificates_20161130.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
index e0b2e41..e47bad1 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=e7358b9541ccf3029e9705ed8de57968
 DEPENDS = "ca-certificates-native"
 DEPENDS_class-native = "openssl-native"
 DEPENDS_class-nativesdk = "ca-certificates-native openssl-native"
+PACKAGE_WRITE_DEPS += "ca-certificates-native"
 
 SRCREV = "61b70a1007dc269d56881a0d480fc841daacc77c"
 
-- 
2.7.4


