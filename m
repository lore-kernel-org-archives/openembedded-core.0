Return-Path: <pjtexier@koncepto.io>
X-Greylist: delayed 443 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 11 Jan 2020 13:46:36 UTC
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 901997F80A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 13:46:36 +0000 (UTC)
Received: from menoah.home (apoitiers-653-1-564-131.w109-222.abo.wanadoo.fr
	[109.222.141.131])
	by koncepto.io (Postfix) with ESMTPSA id B0FB660174;
	Sat, 11 Jan 2020 14:39:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1578749952;
	bh=djZXSzikZP1lRcIr4rDU4caB/ptujpH41wleCPH/b0g=;
	h=From:To:Cc:Subject:Date:From;
	b=Ez9AkMmZLYk8/3QcHVQnDSKXEsvK7IBSKCD6Fuo2+hg35EWenrlFBn65iPbJ+i3xA
	Sq+o+Mphc6GqUWQBfVuKNUy00x0yYB176SZoXJfMwz0NWM8LS51Ep0ZdiNrXTj6ayU
	vbYx2//DRahAvqenIZPbS5juMfJQhe7qgM/URKXze86LY07oRM3+zK0f68XgD5oGdv
	YMzCVefUYRlB4fvRyo4FErwURckpeky3jcA6tkVNIU15GMl9tptFDlKn05g++9toA/
	7EoOls+AmmaKymIW5XokbBrx+HXUN/BekI8ZZXZPK+SXYHgf+HWx3ZPRCVooDLi/g6
	dUYWuLPzT/n1A==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Jan 2020 14:39:05 +0100
Message-Id: <1578749945-16783-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] curl: upgrade 7.67.0 -> 7.68.0
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
X-List-Received-Date: Sat, 11 Jan 2020 13:46:36 -0000

See full changelog https://curl.haxx.se/changes.html#7_68_0

The hash of the license is updated because the copyright year was
updated in COPYING file:

-Copyright (c) 1996 - 2019, Daniel Stenberg, <daniel@haxx.se>, and many
+Copyright (c) 1996 - 2020, Daniel Stenberg, <daniel@haxx.se>, and many

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-support/curl/{curl_7.67.0.bb => curl_7.68.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/curl/{curl_7.67.0.bb => curl_7.68.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.67.0.bb b/meta/recipes-support/curl/curl_7.68.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.67.0.bb
rename to meta/recipes-support/curl/curl_7.68.0.bb
index e08e08e..0a1547c 100644
--- a/meta/recipes-support/curl/curl_7.67.0.bb
+++ b/meta/recipes-support/curl/curl_7.68.0.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "http://curl.haxx.se/"
 BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=be5d9e1419c4363f4b32037a2d3b7ffa"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2e9fb35867314fe31c6a4977ef7dd531"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[md5sum] = "7be288f6fd5b7b5e402ef3b36a461a24"
-SRC_URI[sha256sum] = "dd5f6956821a548bf4b44f067a530ce9445cc8094fd3e7e3fc7854815858586c"
+SRC_URI[md5sum] = "40d6784bd1a86e079d63cc668ba9bd8f"
+SRC_URI[sha256sum] = "207f54917dd6a2dc733065ccf18d61bb5bebeaceb5df49cd9445483e8623eeb9"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4


