Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZPLf-0000G7-Fp
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 17:00:27 +0100
Received: by ggnh1 with SMTP id h1so4216253ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 07:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Bw3Q0owH/BqtTeO3QE4zttYJNG5RJC8vEppKfqXtKKE=;
	b=E9jfSBLkUxFYh05V9yH5BFMu5jz5t+fRsUdnPh4MSfb4+QeuJ2ZPy2Gbki5zP6gD8S
	Hj0LlKE23wqHTmpVR2bXlK9LvyCGWxWBcKoI5ePb95vcdxD09m+KP6xtqnWvvK9rqXJD
	6JF6W/GHIq7BrWHgMQ/T7zz2wwqt+FeYAZ8i0=
Received: by 10.101.157.1 with SMTP id j1mr2876376ano.15.1323532414833;
	Sat, 10 Dec 2011 07:53:34 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 11sm22889515anp.13.2011.12.10.07.53.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 10 Dec 2011 07:53:34 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Dec 2011 15:53:12 +0000
Message-Id: <1323532392-15760-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] scripts/send-pull-request: fix typo
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
X-List-Received-Date: Sat, 10 Dec 2011 16:00:27 -0000

s/No cover letter will be send./No cover letter will be sent./

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/send-pull-request |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 8d51ce2..09f4245 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -118,7 +118,7 @@ if [ -e $PDIR/0000-cover-letter.patch ]; then
 		fi
 	done
 else
-	echo "WARNING: No cover letter will be send."
+	echo "WARNING: No cover letter will be sent."
 fi
 
 # Harvest emails from the generated patches and populate AUTO_CC.
-- 
1.7.2.5



