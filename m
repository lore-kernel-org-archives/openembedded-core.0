Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id AB58661C0D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 16:38:45 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 6042960044;
	Wed, 11 Mar 2020 17:38:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1583944725;
	bh=kF5UgfY2YWRm5JD5npKgXYpooWgMNAXJmWXEFogFsik=;
	h=From:To:Cc:Subject:Date:From;
	b=Y6aNiIhJYzMFeCEc1QGhhqy0JJ16jP9jkB42Ju06Ktjs0M7GZ4KXwvvZ+H6xFI4rr
	qPsNxILY19CgGjh684B/28nqmc2MJ09Zy/J40N2TRGEDahF9+hML7yUAQLdzsDcJjr
	qji91NpcNEMLW8eagvM4iQuFWY+4e6eXX31u3d/24+NZJSpfbn2Jybt4g0s8PSnLvZ
	84BPKw1Dz5QZ0BRUPlvTKvquZd9zEDNYoSqsdwot7sZSmh0E+wuVcnCraF9EmYiNsg
	eYChv2qLvrp1bIa0G2iJqOjAilF/h1uvjif5wTEynStVhCkvkh7j7DfJPxqurv4/Ue
	ucGwjJ473uJVQ==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 17:38:38 +0100
Message-Id: <1583944718-9485-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] curl: upgrade 7.69.0 -> 7.69.1
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
X-List-Received-Date: Wed, 11 Mar 2020 16:38:45 -0000

Contains a number of fixes for issues discovered post-7.69.0.
For details, see full changelog:

https://curl.haxx.se/changes.html#7_69_1

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-support/curl/{curl_7.69.0.bb => curl_7.69.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.69.0.bb => curl_7.69.1.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.69.0.bb b/meta/recipes-support/curl/curl_7.69.1.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.69.0.bb
rename to meta/recipes-support/curl/curl_7.69.1.bb
index cf4f4bc..49e180c 100644
--- a/meta/recipes-support/curl/curl_7.69.0.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "04eb86d1138c2ff3dbfd497f7de85daa"
-SRC_URI[sha256sum] = "668d451108a7316cff040b23c79bc766e7ed84122074e44f662b8982f2e76739"
+SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
+SRC_URI[sha256sum] = "2ff5e5bd507adf6aa88ff4bbafd4c7af464867ffb688be93b9930717a56c4de8"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4


