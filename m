Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8C36460138
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Apr 2015 01:11:27 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so104362095igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Apr 2015 18:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iX5iSllTUR5seS5dDIutC9V42KqF4V+AgJCwu9LgkMw=;
	b=suLPZ1SfexZQJWdySmYrBMtImfP8EFwXM+6bkJISzk9KmBZ+Zej7mIxfzDjZ5IYfxg
	eRV2YQ12wuGT9AP/Lja0e5K4rynAzNInqts7dD5iqaxKtzk/ORGd1ya/ilxJhzRUUnYs
	tgxj3R/GBDEebUvRGe1kyikkHhv+H3qKRfzU4QHWIY/gf2mopaqXTZvaR/E9DbmzpK4o
	U4nru2SFwbNJbKeW4q5nym1ZJLoSL6MKjWK9Lv4+eUZnHyMWym8i38RZBVB+BVgi6vhX
	XS/fKJ85JSVd/pN8OEKUMgzFEXKUCrKEY0JgjKzfGRad4ljb8gGCmVKjJCsU/up6OnvB
	2Vbg==
X-Received: by 10.50.129.9 with SMTP id ns9mr8299725igb.24.1428109888068;
	Fri, 03 Apr 2015 18:11:28 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	b137sm6636948ioe.36.2015.04.03.18.11.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Apr 2015 18:11:27 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Apr 2015 18:11:13 -0700
Message-Id: <1428109874-2871-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] libevent: control openssl support via PACKAGECONFIG
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
X-List-Received-Date: Sat, 04 Apr 2015 01:11:31 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libevent/libevent_2.0.21.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libevent/libevent_2.0.21.bb b/meta/recipes-support/libevent/libevent_2.0.21.bb
index 1230e92..e198f09 100644
--- a/meta/recipes-support/libevent/libevent_2.0.21.bb
+++ b/meta/recipes-support/libevent/libevent_2.0.21.bb
@@ -18,7 +18,8 @@ SRC_URI[sha256sum] = "22a530a8a5ba1cb9c080cba033206b17dacd21437762155c6d30ee6469
 
 S = "${WORKDIR}/${BPN}-${PV}-stable"
 
-EXTRA_OECONF = "--disable-openssl"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 
 inherit autotools
 
-- 
1.9.1


