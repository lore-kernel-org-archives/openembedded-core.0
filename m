Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 877556BBD8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 21:33:32 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id ii20so517228qab.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=0h0w4D2SMAhgbEFbyaZBfe5LFhRj+Pvqfzp9QxeXpzY=;
	b=uRI8up7jXl9cpR/J2nqEtNtf/ssD9hi0XRLuuF7KoTpHd6DZve5W44Wyw3Z6qgFjLB
	SyGFnFSnVDj85ygaTsC4SWRDQaTLNBqilx1kiiQd5F1ceidvgMw74o5e1Bffbh7lpjaK
	r5L1ePFhvlhXKdWHBz/a61UMZZuunUrVfOQouGFTQKREipKbdeHQXqx6NaU5PwuQl97f
	I9fqIVRfDl/sGMBhPTK29uX9MBRi6U9OMXou6+pvGeVGkaaYPD0X7xHaRlfjxC4qyyHh
	cviczA6MdjbPf2pZvHrJacmPXn/qOZlNIf8+O2JIsPrZtnJ6iVzC9hjdFJ5l+L+Twhw7
	4YWA==
X-Received: by 10.49.95.68 with SMTP id di4mr5967826qeb.50.1378330413836;
	Wed, 04 Sep 2013 14:33:33 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id u8sm40128437qef.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 14:33:33 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  4 Sep 2013 18:33:18 -0300
Message-Id: <1378330400-28466-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/3] core-image-weston: Ensure wayland distro feature is enabled
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
X-List-Received-Date: Wed, 04 Sep 2013 21:33:32 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2:
- New patch

 meta/recipes-graphics/images/core-image-weston.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index 064133f..187523c 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -4,6 +4,8 @@ IMAGE_FEATURES += "splash package-management"
 
 LICENSE = "MIT"
 
-inherit core-image
+inherit core-image distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "wayland"
 
 CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
-- 
1.8.4.rc3


