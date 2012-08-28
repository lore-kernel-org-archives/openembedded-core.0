Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6FhK-0006Kp-ML
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 08:54:50 +0200
Received: by mail-ey0-f175.google.com with SMTP id d12so1156736eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=qGDlAG5GzD1PAAnCdDX9zOH4rb6hpQHgQplo1LoiUSc=;
	b=o6hd+lktOFkNvrsaIpXgFerlsI5f3NtToVxTQHG7qwxSULJZT+D4kQNsGx+u3m1L+u
	3p/N7hM7v9iiBI0ATqslUspFKT/rQrjvx62R5rG+bzLbJ/3GSsfnmufDpru6MKzQQkg+
	Kw0cs3cJuSiWz+s44A5eXT0yXz9mVDDu7g2ECLJ9S9/s+2BpPhfzNekoY4HFs3zp5k62
	tzfwOABQoaXbvMRFtQYvXFtCgA8B+iRcFd6IyFsuKjoYbIEWGDYfYCCGvRWhgRO2FJUJ
	SoQsdPhSZ0/puoCeRPFp3/ia92WapcRQaaluNu5IPMwX+h8rIj9S4N0caatBqBwaz18Z
	O8qA==
Received: by 10.14.184.133 with SMTP id s5mr20745406eem.31.1346136160583;
	Mon, 27 Aug 2012 23:42:40 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id u47sm58234123eeo.9.2012.08.27.23.42.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:42:39 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:41:48 +0200
Message-Id: <1346136108-13062-11-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkMTV3ODdElDlcz1OzbyNxKm6qjRSEgDGFVo//0ATXfy+SZaGW7ReTYQZcGqnrJMNEllxD7
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][meta-oe][PATCH 11/11] kernel.bbclass: Dont package kxgettext.o
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
X-List-Received-Date: Tue, 28 Aug 2012 06:54:50 -0000

From: Khem Raj <raj.khem@gmail.com>

kxgettext.o is generated when building ppc kernels
so we end up with packaging errors like

> ERROR: QA Issue: Architecture did not match (20 to 62) on
> /work/virtex5-poky-linux/linux-xilinx-2.6.38-r00/packages-split/kernel-dev/usr/src/kernel/scripts/kconfig/kxgettext.o

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5de270f..7ae2a53 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -196,7 +196,7 @@ kernel_do_install() {
 	# during do_package for cross-compiled platforms
 	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
 	           arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
-		   scripts/kconfig/conf.o"
+		   scripts/kconfig/conf.o scripts/kconfig/kxgettext.o"
 	for entry in $bin_files; do
 	        rm -f $kerneldir/$entry
 	done
-- 
1.7.7.6



