Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 16BFD72FE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 11:09:46 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20170313110946187_0485
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 11:09:46 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=50998 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cnNrA-0005qI-FK for openembedded-core@lists.openembedded.org;
	Mon, 13 Mar 2017 07:09:40 -0400
Date: Mon, 13 Mar 2017 07:09:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703130706150.979@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH] classes: Fix "U-boot", use proper spelling of "U-Boot".
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
X-List-Received-Date: Mon, 13 Mar 2017 11:09:48 -0000
Content-Type: text/plain; charset=US-ASCII

U-Boot people are amazingly pedantic in their insistence on proper
spelling of "U-Boot", so humour them.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 1c3b4b7..f9702f8 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -24,7 +24,7 @@ python __anonymous () {
             d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')

         # Verified boot will sign the fitImage and append the public key to
-        # U-boot dtb. We ensure the U-Boot dtb is deployed before assembling
+        # U-Boot dtb. We ensure the U-Boot dtb is deployed before assembling
         # the fitImage:
         if d.getVar('UBOOT_SIGN_ENABLE') == "1":
             uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 65a8c49..8ee904e 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -25,7 +25,7 @@
 #   u-boot:do_concat_dtb
 #   u-boot:do_install
 #
-# For more details on signature process, please refer to U-boot documentation.
+# For more details on signature process, please refer to U-Boot documentation.

 # Signature activation.
 UBOOT_SIGN_ENABLE ?= "0"

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


