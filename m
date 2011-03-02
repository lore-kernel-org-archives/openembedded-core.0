Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pub30-0005Yn-T5
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 02:40:15 +0100
Received: by iyb26 with SMTP id 26so4794282iyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2011 17:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=XN8zM5q84RL4t/4bNrUi/yTueriI3UiH2SL+KNBzPEc=;
	b=D43AoCAYHIChbZ+imRlUDdKUTSdHFVFxdavFa4enxmjKIjc6eS/eoLI+YZp4POy90h
	b1ujVksui77ViXafJ6yMVvhFFFCy4PQpatlRBkkZQq+DYCpK6iLGE9d/QbUy8QEoBFTQ
	bWCwAKelF14bIS4gq2XZYqku7ZWyvkiPCx9LU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BrMkNBKdTF+wpVTQPxY5lHE0YPyUtKkUGndkc9FEL2HcLW/dGyuDtoeAgZFteUVIYX
	D2vqQDExEuoiFaYiN2Y4shgUMO7QwQgAVsV93Cq61xhsA81H4AzigP4TwxBFgoPTmCFx
	kd9Y6SOedS3BZARSmD/lMWfAykbBZ5qX5mlJA=
Received: by 10.231.156.1 with SMTP id u1mr7000498ibw.52.1299029927548;
	Tue, 01 Mar 2011 17:38:47 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d21sm6206023ibg.9.2011.03.01.17.38.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2011 17:38:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2011 17:38:28 -0800
Message-Id: <1299029911-3973-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299029911-3973-1-git-send-email-raj.khem@gmail.com>
References: <1299029911-3973-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/6] linux-libc-headers_2.6.37.2.bb: Add checksums
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
X-List-Received-Date: Wed, 02 Mar 2011 01:40:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../linux-libc-headers_2.6.37.2.bb                 |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
index dc9d49a..888d9e4 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
@@ -45,3 +45,5 @@ do_install() {
 }
 
 BBCLASSEXTEND = "nativesdk"
+SRC_URI[md5sum] = "89f681bc7c917a84aa7470da6eed5101"
+SRC_URI[sha256sum] = "2920c4cd3e87fe40ebee96d28779091548867e1c36f71c1fc3d07e6d5802161f"
-- 
1.7.4.1



