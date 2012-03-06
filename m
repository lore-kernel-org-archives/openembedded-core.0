Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1S4x4Z-0002XJ-1x
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 17:17:11 +0100
Received: by yenm3 with SMTP id m3so2235893yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 08:08:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jefflance01@gmail.com designates
	10.236.136.99 as permitted sender) client-ip=10.236.136.99; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of jefflance01@gmail.com
	designates 10.236.136.99 as permitted sender)
	smtp.mail=jefflance01@gmail.com;
	dkim=pass header.i=jefflance01@gmail.com
Received: from mr.google.com ([10.236.136.99])
	by 10.236.136.99 with SMTP id v63mr34375086yhi.46.1331050114834
	(num_hops = 1); Tue, 06 Mar 2012 08:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qez97Vw6lM6IRF8C347wfseFGLYS+lmkk4TTXZZvgkU=;
	b=QHU0ZdsYS+S5KblUxl6DbzxeLQDevcYEMgvBanvfW8hB89zAGu7F4v018gQtuHlCZf
	DI0XVdimZjPmB1Pg7/6gFO7KwcMLxztOi4t88apsNTdqNZ7rd9nK3meNHyGu4cWHzxux
	tMn1/UH69R/LOgiy5sq3IJSYd/lmRgLYg+XaqewTPM9zeE+e+iaZOZ1XUORGRaKTuvE5
	Kt1EPY67COPAKPBLgCqKgn8K/vsg4zrxTqTTTNs7UEsdb6vRcEwU4Nr6H7xfyeE91MlU
	yLxsQHyE1sBhJ+dwLKsYW6f3/x5RRrtEaYJzVa5K1B42F+orTWsW/u8Fbpqxy0ngX9uM
	BVxg==
Received: by 10.236.136.99 with SMTP id v63mr27207090yhi.46.1331050114560;
	Tue, 06 Mar 2012 08:08:34 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id u20sm12847595yhi.10.2012.03.06.08.08.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 08:08:32 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 10:08:28 -0600
Message-Id: <1331050108-21460-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH] trace-cmd: modifying License information
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
X-List-Received-Date: Tue, 06 Mar 2012 16:17:11 -0000

* Adding LGPLv2.1 to GPLv2 to create a dual license to cover the libraries.
* Bump up PR

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
index d40dc6e..007cad2 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
@@ -1,10 +1,12 @@
 DESCRIPTION = "User interface to Ftrace"
-LICENSE = "GPLv2"
+LICENSE = "LGPLv2.1 GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e"
+                    file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \
+                    file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
+                    file://trace-input.c;beginline=5;endine=8;md5=c9c405aaf5cfc09582ec83cf6e83a020"
 
 SRCREV = "7055ffd37beeb44714e86a4abc703f7e175a0db5"
-PR = "r1"
+PR = "r2"
 PV = "1.2+git${SRCPV}"
 
 inherit pkgconfig
-- 
1.7.0.4



