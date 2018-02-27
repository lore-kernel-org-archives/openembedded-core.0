Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id D7C5178726
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 00:39:46 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id c11-v6so6913764plo.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 16:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bmxoricLWeZ/WeBIpo+by0fMc7a8pSW49PF21U7DeTU=;
	b=UT4zz7hY1MidI+A8ihVCblQwEZ3pFbVNz+IVSkRETOGgCqojHXoFrDSi0hz+tvzdW6
	xVrQYmvQ5seSK6Mj1ZqTW8cNkIH9Jr2ZLB+SzhhtrtMpouXMeubp4c1LotJOxISflsY0
	qOxZu3PBjrmI+ePDr+Nn/iuwRlnwNnNTjDrJf+b1a3EIFzQGgHyKH9KU4yR50zmMPE2r
	8/djVjTG/ncpqnhfN2+Aa3GS3mQGR1LeXO/frQ6b1f8tFh2eChHCmasuH1aNem8bfZuo
	Ez8ELqGvLk7BEQE1J2Qe+e93K8dmtjTbyg7IssgOobRWyz1U9BUDXOXCZNRRR/8z/OGq
	TFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bmxoricLWeZ/WeBIpo+by0fMc7a8pSW49PF21U7DeTU=;
	b=Q2/cX1e8VLoHcwT9z/vKzzzVTKqKF4JUwws+DausbRJSc9zXPHlTk9impGCF2Sny9M
	BXWkQNVUFXt/uvioShueNTVeu1YU2pw6xpB/CsoHtKwmwKkeOEXxhOVPOXONOGKZas3M
	1/KfdsoXULxTez/n+N0Sxod+2NKd7CnXMJOpA8oEEzP+aXdFBqlxvskYiVBs9w+MwDnl
	v6pG8gcjLH8fLVuHTX9JGDvZcO4pgX4ouWlRZkjpJf4BswjpMbkaIohN81nxAimGaFB2
	xDx4jflRCrLfIfng4H7befROlnYDpsZzbqNaoB4KeS8H5UYKQPWnUiincVlt4W+jrh17
	fUGg==
X-Gm-Message-State: APf1xPA4r+XwNlhnkF/vz3it/5qHN+k322W5dTVai5nTCFp6rcsTQZ87
	T2GhqX6F8uuwoYw167l9izhZfw==
X-Google-Smtp-Source: AG47ELvvQ2XM4eVtk9XD3rvIDOeUG6PHGVdGuuV4xe03zYjykU7FyPnK9QoqWT6uF3j3hqQ6vUEvJQ==
X-Received: by 2002:a17:902:bd41:: with SMTP id
	b1-v6mr5390378plx.147.1519691987681; 
	Mon, 26 Feb 2018 16:39:47 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	m190sm15862268pga.42.2018.02.26.16.39.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Feb 2018 16:39:46 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 16:39:40 -0800
Message-Id: <1519691980-11486-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [krogoth][PATCH] logrotate: replace fedorahosted.org SRC_URI with github.com source
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
X-List-Received-Date: Tue, 27 Feb 2018 00:39:47 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

fedorahosted.org was retired on March 1st, 2017. This is to
update the SRC_URI to point to github.com.
Update the ${PN} to ${BPN} in order to pass the autobuilder
mulitlib enable configuration.

[YOCTO #11226]

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit b935c1e9dd17afa85a9ffe213d5f94051f585529)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
index 5f1a601..5bd3381 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Rotates, compresses, removes and mails system log files"
 SECTION = "console/utils"
-HOMEPAGE = "https://fedorahosted.org/logrotate/"
+HOMEPAGE = "https://github.com/logrotate/logrotate/issues"
 LICENSE = "GPLv2"
 
 # TODO: logrotate 3.8.8 adds autotools/automake support, update recipe to use it.
@@ -10,14 +10,23 @@ DEPENDS="coreutils popt"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
-SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz \
+# When updating logrotate to latest upstream, SRC_URI should point to
+# a proper release tarball from https://github.com/logrotate/logrotate/releases
+# and we have to take the snapshot for now because there is no such
+# tarball available for 3.9.1.
+
+S = "${WORKDIR}/${BPN}-r3-9-1"
+
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/archive/r3-9-1.tar.gz \
            file://act-as-mv-when-rotate.patch \
            file://update-the-manual.patch \
            file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[md5sum] = "4492b145b6d542e4a2f41e77fa199ab0"
-SRC_URI[sha256sum] = "022769e3288c80981559a8421703c88e8438b447235e36dd3c8e97cd94c52545"
+SRC_URI[md5sum] = "8572b7c2cf9ade09a8a8e10098500fb3"
+SRC_URI[sha256sum] = "5bf8e478c428e7744fefa465118f8296e7e771c981fb6dffb7527856a0ea3617"
 
 PACKAGECONFIG ?= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
-- 
1.9.1


