Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShqSn-00016g-Pr
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 01:06:58 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so2657441pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 15:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LUnv/A1IUC/cbVS0DaRuVMEsNmlccNVpdT6fMoMvzOo=;
	b=sskIesh3a/ka+2HkMSmzr/0Cfc6WM6/p0oU7xWr9WVi5A4fRE54AqQfFh3z94CllnX
	M2KfUKGyVFKv0AlpWDFUWbNFLKwMRjE9iSETXuRrAMLIImnp388iYNmc4I9trAH2ya4S
	jwecdnakrL6fuFRE1zIBhVkhDB5Gj4o5LIpGcOSllT7DWESALWz5kpXAGs1fc7iRCz1F
	c9Kt+FB1xPqAo485R2d888AcmEmvRaI83YO/RxByAysETXY3YHHzstnKVu4ceKtHmmah
	xzOtESDLdHTrzr8T34lKx9e2T0H7F+OZJIdDkCdB4wgsSfG8wRXZEp44jFzUZbBT9KJU
	150w==
Received: by 10.68.226.102 with SMTP id rr6mr3021541pbc.99.1340319373364;
	Thu, 21 Jun 2012 15:56:13 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tk1sm36951511pbc.8.2012.06.21.15.56.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 15:56:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2012 15:54:50 -0700
Message-Id: <cc6e69d609dfd4b2d9a3d81179cf2d764ef0b1a0.1340319020.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <34661d7f2383341236e842d75197263faf23ced1.1340319020.git.raj.khem@gmail.com>
References: <34661d7f2383341236e842d75197263faf23ced1.1340319020.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340319020.git.raj.khem@gmail.com>
References: <cover.1340319020.git.raj.khem@gmail.com>
Subject: [PATCH 5/5] qemu_git: set empty PACKAGECONFIG
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
X-List-Received-Date: Thu, 21 Jun 2012 23:06:58 -0000

gl patches are not yet forward ported to git recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_git.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index b788e51..0d0308b 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -18,3 +18,4 @@ SRC_URI = "\
 S = "${WORKDIR}/git"
 
 DEFAULT_PREFERENCE = "-1"
+PACKAGECONFIG = ""
-- 
1.7.5.4



