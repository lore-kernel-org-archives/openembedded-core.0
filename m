Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TKbh2-0003Tz-6s
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Oct 2012 23:13:52 +0200
Received: by mail-gh0-f175.google.com with SMTP id z2so900324ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Oct 2012 14:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=rrBgxGy1Yk0x/jOOhNaf9KkSRAgISqYMH3jtjhmF0dI=;
	b=QCmeUQ8/Ew3zjf/iy048TJUzw18uS9sGu03Ysiauukp7I9ykRo/g6qmi32DNk/IZ7o
	63SLMOvLMWZzQkKvFcw+7p7wvnNfESoqJCESSl0ymK9+pymf3zdIL1BlfVjlxpVZV8kD
	pKBmt0QrMqxV8PuzH92VOa2nGAZD4f6LlX5IQ+2omB4s3+crkx0si0U3m+AQ3iuIw/3G
	TBM+GEWk5pSuqDL+/g6zwR5V2rQ/DQIejaI2O82tuaV+5WnDT9A0QVC2hjCPmaTe0ywb
	XeLvrB1n3u5eZbmYS2vhvKi4+s6iR2t6ENdqShiOonK1XRk9qbc9Z7V87AYLSWJaQehu
	0Lpg==
Received: by 10.236.143.4 with SMTP id k4mr11959302yhj.111.1349557247805;
	Sat, 06 Oct 2012 14:00:47 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id o5sm13220231anm.10.2012.10.06.14.00.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 14:00:47 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Oct 2012 18:00:38 -0300
Message-Id: <1349557238-6559-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] oe-buildenv-internal: Add BB_NO_NETWORK to BB_ENV_EXTRAWHITE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Oct 2012 21:13:52 -0000

This allows for use of bitbake in offline mode, but override it in
command line.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/oe-buildenv-internal |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 01fffba..c3a30fb 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -80,4 +80,4 @@ unset BITBAKEDIR
 # Used by the runqemu script
 export BUILDDIR
 export PATH
-export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER SCREENDIR"
+export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER SCREENDIR"
-- 
1.7.2.5



