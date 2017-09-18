Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 969C778062
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 22:31:02 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id 108so1653661wra.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 15:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JLd9dqipfOROYIPol3LB03JgV3QwjEzmRy1VEh1F/jE=;
	b=xRJ6iCz3pqLzkAKL2191X6ednWlXu0UvN08Tesg80onblfhCBRNzIw0pjKQNQyhgmG
	dkD5Oyp7ykRf3cjCfxU90oGJ0f8R5W6pMWNyjldz2zlzFv9mCB+IVO0ssDmDNBuMzVe3
	81BmLkJKQwa7RPD+NjITVGJpZGnFBRIHvYchIWSN6DMpRThXrHp1hhy7QKdIATPM7oQl
	EdE/Xa8T8UHscuQGoRTsh73Hoed1xgzHEUsWSv/nqob9VKFzLMtGs4txEz3e1sZoQw5e
	rIef6HhIDdV9jOX1VxEZ5YGwHQjM7ZcYfr+XP1ySZi23BW82t0JnIJoZGmQCb6Q+aWAu
	pEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JLd9dqipfOROYIPol3LB03JgV3QwjEzmRy1VEh1F/jE=;
	b=uLQrRFPD9gYiYz93z7AUiYDsM/gq08DoD7CCSOcRsVF5rfWUHJ80cZXsE0IO+06/wp
	JlCH6Wv9AntDgxhALMtRPTc6NwfUTm3YT7z3UdH3ZHMsqrymZgYeJwNhVpYXL4erwPvt
	p06Qvf0em79mm2h2pOXyhM+pyfZf1tTzUNHKCKTPGh5YozFrJegUqCoGSEVKpd6tBUxp
	KFun6y5x3v8Rgm+73Sz/JapakMonqOfIaILhVBFIkseBgVhlM2pHov2Wx0XMz3uFsp8L
	9VA4HwWHGzbiY9RX/R2Se5pBcbLlFrxxygS9PQj7fg13DVl4MRBbnLlrfVMc6HctHgqu
	4G9w==
X-Gm-Message-State: AHPjjUhWsk2aeoI3MNgZIc84omIGt2gP5VqJxtVSTMgZuqzIOcG7IjNu
	rHEH9iop3/yekU8yAxA=
X-Google-Smtp-Source: AOwi7QClnWHfpmVXp9FLxP6fibxWUOdUskx9L2DF57IKNM3KKAipdBHDUqGjoiAOk4nM4ogfHx4rng==
X-Received: by 10.223.199.196 with SMTP id y4mr20406036wrg.181.1505773863007; 
	Mon, 18 Sep 2017 15:31:03 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	p199sm121811wmb.28.2017.09.18.15.31.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Sep 2017 15:31:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Sep 2017 23:31:00 +0100
Message-Id: <20170918223100.18712-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] eudev: use archive tarball instead of Github generated tarball
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
X-List-Received-Date: Mon, 18 Sep 2017 22:31:02 -0000

The Github-generated tarballs can and do change over time, so point at the
archived tarball website that the maintainer hosts.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/udev/eudev_3.2.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.2.bb b/meta/recipes-core/udev/eudev_3.2.2.bb
index fcadfa36f79..02fb23ac569 100644
--- a/meta/recipes-core/udev/eudev_3.2.2.bb
+++ b/meta/recipes-core/udev/eudev_3.2.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod libxslt-native util-linux"
 
 PROVIDES = "udev"
 
-SRC_URI = "https://github.com/gentoo/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
+SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
            file://Revert-udev-remove-userspace-firmware-loading-suppor.patch \
            file://devfs-udev.rules \
@@ -21,8 +21,8 @@ SRC_URI = "https://github.com/gentoo/${BPN}/archive/v${PV}.tar.gz;downloadfilena
 "
 UPSTREAM_CHECK_URI = "https://github.com/gentoo/eudev/releases"
 
-SRC_URI[md5sum] = "1a0faad3a88ade3475e8c0ddef78e30b"
-SRC_URI[sha256sum] = "80628191448886846ab9cc0e2af6782358a0afb81d5b4f8cd9d982d2626cca31"
+SRC_URI[md5sum] = "41e19b70462692fefd072a3f38818b6e"
+SRC_URI[sha256sum] = "3e4c56ec2fc1854afd0a31f3affa48f922c62d40ee12a0c1a4b4f152ef5b0f63"
 
 inherit autotools update-rc.d qemu pkgconfig
 
-- 
2.11.0


