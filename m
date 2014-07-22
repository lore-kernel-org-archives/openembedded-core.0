Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id BF01560DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:38:39 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so55245wes.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=g49pzi9KvI12Pc1u5gUoL+nQb4epZTHpH+ToKljjTWQ=;
	b=SEM19LKP2pP0snnrcOojKuMeQDrZBftWWe70J5vBM3KR4JI2kvL66KrQ8mw1g11vE7
	DrqGHBpFlC8LknLehydmf84crK+WgbCWLJLJmNS2T1/DIDWhRdcLFdDQMCHrBLiphuDB
	70VwfwmSInXDGa5EJfSNmLCFgJRqgoJZVj+g8JwTpgBwv3OXHVjG7bIOUFGHAYtp++cg
	cklJbA3fQYbgDrJbQjjzlIDcYqiRrFwcRGkG3ZctfwXaPhLPKg+byXLGA/rCzRh3/Ty7
	1fBlRJyJKyUAXFW+/eQ2+tWo/dlqAren1aUWsSIPzuh5uhxhWhykOFGL92+/FzuZP3gu
	QG6g==
X-Gm-Message-State: ALoCoQk3NNoNlg6TG7HUlW02kWZYy01+luXKeLzXw0orLi5bGMq+ri80thBeXCifYsk9SRx0KJ1Z
X-Received: by 10.180.81.103 with SMTP id z7mr17165274wix.23.1406054319471;
	Tue, 22 Jul 2014 11:38:39 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jy8sm2847638wjc.7.2014.07.22.11.38.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 11:38:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 19:38:19 +0100
Message-Id: <1406054301-9027-9-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
References: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 09/11] xcb-util-wm: upgrade to 0.4.1
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
X-List-Received-Date: Tue, 22 Jul 2014 18:38:40 -0000

Licence checksums changes as the files previously checksummed were generated and
subsequently removed from the tarball.  Change the checksums to use the source
files instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.0.bb |   11 -----------
 meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.1.bb |   11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.0.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.1.bb

diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.0.bb b/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.0.bb
deleted file mode 100644
index 2b4ee70..0000000
--- a/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xcb-util.inc
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://ewmh/ewmh.c;endline=27;md5=63fd80552d7dc886f4eb267610d5bb9d \
-					file://ewmh/xcb_ewmh.h;beginline=4;endline=30;md5=73b589f90ef90b4a43998955daad5cd8 \
-					file://icccm/icccm.c;endline=28;md5=e2b3240a0c197e8977adde2a5cf18d50 \
-					file://icccm/xcb_icccm.h;beginline=4;endline=31;md5=393772b7b07b9868d479d538238c1d8a \
-					"
-
-SRC_URI[md5sum] = "1b5182b894753de63c9fad1ce6124534"
-SRC_URI[sha256sum] = "66f97c18f7d98d3c873fe5db5842d2fca34519274c31ee668551ab8995a2f51f"
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.1.bb b/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.1.bb
new file mode 100644
index 0000000..39f1383
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-wm_0.4.1.bb
@@ -0,0 +1,11 @@
+require xcb-util.inc
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://ewmh/ewmh.c.m4;endline=27;md5=63fd80552d7dc886f4eb267610d5bb9d \
+					file://ewmh/xcb_ewmh.h.m4;beginline=4;endline=30;md5=73b589f90ef90b4a43998955daad5cd8 \
+					file://icccm/icccm.c;endline=28;md5=e2b3240a0c197e8977adde2a5cf18d50 \
+					file://icccm/xcb_icccm.h;beginline=4;endline=31;md5=393772b7b07b9868d479d538238c1d8a \
+					"
+
+SRC_URI[md5sum] = "87b19a1cd7bfcb65a24e36c300e03129"
+SRC_URI[sha256sum] = "28bf8179640eaa89276d2b0f1ce4285103d136be6c98262b6151aaee1d3c2a3f"
-- 
1.7.10.4


