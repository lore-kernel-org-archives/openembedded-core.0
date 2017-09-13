Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DF74778655
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 15:21:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8DFL1Pl031155
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 08:21:01 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 13 Sep 2017 08:20:59 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 10:15:05 -0500
Message-ID: <1505315706-8937-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 1/2] meta/conf/layers.conf: Add ca-certificates as ABISAFE
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
X-List-Received-Date: Wed, 13 Sep 2017 15:21:03 -0000
Content-Type: text/plain

meta-oe was doing this before, but it was triggering a yocto-compat-script
failure during the signature checking.

The ca-certificates changing is ABISAFE, as the certificates themselves do
not modify the compiles behavior of the applications.  This should permit
easier upgrades without as much rebuilding.

The original value was set in meta-oe by commit
ff7a4b13c4efeffc5853a93c6ff7265fa3d6c143.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index df457c2..6be2a57 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -40,6 +40,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   base-passwd \
   opkg-utils \
   gstreamer1.0-meta-base \
+  ca-certificates \
 "
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
-- 
1.8.3.1


