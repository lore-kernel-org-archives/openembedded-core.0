Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhsLg-0000Gk-85
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 02:03:12 +0200
Received: by iwn4 with SMTP id 4so1573216iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 16:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ABlAfwxKg7ZAiYi8UI4px9VJdg2R6C+bHQH40fviwPE=;
	b=aDeFJ7rjYIdAUMECAkVXOTcWaXJWrWzcufnVsLP+PsDSOvPr4OO2qYLdJ5rOnwIV7i
	JMB+JMPOuaGfHzi+mTnFn135OtRu9l9AExMeRwGx/qnup63cT6OnecsdmemZszVS3ZDv
	KiF6yFoIQv+T4A2/7OywtX2Mye1UNRVS8pOlw=
Received: by 10.42.161.129 with SMTP id t1mr4540600icx.123.1310774350448;
	Fri, 15 Jul 2011 16:59:10 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id vj5sm1904952icb.11.2011.07.15.16.59.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jul 2011 16:59:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 17:00:20 -0700
Message-Id: <1310774420-27181-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] oe-buildenv-internal: Replace POKYMODE POKYLIBC with TCMODE and TCLIBC
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
X-List-Received-Date: Sat, 16 Jul 2011 00:03:12 -0000

These are new variable names in oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/oe-buildenv-internal |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 09dbf02..c13fc40 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -55,4 +55,4 @@ unset BITBAKEDIR
 export BUILDDIR
 export PATH
 
-export BB_ENV_EXTRAWHITE="MACHINE DISTRO POKYMODE POKYLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND"
+export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND"
-- 
1.7.4.1



