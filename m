Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CEAE478699
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 12:56:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w04CuLHY007256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 4 Jan 2018 12:56:22 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eX54H-0006NO-5Y; Thu, 04 Jan 2018 12:56:21 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jan 2018 12:56:14 +0000
Message-Id: <1515070574-24435-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515070574-24435-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1515070574-24435-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/2] site/common: Allow ac_cv_path_SED to be overridden
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
X-List-Received-Date: Thu, 04 Jan 2018 12:56:22 -0000

There are tools in the wild where we need this to be a full path, even
if that doesn't make sense in most other cases due to libtool issues.
Allow those cases to override the default value as currently its near
impossible to do so.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/site/common | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/site/common b/meta/site/common
index 5ccc14f..ff55232 100644
--- a/meta/site/common
+++ b/meta/site/common
@@ -18,4 +18,4 @@ shadow_cv_passwd_dir=${bindir}
 # python: deactivate a runtime check for ipv6-support in python >=2.7.1 that fails when cross-compiling
 ac_cv_buggy_getaddrinfo=no
 
-ac_cv_path_SED=sed
+ac_cv_path_SED=${ac_cv_path_SED=sed}
-- 
2.7.4


