Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QrMPr-0007S5-JM
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 05:58:43 +0200
Received: by yia28 with SMTP id 28so1109933yia.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 20:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=lycNcBh1BQ4YNZh17N6o+x6PD5NsaWxpZLrZTVdvf8I=;
	b=ALUFZ/cXU+05M+UI/WP5JR1Zz9OTwK8K6802JtW4APknbyg/7crD90YhV+RLwMM32N
	4u2Pkz81WTS1r0edlwtTNo6bSbwpbZRJQ+El52wg2V52r9qRgsAHbBVeIQjvt6Ij6o1h
	wqvpCPZmCEK4AnvcXG5LjpSktjp1Y4pEsiEyY=
Received: by 10.91.177.2 with SMTP id e2mr1678196agp.169.1313034852093;
	Wed, 10 Aug 2011 20:54:12 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c6sm398743yhm.44.2011.08.10.20.54.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Aug 2011 20:54:11 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2011 22:46:47 -0500
Message-Id: <1313034407-6961-2-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1313034407-6961-1-git-send-email-agnel.joel@gmail.com>
References: <1313034407-6961-1-git-send-email-agnel.joel@gmail.com>
Cc: mporter@ti.com, k-kooi@ti.com, s-kipisz2@ti.com, jdk@ti.com
Subject: [meta-ti PATCH 2/2] linux-3.0: Remove the 1GHz support hack
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
X-List-Received-Date: Thu, 11 Aug 2011 03:58:43 -0000

This makes the errors possibly related to a corruption of the memory such as "Undefined Instruction"
and "Unable to handle kernel paging request at virtual address" go away. I have verified this multiple times

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
 recipes-kernel/linux/linux_3.0.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index 718b6af..753d3ce 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "(beagleboard)"
 SRCREV_pn-${PN} = "94ed5b4788a7cdbe68bc7cb8516972cbebdc8274"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "m"
+MACHINE_KERNEL_PR_append = "n"
 
 FILESPATHPKG_prepend = "linux-3.0:"
 
@@ -193,7 +193,6 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-3.0.y.git
             file://beagle/0001-OMAP3-beagle-add-support-for-beagleboard-xM-revision.patch \
             file://beagle/0002-UNFINISHED-OMAP3-beagle-add-support-for-expansionboa.patch \
             file://beagle/0003-HACK-OMAP3-beagle-switch-to-GPTIMER1.patch \
-            file://beagle/0004-OMAP3-beagle-HACK-add-in-1GHz-OPP.patch \
             file://beagle/0005-omap3-Add-basic-support-for-720MHz-part.patch \
             file://beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch \
             file://madc/0001-Enabling-Hwmon-driver-for-twl4030-madc.patch \
-- 
1.7.0.4



