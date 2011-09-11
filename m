Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ebutera@gmail.com>) id 1R2kFM-0004Je-Kp
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Sep 2011 15:38:56 +0200
Received: by wwf27 with SMTP id 27so316439wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2011 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=QdkHrIIw5kGkyD/4kICmBlXTZ4FLMJgTQ1PLiRh4P9o=;
	b=UuFnuuRRpDZEbOFTXRWyovewRNR7poDSNJLEmO5gqidV+04s+OTRVMzUXAWHIu9xN3
	LZf3jPzb3OXSY91cI8LUrqzBaorV2F4eeB4tos8laxIa86yPft103oksucudtMwK6zhh
	3sYjbchrnNGEr4bquixiKSuajLNGogAyzrZMw=
Received: by 10.227.58.75 with SMTP id f11mr28618wbh.106.1315748027363;
	Sun, 11 Sep 2011 06:33:47 -0700 (PDT)
Received: from localhost.localdomain
	(host145-0-dynamic.18-79-r.retail.telecomitalia.it [79.18.0.145])
	by mx.google.com with ESMTPS id fp5sm13169025wbb.2.2011.09.11.06.33.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 11 Sep 2011 06:33:46 -0700 (PDT)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Sep 2011 15:33:40 +0200
Message-Id: <1315748020-2323-1-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] mirrors.bbclass: add OSUOSL to kernel.org mirrors
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
X-List-Received-Date: Sun, 11 Sep 2011 13:38:56 -0000

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 meta/classes/mirrors.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 2146087..cd13229 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -28,6 +28,7 @@ ${KERNELORG_MIRROR}	ftp://ftp.uk.kernel.org/pub \n \
 ${KERNELORG_MIRROR}	ftp://ftp.hk.kernel.org/pub \n \
 ${KERNELORG_MIRROR}	ftp://ftp.au.kernel.org/pub \n \
 ${KERNELORG_MIRROR}	ftp://ftp.jp.kernel.org/pub \n \
+${KERNELORG_MIRROR}	http://ftp.osuosl.org/pub/kernel/pub \n \
 ftp://ftp.gnupg.org/gcrypt/     ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt/ \n \
 ftp://ftp.gnupg.org/gcrypt/     ftp://ftp.surfnet.nl/pub/security/gnupg/ \n \
 ftp://ftp.gnupg.org/gcrypt/     http://gulus.USherbrooke.ca/pub/appl/GnuPG/ \n \
-- 
1.7.4.1



