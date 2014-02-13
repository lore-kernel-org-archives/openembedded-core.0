Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 73A6C6E891
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 07:39:46 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id b8so7883921lan.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 23:39:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+m3fTbzl+2ykynHaeLGwP0XPaLzDV+7v2RaOzS1jCl0=;
	b=jKbzTANaMWpUYOymoT59rhoLJ9Nj2hzL5gyUYufwJOwfcWjUrLlUZEgOXCo1e6FtVV
	JTIeIDLSJCq5Qk6x5/D8RMdJH2+z51K+v0G3DY3lG2zMVSCiyAiP07BGL6XOcF4D2uP2
	Ynsev1OAoB9IxkK+BOFD9UfJg39smt9NUMMFVyBAUut+10MENIwyopoZxcRGAK5BVQLT
	4d9HEb4I7QlVeUgRtmbH1feU3IkyzNiyuhnjqSCmnGI+6Irq2FTru5l600RbfeWK7Fpn
	/a6VdneaA1OlwB90oOLORj48mPc/Ms/oYX5Zrben92WafuciN27RLv75MmrWdm52fReV
	y4Sw==
X-Gm-Message-State: ALoCoQn/kPPuz8ZLQ6K4kXp2jJOj780McvAwSyeyVgo5XMXXDvEa7t8NWRIAtkWXRGS1Kxm85UmT
X-Received: by 10.112.180.72 with SMTP id dm8mr67178lbc.28.1392277186589;
	Wed, 12 Feb 2014 23:39:46 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id bl8sm1115408lbb.3.2014.02.12.23.39.45
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 23:39:46 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2014 09:39:41 +0200
Message-Id: <1392277181-19357-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] systemtap: fix error: 'EM_AARCH64' was not declared in this scope
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Feb 2014 07:39:46 -0000

bump SRCREV to commit 508059f04842ed85d10bfbec8a9c688d57368860
 Define EM_AARCH64 if elf.h doesn't.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index b87aa1a..962aef9 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,6 +1,6 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "9190b3acfe706d3bfd66dec18133d28f98443321"
+SRCREV = "508059f04842ed85d10bfbec8a9c688d57368860"
 PV = "2.4+git${SRCPV}"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
-- 
1.8.1.2


