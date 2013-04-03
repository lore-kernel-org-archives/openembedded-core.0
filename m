Received: from mail-ye0-f177.google.com ([209.85.213.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UNWGV-0007yv-Gw
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 00:34:47 +0200
Received: by mail-ye0-f177.google.com with SMTP id l14so328233yen.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 15:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Q4zM7VHfehyx+9FTc0jiAlpxZFGwSUEKrESf0n6eTdc=;
	b=UzZm+rckuDnMpKZdT9UORTVrUYS655D+jrbxygV9ISlagQ1cbbeBQO45zmRscIg4Jq
	Nx3g/Q0hwAE2GgGke+Wh3fKdjtYeizLEomT/99KDD3py/ImZf7ooT2bomBjzHiYgmlyZ
	2pQPimu2WH+tFk7RcdTInWgE8Ez6wtc/viY4mEk2qROVHeNlvAryi8Bz0Tfwti2rEIw3
	5VcSFosGdR9NrRiXtol1Nd3PXIfA3LRv8e0Vu1zmEEbUtbIK08xpsbYliBdVQ5zDDpLu
	h4cWxVTuFm3Baa05uIa9M44RcT3U3alWEpokMhAFC8rgIq5HAAkxiWwFEcC4OXH+UFzX
	5KIg==
X-Received: by 10.236.26.203 with SMTP id c51mr2279711yha.89.1365027455355;
	Wed, 03 Apr 2013 15:17:35 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id f70sm12089239yhi.12.2013.04.03.15.17.33
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 15:17:34 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  3 Apr 2013 19:23:40 -0300
Message-Id: <1365027820-2912-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1365027820-2912-1-git-send-email-otavio@ossystems.com.br>
References: <1365027820-2912-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] pointercal-xinput: Import recipe from Meta-OpenEmbedded
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
X-List-Received-Date: Wed, 03 Apr 2013 22:34:47 -0000

This should be used to provide calibration information for xinput
based touchscreens.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../pointercal/pointercal-xinput/pointercal.xinput    |  1 +
 meta/recipes-bsp/pointercal/pointercal-xinput_0.0.bb  | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-bsp/pointercal/pointercal-xinput/pointercal.xinput
 create mode 100644 meta/recipes-bsp/pointercal/pointercal-xinput_0.0.bb

diff --git a/meta/recipes-bsp/pointercal/pointercal-xinput/pointercal.xinput b/meta/recipes-bsp/pointercal/pointercal-xinput/pointercal.xinput
new file mode 100644
index 0000000..9633fc5
--- /dev/null
+++ b/meta/recipes-bsp/pointercal/pointercal-xinput/pointercal.xinput
@@ -0,0 +1 @@
+# replace with valid machine specific pointercal.xinput
diff --git a/meta/recipes-bsp/pointercal/pointercal-xinput_0.0.bb b/meta/recipes-bsp/pointercal/pointercal-xinput_0.0.bb
new file mode 100644
index 0000000..9b68d54
--- /dev/null
+++ b/meta/recipes-bsp/pointercal/pointercal-xinput_0.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Touchscreen calibration data from xinput-calibrator"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r4"
+
+SRC_URI = "file://pointercal.xinput"
+S = "${WORKDIR}"
+
+do_install() {
+	# Only install file if it has a contents
+	if [ -s ${S}/pointercal.xinput ]; then
+	        install -d ${D}${sysconfdir}/
+	        install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
+	fi
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
-- 
1.8.1



