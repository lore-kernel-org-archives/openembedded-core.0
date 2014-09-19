Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id A74E26B876
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 23:56:14 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id a1so377960wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 16:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jzsPLwhey3cMRAKJKUCNp56XKsD7egS93Ozo0OQBbWY=;
	b=RrrLhCPoLo9gl/QWpGrLL9PsfqDJ0N1HhjLGZWfeGDbnnzfz0w+EoyGScN4WKLXiEi
	GLQ5OMDADOOiYV5XbxXw5dnluelJeODRLwEvsQ/6GPwR5I3NVqJYPNKF5GipLISteT0k
	JYdBqDlMYFMyxNW4Rig2yIgmN2eo/7ik4KM5Xx21DSq02lID0VmnUTlRtYN3MfeW8Ni+
	CfGF7S5yenQjrIR10mdZQibO7S/5kvtK03DRjx5gJxm2x3Q81qdqezS023sXMqP7nlKu
	wUpPBbx9unT1XC5vxSLMusaLTj5K/uZKmKJfNjujf2cgLVMwtEUWKj56hJURsogIpa6i
	6EVQ==
X-Gm-Message-State: ALoCoQlS7d89QzMfU2hlRr360C1dqvuBxejbQgYXfOGTWaU0pItJT7YrrxblbFpvrx1NuQdVR6yW
X-Received: by 10.194.184.166 with SMTP id ev6mr3999320wjc.61.1411170975691;
	Fri, 19 Sep 2014 16:56:15 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id u10sm3637798wix.2.2014.09.19.16.56.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Sep 2014 16:56:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Sep 2014 00:56:10 +0100
Message-Id: <1411170970-551-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] irda-utils: remove inherit autotools
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
X-List-Received-Date: Fri, 19 Sep 2014 23:56:18 -0000

irda-utils doesn't use autotools, so don't inherit it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
index 21891b2..bd60b9f 100644
--- a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
+++ b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
@@ -18,7 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/irda/irda-utils-${PV}.tar.gz \
 SRC_URI[md5sum] = "84dc12aa4c3f61fccb8d8919bf4079bb"
 SRC_URI[sha256sum] = "61980551e46b2eaa9e17ad31cbc1a638074611fc33bff34163d10c7a67a9fdc6"
 
-inherit autotools-brokensep update-rc.d
+inherit update-rc.d
 
 EXTRA_OEMAKE = "\
     'CC=${CC}' \
-- 
1.7.10.4


