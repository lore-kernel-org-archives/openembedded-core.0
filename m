Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DF2CCD187
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 20:52:16 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.318.1760129531319344463
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 13:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=XdCblJQu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20251010205206d8fca611490002078c-6mwygr@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251010205206d8fca611490002078c
        for <openembedded-core@lists.openembedded.org>;
        Fri, 10 Oct 2025 22:52:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mcm8zTZCEiVxCWl3zmzYZgIx9Im/Z/yaVm+VGdOF9co=;
 b=XdCblJQucywklIzvcn2/DCQzGLJC3MiLszRqezlg+qQ5wCrL8Osxe6p7sOZJAfKxe41gzB
 5zfUOABDgwuZxZmUOMESOoRsSGb3lK5pgHgZa7P5uRMJQCuOuLRXNfO4ji6H5CqZhV5s1Wwe
 f+3gGZeu76nvfjMJ202F9E5oz/6mu9EhBF93ZbKnlRJ1RGLcM9ke3hRRyRDikpqCrG8DwnYz
 VlnKnLfyY4QjzTCFJQv6fzU/pdexct3LIyGTgc34/URhw7ts8boCj6snlQV1596iy0wM04wn
 9I5tOTYI5pz3jGuwxat5Hu3ISHJSY2cGMacc2Vzr26TeiAcW/twxyamw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 0/2] binutils: patch CVE-2025-11082 and CVE-2025-11083
Date: Fri, 10 Oct 2025 22:51:58 +0200
Message-Id: <20251010205200.1301197-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 20:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224706

This patch in on top of
https://patchwork.yoctoproject.org/project/oe-core/patch/20251010115911.3361641-1-Yash.Shinde@windriver.com/

Results of binutils-testsuite are unchanged after these patches.

Peter Marko (2):
  binutils: patch CVE-2025-11082
  binutils: patch CVE-2025-11083

 .../binutils/binutils-2.45.inc                |  2 +
 .../binutils/0016-CVE-2025-11082.patch        | 46 +++++++++++
 .../binutils/0017-CVE-2025-11083.patch        | 77 +++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-11082.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2025-11083.patch


