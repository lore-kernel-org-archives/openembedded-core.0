Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qudiu-0004Dj-1m
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 07:03:57 +0200
Received: by yxl11 with SMTP id 11so528933yxl.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 21:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=+kPS7RtbGmDjZ73QGcMGFsbLG5DO0ZtkFRDUCY0rvSI=;
	b=TCZ+MVm1NCBy/Qajsgi8afPK+X0900TfARoRuBQ1x9W4mfNtJ/vyV/Wg3NoFxahX0g
	VkOYUEM6RmiN23iLpeQH95uCJyqKNCtAZqmeF7yb5A81r7SoU1fFP5JogCXJSlLnamn8
	oLUlsAWeSP/gKbipEknt3JBHXR9EU6ur8j5qg=
Received: by 10.236.180.38 with SMTP id i26mr821306yhm.7.1313816354349;
	Fri, 19 Aug 2011 21:59:14 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f48sm4668774yhh.56.2011.08.19.21.59.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 21:59:13 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Aug 2011 04:58:45 +0000
Message-Id: <512d2bd7cc7ad38f24b57fd8e0a73c8906cb4273.1313816148.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1313816148.git.otavio@ossystems.com.br>
References: <cover.1313816148.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1313816148.git.otavio@ossystems.com.br>
References: <cover.1313816148.git.otavio@ossystems.com.br>
Subject: [PATCH 7/8] scripts/runqemu: remove redundant checking
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
X-List-Received-Date: Sat, 20 Aug 2011 05:03:58 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/runqemu |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 91c3c9e..d617f79 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -163,7 +163,7 @@ while [ $i -le $# ]; do
             # A directory name is an nfs rootfs
             if [ -d "$arg" ]; then
                 echo "Assuming $arg is an nfs rootfs"
-                if [[ -z "$FSTYPE" || "$FSTYPE" == "nfs" ]]; then
+                if [[ -z "$FSTYPE" ]]; then
                     FSTYPE=nfs
                 else
                     echo "Error: conflicting FSTYPE types [$arg] and nfs"
-- 
1.7.2.5



