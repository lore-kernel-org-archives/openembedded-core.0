Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qiy4K-000258-Jv
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:21:48 +0200
Received: by mail-iw0-f175.google.com with SMTP id 4so3528794iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ABlAfwxKg7ZAiYi8UI4px9VJdg2R6C+bHQH40fviwPE=;
	b=a/OGQibMG7ZQ5P1e0uDxeCXel0DNVQbNrl+EreYsCvPuy8ZlhZOiQ/PG/9sSzws2u3
	LLP1M8A6ckdA+SoLBaiGIkEDPPBmXW16eg4n+b0UlqhOgEtHo8eyKgree0oGhm1Z9ZRo
	ZNIrA2WXCBfyMV/nUDrRSyQ52eEGJe3vMB66Y=
Received: by 10.231.64.67 with SMTP id d3mr5953006ibi.113.1311034665975;
	Mon, 18 Jul 2011 17:17:45 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm3248255ibg.14.2011.07.18.17.17.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 17:17:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 17:17:21 -0700
Message-Id: <f3cb98d70fe54346eebb6b463af38d478366f355.1311034342.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
References: <cover.1311034342.git.raj.khem@gmail.com>
Subject: [PATCH 02/16] oe-buildenv-internal: Replace POKYMODE POKYLIBC with TCMODE and TCLIBC
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
X-List-Received-Date: Tue, 19 Jul 2011 00:21:48 -0000

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



