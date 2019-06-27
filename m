Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 129E57E961
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 13:54:02 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id h6so4930439ioh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 06:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EGg3QNqAPLK+HnI3+4Xzc7ykdG0zr36U0iTna5Lhg9E=;
	b=NLoeNdfT/rwbDpyuzRObj7wh0u/koZ7TwijFUYI0Cagy2cYEgNjXQogMLeLnKXVUGE
	QRHO8aIJRs49Z3Qw2V09hpmK4V0vz8ph9+BrCNc8UFe+AFhLpWpEz4Ef9OykFHR70dG9
	8nZ2OqZnssofrcl2O3sSFPKT+CuyxsHFnIJSyB/IbzoW1LY1d0gFHDw7G1jGfQvLhd2A
	kN4H6gKoc6bRspyX4m4LYowYERPMoYiTTPTlNcZeQseNHaeRYNAj7YqXXosO+SghDrJe
	pyWrF9QPDRFWd1sAjOfuY051MBMYkUf9GyxKif1bU+AvqR4xC0IOQ/ualAsEfsT1e2wd
	evWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EGg3QNqAPLK+HnI3+4Xzc7ykdG0zr36U0iTna5Lhg9E=;
	b=TL6Qca/tHIhGrNO+RASjPo8TJKOF8tJBlFTpUXJAEhC3TrPtHUwx71AV8vkXDFuYhH
	h9yVB2T1iBb7XhFAovY70Yw9+LEzaHr4hE+rV0Vvyi6uoVYEeIHt5VZ8VvPV9TULD8O1
	bg7NgnfBmVEM+m4pbOv4im6dgRp1yuLw7Tv8sHHEND/C6O0DdAFTS0hrcj5SBa2DgikL
	Kl1NT9dU90vgSImuXgNWmPVpvNxQ9ByL2luEIC6HL+wRzPGd3amdlIEEGc8CNc17Nj27
	BgiyZRa9whS03074v7cmF+J6LpWvxoNN8Xe5/QlHMRapFkdCfJtDD1Td1Fd5rALCbH41
	5TVQ==
X-Gm-Message-State: APjAAAXl3xebYY6l7IJ/Yg6L3wuNK8aIJQPHgdKjUdAB+XbZ1fqff5A7
	LkcDLQZWylFSXGyzi6EC2lCTKXId
X-Google-Smtp-Source: APXvYqwdelUXjxhx3lNE1bfx5CX9v/FslUZ+guQ73as8o//yvfVN9oONg4FsXTH5FBtD2uhGelwyyA==
X-Received: by 2002:a5d:9bc6:: with SMTP id d6mr4059151ion.160.1561643643914; 
	Thu, 27 Jun 2019 06:54:03 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	n26sm1731761ioc.74.2019.06.27.06.54.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 06:54:03 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 08:53:59 -0500
Message-Id: <20190627135359.15689-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] opkg-util: Fix documentation DEPENDS
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
X-List-Received-Date: Thu, 27 Jun 2019 13:54:03 -0000
Content-Transfer-Encoding: 8bit

opkg-utils requires perl to generate documentation in do_compile. If not
present, the documentation will be skipped, which is not reproducible.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
index 4be7b16d8a2..2f1bf0d21ba 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV
 "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
+# Perl is required to generate documentation
+DEPENDS_class-target = "perl-native"
 
 SRC_URI[md5sum] = "8c140f835b694a0c27cfb23d2426a02b"
 SRC_URI[sha256sum] = "9ea9efdd9fe13661ad251e3a2860c1c93045adcfaa6659c3e86d9748ecda3b6e"
-- 
2.21.0


