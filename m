Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id AFD727FC10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:15:24 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id bg7so4337088pjb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0Y5vhabqW7djdwHdjCEPXH1majAzei6DlaJNMt3R/PY=;
	b=mDxjmVOokL3eISgXK6e4kZ2LQnvWRgCUfDLhgjZ1IvbHGrwpopd0rtLMGcfsC1z8Cr
	2tIKNCYzyHvHAzNjpZqDM3khRaEOyqxjQwt5wnpQaKlN3YPunLzgDmLHDJHtc2rwWFNQ
	cD93vLccHmKBgmUdiaWsmZYPNESplIWzvuy2Os6xpSNyktuyw8WmH3J0vFJJKRIWTSrI
	3nTJvVSOOAI+InMv1e5R6OjRfj6EATvdnyjOJ97lv7DHYnqF8Bp9cMqOdVMJ6IAbt2dg
	TocW1sCQ9xJHCCxUvTLWQinpEtlRMkRZhFY0ktFGUxuMLwaDMdpFPWqKjOlGLM49EV5M
	fcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0Y5vhabqW7djdwHdjCEPXH1majAzei6DlaJNMt3R/PY=;
	b=uTlTRgGT8F4pyb4XnlNMQjE8W+HlnNoEaqzsto+4UxZ/1Dh5BCeOEReTX5ASjJsFpF
	rsdttz1ndL1LrGqjpZKzCWPBG+zrBQj1NEUqrykaBHsadCorFeUjaUjQ5I6ZRrryT35I
	7tFfFMZXuInoEjQqWcKBeHvtfXBOTpqSp5R5ZghCglnKzBek5G9BEhZlwyKyx6wGfWR+
	xwUi2kNb4SLb5alKiKoKnonvPEPby9qmaDFSWJW+YrePAUqmoVYyXUzyxbXtiSEfF2fH
	gVOUh7Fhc1qLLJsCNViTJTHx8sGnzGoWaEt0sQR1/a7spHH7iyVXPVMcG9aB5ixUs/gW
	CC/Q==
X-Gm-Message-State: APjAAAUugh8BGyAyHzGn9C5fqOODQbNfKIOz49gtcAWvr8XrM3N6JCb4
	C1aVBzTFs3z3uQbml3wS3ymJCytOiSI=
X-Google-Smtp-Source: APXvYqz13IlTM6cCO7RHZhibW+DFhQFqSHik+6584Schlw+7d3uoQoVACMbkwvC8ggpAtYnHxkWhdw==
X-Received: by 2002:a17:90a:1992:: with SMTP id
	18mr19577421pji.46.1576887325103; 
	Fri, 20 Dec 2019 16:15:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	65sm15001784pfu.140.2019.12.20.16.15.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:15:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:14:59 -0800
Message-Id: <20191221001459.1630195-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221001459.1630195-1-raj.khem@gmail.com>
References: <20191221001459.1630195-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] tune-power9: Add power9 tunings
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
X-List-Received-Date: Sat, 21 Dec 2019 00:15:24 -0000
Content-Transfer-Encoding: 8bit

Add Little/big Endian, 32bit/64bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-power9.inc | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-power9.inc

diff --git a/meta/conf/machine/include/tune-power9.inc b/meta/conf/machine/include/tune-power9.inc
new file mode 100644
index 0000000000..81d6e8e9bf
--- /dev/null
+++ b/meta/conf/machine/include/tune-power9.inc
@@ -0,0 +1,35 @@
+DEFAULTTUNE ?= "ppc64p9le"
+
+require conf/machine/include/powerpc/arch-powerpc64.inc
+
+TUNEVALID[power9] = "Enable IBM Power9 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'power9', ' -mcpu=power9', '', d)}"
+
+AVAILTUNES += "ppcp9 ppc64p9 ppcp9le ppc64p9le"
+
+TUNE_FEATURES_tune-ppcp9 = "m32 fpu-hard power9 altivec bigendian"
+BASE_LIB_tune-ppcp9 = "lib"
+TUNE_PKGARCH_tune-ppcp9 = "ppcp9"
+PACKAGE_EXTRA_ARCHS_tune-ppcp9 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppcp9"
+
+TUNE_FEATURES_tune-ppc64p9 = "m64 fpu-hard power9 altivec bigendian"
+BASE_LIB_tune-ppc64p9 = "lib64"
+TUNE_PKGARCH_tune-ppc64p9 = "ppc64p9"
+PACKAGE_EXTRA_ARCHS_tune-ppc64p9 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p9"
+
+TUNE_FEATURES_tune-ppcp9le = "m32 fpu-hard power9 altivec"
+BASE_LIB_tune-ppcp9le = "lib"
+TUNE_PKGARCH_tune-ppcp9le = "ppcp9le"
+PACKAGE_EXTRA_ARCHS_tune-ppcp9le = "${PACKAGE_EXTRA_ARCHS_tune-powerpcle} ppcp9le"
+
+TUNE_FEATURES_tune-ppc64p9le = "m64 fpu-hard power9 altivec"
+BASE_LIB_tune-ppc64p9le = "lib64"
+TUNE_PKGARCH_tune-ppc64p9le = "ppc64p9le"
+PACKAGE_EXTRA_ARCHS_tune-ppc64p9le = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64le} ppc64p9le"
+
+# glibc configure options to get power9 specific library
+GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power9', '--with-cpu=power9', '', d)}"
+GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power9', '--with-cpu=power9', '', d)}"
+
+# QEMU usermode fails with invalid instruction error
+MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'power9', ' qemu-usermode', '', d)}"
-- 
2.24.1


