Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F06CA5FF5
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 20:31:07 +0000 (UTC)
Received: from imap6.mcr3.codethink.co.uk (imap6.mcr3.codethink.co.uk [46.37.160.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27821.1791226773277036409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 11:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@codethink.co.uk header.s=imap6-20260915 header.b=P3jsv7p+;
 spf=pass (domain: codethink.co.uk, ip: 46.37.160.117, mailfrom: marcel.ziswiler@codethink.co.uk)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap6-20260915; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=CdaDYOS5HFEs3YGqF/46LykFt4n8VzLSMIMN7q0iOM0=; b=P3jsv7p+wFuzTy
	bPFbGAhF80ZREnvQeBfKDxE1DciWcofR0MHIyW9CXupkPCdMFdiZc4IkRfs7MpgaianIP8gknKQs7
	AZuBM4s2/gmSKW2rt7eaCJEgtOwo6E/YTkCQQILTNh54SIdL7EReB0YHjAlAWToKR0nxzkUh2cXKZ
	5LdyK8lzXJnj+Nr7D6FK3uCqHbizJB7vxAzCk80H+c3BG424+6FDv9VqM82wrfSaF+i64PV2fqRMK
	ppGayCIuxE2lqQw6IwaeX/5HjxRmhwx9QCUyoIeZ5aqvZwsVqEX/zsVu66eeHeIKMcRcWCUXOT3q2
	5hz2xxbfnwOy0RnjfaTQ==;
Received: from [10.17.2.146] (helo=toolbx.v.cablecom.net)
	by imap6.mcr3.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1xDnYI-00Fdbr-3w; Mon, 05 Oct 2026 19:36:42 +0100
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Subject: [PATCH 0/2] mesa 26.2.4 upgrade and gallivm llvm 23 build fix
Date: Mon,  5 Oct 2026 20:36:25 +0200
Message-ID: <cover.1791224526.git.marcel.ziswiler@codethink.co.uk>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Sender: marcel.ziswiler@codethink.co.uk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 20:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247259

This series upgrades mesa to 26.2.4 and fixes a gallivm llvm 23 build issue.

Build tested on x86_64 and run tested on LicheePi 4A.

Marcel Ziswiler (2):
  mesa,mesa-tools-native: upgrade 26.2.3 -> 26.2.4
  mesa: gallivm llvm 23 build fix

 ...uiltin_cpu_supports-for-avx2-detecti.patch |  2 +-
 ...on-t-encode-build-path-into-binaries.patch |  2 +-
 ...gallivm-adapt-for-JITLink-in-LLVM-23.patch | 51 +++++++++++++++++++
 ...sdetects-64bit-atomics-on-mips-clang.patch |  2 +-
 ...er-jay-jay_ir.h-do-not-used-typed-en.patch |  2 +-
 ...c-do-not-use-arm-fpu-instructions-if.patch |  2 +-
 meta/recipes-graphics/mesa/mesa.inc           |  5 +-
 7 files changed, 59 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-23.patch

-- 
2.53.0


