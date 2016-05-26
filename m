Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7A85060796
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 19:13:28 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id a136so41209981wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 12:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Zm/tuRz5MTuSzBiDNvdbBuHM5W3oAbEMb76sU8bTvmw=;
	b=RHQ86ZmUUIo3j9+lk9WDv80CZzwdpUV/9oAmkJma534w2voNRjngcrvPkmdyok0/OE
	UGPNsYos8aCwxt7fKPt2gEAEJfWs4nRrokRYfCieASfjdLKML08WrdyORz6QnygL1f0q
	xwRyC6ZmfZRFqpwWWtmgqcPciE8r5sOKZRSC4KfKRTsQkozJ3bLwxetU1/k5r5kOmndC
	je5Mt+HaLkS8e8Gl+YakGR34FeTtxC7TcdhtXHwr7cVbp/oPrNgiazFjukMsz5I/LSID
	AxAAzJ0BGV+txagevq6/FgED5BFPbkIx5WFAMM0fkHpgTeVJZsH/odsizXYHQOY9K7/m
	Wffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Zm/tuRz5MTuSzBiDNvdbBuHM5W3oAbEMb76sU8bTvmw=;
	b=a9h6Y6xyU8Qj9vwcqYA5NNgEmievDHLQ9gS4emhsUVNhRfMDg10MHp1huryMj5dd6P
	uvKGZl9oStYqx0KSsnHyb+tkxzqpcNgaDOJFSNkQnY8brFnjvbIwySE0938rn/2a0ayB
	6W/IDQ+NAGwqrAdj35Zk+8EdScE7V1/k4hC7hXGS+XY3ELXgH4zFBmwLr0HSFsOzPI+9
	Z1PqavrKPjjANQmMfZblf3SZXWSTwWxARVP+cnvYTN00gKFia0zMrHPLjQRwbxrM+gMw
	YuFErgAuRXu71eqJqETBmdPjWr4QW3+Qed/DIfF+K2CfilVXUuyj5V68pxiUPwHjpWOz
	BCQQ==
X-Gm-Message-State: ALyK8tKIzQpHIG1eU6Za2+RAKAgZ9JwE2wXf/U5XpKXmhycpvhoSvxQve982E2598kydE9gB
X-Received: by 10.194.158.69 with SMTP id ws5mr11030854wjb.17.1464290009287;
	Thu, 26 May 2016 12:13:29 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i1sm15727790wjm.12.2016.05.26.12.13.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 May 2016 12:13:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 20:13:23 +0100
Message-Id: <1464290005-6724-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH 1/3] xcb-proto: upgrade to 1.12
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
X-List-Received-Date: Thu, 26 May 2016 19:13:29 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-proto/{xcb-proto_1.11.bb => xcb-proto_1.12.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.11.bb => xcb-proto_1.12.bb} (60%)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.11.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
similarity index 60%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.11.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
index 5bc5a11..23166a9 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.11.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
 
-SRC_URI[md5sum] = "6bf2797445dc6d43e9e4707c082eff9c"
-SRC_URI[sha256sum] = "b4aceee6502a0ce45fc39b33c541a2df4715d00b72e660ebe8c5bb444771e32e"
+SRC_URI[md5sum] = "14e60919f859560f28426a685a555962"
+SRC_URI[sha256sum] = "5922aba4c664ab7899a29d92ea91a87aa4c1fc7eb5ee550325c3216c480a4906"
-- 
2.8.0.rc3


