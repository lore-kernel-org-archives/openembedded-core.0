Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id E392E71AFC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 15:45:38 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id E1CCF20976
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 11:39:20 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute1.internal (MEProxy); Wed, 02 Nov 2016 11:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=x-me-sender:x-sasl-enc:from:to:subject
	:date:message-id:in-reply-to:references:in-reply-to:references;
	s=smtpout; bh=Lkccy3zCml20iwXHnQuYqHhcGPQ=; b=t1GyEUS/k+jPhRg42
	jIb6KR6V8w15ICU9YgGqSd34/iBA7oUN+/rpHYacu4vsrBJyvIV5qe9J6OG+U1xk
	zE5Y+4WPKnsv1R39YXpW8eenNwoOPLSd5GVxdEgHTJhmQjnrJhzqMVh8bSxZfJ5p
	NQsNog1cWzP6HgHMkPxY2iKNN8=
X-ME-Sender: <xms:qAgaWPO0Fri_iyeA_coEMsoWDFsjhpQWDGeDutJqFPZdQjq-PcKTMw>
X-Sasl-enc: HVFGTyW7gAMTRSyROPOE617x35NqUVmjUBt0s8tWE+JQ 1478101158
Received: from localhost.localdomain (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0D90FCC07B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 11:39:17 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 17:39:08 +0200
Message-Id: <1755ee908fb54e762da391e2088d491d91be4d8b.1478101052.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1478101052.git.tanuk@iki.fi>
References: <cover.1478101052.git.tanuk@iki.fi>
In-Reply-To: <cover.1478101052.git.tanuk@iki.fi>
References: <cover.1478101052.git.tanuk@iki.fi>
Subject: [PATCH 1/2] libsamplerate0: 0.1.8 -> 0.1.9
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
X-List-Received-Date: Wed, 02 Nov 2016 15:45:39 -0000

The license has changed to BSD as explained here:
http://www.mega-nerd.com/SRC/license.html

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../{libsamplerate0_0.1.8.bb => libsamplerate0_0.1.9.bb}       | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/libsamplerate/{libsamplerate0_0.1.8.bb => libsamplerate0_0.1.9.bb} (62%)

diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
similarity index 62%
rename from meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
rename to meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
index 1c37681..a24b8c7 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
@@ -1,16 +1,16 @@
 SUMMARY = "Audio Sample Rate Conversion library"
 HOMEPAGE = "http://www.mega-nerd.com/SRC/"
 SECTION = "libs"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/samplerate.c;beginline=1;endline=17;md5=d0807c35fc906466d24a50463534815a"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=336d6faf40fb600bafb0061f4052f1f4 \
+                    file://src/samplerate.c;beginline=1;endline=7;md5=5b6982a8c2811c7312c13cccbf55f55e"
 DEPENDS = "flac libsndfile1"
 PR = "r1"
 
 SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1c7fb25191b4e6e3628d198a66a84f47"
-SRC_URI[sha256sum] = "93b54bdf46d5e6d2354b7034395fe329c222a966790de34520702bb9642f1c06"
+SRC_URI[md5sum] = "2b78ae9fe63b36b9fbb6267fad93f259"
+SRC_URI[sha256sum] = "0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1"
 
 UPSTREAM_CHECK_URI = "http://www.mega-nerd.com/SRC/download.html"
 
-- 
2.9.3


