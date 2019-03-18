Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8904A7C752
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 16:58:12 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id v21so11651707pfm.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 09:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ug1n5Hw3Zt9YAzIIshXn4b9lCTTls3TDjRuvcNYmCI4=;
	b=e8CtpPmSzLRsoPyATmBKfCfApY3ZN99NnCnjvRnCxT26JIid5I28zlrnYm5/AHmnBm
	9exNPYrpqx3TlabVhpCQ/CC4Y0d9vOq4jbWbPHWtCziAVlSl7Vu9z3o7s0evkrIC9GMV
	+Wla+uz5Hj0tE//7xPjQrCybptlUe+LeXin0i0GOVGm9r8CjriPerHzGFftfAULoIYLO
	O4LKuB6ZKY3cpRRnmTsw61LaTfdKz7X6MU1ynkR17eE/JAa3ESLIsZvezonRRKQUn4nL
	/AbSVvcGQpNs7wqcNfLBwXCzYZ3/UarKMMeRtVwcMPf0gxmQsuVCDH4x9Y5/fNZPH9lx
	DExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ug1n5Hw3Zt9YAzIIshXn4b9lCTTls3TDjRuvcNYmCI4=;
	b=NiKrxSGoGDN2Wj2r7VCPTcX+SvxTnO3ASGchfBCUvLD46Cjv/0MpLVZKhc45CfBf/8
	ATydY3X4KxqWnJ7TALvHAgBXahSubt/yODqaeGiKRK/0j+rLxaPZlRIqD7tT/4zfUv/Z
	6cXu1/g9D7tf+BQcFmBMCF5LHy0I3NIxRh63D3n6OO5aP+jKxjCpZtEtBMUovCNKKTUC
	mVjUbvYDGxx6iNkfbRtff/bDQZm3LYOVE2gfQz0h7BVN/soD4dMocXYoP+3S8nsA2hXX
	n6ilEzPdHsHoD+DUpa5KFUkOEA8o1fqlxO8ZrHf/xZmOTXMSG+pyykX7b+K5BOdDnuDa
	lH6w==
X-Gm-Message-State: APjAAAX4DQqvd/d21ssp+sL4gOxRSsncye6XrEvNtpIpMeCJ+Lyq2yNX
	MvL4xcellax3/3EbDZym2y1XzxWY
X-Google-Smtp-Source: APXvYqwUxMMoNosuU39ISKmpBk+qqRO7VQsp1RuC/WTlisEaE174pJLWthTR7TQYxu6pr7+W72DgIA==
X-Received: by 2002:a63:68c9:: with SMTP id
	d192mr18976178pgc.264.1552928293056; 
	Mon, 18 Mar 2019 09:58:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	n82sm4595910pfi.63.2019.03.18.09.58.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 09:58:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2019 09:58:01 -0700
Message-Id: <20190318165803.10375-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/3] lttng: Enable on musl and riscv
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
X-List-Received-Date: Mon, 18 Mar 2019 16:58:12 -0000
Content-Transfer-Encoding: 8bit

Latest version compiles on musl as well as on risv64 now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb | 2 +-
 meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb   | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
index 086254d3d3..15e75e51c9 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.8.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4613d1f8a9587bd7b366191830364b3 \
 
 inherit module
 
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
 
 #https://lttng.org/files/lttng-modules/lttng-modules-2.10.7.tar.bz2
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
index 151e35e3c3..d544f8e206 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
@@ -26,9 +26,7 @@ PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig
 PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
-PACKAGECONFIG_remove_libc-musl = "lttng-ust"
 PACKAGECONFIG_remove_arc = "lttng-ust"
-PACKAGECONFIG_remove_riscv64 = "lttng-ust"
 
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://x32.patch \
-- 
2.21.0


