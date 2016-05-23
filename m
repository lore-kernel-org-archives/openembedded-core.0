Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9301460796
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 12:53:40 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q62so14735880wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 05:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=TB5q9oq/iR0KWcuWFaxlYaQTk9hmQCCK1HF0zvawELo=;
	b=plZvsQ40wNRRQa6xzUIXXT1yyDVFFpP2QCqMEknYI+MuJsJCtu+WFP5gmIG8EPjZDp
	1U0wD9FzsUM0UptJew2oP+19lBowS4HMDlW65OarUBHwQEK4JK/W9+hB7iWeZqVvdxo1
	ajivFgVzxxi2sH+T2clAuh+4J7TUnBsg4HGZQMhhZs30aSVoxZdmRdul7EENXExkgm/o
	qtenxG4Qtz+0Zjom0XpIc36qFZ/ZZXm7+V7Tu0F/KKGl8p+cM+OZVLMA7kj03miCYKDC
	069e6B7EsT5tVXYa9AFSe9zEKpW9AUDXZ75S7FaHCuWBQX8pP4RYF/TrxasvUiTwzlsv
	WQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=TB5q9oq/iR0KWcuWFaxlYaQTk9hmQCCK1HF0zvawELo=;
	b=BTwkMqINYzQTu66DcM+Ai0gAB1aicnX2w6CpI52ukmDHhffbb+h0MTCvfaLWo/qgQk
	T7oV+StnF9gqB0usm3GHfuvYH8OFBgyWv48luz97SI8y/xfPA2jv93zHQtZCjQIe0wYm
	I6phViwCIsXPO/gZCjDV11M3RsiE/OXrLvYcp1B0kNfF5R/60bZF9sy3jZ6683Pad+0T
	SZ+AR38rB4GUhwZY7UjMRPN5ZM5v7+mcgaEA+n1kuKNPQuZ1iNJk7uY5VGDYpXKmi2yn
	eww4vkFZVBqKJTC+28wfLoW0eSfKSuiytH+DGFStNatUnstMGF2fvFoojrwSU4yHPEWK
	P25w==
X-Gm-Message-State: AOPr4FUuN4xepUqM7ZKbZ7RhpGpjgWKyrw4yfzpkjuChoeoR+BZTmmEjPXSi2TLrj2m19A==
X-Received: by 10.194.233.5 with SMTP id ts5mr18203039wjc.109.1464008020362;
	Mon, 23 May 2016 05:53:40 -0700 (PDT)
Received: from sgxcmp131.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id
	n15sm27037913wjr.1.2016.05.23.05.53.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 May 2016 05:53:38 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 14:53:36 +0200
Message-Id: <1464008016-15268-1-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] kernel: Fix a typo in kernel.bbclass
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
X-List-Received-Date: Mon, 23 May 2016 12:53:41 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6e3e81e..fa0864c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -361,7 +361,7 @@ inherit cml1
 EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
-# kernel-image becomes kernel-image-${KERNEL_VERISON}
+# kernel-image becomes kernel-image-${KERNEL_VERSION}
 PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
 FILES_${PN} = ""
 FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
-- 
2.1.4


