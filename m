Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TkedG-0000NC-NA
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 18:37:38 +0100
Received: from mail-la0-f69.google.com ([209.85.215.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 09:22:56 -0800
Received: by mail-la0-f69.google.com with SMTP id w12so4333030lag.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 09:22:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=3kSgcAiEuEyhIs19426ZMF7Lw1XdJMIv7ZhIDKl4Iqc=;
	b=RKe6Oi4OItQbwhmTFE+IHDF9BX43ysjm+ee7m7Dvwhfoa5vKOz3CgvS5spzqawROHR
	Zwm8slctfXgs8oFPDAeJtoMd+vvpKyYoliT6a+N3lvjB7/CHTNMkbCJnFcvUvBTwCamy
	ycpIJpPTR/9QpByMgPPAI1rcThLkQhnnW+20ORKcSAt3/HD6v6ZfiuqSruDGF1bvUpaB
	ARAY7qN/nXYLknrQb80Gqeqj+p+yq+HmMTybc5Y/V6a8DIG6kRSV+hpRzKaMkUwWjf/S
	9u5EsBb+A5NYVsnlgmDMuagJhZtvUmfnHy01ynJRirEtk0p/bc5B94I1jtsBEa+hVOGH
	CICg==
Received: by 10.180.88.99 with SMTP id bf3mr17097837wib.22.1355764973962;
	Mon, 17 Dec 2012 09:22:53 -0800 (PST)
Received: by 10.180.88.99 with SMTP id bf3mr17097828wib.22.1355764973854;
	Mon, 17 Dec 2012 09:22:53 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p2sm13460213wic.7.2012.12.17.09.22.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Dec 2012 09:22:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 17:21:10 +0000
Message-Id: <1355764871-1813-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmLGRmVR66zC4S5rYrSQ45vZ0hFAJEn7bQNuQZ5y2sFWTZjxOvUHStZaR/gvUjHLDL1S4hdBpzcbJxgs40rEl0FHb2zznTcQR8j17FB+BLRkowIhmvgIB4gJv/YNEX87fT1UKMcUclPIK562rxLgOqiN1jOo3RSqQS+k21nsAGHqAhUSM2LAEb4mfDdNwD0ybiGxLJ+
Subject: [PATCH 1/2] gst-meta-base: don't rdepend on ximagesink/xvimagesink
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 17:37:39 -0000

Loosen these dependencies to recommends, as some targets won't want or build
these sinks.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
index 21243c6..37c70c2 100644
--- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 
-PR = "r12"
+PR = "r13"
 
 PACKAGES = "\
     gst-meta-base \
@@ -33,7 +33,7 @@ RDEPENDS_gst-meta-base = "\
     gst-plugins-good-autodetect \
     gst-plugins-good-souphttpsrc"
 
-RDEPENDS_gst-meta-x11-base = "\
+RRECOMMENDS_gst-meta-x11-base = "\
     gst-plugins-base-ximagesink \
     gst-plugins-base-xvimagesink"
 
-- 
1.7.10



