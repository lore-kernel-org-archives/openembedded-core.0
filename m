Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW2Oa-00053V-S8
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 09:53:33 +0100
Received: by eekc1 with SMTP id c1so1042748eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 00:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=QVrCwMupwWQTPl2czlWSwegna8nT52FTQdXavP4VHZU=;
	b=ELtumFzuxWunDWtJ0f6SLB0nQaht0ULyptl2AX3zzTKvaoX0wEZwkXCXPTkXxP3SGg
	HqWwQTYrV0OoiPgu+DupBsXYM6rmZV1yhUdxVOg3UMlFrAJommHFx3o/EaEPm4lZoldx
	pP29G5x4yGRuis+etqAr3lgz4j9HXfrSpTtGY=
Received: by 10.14.20.9 with SMTP id o9mr729244eeo.28.1322729210979;
	Thu, 01 Dec 2011 00:46:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 8sm15259918eei.8.2011.12.01.00.46.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 00:46:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 09:46:39 +0100
Message-Id: <1322729201-11290-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <20111201080213.GE29875@jama.jama.net>
References: <20111201080213.GE29875@jama.jama.net>
Subject: [PATCH][oe-core 1/3] startup-notification: bump PR, because of xcb-util was renamed to libxcb-util0
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
X-List-Received-Date: Thu, 01 Dec 2011 08:53:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../startup-notification_0.12.bb                   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
index d3a9576..0fc18b1 100644
--- a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
+++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a2ae2cd47d6d2f238410f5364dfbc0f2 \
                     file://libsn/sn-common.h;endline=23;md5=6d05bc0ebdcf5513a6e77cb26e8cd7e2 \
                     file://test/test-boilerplate.h;endline=23;md5=923e706b2a70586176eead261cc5bb98"
 
-PR = "r0"
+PR = "r1"
 
 SECTION = "libs"
 
-- 
1.7.8.rc4



