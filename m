Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SCcZ0-0007Ih-By
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 22:00:20 +0200
Received: by obqv19 with SMTP id v19so309376obq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 12:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4Ss51fwVdkXWnbWeW9EpNh8FMTXnuhDG3+07vKD8hkU=;
	b=R1AaDm1kZ9hjakjJv9BhGQizTf/dyH3BTl1u8rmw8Iuxq3enLhHtuaLa4bkwgY4MpZ
	gF/LlvhOL1JCujjzK9l1U9jtC6g27MbX+ymBIHjGiSMSepCHRq5HTYzTjDiwedVZsxuh
	nh1fMgcj6BN/Zx36sPnYe0efN5UPEtaBqduXcbJYqUGJ5YQXuK5/2EIakog/66O0exm0
	C2dlgq20udG5zmPbZBdWvhrnGfBQ20DJX81+TaSwIwr6Ep677wXlhQ3ccrYw8VKIzUJW
	KOKQzshP5x65ApqW65WCvIEJ+rBS950ii6gTWCpp7gJjMoAbgX7mmKsgrJsi2KFdkPWQ
	ggmg==
Received: by 10.182.1.2 with SMTP id 2mr33862927obi.58.1332877876710;
	Tue, 27 Mar 2012 12:51:16 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id v9sm797626obo.9.2012.03.27.12.51.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 12:51:16 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2012 14:51:07 -0500
Message-Id: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
Cc: Christopher Larson <chris_larson@mentor.com>, edmar@freescale.com
Subject: [PATCH 1/3] external-csl: add mapping for powerpc-nf
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
X-List-Received-Date: Tue, 27 Mar 2012 20:00:21 -0000

From: Christopher Larson <chris_larson@mentor.com>

This ensures we get the files from the correct multilib dir in the external
toolchain when using powerpc with soft-float.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/distro/include/tcmode-external-csl.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index 7bb8453..1fc366c 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -48,6 +48,7 @@ def csl_target_core(d):
         'i686': 'sgxx-glibc',
         'mips': 'mips32',
         'mipsel': 'el',
+        'powerpc-nf': 'nof',
         'ppce500': 'te500v1',
         'ppce500mc': 'te500mc',
         'ppce500v2': 'te500v2',
-- 
1.7.7



