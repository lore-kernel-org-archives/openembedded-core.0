Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A738B773EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 17:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBLH5vdH001264; Wed, 21 Dec 2016 17:05:57 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UrFn1sztC3tQ; Wed, 21 Dec 2016 17:05:57 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBLH5qrY001236
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 21 Dec 2016 17:05:53 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cJkKu-0006ss-2M; Wed, 21 Dec 2016 17:05:52 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2016 17:05:43 +0000
Message-Id: <1482339945-26418-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1482339945-26418-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1482339945-26418-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/4] bitbake.conf: Add inclusion of BB_CURRENT_MC.conf after local.conf
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
X-List-Received-Date: Wed, 21 Dec 2016 17:06:00 -0000

People are strugling with multiconfig as the up front inclusion of the
configuration file doesn't do what people expect. The only way to meet
user expectations is to include the file immediately after local.conf.

We add BB_CURRENT_MC to bitbake so that the metadata can determine when
to include the extra configuration.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index aee9919..7b0ae65 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -701,6 +701,7 @@ require conf/abi_version.conf
 include conf/site.conf
 include conf/auto.conf
 include conf/local.conf
+include conf/multiconfig/${BB_CURRENT_MC}.conf
 include conf/build/${BUILD_SYS}.conf
 include conf/target/${TARGET_SYS}.conf
 include conf/machine/${MACHINE}.conf
-- 
2.7.4


