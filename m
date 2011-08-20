Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qudit-0004CN-7O
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 07:03:56 +0200
Received: by gxk3 with SMTP id 3so2536210gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 21:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=bLnBNHb9z2O+uriyIIMQAend5TbUOPWBe5EZcJoJFGc=;
	b=RrOz94unkFzD0IrlKicd6ZuYp7iq+n9XhEtReC23nRNS1kDLsKPpXulEg1zV4m3Q53
	kn1ALeNKQygkiqEjp01BNZ7Ocny/K0boVhrEP4gX8Zl19JbtFGOA61NQhadC2F9Bhlaf
	6xsD8FHK3CXk2smqLyXKGBTks16OSeuWX/FRI=
Received: by 10.236.72.201 with SMTP id t49mr653823yhd.114.1313816352347;
	Fri, 19 Aug 2011 21:59:12 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f48sm4668774yhh.56.2011.08.19.21.59.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 21:59:11 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Aug 2011 04:58:44 +0000
Message-Id: <57aeaf6914e82a29385494f6ea0b1bcd10aada37.1313816148.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1313816148.git.otavio@ossystems.com.br>
References: <cover.1313816148.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1313816148.git.otavio@ossystems.com.br>
References: <cover.1313816148.git.otavio@ossystems.com.br>
Subject: [PATCH 6/8] scripts/runqemu: add support to pass bootparams to kernel
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
X-List-Received-Date: Sat, 20 Aug 2011 05:03:57 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/runqemu |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index ed8c05b..91c3c9e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -135,6 +135,9 @@ while [ $i -le $# ]; do
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -serial stdio"
             SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
             ;;
+        "bootparams="*)
+            SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT ${arg##bootparams=}"
+            ;;
         "audio")
             if [[ "x$MACHINE" == "xqemux86" || "x$MACHINE" == "xqemux86-64" ]]; then
                 echo "Enable audio on qemu. Pls. install snd_intel8x0 or snd_ens1370 driver in linux guest.";
-- 
1.7.2.5



