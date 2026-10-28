Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7272.1793221928942108055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 14:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=ZfAAEMpJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20261028211205e2bf1d29e30002077a-k6aqlo@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261028211205e2bf1d29e30002077a
        for <openembedded-core@lists.openembedded.org>;
        Wed, 28 Oct 2026 22:12:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JpGskFvqcvL4o15KzFzQv40l9xyNRLLczEipSNsB/G8=;
 b=ZfAAEMpJ1b0Hpr/v0ilIk+E9bTpkeye/e17c2QHemqbu3oAu5WvxEJLHsxJFu5+cMwTDGX
 aZkttuVlQ1dBlq1M7JBl0ZEvVGmrZKYdDAJSOXu/NwO6cQRTt+2LJB8NJIakiLliauVJlWYg
 +6033O/h9TQ+BSJaXcNib3vS5Y4YW08JAJJYo38gh48F2CrOmXhZtxlrAD1NwjKVG3cLRP3O
 ndvvxCThL3c36xCURmQgyfFuDaqxSsEpBTcpvP9wcPjPEzIxDs6iAbqA3nsmIZGu+uXQdmTl
 OYBI4C2PRNM/k3vEKv51zE6OhubCIk9sGtefzX7xlIJJSe05xXU+idxQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/3] oeqa/utils/commands: add get_bb_vars_flags and build get_bb_var(s) on it
Date: Wed, 28 Oct 2026 22:11:22 +0100
Message-ID: <20261028211203.3081460-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 21:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248832
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add a new get_bb_vars_flags API to read variables and flags in tests, and
re-implement get_bb_vars and get_bb_var on top of it for more robust code.

It replaces the synthetic FIT_LOADABLE_* variables, which
kernel-fit-image.bbclass only set to make the flags visible to the
fitimage selftest.
