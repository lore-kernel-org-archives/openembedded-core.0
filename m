Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michel.thebeau@windriver.com>) id 1UPuXX-0006tm-Q8
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 14:54:18 +0200
Received: from yow-mthebeau-lx2.wrs.com (yow-mthebeau-lx2.wrs.com
	[128.224.146.159])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3ACanOF014628;
	Wed, 10 Apr 2013 05:36:49 -0700 (PDT)
From: michel.thebeau@windriver.com
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2013 08:36:46 -0400
Message-Id: <1365597407-16068-1-git-send-email-michel.thebeau@windriver.com>
X-Mailer: git-send-email 1.7.9.7
Subject: [PATCH 0/1] kernel.bbclass: do_strip: allow recipes to strip the kernel
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
X-List-Received-Date: Wed, 10 Apr 2013 12:54:19 -0000
X-List-Received-Date: Wed, 10 Apr 2013 12:54:19 -0000

Hi Richard,

Thanks for your review earlier.  Here is the revised patch, stripping
the kernel output elf image in place.

Tested for routerstationpro, qemux86 (bzImage), qemuppc (vmlinux),
qemuarm (zImage).

Am sending the enabling patch for routerstationpro to poky list.

[YOCTO 3515]

M


