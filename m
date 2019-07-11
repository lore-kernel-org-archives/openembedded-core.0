Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1338B7F0A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 23:54:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r1so8025540wrl.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 16:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0BoAy6pgRslmQUepxOlNDE0RILap4cOUB1vW+lb+6+4=;
	b=E0BmSq86CavgrP0ETlBOp6UXO9GszWHBun2U2aILFghqpItkl2XBnnwAJIxNwIXAML
	ToQHqWwVMEjcFp38oPxB1khItpEX3e9zUHkzEZ/7zxSwAy7I+VlEbm2YnEoJKxnYPK7p
	6AovoMetcJmVNgzs3D+Mu96dpHN8AzT+SWfw8ELrirUs6PtZG0lyUeXm7o0rdKKzGDez
	bGjGrzMsFCeJdz7HDm1Bu3+o9gwcKqz1AdQvkdUoRjXghu/rt/F4/6XW2dd6aVWF4xCW
	sX9no2EDf7dhCNqbqDeiALbcA8TUtnTD+MMtuK+g1lDGDWPr/sJimu6k2dxPleax5FaL
	ZXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0BoAy6pgRslmQUepxOlNDE0RILap4cOUB1vW+lb+6+4=;
	b=Iol9+zWVDqpQJ/OPSVMgc2ckCw6U9IYxBjUL1IGIGPaA6GKf1dtaHiqRVsNgxVBnKu
	BKTyx8B1erTPZtKYRXqoYOCpI3YqZmrc1Ria1wCy/BOoFovi0IPxbFu+SsapTkWbzGRN
	qypRI+JiCPFc26xckVyeMLcaj+F6xJ7v+2MC5N2XbINdbj29uJN8/sHmzC2/ijY8AuVz
	JyAWWQ6XBA83GRNeZdpi+w1WzMUmxT7vigJztKt1pZhZxupyOtVc/CI/Ga8nok5QSfhq
	3KGRGtlO5dUxeXVMOecrotA7nuGxyM8nFs9gHEm27V1Zro6sFe91SPS5D5p/+ku1inWc
	MA2Q==
X-Gm-Message-State: APjAAAVPy0r9g9rCFzfbvh7GSqfC7prqCCcTRsgMSlHOYVX/mVxZcU5B
	4JNQuLH2l1NHdHWUwtnSmDS5mTsF9jI=
X-Google-Smtp-Source: APXvYqwN5Z2zhICXZg5zPaEH24kndAmE0AlK6v6t6ueP3KdFNADboUu+nCMlnSwunk/oAX14igg9HA==
X-Received: by 2002:adf:fd08:: with SMTP id e8mr6566074wrr.147.1562889273584; 
	Thu, 11 Jul 2019 16:54:33 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c78sm8239871wmd.16.2019.07.11.16.54.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 11 Jul 2019 16:54:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 00:54:31 +0100
Message-Id: <20190711235431.23122-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] qemu: use Python 3 to build
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
X-List-Received-Date: Thu, 11 Jul 2019 23:54:33 -0000
Content-Transfer-Encoding: 8bit

As part of the mission to remove the use of Python 2, explicitly use Python 3
when building qemu.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu-native.inc | 1 -
 meta/recipes-devtools/qemu/qemu.inc        | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-native.inc b/meta/recipes-devtools/qemu/qemu-native.inc
index 34ab8e64011..c04297cad04 100644
--- a/meta/recipes-devtools/qemu/qemu-native.inc
+++ b/meta/recipes-devtools/qemu/qemu-native.inc
@@ -6,7 +6,6 @@ SRC_URI_append = " \
             file://0011-fix-libcap-header-issue-on-some-distro.patch \
             file://0012-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch \
             "
-EXTRA_OECONF_append = " --python=python2.7"
 
 EXTRA_OEMAKE_append = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ac475a8e2ae..c1c99cd8683 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -77,6 +77,8 @@ export LIBTOOL="${HOST_SYS}-libtool"
 
 B = "${WORKDIR}/build"
 
+EXTRA_OECONF_append = " --python=${HOSTTOOLS_DIR}/python3"
+
 do_configure_prepend_class-native() {
 	# Append build host pkg-config paths for native target since the host may provide sdl
 	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-- 
2.20.1


