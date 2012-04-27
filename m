Received: from mail-wg0-f65.google.com ([74.125.82.65])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SO2dD-00059J-T2
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 10:03:51 +0200
Received: by wgbdt11 with SMTP id dt11so151509wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2012 00:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=resent-from:resent-date:resent-message-id:resent-to:delivered-to
	:received-spf:x-google-dkim-signature:from:to:date:message-id
	:x-mailer:cc:subject:x-beenthere:x-mailman-version:precedence
	:reply-to:list-id:list-unsubscribe:list-archive:list-post:list-help
	:list-subscribe:mime-version:content-type:content-transfer-encoding
	:errors-to; bh=SMYmEASn3JeaBc1Bjnsx+yxmnASdRLpfczIrGYLKgn0=;
	b=pVd4RawRRkAvlP7aF6JhC7JxaPOAGD5mDwPq/OJtqFuNQIq4aA0ViCiwTvkCobU/qA
	zT0shggO16nMPBEjkh9J7NGlbFFFcIWnd6oXxHKTJCVlK/7Lt3wNzP3SbB9OCXsojWif
	tPIO1ltFfEBDWOaIQWihnrMR8ySMBXDj6kand9ZXAjOAT9JwK0FDbn4AxPEMaakkb+D0
	rG+YVq9CadSwpB7vDHo6XBlpVmSRmPLZnaPCS0RF+AQOmsr7g5igODhAL39dm1cnlGH/
	hiPhn9vx+6RTYluLeFP+7bGi7cfA7j+oiT3lVB9GqQzq2S55IqDWGPWo3uO/AZ+CA2jm
	OtMQ==
Received: by 10.180.105.69 with SMTP id gk5mr14611363wib.3.1335599651638;
	Sat, 28 Apr 2012 00:54:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j3sm16995337wiw.1.2012.04.28.00.54.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Apr 2012 00:54:11 -0700 (PDT)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Sat, 28 Apr 2012 09:54:15 +0200
Resent-Message-ID: <20120428075415.GB3688@jama.jama.net>
Resent-To: openembedded-core@lists.openembedded.org
Received: by 10.236.61.4 with SMTP id v4csp384008yhc;
	Fri, 27 Apr 2012 01:06:59 -0700 (PDT)
Received: by 10.216.136.131 with SMTP id w3mr3405778wei.15.1335514019376;
	Fri, 27 Apr 2012 01:06:59 -0700 (PDT)
Received: from linuxtogo.org (linuxtogo.org. [188.40.83.200])
	by mx.google.com with ESMTPS id w28si6871970weq.138.2012.04.27.01.06.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Apr 2012 01:06:59 -0700 (PDT)
Received-SPF: neutral (google.com: 188.40.83.200 is neither permitted nor
	denied by best guess record for domain of
	openembedded-devel-bounces@lists.openembedded.org)
	client-ip=188.40.83.200; 
Received: from localhost ([127.0.0.1]) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-devel-bounces@lists.openembedded.org>)
	id 1SNgLd-0007oP-Si; Fri, 27 Apr 2012 10:16:13 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SNgLc-0007oJ-Ed
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 10:16:12 +0200
Received: by wibhj13 with SMTP id hj13so292015wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 01:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ECepKG4oZqalKnS9esyoW+mNSimtw2zbeK0J/rrqQAc=;
	b=M/a8RpQOYy6vxi8eJs0XJJuzP0WfCI9TyzNw7C37YGyoAo/il93NkeMRIpoFX1SSFc
	F6Gn06tCRfKJbNFAK8Sc+AIt9i2xfZW4GvlR+pjCMc8ZfV0bkHPGGH8rYkBlPMOD4Q5n
	LsG2ZOc/fC3ALLuxEz894k+JqDehiuUi04K3xDqTURF3fzlzccMFSQQi678N1EbQs26H
	/Sp/Q/3hI4o0LjGd7kpHSWEuDzgDgCZ1wiJJNSAuZ2QcS9uXoka4B1wSF3/0mbind5E1
	RZeWin+TYpBaXV/YFb2FDj/7pVCm7cuRkpMDTvenNkTjt1ol4WpR7O96WCUhvMhd97Iq
	lpbQ==
Received: by 10.180.92.130 with SMTP id cm2mr3549770wib.4.1335513994518;
	Fri, 27 Apr 2012 01:06:34 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gd4sm4922425wib.6.2012.04.27.01.06.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Apr 2012 01:06:33 -0700 (PDT)
From: Koen Kooi <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Apr 2012 10:06:28 +0200
Message-Id: <1335513988-4447-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnVtPB5AP/I0aYBakYIWJrrFTAkxfF1pypbyzsjoZ0zuCwDL35Ff9IkDx4drUu4LxmtVqyW
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
MIME-Version: 1.0
Errors-To: openembedded-devel-bounces@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [oe] [meta-oe][PATCH] kernel bbclass: recreate uImage unless	KEEPUIMAGE is set
X-BeenThere: openembedded-core@lists.openembedded.org
Reply-To: openembedded-devel@lists.openembedded.org,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sat, 28 Apr 2012 08:03:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The intent of the uImage code in this class includes the following

1) be able to specify custom load addresses without needing to patch the kernel
2) add better information to the uImage description field

The current state is a NOP anyway, the kernel will always build a uImage when you tell it to 'make uImage'.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/classes/kernel.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index b7e9f54..98320fe 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -512,7 +512,7 @@ KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
 
 do_uboot_mkimage() {
 	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
-		if test ! -e arch/${ARCH}/boot/uImage ; then
+		if test "x${KEEPUIMAGE}" = "x" ; then
 			ENTRYPOINT=${UBOOT_ENTRYPOINT}
 			if test -n "${UBOOT_ENTRYSYMBOL}"; then
 				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
-- 
1.7.10


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


