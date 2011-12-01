Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW2Oh-00053y-K8
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 09:53:39 +0100
Received: by eaad13 with SMTP id d13so1870623eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 00:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=3T0mnXuobqlQ/73Gok7bySGwoe0K8Pi5AD84PfsytmU=;
	b=TwPCOfwu8AWYFN8cBNBf2COoJT+/5+X6BS7w1e8slWAfqTx1gQmD/OAWCMxmwWhZ32
	A7vaa8W8LbUsrpwOVnhLdyEfj43MqAYyibRBUeFrIJ75RygBzjYJ2FCnQgcUgFdQU84J
	Y1OSaK959jBUE8jhTKs7pB26+I8KuNPa8uJ5M=
Received: by 10.213.113.198 with SMTP id b6mr907797ebq.140.1322729218473;
	Thu, 01 Dec 2011 00:46:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v3sm15268556eej.7.2011.12.01.00.46.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 00:46:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 09:46:40 +0100
Message-Id: <1322729201-11290-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <1322729201-11290-1-git-send-email-Martin.Jansa@gmail.com>
References: <20111201080213.GE29875@jama.jama.net>
	<1322729201-11290-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 2/3] matchbox-panel-2: bump PR, because of xcb-util was renamed to libxcb-util0
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
X-List-Received-Date: Thu, 01 Dec 2011 08:53:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index c1da0cf..41ba8e1 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -13,7 +13,7 @@ DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
 SRCREV = "cdf7a22716b87468f10573f622d5c7a58a684e35"
 PV = "0.0+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
-- 
1.7.8.rc4



