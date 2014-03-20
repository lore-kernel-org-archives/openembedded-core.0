Return-Path: <trevor.woerner@linaro.org>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 254226E6FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 21:06:58 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id j17so1571665oag.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 14:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0ba4YV6xIDepU7ll6XiLls3x1IMMXLc8F5HLqCk8C3Q=;
	b=AumfgHFUVRYGzTotwC3mNpfv9oDpvnnEls/+AutLnGCTrvl+YLZtEklpcZD0LmUmbh
	m9y9VusjeTzQLjanNJoraCgVBwLvOQo0/7vB6lZ2MXqAJY9JFWb5dfPYfT71HgMLweEs
	dRy9qxurUJMCT+h7tl+027miql+zfh3RARk8vfz6Ifj2atUDK6I9xTp3k7BNX4wU2fTI
	vMiZXi/03T1LjwfLjmCE5DXIzfR2BjCNJsB6R3ReB8nAQiIxfy2Tf8B43UCxnWiybSjU
	M915oY1fC6JIM9pS8+UYw07b7f9jYG82+k22yuDD/DHgVKqB6/vSRyNOwTkbOq6Mu0rR
	Uk/g==
X-Gm-Message-State: ALoCoQkwRekGMpiYt5AGQkVV39hZk7IvYyssJ6BsrI0s1PQpxQk0oMmDt8Y+pSvJgc3MhkZnJPPx
X-Received: by 10.60.142.166 with SMTP id rx6mr8297816oeb.57.1395349618365;
	Thu, 20 Mar 2014 14:06:58 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158]) by mx.google.com with ESMTPSA id
	fn10sm4722779obb.12.2014.03.20.14.06.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Mar 2014 14:06:57 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 17:06:38 -0400
Message-Id: <1395349598-951-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: patches@linaro.org
Subject: [PATCH 1/1] core-image-minimal: allow user to set size
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
X-List-Received-Date: Thu, 20 Mar 2014 21:07:00 -0000

Allow the user, in their local configuration, to override the size of the
final image. This is useful when creating an image for (for example) an SD
card and the user wants the image to fill up the card as much as possible.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta/recipes-core/images/core-image-minimal.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index b82ca46..9716274 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -8,5 +8,5 @@ LICENSE = "MIT"
 
 inherit core-image
 
-IMAGE_ROOTFS_SIZE = "8192"
+IMAGE_ROOTFS_SIZE ?= "8192"
 
-- 
1.9.0


