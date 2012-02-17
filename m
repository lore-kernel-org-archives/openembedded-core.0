Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyS1p-0002lR-Em
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 18:55:29 +0100
Received: by ggeq1 with SMTP id q1so1947398gge.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2012 09:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=RkUZ3qAwfYTWu31527Y2NMS8dC1IcFjNGLOJbk+AAPU=;
	b=EyeAniwms6hohCzOvcYPU9YzJy5D+LOuizJUC1UA4exBlItBSw6xfaNrJ3CjU7+EZC
	JraQtFCpaheF+aei9iPy5nKueTc+lJboUOyziaCqeVR4dPBL1rBNGiwEW2lLbTir7Siw
	+XwVko9STMCIgBZ5nT4r9852fbjKm5E1BaFbI=
Received: by 10.100.84.9 with SMTP id h9mr3436968anb.12.1329500834692;
	Fri, 17 Feb 2012 09:47:14 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id e45sm24123959yhk.2.2012.02.17.09.47.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 09:47:14 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Feb 2012 17:47:03 +0000
Message-Id: <4f96daf0d271de4e0b421c477c1fa0724c7082a4.1329500798.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1329500798.git.otavio@ossystems.com.br>
References: <cover.1329500798.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1329500798.git.otavio@ossystems.com.br>
References: <cover.1329500798.git.otavio@ossystems.com.br>
Subject: [PATCH 1/3] update-rc.d.bbclass: do nothing for extended cross packages
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
X-List-Received-Date: Fri, 17 Feb 2012 17:55:29 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/update-rc.d.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index e72cf78..db88a8e 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -2,6 +2,7 @@ UPDATERCPN ?= "${PN}"
 
 DEPENDS_append = " update-rc.d-native"
 UPDATERCD = "update-rc.d"
+UPDATERCD_virtclass-cross = ""
 UPDATERCD_virtclass-native = ""
 UPDATERCD_virtclass-nativesdk = ""
 
-- 
1.7.2.5



