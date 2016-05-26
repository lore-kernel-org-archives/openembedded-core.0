Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 27FDF60796
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 19:13:29 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id z87so111049921wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 12:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FDEN3JweThvl7wvkzEK/MZy1MNSSyFbv0pjl+m3bC4Q=;
	b=kr6h1J9WIuzbX+I3bf/yW/MH26ub5DFjVnrhunK++yHHie9jTuD0wLDX2Imd7li4Yo
	PXbJ0VL9Dpaq5zMMNNbeeMKxGGBCpp8wXThrGCPxnkpzg7gNYUvJ6eG3nUJZnnKjQ/rv
	wEvX+45q3snup+Z2c8hPeFYtnuYYlVz4iaVHzH/U0TVy5OIZz+daANQDxdiZaoyiy+Qp
	4zkvK7B7kRFYU9mtZmvDsib3dtNVe6WU93jHXrD/il5G00p2dJ3WFTPZsEuDeH9VX50x
	EiNxGYzJjmxxT9XgkwZZBSNNCGfJhM1szx+6MdVQ9xUKNq7PpDuX1/s7NAFu0Xb4+YPp
	zbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FDEN3JweThvl7wvkzEK/MZy1MNSSyFbv0pjl+m3bC4Q=;
	b=ixSs4ChjxEUPrUC9x7rYUdpdFJfXRknIIkEE3e8FdHxD/LRyPO05yAm1S5XgUq7g48
	eKYdeoJjPbLm4oZBsJaFgrkPEbzSd6JBbS5kr+I7JM2beGNZYoRWdaagpPL66VDxfyLt
	yEso7LhoZb7muMFREBq+GJxl6kZFnZyIvLUQt+uMFkvDRjD2Es5SohviPuE18JpBM82/
	hAu43BaITCwggaEv43JtxEkfB5Qwoo2daPssYCqLi/HHBLty9Q24qwKWxdMiVbyntRE8
	8E6w9xJAuxKjYuOMSTAwllmHD+7OJT6F1NkaBu/wWNSDEo1IbIKt4aQGCSnlAhcjxmCK
	6N2g==
X-Gm-Message-State: ALyK8tIT8vUbomUrWMO4+u+cqVv3Sjx3fLmmLuIt4oxFIRp8hNqabfmtPOQgv71myC9gwna7
X-Received: by 10.194.101.170 with SMTP id fh10mr10970834wjb.50.1464290010313; 
	Thu, 26 May 2016 12:13:30 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i1sm15727790wjm.12.2016.05.26.12.13.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 May 2016 12:13:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 20:13:24 +0100
Message-Id: <1464290005-6724-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1464290005-6724-1-git-send-email-ross.burton@intel.com>
References: <1464290005-6724-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] libxcb: upgrade to 1.12
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
X-List-Received-Date: Thu, 26 May 2016 19:13:30 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxcb_1.11.1.bb => libxcb_1.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcb_1.11.1.bb => libxcb_1.12.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
rename to meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
index 0856c19..62b8bab 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
            file://disable-check.patch \
            file://gcc-mips-pr68302-mips-workaround.patch \
           "
-SRC_URI[md5sum] = "f97a65e6158775de518ac391935634c2"
-SRC_URI[sha256sum] = "b720fd6c7d200e5371affdb3f049cc8f88cff9aed942ff1b824d95eedbf69d30"
+SRC_URI[md5sum] = "28e552bd78bc1050b6b26ca1db0e5bb6"
+SRC_URI[sha256sum] = "4adfb1b7c67e99bc9c2ccb110b2f175686576d2f792c8a71b9c8b19014057b5b"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.8.0.rc3


