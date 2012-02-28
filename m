Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2O0f-0002s6-UZ
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 15:26:34 +0100
Received: by ggeq1 with SMTP id q1so2400416gge.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:18:06 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.184.196 as permitted sender) client-ip=10.236.184.196; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.184.196 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.184.196])
	by 10.236.184.196 with SMTP id s44mr29371450yhm.9.1330438686162
	(num_hops = 1); Tue, 28 Feb 2012 06:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=UnZuBEuVgG8yR85X0stUdjrzNJ6h06zd1b5ZsRjqxdg=;
	b=QWcgeP17iKUUHMp1lzRfhzxJLfDi+ff0VAnTBCEWsGkYrZlwcWVgtPRnaJ2P43uaUr
	FhPAPNdg9/dPucNMaPPVSGGip5nYvPPYYgfzktfs+7RSCNgMwpTteNIaQskPPsc3vuug
	yxnpa6K0c6j2qE5UPt+DZrYf7A5U7Ij6Zzcs4=
Received: by 10.236.184.196 with SMTP id s44mr22177149yhm.9.1330438686108;
	Tue, 28 Feb 2012 06:18:06 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d66sm47458180yhh.12.2012.02.28.06.18.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 06:18:05 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 14:17:59 +0000
Message-Id: <48ec8534b699a29cbb6efbfba0bfbcef0581ae3d.1330438659.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330438659.git.otavio@ossystems.com.br>
References: <cover.1330438659.git.otavio@ossystems.com.br>
Subject: [PATCH 1/1] syslinux: bump PR
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
X-List-Received-Date: Tue, 28 Feb 2012 14:26:34 -0000

The change done in 868a81e869a6193aada2073ae533d937a1c0baf4 has
changed the packaging however it haven't bump the PR making
auto-building fail.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/syslinux/syslinux_4.03.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_4.03.bb b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
index 862ea8b..823465c 100644
--- a/meta/recipes-devtools/syslinux/syslinux_4.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 # If you really want to run syslinux, you need mtools.  We just want the
 # ldlinux.* stuff for now, so skip mtools-native
 DEPENDS = "nasm-native"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/4.xx/syslinux-${PV}.tar.bz2 \
            file://cross-build.patch"
-- 
1.7.2.5



