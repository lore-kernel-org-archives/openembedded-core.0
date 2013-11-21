Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DE5EF60B60
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 15:26:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rALFPmia012049; Thu, 21 Nov 2013 15:25:48 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Q7J6Hli43eFo; Thu, 21 Nov 2013 15:25:48 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rALFPe3X012033
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 21 Nov 2013 15:25:42 GMT
Message-ID: <1385047536.16887.137.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 15:25:36 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: meta-intel@yoctoproject.org, "Hart, Darren" <darren.hart@intel.com>
Subject: [PATCH] ia32-base: Remove cpio and ext3 defaults
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
X-List-Received-Date: Thu, 21 Nov 2013 15:26:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On real IA hardware, neither the ext3 or cpio images are particularly useful
or used. cpio is legacy from initramfs and that specific image now overrides
FSTYPES accordingly. The size difference in filesystems makes ext3 as a file
format less useful, mainly being useful in the qemu case.

When needed users can still override the default FSTYPES so having
saner defaults makes sense. This improves build times and uses less
network bandwidth for builds and releases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
index 8a20bca..e15f927 100644
--- a/meta/conf/machine/include/ia32-base.inc
+++ b/meta/conf/machine/include/ia32-base.inc
@@ -10,7 +10,7 @@ MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"
 
-IMAGE_FSTYPES += "ext3 cpio.gz live"
+IMAGE_FSTYPES += "live"
 
 KERNEL_IMAGETYPE ?= "bzImage"
 



