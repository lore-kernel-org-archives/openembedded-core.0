Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UNpbh-00013j-OA
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 21:14:02 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E95ACD22CD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2013 20:56:52 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 20:56:43 +0200
Message-Id: <1365101803-17607-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] site: add endianness information for libmemcached
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2013 19:14:09 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/site/endian-big    | 3 +++
 meta/site/endian-little | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/meta/site/endian-big b/meta/site/endian-big
index 29edc8d..b99e96c 100644
--- a/meta/site/endian-big
+++ b/meta/site/endian-big
@@ -3,3 +3,6 @@ ac_cv_c_bigendian=${ac_cv_c_bigendian=yes}
 
 # libnet
 ac_cv_libnet_endianess=${ac_cv_libnet_endianess=big}
+
+# libmemcached
+ac_cv_c_endian=big
diff --git a/meta/site/endian-little b/meta/site/endian-little
index 9fcf31b..858db76 100644
--- a/meta/site/endian-little
+++ b/meta/site/endian-little
@@ -4,3 +4,5 @@ ac_cv_c_bigendian=${ac_cv_c_bigendian=no}
 # libnet
 ac_cv_libnet_endianess=${ac_cv_libnet_endianess=lil}
 
+# libmemcached
+ac_cv_c_endian=little
-- 
1.8.1.2



