Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qudin-00049K-JR
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 07:03:49 +0200
Received: by gwb11 with SMTP id 11so1996234gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 21:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=N5MUn37RRLUqKNIvwWzW5zCbt0IWpZ+f6s/I6/fQiIY=;
	b=j9GvYNJw2bmB0lkzI7+Gkrbplf/qB8sWrF69sr8GTCijl+rFHhxVRfhN70T4HEbEvQ
	kQA6MoIiJQXddEZmn1uTAyOBPfnBU0b//YsRjpD9laS2eOEPGPIJIU3Pv24gd/b+GXSA
	Tx1VLojfoen970l1Qk9D6RFUt7jshYFCgRflg=
Received: by 10.150.47.35 with SMTP id u35mr171872ybu.88.1313816347930;
	Fri, 19 Aug 2011 21:59:07 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f48sm4668774yhh.56.2011.08.19.21.59.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 21:59:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Aug 2011 04:58:42 +0000
Message-Id: <7864a738ff2a7bad7db2955280c5b48a5af26f1f.1313816148.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1313816148.git.otavio@ossystems.com.br>
References: <cover.1313816148.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1313816148.git.otavio@ossystems.com.br>
References: <cover.1313816148.git.otavio@ossystems.com.br>
Subject: [PATCH 4/8] kernel.bbclass: save kernel image name into $kerneldir
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
X-List-Received-Date: Sat, 20 Aug 2011 05:03:49 -0000

Save the kernel image name into sysroot so it can be used during image
build if need. This is used by O.S. Systems products and probably
useful to others.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/kernel.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8a56b85..354f1d6 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -129,6 +129,12 @@ kernel_do_install() {
 	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
 
 	#
+	# Store kernel image name to allow use during image generation
+	#
+
+	echo "${KERNEL_IMAGE_BASE_NAME}" >$kerneldir/kernel-image-name
+
+	#
 	# Copy the entire source tree. In case an external build directory is
 	# used, copy the build directory over first, then copy over the source
 	# dir. This ensures the original Makefiles are used and not the
-- 
1.7.2.5



