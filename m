Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QGyXV-0005Vi-3V
	for openembedded-core@lists.openembedded.org;
	Mon, 02 May 2011 21:12:13 +0200
Received: by mail-gy0-f175.google.com with SMTP id 1so2199733gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2011 12:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=C+c4z8lXDJj/M1+l1KMOiW160Xt4Cus+95yCIp4r6fY=;
	b=Rq3jk/w1qJNXdvENu+srvmgzHV+8VAmlrUZ35iXjz2V2wPXeqgFGUt7EutAZ6h+/k6
	FAL/CPgoEXe3qSoz6Dg4K4sCbWGF2T+Ir5i+QK0TBLiZm4+cs1hIFj83iycMfJk2+g+l
	aqyC0cE05pBiIOymgZi27dl7Hf+17YbE8X2fQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=qjTP1/vQ4gFTjgR1oAji14Dxuz7y/8Mscamq1jmZMf5lilcSJSNZqVlsIe0G78U/Rb
	wRYc2Vew41F4cJIdrqg5Bxgf0B6KjqcdWxw+biol7sZe0BcJw4VLOJ/+Q/6jccKOuX6G
	8DT8WZVN4NEqmly1EerEaDz+EW26EU5gClRoM=
Received: by 10.151.82.4 with SMTP id j4mr2755190ybl.6.1304363378587;
	Mon, 02 May 2011 12:09:38 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r9sm856452yba.16.2011.05.02.12.09.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2011 12:09:37 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2011 19:09:14 +0000
Message-Id: <1304363356-27535-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304363356-27535-1-git-send-email-otavio@ossystems.com.br>
References: <1304363356-27535-1-git-send-email-otavio@ossystems.com.br>
Subject: [PATCH 2/4] scripts/oe-setup-builddir: fix typo
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
X-List-Received-Date: Mon, 02 May 2011 19:12:13 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/oe-setup-builddir |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 2f8a064..7fefc52 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -60,7 +60,7 @@ if [ "x" = "x$OECORELOCALCONF" ]; then
 fi
 if ! (test -r "$BUILDDIR/conf/local.conf"); then
 cat <<EOM
-You had no conf/local.conf file. This configuration file has therefore beend 
+You had no conf/local.conf file. This configuration file has therefore been
 created for you with some default values. You may wish to edit it to use a 
 different MACHINE (target hardware) or enable parallel build options to take 
 advantage of multiple cores for example. See the file for more information as 
-- 
1.7.2.5



