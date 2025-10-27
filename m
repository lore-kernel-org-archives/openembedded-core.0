Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A044CCF9EF
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 20:58:14 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.2483.1761598689361432542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 13:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=SsXRQokb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20251027205805118690d5b1000207cc-xjtsio@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20251027205805118690d5b1000207cc
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Oct 2025 21:58:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=LmviUaFhJQnBfoWmPMdwOIaUhqzmYiRCc3N2CkYLVr4=;
 b=SsXRQokbZJ1Cu7w4byhljjC2EF2gNhLDWRI0fgelx2joWkMpjoZQkg6JPRMkwJ8MFyLoDR
 ZfRr+xm7wgPWi1w7ecZD6Nj5LNpa3hv2J0FOsJEKoPyYma0CdXhk4BrqhWuTyURGy32zGCBe
 qLlSPEy4vOIjCAWp0Ii7A5BS4gLq79zlQ4nDLWeIqldcm/BMasouxO+GORkmfBr51tMT/nk/
 erWuv0qcZCzhambKZjoFrJxbfQ2fdQYnjZHpggFmqBU0ohzNrL6F05VQxUhlJZ892QT7ByOZ
 PMo5lfSoeBVreWe0d6hO9Qt18teNaIjpSjmK988zwBB2SPQVeRgYc3pg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: kavinaya@qti.qualcomm.com,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/2] fitimage cleanup
Date: Mon, 27 Oct 2025 21:56:47 +0100
Message-ID: <20251027205741.2452251-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 20:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225360

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This is a small cleanup of the fitimage improvements before the release.

It requires to drop these 2 commits from master-next branch:
- kernel-fit-image: enable compatible string for kernel built-in DTBs
- oe-selftest: fitimage: test FIT image with/without kernel node

This is not sent as a v2 because the commit which need a cleanup are from
different series and this series has a different purpose: reverting an
incomplete feature rather than improving and testing it.

This also drops a commit from master branch. Discussions are here:
- https://lists.openembedded.org/g/openembedded-core/message/225191
- https://lists.yoctoproject.org/g/docs/message/7763

Adrian Freihofer (2):
  Revert "kernel-fit-image: control kernel section with FIT_LINUX_BIN"
  oe-selftest: fitimage: test absent optional nodes in ITS files

 meta/classes-recipe/kernel-fit-image.bbclass | 14 ++--
 meta/lib/oeqa/selftest/cases/fitimage.py     | 80 +++++++++++++++-----
 2 files changed, 65 insertions(+), 29 deletions(-)

-- 
2.51.0


