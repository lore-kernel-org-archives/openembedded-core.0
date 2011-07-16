Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhuDq-0002B1-VR
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 04:03:15 +0200
Received: by iyj12 with SMTP id 12so272203iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 18:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ABlAfwxKg7ZAiYi8UI4px9VJdg2R6C+bHQH40fviwPE=;
	b=NHXPRv3+tU65qVurFZw/LHm/SFJ9GB0oc7tMp29nL5vwMwhWgBhV6kggxE+NRekyEJ
	ewbunX9OO69b4PhInridVfk+j6Qu67GboAPYw3cVVdFfgcgEx/tJjkF5H21VVkWiLnyn
	rqDqPHxWB44A/WUHyuMj+yP31x0qpSGR1B3+E=
Received: by 10.42.154.132 with SMTP id q4mr822688icw.200.1310781553448;
	Fri, 15 Jul 2011 18:59:13 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id hq1sm2001828icc.14.2011.07.15.18.59.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jul 2011 18:59:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 18:59:03 -0700
Message-Id: <95af2212bfd5683957ba7095a8d10bccf35e7d8c.1310781382.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <e286a25378756398463d3bf34174005a8cef8841.1310781382.git.raj.khem@gmail.com>
References: <e286a25378756398463d3bf34174005a8cef8841.1310781382.git.raj.khem@gmail.com>
In-Reply-To: <cover.1310781382.git.raj.khem@gmail.com>
References: <cover.1310781382.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] oe-buildenv-internal: Replace POKYMODE POKYLIBC with TCMODE and TCLIBC
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
X-List-Received-Date: Sat, 16 Jul 2011 02:03:15 -0000

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



