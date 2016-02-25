Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3F8771A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 19:59:20 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id ts10so59092798obc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 11:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=b7dw79VmCcDOJNfDThlNUNRHJm7/y0AGNjeQTJtY1lw=;
	b=V4QKpNAE9rFDC+QV0HB101BF+RjSLhGWz/EF9zLXlbR4umvpP1Y11IXdTHlmsaWAu/
	3XrKky3iQsOjppMeP54D4k6yF4HPrroE5RlK6vy4bl3TuvJ8HLS1X83tyQY+U1nmSIyo
	FSl1I17M1ba04yYQl3TWZDSSHq+bgwzEQfUeO3s55Ff7f2/Cw4IqeKmyHzRXpXok0lEr
	UV6wO198L1xOHvxxWZyJTHDnwB6XPhJvrWfoDBbOGrU83RKax9p2D4D38iL4WZS43/tL
	ts2Qt/wKavSW/PMOdwAnwHs3Xc7Uhz3ktVgmHoCpkUY1K/NraMaXq/3g2IvjNomCCaVT
	HO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b7dw79VmCcDOJNfDThlNUNRHJm7/y0AGNjeQTJtY1lw=;
	b=g3oPSw6B53557I6NAQSyAEJC6Y5mO6Vd3NwW9noki6IH6RUx4wXjWxdZR6BSi6xo8m
	GsRqr1CpnzM9QtFVHo3tBxx0MseisAsvm0t4WRr3UqBfoPllLLsPZvdruC+KpGn+8hkc
	VHbewswrR+/HfChUfQ/NujtxbktuIYZXo1ZPNhJI5IbqcQtQhvDE+8lEwaOOb/6mthCM
	EaAVxLBOPxFSxDjZDp2uFWbtywHYfgh7Ijh9tHgR5+TkpgpUyvLr7cJurt5UodKR0OYE
	/VIM8nrXYvk9DE7pZjtbXoxr/dK+PoMm5YCHIb7CGfHeM6d46N932UKIDibMBFXjOUVf
	pqIg==
X-Gm-Message-State: AG10YOQDT2SWZvb6cV+YAfArMk2+q+4n4p3r+30tF3UM5eXgNGK5akIfYtxK3jcEWCF9yg==
X-Received: by 10.60.79.102 with SMTP id i6mr38135744oex.4.1456430361216;
	Thu, 25 Feb 2016 11:59:21 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id cn2sm6277289oeb.8.2016.02.25.11.59.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Feb 2016 11:59:20 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 11:59:15 -0800
Message-Id: <1456430355-11659-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] boost.inc: fix BJAM_OPTS --build-dir option
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
X-List-Received-Date: Thu, 25 Feb 2016 19:59:21 -0000

The correct syntax is --build-dir ( --builddir is silently ignored ).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index c55221f..982446c 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -143,7 +143,7 @@ BOOST_PARALLEL_MAKE = "${@get_boost_parallel_make(d)}"
 BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
 		${BJAM_TOOLS} \
 		-sBOOST_BUILD_USER_CONFIG=${S}/tools/build/example/user-config.jam \
-		--builddir=${S}/${TARGET_SYS} \
+		--build-dir=${S}/${TARGET_SYS} \
 		--disable-icu \
 		${BJAM_EXTRA}'
 
-- 
1.9.1


