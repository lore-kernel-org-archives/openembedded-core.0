Return-Path: <Vignesh.Rajendran@in.bosch.com>
X-Greylist: delayed 543 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 07 May 2018 06:00:05 UTC
Received: from de-deferred2.bosch-org.com (de-deferred2.bosch-org.com
	[139.15.180.217])
	by mail.openembedded.org (Postfix) with ESMTP id F25C274DE5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 06:00:05 +0000 (UTC)
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
	by fe0vms0193.rbdmz01.com (Postfix) with ESMTPS id 40fWvB61sLz3yn
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 07:51:02 +0200 (CEST)
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
	by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 40fWv86DZHz4f3knQ
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 07:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
	s=2015-01-21; t=1525672260;
	bh=Z82gI/uiUyInIjpSrNlFiRoFPJ1/SMTjDPb3N8PyKbs=; l=10;
	h=From:From:Reply-To:Sender;
	b=BMdNOdK2SwgmeSAsPkerB4nI9SoLFGhMauAnlfV+GKaU55nwdc0Hf8zmRrWeukvIx
	5eFMECDkfVLG3ZjEjQuq1jMiPlLyWDV5Lrx33D1FkoI57H4xDFLJ/TYfiNhK0HNYfs
	1Z8HE6opZiPC1HbePxjwSUadWu0moVwwbD7jSNkk=
Received: from si0vm2083.rbesz01.com (unknown [10.58.172.176])
	by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 40fWv85sxpz1C6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 07:51:00 +0200 (CEST)
X-AuditID: 0a3aad17-4fbff70000000e32-8c-5aefe9467923
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by si0vm2083.rbesz01.com (SMG Outbound) with SMTP id
	75.1A.03634.649EFEA5; Mon,  7 May 2018 07:51:02 +0200 (CEST)
Received: from SI-HUB1000.de.bosch.com (si-hub1000.de.bosch.com [10.4.103.106])
	by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 40fWv83rklzCpP7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 07:51:00 +0200 (CEST)
Received: from APAC (10.169.42.196) by SI-HUB1000.de.bosch.com (10.4.103.106)
	with Microsoft SMTP Server id 14.3.319.2;
	Mon, 7 May 2018 07:51:00 +0200
From: Vignesh Rajendran <vignesh.rajendran@in.bosch.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 May 2018 11:20:55 +0530
Message-ID: <1525672255-24026-1-git-send-email-vignesh.rajendran@in.bosch.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.169.42.196]
X-Brightmail-Tracker: H4sIAAAAAAAAA22SaUgUcRjG/e/l7ObU7K7H26aCk5SY2qodVlJBIEEQ2d2C2ZiTu7S7ys5q
	ahFSWLnZfdliJmVi2cHatUmZTVppErTZoS5lZqJ2gl1SaTONtvuhb+88z/t7H/4Pg4lVwzIN
	ZjBbaYuZMpIyhUQx+0JIdFLfJ522fVtYgnvwo+98tPCRowotQTpFYjptNOTQlqlz1yn0P0/e
	l2XdgNyO/fXiAlSntiE5BsQ0uLezDtmQAlMRJSI4eWpAJny8R+Ao3CcdcRA01ndwDobJiATo
	7pnNj/5EDDwdCuAPiYkZYN9d7cvPaiIFbm8vkPGzhAiH8rN1En7GicXAfjmGhOBQaHtUJBZ0
	JTQd75YIdwDu9PaKhZ0wqLncL9mPxtq91uxea+VIdA4FMAZtjilOmxAfY0mjmXxtbMz6TFMN
	EtoJcqIvDopFBIZIPzyW/aRTSakcJs/EoumYiAzAx3Ry0ti0zPQ8PcXoUy3ZRpohNTjy8fFR
	qf/JTHaaycAwhkwziwATk/74uEaOw9OpvHzakilgLJqAScggvDh9i05FZFBWeiNNZ9GWUXcO
	hpGAH+rlQKWFzqBzNxiM1lGbDBEyA70d71gRJmdRPObHZS/nT+BMFmViDBkj+HgBV42qHrQZ
	zdQE4XqeIXhXn23+l6oJxgcWfdCpArwMD9mP2hDXmxqP4GE/7sfz5AHuVJeuUSlHRA8Ud4Zj
	CFYOpS3PEZQ5vyLo+NYghYs7XFJw1dp9ofXnG1+wDRbJoerdsB9ca60gwPl7UAnFRdVqzmjy
	h5c9OwLB/qQ5EMrOuwEO2naNh/Ofj2jg6vfqYPh15XowtJfvDoXBwyWh8KNiKBRudu2dCEOu
	ynB4//DBJCjt7JsEhx6/joAXx7umQOHXs1HQVslGwZDzTAy4vw9P7efKFHFlKjv/lmmlrP8p
	c0T1vE5TgOZmJ62oWdtS0eKolIeJIh1HjFurNse+Sj6Ateauexs/brX9lmkg2Vb4bkL357uJ
	jtPRPUtTUg2rFrjaU9YfnRKGu1e8qCvri4iS5Vcu+30g8fmWWdpvKy89/VWUPINKDZwnbwjf
	YyvGE2tyrkod5rfPdtZfmLxxYu2VkPmbXIXuE0mNpITRU7GRYgtD/QHxSTaXEgQAAA==
