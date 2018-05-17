Return-Path: <Vignesh.Rajendran@in.bosch.com>
X-Greylist: delayed 63526 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 May 2018 05:50:09 UTC
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
	by mail.openembedded.org (Postfix) with ESMTP id 1216C60557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 05:50:09 +0000 (UTC)
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
	by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 40mgPY6tmPz4f3mR8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 07:50:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
	s=2015-01-21; t=1526536210;
	bh=Z82gI/uiUyInIjpSrNlFiRoFPJ1/SMTjDPb3N8PyKbs=; l=10;
	h=From:From:Reply-To:Sender;
	b=RW8sSPlkGpCyTUtC7GVYYdHap1E+buiZRH3zsF19hb0Wb3MfN2t0MztCM49iBvFiB
	CHn32GKn/mdgdGWWCVpBj8z62HiGOS/IxYrEByGtBUJnnp5sdxMUxvFjkz2wUGG54Y
	EV1AumwImGEQVdO8cv7IImGGtxwuUh0RgFLj5RGU=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
	by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 40mgPY6WzVz1JG
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 07:50:09 +0200 (CEST)
X-AuditID: 0a3aad10-427ff70000000ee7-c1-5afd181cc59c
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id
	54.E4.03815.C181DFA5; Thu, 17 May 2018 07:50:20 +0200 (CEST)
Received: from SI-HUB1000.de.bosch.com (si-hub1000.de.bosch.com [10.4.103.106])
	by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 40mgPY4dhBz6D44M1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 07:50:09 +0200 (CEST)
Received: from APAC (10.169.42.196) by SI-HUB1000.de.bosch.com (10.4.103.106)
	with Microsoft SMTP Server id 14.3.319.2;
	Thu, 17 May 2018 07:50:09 +0200
From: Vignesh Rajendran <vignesh.rajendran@in.bosch.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 May 2018 11:20:00 +0530
Message-ID: <1526536200-26106-1-git-send-email-vignesh.rajendran@in.bosch.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.169.42.196]
X-Brightmail-Tracker: H4sIAAAAAAAAA22SW0wTWxiF2Z22DE2HDFMpPxVJzhwF46UWRYtoDPFFz4PGRJMjY7xMYaTV
	lpKZlojRSDRyDtUo8ZZSCeKJcBCKREStSoI24j1G8Yo2xiupqFWjiAQpdjJg++Dbv9f6v71m
	rwyOUSNKHW4pdnB8MWullSq5KrdlwvQ0GGYMh95SOYHBUHweWnz7ZCNahhjV/ELOainl+BkL
	1qnMjVeqsJKGlE0Xn99RlKMuyoUScCCzwd3gRi6kwinSLYOWxp0y6RBC0PMmgEmHagTfmg4o
	XQjHlWQOvO7NFcdxpB4ehJPFizByDnh2NceLs4ZcDZ07ypXiLCcnwZejQZk4E+RS+P7FjUnB
	6dBzuxKT9CS4Xv1aLt0DcCkYHN35A9pO9cmrUKInZs0Ts1aHZE0oeT1nKLUZ52bl6HkTJ2w2
	ZOkL7LY2JLVD+pDnusmPSBzRamKWdpihFGypUGbzo9m4jE4m9oSHGCrRZC8sM7OCeS3vtHIC
	rSNQXFwcpfklC06TzSIIFnuxHwGO0eOI7K8/GIooZMs2c7xdwvxoPC6nU4jdhVsYiixiHdxG
	jivh+DF3Ho7TQKhTIt+QxHNF3Kb1FqtjzKYnSJnaWCc2VoYn+NEsXB3J/iA+gxBKWJtgKRrF
	UyWcGlOj6A1k1KUQ20WGFF2zs/hXqi6NyNQNMlRyjBEl+1APivSmITpEWB358aJ5QPg0NflU
	0qgYhWbWRxjSnQA1tx4hqPX1I3j67bICTlR0K6D7vCce7g+9igfXYGUCNL4bUcOZ+8dI8A0P
	JsHuymYNPOut0ILn3g0t1HoDAPtc/6aC99NBHZweaE6DH+1n0+BJ3a50+H4snA4dL/f8CeHu
	honw/ua1DKh5/jYD9t99MRkeV7+cCjv7j0+Dngb/NAj76vUQGBiZAZ0DdwzgO3DP0BcpUxYp
	E10cEst0sI7flDmqRl+nK0fOIzUXDj7623BuUerE3tCkJVcOzdubqw1b/vJiwVZd3mSrN9vZ
	9bGr7fyL9hVtpnxG2NhSkPfVntk5UHHV+DAUOMxs6+jfghT/xRnnBFZ+bNcXLPS2pvOpn2Zu
	rfpnUV2tUumfnp+4sDW4ZnagO7tog/LhcmMrGj8/c9X2/599DtXTcsHMZk3BeIH9CdgGZd0S
	BAAA
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
X-List-Received-Date: Thu, 17 May 2018 05:50:10 -0000
Content-Type: text/plain

The recipes which are using externalsrc method doesn't contain the
debug sources in their -dbg packages.

Add a handling in copydebugsources function to copy the debugsources for
externalsrc -dbg packages.

Signed-off-by: Vignesh Rajendran <vignesh.rajendran@in.bosch.com>
---
 meta/classes/externalsrc.bbclass |  3 +++
 meta/classes/package.bbclass     | 12 ++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

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
index edeffa9..f071a2e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -420,6 +420,7 @@ def copydebugsources(debugsrcdir, d):
         workdir = d.getVar("WORKDIR")
         workparentdir = os.path.dirname(os.path.dirname(workdir))
         workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
+        externalsrc = d.getVar('EXTERNALSRC', True)
 
         # If build path exists in sourcefile, it means toolchain did not use
         # -fdebug-prefix-map to compile
@@ -444,9 +445,16 @@ def copydebugsources(debugsrcdir, d):
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
         (retval, output) = oe.utils.getstatusoutput(cmd)
         # Can "fail" if internal headers/transient sources are attempted
         #if retval:
-- 
2.7.4


