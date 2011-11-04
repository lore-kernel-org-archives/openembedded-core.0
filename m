Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RMOTF-0001fF-A4
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:26:29 +0100
Received: by mail-yw0-f47.google.com with SMTP id 9so2651180ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2011 11:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=iFnHBgoyJTezGbxuV2mknFuaSsDQDPRt9RyTGm7TPmI=;
	b=Q70ljIzrnhfR0/P8CeCeX9EWCVRH5W1Msd1si8k2DJMspMO3IHEWEVwY62eo/RVzlm
	lfLcvKbdO5h4MVP8/Ft94iHYE80Nq+R2M2z45y+BSkyUqdEiDSrauxT8BIlGX9REGE1X
	OreUceelJp/vn1S4/sa4ggkbXayjrmnuMjFSQ=
Received: by 10.236.78.130 with SMTP id g2mr21808779yhe.79.1320430821578;
	Fri, 04 Nov 2011 11:20:21 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q57sm16408660yhi.22.2011.11.04.11.20.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 11:20:20 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 18:20:05 +0000
Message-Id: <4243288fea16976bfc094e78acda6d039c060584.1320430778.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320430778.git.otavio@ossystems.com.br>
References: <cover.1320430778.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320430778.git.otavio@ossystems.com.br>
References: <cover.1320430778.git.otavio@ossystems.com.br>
Subject: [PATCH 2/5] files/device_table-minimal.txt: add /dev/kmsg
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
X-List-Received-Date: Fri, 04 Nov 2011 18:26:29 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/files/device_table-minimal.txt |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/files/device_table-minimal.txt b/meta/files/device_table-minimal.txt
index 495b5d5..c6e5463 100644
--- a/meta/files/device_table-minimal.txt
+++ b/meta/files/device_table-minimal.txt
@@ -15,6 +15,7 @@
 /dev/hda	b	660	0	6	3	0	-	-	-
 /dev/hda	b	660	0	6	3	1	1	1	20
 /dev/kmem	c	640	0	15	1	2	-	-	-
+/dev/kmsg	c	600	0	0	1	11	-	-	-
 /dev/mem	c	640	0	15	1	1	-	-	-
 /dev/null	c	666	0	0	1	3	-	-	-
 /dev/ram	b	640	0	0	1	0	0	1	4
-- 
1.7.2.5



