Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 045B260111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 16:06:50 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m203so7566829wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 08:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B81wD3WUtfHxkRxL+p9mPwtPz9b53wCXL3p6baIQagc=;
	b=eu3JGmwTpU/R9VyEaSr5rhHrMejvhXAoPNQ+YqwlluMgvj6Y3vnymvVNrduxK/C3E0
	UE0BUjgFhoo7ijuN4lfps9Wdvq9yK5xg0J95JrU+eCgbQhM458WOsfnm3BbetF2Sqmv1
	XCHJ4gvaViUYWCE8oSvdnopfbm2fufpVpgwCjVaVMHO0KzeTACJ5+J0JsdMZ77QUq7UV
	uCT0wo3aQf64uRb6Pxl9AFZxq+KS2JJKZ/0Frww5yIH/qEa0UE6+N+7qWcToihW87MPl
	KqKyHE5CTlayugdEySm1BXlt4WCD2gx5CIj7RA4DHGaROQkIJreSlZ2nDZhz1hvMLGkK
	gLEA==
X-Gm-Message-State: AKaTC02BN2Az6bE7Qf/BxfZUHix2L3zdxbc8+W9/huSic7+THviOH05f3aKSe0awCvCYBg==
X-Received: by 10.194.235.131 with SMTP id um3mr250899wjc.161.1479485211473;
	Fri, 18 Nov 2016 08:06:51 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id b15sm4111621wma.5.2016.11.18.08.06.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Nov 2016 08:06:50 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Nov 2016 16:06:49 +0000
Message-Id: <20161118160649.9559-1-git@andred.net>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] ofono: update 1.18 -> 1.19
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
X-List-Received-Date: Fri, 18 Nov 2016 16:06:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

In particular, this fixes a crash on shutdown.

From upstream's ChangeLog:
ver 1.19:
        Fix issue with DHCP parsing and Huawei modems.
        Fix issue with detecting Huawei E3372 modem.
        Fix issue with handling serving cell info.
        Fix issue with handling SIM SC facility lock.
        Fix issue with Android RIL PIN retry logic.
        Fix issue with Android RIL and RAT handling.
        Add support for Android RIL cell broadcast.
        Add support for SoFIA 3GR thermal management.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-connectivity/ofono/{ofono_1.18.bb => ofono_1.19.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.18.bb => ofono_1.19.bb} (52%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.18.bb b/meta/recipes-connectivity/ofono/ofono_1.19.bb
similarity index 52%
rename from meta/recipes-connectivity/ofono/ofono_1.18.bb
rename to meta/recipes-connectivity/ofono/ofono_1.19.bb
index b070731..adebd71 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.18.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.19.bb
@@ -4,7 +4,7 @@ SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
   file://ofono \
 "
-SRC_URI[md5sum] = "0a6b37c8ace891cb2a7ca5d121043a0a"
-SRC_URI[sha256sum] = "53cdbf342913f46bce4827241c60e24255a3d43a94945edf77482ae5b312d51f"
+SRC_URI[md5sum] = "a5f8803ace110511b6ff5a2b39782e8b"
+SRC_URI[sha256sum] = "a0e09bdd8b53b8d2e4b54f1863ecd9aebe4786477a6cbf8f655496e8edb31c81"
 
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
2.10.2


