Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 14DD960232
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 18:05:14 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so21002033wgh.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 10:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qLsJE+hm5vPETWkXFWgTsegVV3txbT4FIpxL1TVs89Q=;
	b=EFWspyTDVPOHhq7mR45sgiPHBWhHhXc4O7dH4X/EJ8e10bkCg2EDS/EXNqXQTLfBNX
	lh1MiipvvKP1sBN5b6xfAdhZ8uaolMeZKDwx5KGgxOzAvvG94y1waPOOALHlkXx8YRFB
	bGOg4o4wfTfIaRiD6nCelMIAPeBToC+6lIWhwvH47ZzxKDVVk5WWzNc9kL+qXKuXrpo6
	z2y/LGov1hFu6NOYJNcrZ6KB0UEiVQwhBx1EENvaOFm0ICHXi9FO4sIzbxDXDoH1YdUa
	lC9tnKFp4lmyMudP1gqUCKxzXEqfkiik66q9FT66eESsn1Rs/zcXmPQXCXyh4A1q0upj
	khrA==
X-Gm-Message-State: ALoCoQkSnsbgyaZGy7nxhgqlycJGQNNXsXOL/Xlr6J2a1b7bA0L0xAPGXV3W+zQ2dFKKFYDenz6f
X-Received: by 10.194.108.162 with SMTP id hl2mr52575050wjb.134.1419962715094; 
	Tue, 30 Dec 2014 10:05:15 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	hl1sm28854285wjc.18.2014.12.30.10.05.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 10:05:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Dec 2014 18:04:03 +0000
Message-Id: <1419962645-26989-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
References: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/7] gstreamer1.0-plugins-ugly: upgrade to 1.4.5
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
X-List-Received-Date: Tue, 30 Dec 2014 18:05:18 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...-plugins-ugly_1.4.1.bb => gstreamer1.0-plugins-ugly_1.4.5.bb} |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.4.1.bb => gstreamer1.0-plugins-ugly_1.4.5.bb} (65%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.5.bb
similarity index 65%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.5.bb
index 6d63ba6..25cb28c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.4.5.bb
@@ -2,7 +2,9 @@ include gstreamer1.0-plugins-ugly.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
-SRC_URI[md5sum] = "316974af949ca4654efee704a0164076"
-SRC_URI[sha256sum] = "25440435ac4ed795d213f2420a0e7355e4a2e2e76d1f9d020b2073f815e8b071"
+
+SRC_URI[md5sum] = "6954beed7bb9a93e426dee543ff46393"
+SRC_URI[sha256sum] = "5cd5e81cf618944f4dc935f1669b2125e8bb2fe9cc7dc8dc15b72237aca49067"
+
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
1.7.10.4


