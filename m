Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id EC3D860D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 17:55:03 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id bz8so8663948wib.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 09:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pzrSZx2rVh5t8PhxGf8wnbgu817jSMv5uyIeXxlrzA4=;
	b=QToRKSUG/LnRjX3m1YG4BkdKyyONF9xuPKf5XHLUjsMO9QFItL6xd5dgYqola3d+UJ
	/bASx7PVF8/VNxl1ypQWBW9/yWHQBllasGte4lVWaKZACHYU7SIu0CDgKLsZN6YiNs+p
	JYLfaKjvKnMH5yv1dWT/odE/4KCynPsQXPaDbmE39KHKPg8K2kprnT6DZ9VIACxyV9Qg
	XyoLxreEGiTm/8yJksnWorwqh5qjPTsh5xzzGj3xXr0M8a/Rg6hJFkD371keix7uobnq
	FJMV6AGOeAeOEtpfMOUupM3hMBvCkLKssxfJIpSlEpa82uh/uDnFg74rQ4R3RUNSRDfQ
	AE1Q==
X-Gm-Message-State: ALoCoQmMwO6MLOm3Ay6OqWcA6B6GWZSdWZ7aquOClPxgoOCryS26RaagfFkNrnuGuDKmqBwOUA/S
X-Received: by 10.194.81.196 with SMTP id c4mr9762815wjy.57.1389376504362;
	Fri, 10 Jan 2014 09:55:04 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id a9sm3686306wiy.10.2014.01.10.09.55.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jan 2014 09:55:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2014 17:54:47 +0000
Message-Id: <1389376488-22286-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389376488-22286-1-git-send-email-ross.burton@intel.com>
References: <1389376488-22286-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] separatebuilddir: build libproxy and taglib out of the source tree
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
X-List-Received-Date: Fri, 10 Jan 2014 17:55:04 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/seperatebuilddir.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index e1a5c6b..a6df6ac 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -320,8 +320,7 @@ B_pn-libpcre = "${SEPB}"
 B_pn-libpcre-native = "${SEPB}"
 B_pn-libpng = "${SEPB}"
 B_pn-libpng-native = "${SEPB}"
-# Needs automatic support in cmake.bbclass
-#B_pn-libproxy = "${SEPB}"
+B_pn-libproxy = "${SEPB}"
 B_pn-libpthread-stubs = "${SEPB}"
 B_pn-libpthread-stubs-native = "${SEPB}"
 B_pn-librsvg = "${SEPB}"
@@ -660,6 +659,7 @@ B_pn-sysprof = "${SEPB}"
 B_pn-systemd = "${SEPB}"
 B_pn-systemtap = "${SEPB}"
 B_pn-systemtap-native = "${SEPB}"
+B_pn-taglib = "${SEPB}"
 B_pn-tar = "${SEPB}"
 B_pn-tar-replacement-native = "${SEPB}"
 B_pn-tcl = "${SEPB}"
-- 
1.7.10.4


