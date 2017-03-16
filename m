Return-Path: <lnowak.tyco@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4B0BF77609
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:40:17 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z133so3277121wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=iyxzOtRekiprI/7Y5Ofe7pugp72+vorSjrSEC+9/Fcw=;
	b=IMDooj3EcWG1YR92jgFWlq8WamsnvChsigIAsXtxUkMWeC1SP7O/jl89hALutH5AI9
	lwc4Yugf5L0B69Ly8I7qj2JjIZlIztSQpVEzf18JfSja2021JinWc6OXhHf0eLLaxfLB
	p9V7WiuVRWJLA37r6iULjkRbIyeJYBYGISXVvvSCsDc5MQmOnLw6R/uV5Y/Wb7vUj9YC
	hpEl3a/M+ewZSrDfqd1S7pzbv7+zMpmmjPJ8yNqiVgYRNlwQRq/8+tdc+YvQ+1CyU52I
	zh41/PbXGbobr8H1xFn5n3bW4yg4tt+35eIlKTOGBKEwRDxhzVTh0gji5FYfzigjRLp7
	fGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iyxzOtRekiprI/7Y5Ofe7pugp72+vorSjrSEC+9/Fcw=;
	b=PtMGRQJyJZt5xRJ1ODA9nIzwVyuoaKdRNvtemu1kSIJQjxDmhT7Zdv61ujxpVS1wKI
	3O/mA1OxDiP5Pz/KmXFFSpZ4hq+JiJGiaTdOi6Z1h1kjB8/ubD9RijrxdWYPAnrkQq3I
	SJalK271jtgnSSKGJl1kqAJ8cgOekm3WTlEA+EEVZ9xm8AZcKrofWKnbHtiCYr9x8dg1
	gv3v+9V9XTPBkzEAHqP6pH32qqr+cxRUvlY0SR57iBLNT9Zga6yOhWBU88w+qi8gSsyx
	AHy2ZcjROqaw1SKfyNZ/SdjfVJJfijkpA8Hns5WkMOWh8pFlSr5vCootz4uDD0YICxm8
	zZ/w==
X-Gm-Message-State: AFeK/H1tqlbkNsgLwkuIazWwuocADtByuTt72d+ipNsBd0lVpBc7UHVGG+JHBRHQY3WWJw==
X-Received: by 10.28.187.68 with SMTP id l65mr9498339wmf.24.1489675218112;
	Thu, 16 Mar 2017 07:40:18 -0700 (PDT)
Received: from ln-xu1604.TYCOFS.COM ([109.77.49.214])
	by smtp.gmail.com with ESMTPSA id
	o143sm4587269wmd.3.2017.03.16.07.40.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Mar 2017 07:40:17 -0700 (PDT)
From: Lukasz Nowak <lnowak.tyco@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 14:40:11 +0000
Message-Id: <1489675211-20118-1-git-send-email-lnowak.tyco@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] connman: Create git recipe
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
X-List-Received-Date: Thu, 16 Mar 2017 14:40:20 -0000

From: Lukasz Nowak <lnowak@tycoint.com>

ConnMan has not released in 8 months. There are many improvements
in git, which may be of use.

Recipe is disabled by default with:
DEFAULT_PREFERENCE = "-1"

1.33 backport patch is not included:
0003-stats-Fix-bad-file-descriptor-initialisation.patch

Signed-off-by: Lukasz Nowak <lnowak@tycoint.com>
---
 meta/recipes-connectivity/connman/connman_git.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman_git.bb

diff --git a/meta/recipes-connectivity/connman/connman_git.bb b/meta/recipes-connectivity/connman/connman_git.bb
new file mode 100644
index 0000000..641d4fe
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman_git.bb
@@ -0,0 +1,18 @@
+require connman.inc
+
+SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
+            file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
+            file://connman \
+            file://no-version-scripts.patch \
+            file://includes.patch \
+            "
+SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch \
+                             file://0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch"
+
+S	 = "${WORKDIR}/git"
+SRCREV = "4de35cde5a93271e785a3bb5a0f3d39aea34d77b"
+PV	 = "1.33-git0+${SRCPV}"
+
+RRECOMMENDS_${PN} = "connman-conf"
+
+DEFAULT_PREFERENCE = "-1"
-- 
2.7.4


