Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RCHf8-0003JR-8Y
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 23:08:58 +0200
Received: by gyg8 with SMTP id 8so4131746gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 14:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=O8fTJFztTFT8s8Yg25Vuc9AfWAeRm0sFXj5kpD10Kpk=;
	b=bIgbflnO5Kp8/X7WD1bBEnw4wAMSj22xoTaMse4ushp09jwps5c/w14haRc0cxSB8r
	AlyNjNa4mMc/ej6I1iFBZEs1/NaCaXebmCbDE8bRJMLaqLZVcn2udzHze5KaKraVSig2
	nMmKQjlkAwl3CxwklBopoFFYEWh+KFwhMjYc4=
Received: by 10.236.85.242 with SMTP id u78mr6487908yhe.116.1318021400191;
	Fri, 07 Oct 2011 14:03:20 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-167-38.ph.ph.cox.net.
	[24.251.167.38])
	by mx.google.com with ESMTPS id x65sm14662621yhg.18.2011.10.07.14.03.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 14:03:19 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 14:03:01 -0700
Message-Id: <702d65b93492008812ac8778fc010f30e904383e.1318021323.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1318021323.git.kergoth@gmail.com>
References: <cover.1318021323.git.kergoth@gmail.com>
In-Reply-To: <cover.1318021323.git.kergoth@gmail.com>
References: <cover.1318021323.git.kergoth@gmail.com>
Subject: [PATCH 3/3] oe.patch: drop bb.msg.domain reference
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
X-List-Received-Date: Fri, 07 Oct 2011 21:08:58 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/lib/oe/patch.py |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 1406e19..9b0ff37 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -376,8 +376,8 @@ class UserResolver(Resolver):
             os.environ['SHELLCMDS'] = "bash --rcfile " + rcfile
             rc = os.system(bb.data.getVar('TERMCMDRUN', self.patchset.d, 1))
             if os.WIFEXITED(rc) and os.WEXITSTATUS(rc) != 0:
-                bb.msg.fatal(bb.msg.domain.Build, ("Cannot proceed with manual patch resolution - '%s' not found. " \
-                    + "Check TERMCMDRUN variable.") % bb.data.getVar('TERMCMDRUN', self.patchset.d, 1))
+                bb.fatal(("Cannot proceed with manual patch resolution - '%s' not found. "
+                          + "Check TERMCMDRUN variable.") % bb.data.getVar('TERMCMDRUN', self.patchset.d, 1))
 
             # Construct a new PatchSet after the user's changes, compare the
             # sets, checking patches for modifications, and doing a remote
-- 
1.7.4.1



