Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 68C5A7F881
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 13:51:09 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id t26so12054238wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 05:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ddt3ZfcFQkllPhYpVbA+LCQDlZRWk+DDHtjd51q8L5E=;
	b=2EfSH5Gv14AKDAmouLiA3xa08W4lKTtgywQMHdCyr44LS2FDVQzSgRPrzI+dtJ6IfF
	RE+2iXFk0AgWPO/SXUJZmP68eoHQs4PKyj+WXLhU9To3xbsq7KoBYRD3M925PotX19B7
	Kw+o1hsNpkE3FMcMxioNb/nf2mfinkqWHxtjwceVVoEYpF9g8O9LIDy1LMLritk6Huif
	Vwq/0o3FyPTaEnLtv0hj7k8mJkPFx4zogtlaGmfcfoN+oSfaUy6bBC35fdENr0Cpg1c1
	O836Pe3fc7x1BkBv/spIhqp5s0gaUbcWplY71L+4qThTyOXupyY+hMeG+GqSaKW3H7Na
	0ZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ddt3ZfcFQkllPhYpVbA+LCQDlZRWk+DDHtjd51q8L5E=;
	b=TVDD9AyiaJjYbk60mPrw+EBDrnwCJX5htyRLu/+TQqOMGNC5MbX+CO1wGvrXDM5jHt
	NBphHmlyxH48mtcouH20jYydzD/vil+fWo2LXFbIuezdLTQnMCBc4teFYEAsLaTHCHke
	WokPXW9hvBfTAxzfD4qtSo/UKFZnaICQ4DRy8zpTheiFsnaY2KqKXTQLp2JYhWDw9Kb1
	2BRNfRfGHtV3io2FHbHuDmv/BwPmQc4YwoDYG56CnvnRKFzaZ86of6NxO31cg0cDAl6r
	kAz25HAQT984dyGAFFpa08djhmhQg88oDllKL0lQJRQdKq3LkWd/MgOP5X/XouF32BuU
	KjmQ==
X-Gm-Message-State: APjAAAUtEcIj020rnpVzz2zGlZu96pHTL1+77MKGKET/aeGWNjXzwb4o
	/hUBBFpUdhYO//cVCsdr3LFpNjABUHs=
X-Google-Smtp-Source: APXvYqx0c07yAiikvpmWIwRicdg0E02Z4ks8a7tNbHCy6pHR94mC6Mo+Cim+tbxApVTItmTdCkmhow==
X-Received: by 2002:a1c:7c14:: with SMTP id x20mr8757886wmc.136.1572875469608; 
	Mon, 04 Nov 2019 05:51:09 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d11sm13431368wrn.28.2019.11.04.05.51.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 05:51:08 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 13:51:05 +0000
Message-Id: <20191104135106.14625-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] procps: whitelist CVE-2018-1121
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
X-List-Received-Date: Mon, 04 Nov 2019 13:51:09 -0000
Content-Transfer-Encoding: 8bit

This CVE is about race conditions in 'ps' which make it unsuitable for security
audits.  As these race conditions are unavoidable ps shouldn't be used for
security auditing, so this isn't a valid CVE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/procps/procps_3.3.15.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.3.15.bb b/meta/recipes-extended/procps/procps_3.3.15.bb
index 9756db0e7b7..e128477c5fa 100644
--- a/meta/recipes-extended/procps/procps_3.3.15.bb
+++ b/meta/recipes-extended/procps/procps_3.3.15.bb
@@ -4,9 +4,9 @@ the /proc filesystem. The package includes the programs ps, top, vmstat, w, kill
 HOMEPAGE = "https://gitlab.com/procps-ng/procps"
 SECTION = "base"
 LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                  file://COPYING.LIB;md5=4cf66a4984120007c9881cc871cf49db \
-                 "
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=4cf66a4984120007c9881cc871cf49db \
+                    "
 
 DEPENDS = "ncurses"
 
@@ -64,3 +64,6 @@ python __anonymous() {
         d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
 }
 
+# 'ps' isn't suitable for use as a security tool so whitelist this CVE.
+# https://bugzilla.redhat.com/show_bug.cgi?id=1575473#c3
+CVE_CHECK_WHITELIST = "CVE-2018-1121"
-- 
2.20.1


