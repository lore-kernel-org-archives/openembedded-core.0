Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qpmfe-0000kf-4h
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 21:36:30 +0200
Received: by gwb11 with SMTP id 11so1135142gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Aug 2011 12:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=szTuoyMd7hecKz3okisZ/gRkGjcgrTScb+hV8WzwtQ8=;
	b=dsnMBnNWz+pQju1PPOT2pbJR1005Ej1041+MbUg0FyLetBsdXcd3LNXyUv5vomRYnQ
	kyIEu1nZOkLfZWGRhKLd3HyR5QgTuuO4KEJqrSwrxWgLDQIOWHemJddApG5mNepm0jYx
	Y6m/NNgO6MR9l1ooZUSYEfV8IITY/ELYGVDio=
Received: by 10.236.175.199 with SMTP id z47mr1191937yhl.524.1312659120597;
	Sat, 06 Aug 2011 12:32:00 -0700 (PDT)
Received: from localhost.localdomain (cpe-76-184-244-226.tx.res.rr.com
	[76.184.244.226])
	by mx.google.com with ESMTPS id j65sm3126629yhm.26.2011.08.06.12.31.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Aug 2011 12:31:59 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Aug 2011 14:31:51 -0500
Message-Id: <1312659111-22327-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.1
Cc: k-kooi@ti.com
Subject: [PATCH] ti-codec-engine: Use latest CE and update all dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Aug 2011 19:36:30 -0000

Switch to the latest CE 2.26.02.11 [1] and update all dependencies according to the
release notes [2]. This makes ti-codec-engine to build without any compilation errors

[1] http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce/index.html
[2] http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce/2_26_02_11/exports/codec_engine_2_26_02_11/codec_engine_2_26_02_11_ReleaseNotes.html

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
This is in sync with:
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/log/?h=gstreamer-ti-import

 ...trom-codec-engine-latest-preferred-versions.inc |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc b/conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc
index 173a15b..ca0ee46 100644
--- a/conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc
+++ b/conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc
@@ -1,8 +1,8 @@
 # This is the latest set of TI components
 #
 
-PREFERRED_VERSION_ti-codec-engine = "2_26_01_09"
-PREFERRED_VERSION_ti-codec-engine-examples = "2_26_01_09"
+PREFERRED_VERSION_ti-codec-engine = "2_26_02_11"
+PREFERRED_VERSION_ti-codec-engine-examples = "2_26_02_11"
 
 PREFERRED_VERSION_ti-biosutils = "1_02_02"
 PREFERRED_VERSION_ti-cgt6x = "6_1_17"
@@ -10,14 +10,14 @@ PREFERRED_VERSION_ti-dspbios = "5_41_07_24"
 PREFERRED_VERSION_ti-dsplink = "1_65_00_03"
 PREFERRED_VERSION_ti-dsplink-examples = "1_65_00_03"
 PREFERRED_VERSION_ti-dsplink-module = "1_65_00_03"
-PREFERRED_VERSION_ti-edma3lld = "01_11_00_03"
-PREFERRED_VERSION_ti-framework-components = "2_25_03_07"
-PREFERRED_VERSION_ti-linuxutils = "2_25_05_11"
+PREFERRED_VERSION_ti-edma3lld = "01_11_01_04"
+PREFERRED_VERSION_ti-framework-components = "2_26_00_01"
+PREFERRED_VERSION_ti-linuxutils = "2_26_01_02"
 PREFERRED_VERSION_ti-local-power-manager = "1_24_02_09"
 PREFERRED_VERSION_ti-lpm-module = "1_24_02_09"
 PREFERRED_VERSION_ti-lpm-utils = "1_24_02_09"
-PREFERRED_VERSION_ti-xdais = "6_26_00_02"
-PREFERRED_VERSION_ti-xdctools = "3_20_03_63"
+PREFERRED_VERSION_ti-xdais = "6_26_01_03"
+PREFERRED_VERSION_ti-xdctools = "3_20_06_81"
 
 PREFERRED_VERSION_ti-codecs-dm355 = "1_13_000"
 PREFERRED_VERSION_ti-codecs-dm355-server = "1_13_000"
-- 
1.7.0.4