Subject: [meta-oe][PATCH] package.bbclass: provide debug sources in externalsrc -dbg packages
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
X-List-Received-Date: Mon, 07 May 2018 06:00:06 -0000
Content-Type: text/plain

The recipes which are using externalsrc method doesn't contain the
debug sources in their -dbg packages.

Add a handling in copydebugsources function to copy the debugsources for
externalsrc -dbg packages.

Signed-off-by: Vignesh Rajendran <vignesh.rajendran@in.bosch.com>
---
 meta/classes/externalsrc.bbclass |  3 +++
 meta/classes/package.bbclass     | 14 +++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index c9f5cf7..135670d 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -129,6 +129,9 @@ python () {
             d.setVar('CONFIGURESTAMPFILE', configstamp)
             d.setVar('STAMP', '${STAMPS_DIR}/work-shared/${PN}/${EXTENDPE}${PV}-${PR}')
             d.setVar('STAMPCLEAN', '${STAMPS_DIR}/work-shared/${PN}/*-*')
+
+	# set DEBUG_PREFIX_MAP to external source path
+	d.appendVar("DEBUG_PREFIX_MAP", "-fdebug-prefix-map=${EXTERNALSRC}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}")
 }
 
 python externalsrc_configure_prefunc() {
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index edeffa9..2c4472d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -420,6 +420,7 @@ def copydebugsources(debugsrcdir, d):
         workdir = d.getVar("WORKDIR")
         workparentdir = os.path.dirname(os.path.dirname(workdir))
         workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
+	externalsrc = d.getVar('EXTERNALSRC', True)
 
         # If build path exists in sourcefile, it means toolchain did not use
         # -fdebug-prefix-map to compile
@@ -444,10 +445,17 @@ def copydebugsources(debugsrcdir, d):
         processdebugsrc += "fgrep -zw '%s' | "
         # Remove prefix in the source paths
         processdebugsrc += "sed 's#%s##g' | "
-        processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
+        # handle external sources to provide sources in -dbg packages
+        if externalsrc:
+            localsrc_prefix = "/usr/src/debug/"
+            processdebugsrc += "sed 's#%s/##g' | "
+            processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s/%s' 2>/dev/null)"
+            cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workbasedir, externalsrc, dvar, debugsrcdir, workbasedir)
+        else:
+            processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
+            cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workparentdir, dvar, debugsrcdir)
 
-        cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workparentdir, dvar, debugsrcdir)
-        (retval, output) = oe.utils.getstatusoutput(cmd)
+	(retval, output) = oe.utils.getstatusoutput(cmd)
         # Can "fail" if internal headers/transient sources are attempted
         #if retval:
         #    bb.fatal("debug source copy failed with exit code %s (cmd was %s)" % (retval, cmd))
-- 
2.7.4


