Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30047C25B7A
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 10:49:46 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.8999.1716634168759996908
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 May 2024 03:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=mwMPkEZE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202405251049254609be2b6870ced05e-1_ytt9@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202405251049254609be2b6870ced05e
        for <openembedded-core@lists.openembedded.org>;
        Sat, 25 May 2024 12:49:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=v/TsY2KCtsHP7TFoidbXfXIjpcXCPQp7xoAQlzdaXRI=;
 b=mwMPkEZEBc0TYkcSfpJs/f8dAzgQlCIxV5sPI6Nu2XFltcB47L7fkxlqzwblaqmEyn8by8
 lJ8+snCRWXJEaE++x/1q2MlbId3sYXwABRhaGgN04rrR9A8AASJ2AJ4Owb68ueOxyoXFI0m+
 NsQ6qGWRGF4AIEaaOi9czs8gQYMwo=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 0/6] scarthgap backports
Date: Sat, 25 May 2024 12:48:32 +0200
Message-Id: <20240525104838.619254-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 10:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199872

Pick some commits from master:
* llvm updates to match meta-clang scarthgap branch
* security related (CVE, CVE_PRODUCT, version)

Note that libusb1 CVE_PRODUCT patch is not on master yet and it was
picked from abelloni/master-next branch.

Khem Raj (3):
  llvm: Upgrade to 18.1.4
  llvm: Upgrade to 18.1.5
  llvm: Switch to using release tarballs

Peter Marko (1):
  update-rc.d: add +git to PV

Ricardo Simoes (1):
  libusb1: Set CVE_PRODUCT

Soumya Sambu (1):
  ncurses: Fix CVE-2023-45918

 .../ncurses/files/CVE-2023-45918.patch        | 180 ++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.4.bb      |   1 +
 .../update-rc.d/update-rc.d_0.8.bb            |   1 +
 .../llvm/{llvm_git.bb => llvm_18.1.5.bb}      |  13 +-
 meta/recipes-support/libusb/libusb1_1.0.27.bb |   2 +
 5 files changed, 190 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-45918.patch
 rename meta/recipes-devtools/llvm/{llvm_git.bb => llvm_18.1.5.bb} (93%)

-- 
2.30.2


