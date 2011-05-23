Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QOU4V-0007uQ-G9
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 14:17:19 +0200
Received: by gwb11 with SMTP id 11so2169577gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 05:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=8z7yhAUr862UsqA8dYpn9RaRfTmvLAcV82/g0s8ROIg=;
	b=wUbnnDuhALsy1tLJKYHeSH2R74OGtTsbQdD6DVCPCTZ0e+5WBD+4jKPklK1tDVsxO0
	SG8c3P2o6YLhScifYHniMXNLT277q5DgKJhJSv4p8bm4baoqLCDhdSI0YYJbcrTXrESh
	d8kRdIOjuv29dMk4tncq4nLvmkgp76043NMwM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=q+aO/MD9ZpGkzucxmDISjf8mvvdIvkZW9iY2o0bDyNUWX63XcIO3CokinUCsCMFbWc
	EbpdH4zIKJ8ixFgnYrRegSrn9GeICjeUyecVMLBHfdKjVY0YWKE1DDEuGv2lKW57yhs3
	u2/+vifbA6vJk2zzhwwb/dqh3AXvi2ts4NUU8=
Received: by 10.101.214.10 with SMTP id r10mr4201631anq.75.1306152858951;
	Mon, 23 May 2011 05:14:18 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q8sm4737950ann.19.2011.05.23.05.14.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2011 05:14:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2011 12:13:55 +0000
Message-Id: <ad984c833e24dc93ac6653e44265592f365d8337.1306152724.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306152724.git.otavio@ossystems.com.br>
References: <cover.1306152724.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306152724.git.otavio@ossystems.com.br>
References: <cover.1306152724.git.otavio@ossystems.com.br>
Subject: [PATCH 3/3] syslinux: rdepends on mtools
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
X-List-Received-Date: Mon, 23 May 2011 12:17:19 -0000

To be able to install into a disk, mtools are required thus we add it
as rdepends of 'syslinux' package.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/syslinux/syslinux_4.03.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_4.03.bb b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
index dc0785e..e76fe1f 100644
--- a/meta/recipes-devtools/syslinux/syslinux_4.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 # If you really want to run syslinux, you need mtools.  We just want the
 # ldlinux.* stuff for now, so skip mtools-native
 DEPENDS = "nasm-native"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/syslinux-${PV}.tar.bz2 \
            file://cross-build.patch"
@@ -48,6 +48,8 @@ do_install() {
 
 PACKAGES =+ "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux"
 
+RDEPENDS_${PN} += "mtools"
+
 FILES_${PN} = "${bindir}/syslinux"
 FILES_${PN}-extlinux = "${sbindir}/extlinux"
 FILES_${PN}-mbr = "${libdir}/${PN}/mbr.bin"
-- 
1.7.2.5



