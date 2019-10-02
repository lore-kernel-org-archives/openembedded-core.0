Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A46AE7D3B1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 12:00:38 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a6so6857070wma.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 05:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=juDdWllxmdnuXXQn9ZJbT2VDt/8Acx8FkPy5W/OwKQ8=;
	b=oSrQM3WvAFp7C0Ml7aeE4v/erAN9thKFPryrmi09CkazZHlYXCXGwz1/mYooI2Ok8p
	fKah9qrRKquCMzgGLnp5qfaham51WaJ0TLh8YJT8z8X3G2bN46Sd5+0Rx4ZoZbpl0bLF
	pKddHRkx3ohBYEuK1D/rRmvauLSWNm/KEjSYNoNuNk+2EWTdRp5mSnP7Tewj4yScvWZk
	qqroeraL3jGJVmYKJB5Ec/aGMAYYd+ZB8NR81CiGXSRfg5zomhVB3nDmHLwE2KXbG7IS
	3ldJTJ0+a2DGSCzcXI9xOQEw9eSR/aTfxUYgL4loZtVAw7VysbFCmiH5IvNgOH7tOUb2
	KD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=juDdWllxmdnuXXQn9ZJbT2VDt/8Acx8FkPy5W/OwKQ8=;
	b=fTd6/QkuwYgo5gj04XrUj3wYL/+AvDmwFlhWDiGSohli4XMurKbVG9W3VG1vIn2+hH
	uIApOO+t13h6DzzZfUgepD5ICVMUrYMcGS6KnxGs6jd/FM/iqvrkyYExzECV8f1gBVy9
	n2wRtJ2eFzOFfJSI0cJUUXX0aVVeFWWwM+QyNXxB/Y1xvCOi/l27ttXIAKKwFF0MtSZO
	YmAXSq7cxSGoKofoUWhZcKJHPvTbpNf3mdwcdDzVLg2T+y8hTdM7ffrhulw0vbE/i0nN
	g3CouYk+O/Hco30lX5eUUSkv8vFcPTLjDaCj54e57UmVKHfBKxi6e+50b/IW58XVmvhN
	9lPg==
X-Gm-Message-State: APjAAAW7nzGtPzTf20aeFyAcOEtIMtLSFMkEDry6nMkiHkKcQ6adsbHF
	Bm0e/osgmlpdZYvKkgzNYGndfRhC
X-Google-Smtp-Source: APXvYqyexaFgY7hyT6s4t0esYUiwjdgzx5NyWlBysWHXuF90H6dQpt1LOOjhGe7Zx6vWlIOuRLQunA==
X-Received: by 2002:a7b:c391:: with SMTP id s17mr2728066wmj.94.1570017638465; 
	Wed, 02 Oct 2019 05:00:38 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e6sm17521899wrp.91.2019.10.02.05.00.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Oct 2019 05:00:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Oct 2019 14:00:26 +0200
Message-Id: <20191002120027.109242-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] binutils: drop UPSTREAM_VERSION_UNKNOWN
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
X-List-Received-Date: Wed, 02 Oct 2019 12:00:40 -0000

As there is now a new version of binutils,
upstream version check works again.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.32.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index d3c52936d16..19baf8a8839 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -14,11 +14,8 @@ def binutils_branch_version(d):
     pvsplit = d.getVar('PV').split('.')
     return pvsplit[0] + "_" + pvsplit[1]
 
-# Actual upstream version is 2.32 (without the .0), so we have to set
-# UPSTREAM_VERSION_UNKNOWN to avoid the version check failure. The line can
-# be removed when a new version of binutils is released (if the PV is then
-# correctly set to match the upstream version tag).
-UPSTREAM_VERSION_UNKNOWN = "1"
+# When upgrading to 2.33, please make sure there is no trailing .0, so
+# that upstream version check can work correctly.
 PV = "2.32.0"
 CVE_VERSION = "2.32"
 BINUPV = "${@binutils_branch_version(d)}"
-- 
2.17.1


