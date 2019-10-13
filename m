Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 086A67C89C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 23:53:10 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 23so9016872pgk.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 16:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7N8mG1cKYgQkLCplvGK/y51+/QMb5NS1XyB5wEVkFK4=;
	b=c2XbGTp5e+JdlWhASL2LOqUmW9H/yMoyMAqYVzpTqvitgzWOOHs/p3eCCZoK2Rwbs4
	oahj4oaQA+9SqcmldDV5+YzB9nDVU9HWqI70WdSPSwhq8gHq4QG0+fW3FaEKXyQ1PPpq
	Ms7HdCw4PZhGnToumWOsI9N9G5Hfxq/Nj5SMmljq7FOO0DxOgj4qIQd+V/cokRwjC6Rt
	WdFpO2kaDA65+xmR4vutdk0E3dItpF5JSJoPlca13DkX0TzcoYZIfpMkT0UBhoXDH9XJ
	3RgD3Xi8QobqjH/be/FG3pFxLCm2/sZSs62FKYoBQhxeyyQjGoQyLCocoSG0L4CXMAaz
	LRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7N8mG1cKYgQkLCplvGK/y51+/QMb5NS1XyB5wEVkFK4=;
	b=KWouT+nKxhMuNYHDDJNj4Q1Yjy2fUEHtbwMk/lfy/XkFAdI278SVEzJPhR580KPrgZ
	Q7Yfhv5weqMsIIuwhPorH1DBKdX+G98FbQgMGgKXIJoC0sLNWF91TkIUKVHQodVrRAxJ
	jhG2C1zmY67FF2j9wqLx8AvlaZqqx5dUqvhNwqFJTMYfRTdkuPnCRN7OuLpovrgVD+s5
	MBc43YPind7djMgKzQ8OZLawApu2e2gZPWHkgDaPz+fF5rreJ2nWG47qcCYFlMhlFs/E
	KUKWeGbeOS1w4s4qi4S9y/IRwZDTR3CfNwnp8MkD5OpHJRsqW8ZBruMgzMG/o6+R1PFW
	A3Yw==
X-Gm-Message-State: APjAAAXJcP3Rc2K+TlaePQw51rx11RFpBh863Hu35Wpl0x8bqRF3ARBx
	04fMMNalWqPCIRm8PVMqEXF76C7S
X-Google-Smtp-Source: APXvYqydJKMiadqcjJ45DrSWU10//4Z2DFsZi8HTSCgRtNDpj9tRWpzYM1nEAfWOupjsst8j5tR2vA==
X-Received: by 2002:a65:6096:: with SMTP id t22mr29595317pgu.409.1571010791712;
	Sun, 13 Oct 2019 16:53:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:e411:bea0:2b80:fd65])
	by smtp.gmail.com with ESMTPSA id
	m9sm14737393pjf.11.2019.10.13.16.53.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Oct 2019 16:53:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Oct 2019 16:53:09 -0700
Message-Id: <1571010789-25049-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [warrior][PATCH] gnutls:upgrade 3.6.7 -> 3.6.8
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
X-List-Received-Date: Sun, 13 Oct 2019 23:53:11 -0000

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

-Upgrade from gnutls_3.6.7.bb to gnutls_3.6.8.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b34486a616ab4d4b30247a5dff58a18ef26ed709)
[Bug fix only update.
Includind: CVE-2019-3836 CVE-2019-3829
https://lists.gnupg.org/pipermail/gnutls-help/2019-May/004527.html]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/{gnutls_3.6.7.bb => gnutls_3.6.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.7.bb => gnutls_3.6.8.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.7.bb b/meta/recipes-support/gnutls/gnutls_3.6.8.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.7.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.8.bb
index 01dd23c..bd752d3 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.7.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.8.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "c4ac669c500df939d4fbfea722367929"
-SRC_URI[sha256sum] = "5b3409ad5aaf239808730d1ee12fdcd148c0be00262c7edf157af655a8a188e2"
+SRC_URI[md5sum] = "9dcf0aa45d1a42e1b3ca5d39ec7c61a8"
+SRC_URI[sha256sum] = "aa81944e5635de981171772857e72be231a7e0f559ae0292d2737de475383e83"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.7.4


