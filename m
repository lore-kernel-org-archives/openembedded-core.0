Return-Path: <michael.haener@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B2ACCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:45:06 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.120.1760474696060513327
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michael.haener@siemens.com header.s=fm2 header.b=DfP2Hixb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-664519-20251014204453f28a44e671000207cf-n5k7pd@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251014204453f28a44e671000207cf
        for <openembedded-core@lists.openembedded.org>;
        Tue, 14 Oct 2025 22:44:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=tCOlTGLwzFr621XTbwHxOMPijZla6MkMaOkstNtFulE=;
 b=DfP2HixbiyoM7ZTNEiGJcTPli31fCWEHzdOj46JrH9dXjLta2rW8YOPTbulnB1u5tmJ3pA
 EiUKf6/qMhRMNSOOM6szjRJLou7dNq7TV6/5/oQ2m69GkPdgxoKEfmUIRQjCFVDv6vPsk3L5
 P45rlq1tiveDr1wnVyZ6CSFVXtFqTtFBKBctwtJggTkDDU3etVDHtcD19jjkCeKb0p0mKTeB
 Y43zhGvXHjmuE8PSlZUu5lTrHJtPJDxXorQCAcDruzW+PbUaO3KJFlrZZJUqnTy9uOqGk8Z5
 JIYzlcYuEELl/0BrHhATTLGxlz5vIeF9zVmS5044nZszoY+J4rjVtA8g==;
From: Michael Haener <michael.haener@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Haener <michael.haener@siemens.com>,
	Ross Burton <ross.burton@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 0/1] oeqa/runtime/ping: backport fix don't bother trying to ping localhost
Date: Tue, 14 Oct 2025 22:44:40 +0200
Message-Id: <20251014204442.1344805-1-michael.haener@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 20:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224852

This backport fixes ping localhost in scarthgap for using podman.
(From OE-Core rev: a06ef43d2a50e16c32bd6edbdc7b32c3528687d5)

Ross Burton (1):
  oeqa/runtime/ping: don't bother trying to ping localhost

 meta/lib/oeqa/runtime/cases/ping.py | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.34.1


