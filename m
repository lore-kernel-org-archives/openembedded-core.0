Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 00FB277142
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 19:56:26 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id x5so4852292obg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 11:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Zyffg7TQO2VtdM4alOsPijocbFxZVtGQ93g6RdITj3o=;
	b=DEIqDJ6NqCxbk/qrrJXbORseUXI/4BhD4k98GcMheNOdKzv5KTNJgxSN5C406GnRj0
	bgmdeqDJuqHq+gGzM+zkSaE/v9jHBG8pu0SzuSd4rfKJUcmtf4fgbd9VVbQXihMNJ3Ic
	kAM/nc1lqFPevi2tuyy5W8h0xNpswAbRq+JayOezdVK75uhOrl/yQ2bkSCmbAgmBKmwI
	yVsUEXS1NcpdHk0jCYPkW2n2oRNXed5JCLxkrdEYO1mIQiSuAr/v6xnCCzyrpcOedJQM
	Cvu92XwPxSE1NJCilRdHuG+190TB3J5q+CtdztAF0Rz6ykPzKphuUkMpbYnwdywuSfmV
	W2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Zyffg7TQO2VtdM4alOsPijocbFxZVtGQ93g6RdITj3o=;
	b=ftEtu7roUSSrXRkAF7HNfsWlPB+xWlzBs2VkazuF+Me30wL5bxkeiSiqTZDR7ILAOi
	vQm8mfsbrY6c8MrFxhkd+XF+KV+6sj2axwmXZDjxxI3PyScdthdEp3sbsSEOrTDfHsYf
	msWhdsRv29rO1/JHE4X1CZBKSxIs7ZBYWYXSoeu7w4i7mbYQc3MWDqzSoUuZJpsCZvxP
	MGYyF6RnFC8ub440L9y+jI1z6xJ/og7f/p3P58vccpxy87F0iQiIjkF1qjqO8lac1L8m
	e+K8x+l+CXQhZfaisEZQ/S1PAh8tDdFt0IGvQz5DKHcxXNvl4qlSKwjs5bPeaHcNn+9U
	fe9w==
X-Gm-Message-State: AG10YOTdoSmuMFykAKsCe/9P2zGlYpGa/t1efoUyKbOsgJ1qYKUgFmv4NjTaQDFtPS4KDA==
X-Received: by 10.182.120.40 with SMTP id kz8mr13813129obb.24.1454702187019;
	Fri, 05 Feb 2016 11:56:27 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	f9sm10046151obw.13.2016.02.05.11.56.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 11:56:25 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 11:56:15 -0800
Message-Id: <1454702179-30239-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] gmp: misc reformatting + fix gmp_4.2.1 for MIPS
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
X-List-Received-Date: Fri, 05 Feb 2016 19:56:28 -0000

Andre McCurdy (4):
  gmp: move SRC_URI out of gmp.inc + minor reformatting
  gmp: move BBCLASSEXTEND = "native nativesdk" from gmp.inc into 6.1.0 recipe
  gmp.inc: limit ARM_INSTRUCTION_SET over-rides to armv4/armv5
  gmp_4.2.1: fix build for MIPS

 .../avoid-h-asm-constraint-for-MIPS.patch          | 57 ++++++++++++++++++++++
 meta/recipes-support/gmp/gmp.inc                   | 12 ++---
 meta/recipes-support/gmp/gmp_4.2.1.bb              |  8 +--
 meta/recipes-support/gmp/gmp_6.1.0.bb              |  5 +-
 4 files changed, 70 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/avoid-h-asm-constraint-for-MIPS.patch

-- 
1.9.1


