Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7757523B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 00:12:56 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id u6-v6so8293151pls.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 17:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yfxbajxuEM8mvxfdVsEFrumoXinhJHhoLki73/BSfh8=;
	b=IvPmyaY7KV5lYqQNEm+Jyq3mUzjTb3SsTj/8NkEtiE1Yhpjrx+fmbbITBEsMcnxOtt
	+MHvxY9YS9vj/bIQNj5m0ga+9Ko8O0yBUgEy0gyNdZjNyFjmvvB2t/pbRH4YPv1OrTnv
	yUqdWD1IkxjTCOWPfjAjN1/baWRH/YORLsSug/0sZgHTNcbCUBbbRyi1dsI0OqQxVfru
	MWtirYQ7UzyU59D9lYN5+nzTqoKMZxNy4OqOyRF9cRXMU7w08HPCuaFRZjzEWRDu2vUC
	BfDUvAfCZv7bDGBEfBCUXzUvd2Dpl2h28wtHE9zFDsTGndnS44xNRspbuWt00u7tRAQS
	pbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yfxbajxuEM8mvxfdVsEFrumoXinhJHhoLki73/BSfh8=;
	b=RdicfVo/p89g1YEKsnpttZovRSYKBlkF85MoVu8Td0hRsrI6ei50DsLGSV3onQZGSB
	ySUxTWFMOVcNukT2BhSli0oQPGd1/uLN4ma7FO8i9+p5dQVxhJrGrYa2dqGVY7p4HQjh
	Bi55EWswlklBXOyxEkum97Dp4ikjGSUtqEW3igbLANn6hkfVH0KJYwFsSikZT8jMCtAF
	tC0X4XRCma2a/doCjYxOJk1b6WdgvepaC9ipqYcTRGLYRCoc7UxYeqH9WGoQi1nERGLn
	zcnkrtrCWKTMSNFb3+TUbCCNTEFO948QDBFfvgkEBuEjec+Pbw6nhEHByW+Bz8no0lZY
	QUfA==
X-Gm-Message-State: ALKqPwfB/8AmmQljsax0i5JJKhWBj1FsXxSQXxYPt5iYkWIOV3gC+uTp
	ygSsVbiTHwNRZD3SHpSquh2VlQ==
X-Google-Smtp-Source: AB8JxZrK3OZ1QGqtreOM0aYI6inZHP+HGvGR3UYlAldiDDU81ZideeE+2UWhNaP0H7vOt7sEWAc1BQ==
X-Received: by 2002:a17:902:8f82:: with SMTP id
	z2-v6mr11954260plo.350.1526343177918; 
	Mon, 14 May 2018 17:12:57 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n10-v6sm24255195pfk.145.2018.05.14.17.12.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 May 2018 17:12:57 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2018 17:12:51 -0700
Message-Id: <1526343171-28124-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] bitbake.conf: drop obsolete comment refering to the fail-fast over-ride
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
X-List-Received-Date: Tue, 15 May 2018 00:12:57 -0000

The comment appears to have been accidentally left behind when the
fail-fast over-ride was removed by:

  http://git.openembedded.org/openembedded-core/commit/?id=83ce96f44516c8a4a44c8c0140949256f8422014

Also update comments to refer to bitbake variables as just variables,
rather than environment variables.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a21b728..b85be1e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -722,19 +722,16 @@ export PKG_CONFIG_SYSTEM_INCLUDE_PATH = "${includedir}"
 # is a bad idea. Setting a dummy value is better than a ton of anonymous python.
 DISTRO ??= "nodistro"
 DISTRO_NAME ??= "OpenEmbedded"
+
 # Overrides are processed left to right, so the ones that are named later take precedence.
-# You generally want them to go from least to most specific.
-#
-# This means that an envionment variable named '<foo>_arm' overrides an
-# environment variable '<foo>' (when ${TARGET_ARCH} is arm).
-# An environment variable '<foo>_qemuarm' overrides '<foo>' and overrides
-# '<foo>_arm' when ${MACHINE} is 'qemuarm'.
+# You generally want them to go from least to most specific. This means that:
+# A variable '<foo>_arm' overrides a variable '<foo>' when ${TARGET_ARCH} is arm.
+# A variable '<foo>_qemuarm' overrides '<foo>' and overrides '<foo>_arm' when ${MACHINE} is 'qemuarm'.
 # If you use combination ie '<foo>_qemuarm_arm', then '<foo>_qemuarm_arm' will override
 # '<foo>_qemuarm' and then '<foo>' will be overriden with that value from '<foo>_qemuarm'.
 # And finally '<foo>_forcevariable' overrides any standard variable, with the highest priority.
+# This works for functions as well, they are really just variables.
 #
-# This works for  functions as well, they are really just environment variables.
-# Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
 OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
 CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
-- 
1.9.1


