Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB50CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:51:47 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.17146.1758289903750850697
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=ElTcYJs3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20250919135140bf0851aefd00020713-03u0_d@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250919135140bf0851aefd00020713
        for <openembedded-core@lists.openembedded.org>;
        Fri, 19 Sep 2025 15:51:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=bzClGUK3fjOAjpQO7loxYeOwB4EcwTvEFMgjkjatBSY=;
 b=ElTcYJs3ZacDR+FD5X/ru6lQtWiYTKzoD1udOtUrH/HuFzT0m04uEr/iYEM8L0uYmQo6Jc
 Mp/GAspQV+mcTYiyF7d/CEepL7J7so8vAxqoWpLgBjCcjF5sbSiVGOt8Ue9wQYDEAiY7ZUJk
 7wRWHF7LwwtiqRWxqXsfblxCKU0E5VoG8+G2WbsYvrq9+T1TLiwLDajjFSc+FgejITBFv3R5
 29kDYCNhtABA/7jw0cdO3tTk/SBWIhU8bVVsPtlM21W2Qqey5hfPq9zKAOJ69izFlfmvUV4t
 eRx/8KZESw3nm4Yue/C2UWM50is7p/MTaeIIEB/QTOyfX7EJb05oSVBQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [scarthgap][PATCH 0/2] llvm: update to 18.1.8 and fix build with gcc-15
Date: Fri, 19 Sep 2025 15:50:05 +0200
Message-ID: <20250919135123.4177466-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 13:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223753

From: Adrian Freihofer <adrian.freihofer@siemens.com>

- Update llvm from 18.1.6 to 18.1.8 (latest update in the 18.1 series)
- Fix build with gcc-15 by adding missing includes of <cstdint> using patches
  from meta-clang.

Adrian Freihofer (2):
  llvm: update from 18.1.6 to 18.1.8
  llvm: fix build with gcc-15

 ...36-Add-cstdint-to-SmallVector-101761.patch | 28 ++++++++++++++++
 ...cstdint-in-AMDGPUMCTargetDesc-101766.patch | 23 +++++++++++++
 ...-include-to-X86MCTargetDesc.h-123320.patch | 32 +++++++++++++++++++
 .../llvm/{llvm_18.1.6.bb => llvm_18.1.8.bb}   |  5 ++-
 4 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0036-Add-cstdint-to-SmallVector-101761.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch
 rename meta/recipes-devtools/llvm/{llvm_18.1.6.bb => llvm_18.1.8.bb} (94%)

-- 
2.51.0


