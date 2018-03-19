Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id E9B91601F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 14:23:28 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z73so14547009wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 07:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+pYkY0UINexZq62xln02hRemfde18AVoC5enJzUuVmE=;
	b=fOmdnGLFcC8Ze65Fc9f0QVVVT4AbJGnOLb1sLevanypfq/JLBjKf+P5r7sY1/Cg5SY
	mjsP62bhcpPfSprIDsUf8XqqPl2d4IHug3KYwfhaAKGK+NMuYQSoSL7u53J8dhPl4NgL
	9NTB7iUeV5Wu81nSwUcCkqzc8SgMK/nUqfzyNWlFdLY67/GjBK2zy6+4n2mhpry9GJR3
	Vocbpnd9FfXfCDA0IoLRB+Jxe/aSaePrRsL5y7wmwZzh6LZEnrEQpeFDJMipENtYPVsO
	ZiH0i/tYEkp6kKjtzispt2iP0Y3pvkUMHYhmn5+IexU9kKCNqx3t1QMbd60BKPFF7Ptc
	GjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+pYkY0UINexZq62xln02hRemfde18AVoC5enJzUuVmE=;
	b=gcirOwDa5HP6GEe/+n1uZAefocwfhSVYJjxCOhcgMs4SOHoH4IH7OsktOlDMz6NIC8
	Ne3k74QRhldi31/F3kZPMwa9QK962fK/y4WIja4jzzcWhaTTJEMzZs+KWsjXBS88pROD
	BcmHLhbHwV130UMhhu2yElXaxjqA6ky+Bf0e/lzjD5fO2bnbLGyNVSkFCQDHIPx9kAK5
	h/e5duJSGWgdavF7yZc3hHLyzetJmiNbatkXTLZGw+CLOd/1yLV0LlAYAwmsiGeID5An
	klWunEjrQsK7t4dqdrU5UMttElgLKVS0ss/2r/9MPUWqvBaR158iUMJT6ro9V0rQWSyN
	TSdA==
X-Gm-Message-State: AElRT7FwY8CTDFahqNBSVz09iRL+sFVPw2vThgqzapjp71NwBL5W03z0
	Rxb38WdTuUQq0ZVds3XAzk3zgwP/
X-Google-Smtp-Source: AG47ELtzyRcMKA5EBm0ESCrBpEQn4bmaAzIIPXGwCYEQGEx1d0OXs9USZkDao/gAXd56k+4Tuzh5eQ==
X-Received: by 10.223.128.40 with SMTP id 37mr10314130wrk.73.1521469409271;
	Mon, 19 Mar 2018 07:23:29 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id e53sm190122wrg.34.2018.03.19.07.23.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 07:23:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 14:23:26 +0000
Message-Id: <20180319142326.11699-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] Revert "lttng-tools: Upgrade 2.9.5 -> 2.10.2"
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
X-List-Received-Date: Mon, 19 Mar 2018 14:23:29 -0000

None of the test suite works, so something quite fundamental broke.

[ YOCTO #12606 ]

This reverts commit 406ea737f1ce5bb5fed46c8cbeb5c7c13bf3b8ad.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../lttng/{lttng-tools_2.10.2.bb => lttng-tools_2.9.5.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.10.2.bb => lttng-tools_2.9.5.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-tools_2.10.2.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
index fd5abbb113b..93626dd4b5f 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
@@ -22,7 +22,7 @@ PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
 PACKAGECONFIG ??= "lttng-ust"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig-native"
 PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
-PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
+PACKAGECONFIG[kmod] = "--enable-kmod, --disable-kmod, kmod"
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 PACKAGECONFIG_remove_libc-musl = "lttng-ust"
 PACKAGECONFIG_remove_riscv64 = "lttng-ust"
@@ -32,8 +32,8 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[md5sum] = "f4037d20c0a905cfb89770bccb2dc3c0"
-SRC_URI[sha256sum] = "b3038ff9ba46c3e4d3d228def733c15952d15d23fcb1151a580f31c4276c9a9f"
+SRC_URI[md5sum] = "051224eb991aee07f8721ff1877d0b96"
+SRC_URI[sha256sum] = "77839eb6fc6c652125f08acfd9369701c2516eb05cc2084160e7efc7a3fb731c"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages
 
-- 
2.11.0


