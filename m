Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 86FE1727A9
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 10:04:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t04A4mSF025867
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Jan 2015 02:04:48 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 4 Jan 2015 02:04:48 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Jan 2015 18:04:58 +0800
Message-ID: <9470b48701aa1836dfd658ba5be3e071f1c153cf.1420359776.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1420359776.git.Qi.Chen@windriver.com>
References: <cover.1420359776.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] curl: upgrade to 7.39.0
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
X-List-Received-Date: Sun, 04 Jan 2015 10:04:55 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/curl/{curl_7.38.0.bb => curl_7.39.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.38.0.bb => curl_7.39.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.38.0.bb b/meta/recipes-support/curl/curl_7.39.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.38.0.bb
rename to meta/recipes-support/curl/curl_7.39.0.bb
index 85bd3be..75a10c5 100644
--- a/meta/recipes-support/curl/curl_7.38.0.bb
+++ b/meta/recipes-support/curl/curl_7.39.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "af6b3c299bd891f43cb5f76c4091b7b4"
-SRC_URI[sha256sum] = "035bd41e99aa1a4e64713f4cea5ccdf366ca8199e9be1b53d5a043d5165f9eba"
+SRC_URI[md5sum] = "1efecb5b0e43c17d968f0d228bbbbbbd"
+SRC_URI[sha256sum] = "b222566e7087cd9701b301dd6634b360ae118cc1cbc7697e534dc451102ea4e0"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.9.1


