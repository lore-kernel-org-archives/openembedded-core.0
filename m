Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ROcPY-0002jQ-A0
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 22:43:52 +0100
Received: by yenm3 with SMTP id m3so2509358yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 13:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=3v4hT9dEq8LJUyVTephz0wldWKLm6ZLSxk+vqljEr6M=;
	b=NGjKEzCbcmVW0ItiX/vBSEzkFQvd+eV/pSjuxQm+wJ8LF6qDuy+2qmFVkn+Q9Nx/oH
	HY+erovoOKYom0F8nCmIujfvxwyzF9dDWNJfHjM5yTGzZg8s9vxtjnVomftPweM55ROb
	Qg+3obcmteE95hdqxIPN2TOEVDUDTxbKPrdIY=
Received: by 10.101.137.38 with SMTP id p38mr4126895ann.33.1320961053398;
	Thu, 10 Nov 2011 13:37:33 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id d5sm13778798yhl.19.2011.11.10.13.37.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 13:37:32 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2011 21:37:18 +0000
Message-Id: <d2cc2964dc67b5d428e53f6580b282ded72cc701.1320961001.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320961001.git.otavio@ossystems.com.br>
References: <cover.1320961001.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320961001.git.otavio@ossystems.com.br>
References: <cover.1320961001.git.otavio@ossystems.com.br>
Subject: [PATCH 3/3] xinit: rdepends on util-linux-mcookie to avoid brining whole util-linux
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
X-List-Received-Date: Thu, 10 Nov 2011 21:43:52 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/xorg-app/xinit_1.3.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb b/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
index 6953ccc..08dfe12 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
@@ -10,12 +10,12 @@ then terminate."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0d4b5eef75f1584ccbdc5e4a34314407"
 
-PR = "r1"
+PR = "r2"
 PE = "1"
 
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
 
-RDEPENDS_${PN} += "util-linux"
+RDEPENDS_${PN} += "util-linux-mcookie"
 
 FILES_${PN} += "${libdir}X11/xinit"
 
-- 
1.7.2.5



