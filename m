Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A894D6AD8C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:12:06 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id j13so5652953wgh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 09:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=T/b5/vR6SALqEIG00UEd+LV/s2KjXcZ0pZPtaV1kUIw=;
	b=F4lXcdpkZCnnSrUkFk2ND3BGj/MZ0PpqxaXmLC/7O7r/wejsjQOEZ7R+AUO0sNafoe
	mDd6eG8QJCscs+qTuo5KmaM0X/PpoC3ZhbhpXRZCii4p443HqhRTcSee6P8WgMfsyY8I
	ptAeC5JDouQ1Sh2qXEsoW6sTr5YKhqapQ8bN5/iMgynSnSpwofK8UIdElUICokuV+YeU
	pLhQX0rIzKSWQaQoOOmxfxrSkQTavsJUbrWfabrdt3jrSYy/PAHW/LGxNsKyQ16/dGqn
	1oGSOJ+RowORSoNr6FX6RSUrmRCWJYcwDPjUkwY3aWcbE/Rkfw/jS1BkSZeudmh8IE0D
	VAZg==
X-Received: by 10.180.88.161 with SMTP id bh1mr113596wib.8.1371744727449;
	Thu, 20 Jun 2013 09:12:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id k10sm1508166wia.4.2013.06.20.09.12.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 09:12:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 17:08:29 +0100
Message-Id: <8c481d40a6746d31d566a9db0b5bbb395ad54031.1371744428.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371744428.git.ross.burton@intel.com>
References: <cover.1371744428.git.ross.burton@intel.com>
In-Reply-To: <cover.1371744428.git.ross.burton@intel.com>
References: <cover.1371744428.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkMtASiK/uUAEvzz7ddNnEMAiGMX0C7ClmBVlMvZuIJbGTiuDq7Wgpp8uOw2CiYVorKy78s
Subject: [PATCH 7/7] core-image-weston: add clutter examples
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
X-List-Received-Date: Thu, 20 Jun 2013 16:12:07 -0000

Now that Clutter supports Wayland too, add the Clutter example app to the image.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/images/core-image-weston.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index cb9d7c7..064133f 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -6,4 +6,4 @@ LICENSE = "MIT"
 
 inherit core-image
 
-CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo"
+CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
-- 
1.7.10.4


