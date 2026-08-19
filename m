Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FD3C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 08:45:03 +0000 (UTC)
Received: from mta0.migadu.com (mta0.migadu.com [91.218.175.87])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2665.1787129102584066548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 01:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.dev header.s=key1 header.b=bURNlRHQ;
 spf=pass (domain: linux.dev, ip: 91.218.175.87, mailfrom: junjie.cao@linux.dev)
X-Envelope-To: openembedded-core@lists.openembedded.org
DKIM-Signature: a=rsa-sha256; bh=HqRPyODAfrbxoxJd3+Tti8xCYzej63GDQb9n+RQzEQs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787129100; v=1; x=1787733900;
 b=bURNlRHQG6d9ORxmaoxG667+4AaxisnZFlM7vPucpPCtYn8/Kduj7D1oTpmhjXvVDeXA1GF/
 Pk3FGqRRe43/6KYW6ISZ+fNTuoKMYHEgzxvXh8Cw+rAS3B9GGYL6cKWbyVPtdNj+Ju3ciD9xhbn
 UTSrVWEqenK9rIJXy3N9qBag=
X-Envelope-To: openembedded-core@lists.openembedded.org
Received: from localhost (2408:84e1:427:6962:81e3:968b:f0b:7219)
	by smtp.migadu.com with ESMTPS id dbb15b9d93312f80;
	Wed, 19 Aug 2026 08:45:00 +0000
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v3 0/9] cve-exclusions: triage nine kernel CVEs lacking upstream fix data
Date: Wed, 19 Aug 2026 05:43:51 -0500
Message-ID: <20260819104351.726529-1-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7b18fd3a5e6b660b9c605671da2b188b5abbf4ba.camel@pbarker.dev>
References: <7b18fd3a5e6b660b9c605671da2b188b5abbf4ba.camel@pbarker.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243718

> I have spent some time validating the status of all the issues and I
> think we're nearly there. I've suggested changes to the commit
> messages, comments and CVE_STATUS wordings, with those addressed I
> think 8/9 of these will be ready to merge.

Will send v4 with those eight using your wordings, with one deviation:
for CVE-2023-6238 the fix was backed out by the nvme maintainer rather
than withdrawn by its author, so the status reads "Proposed fix was not
merged" to match the comment above it.

> CVE-2022-0400 still bothers me. There was clearly something reported,
> there's a non-public Red Hat bugzilla entry referenced by Debian [1].
> It looks like it was closed by Red Hat, SUSE and Debian as they don't
> build the affected code, not because it was an invalid report. We
> should ask Red Hat to release more details.

Agreed - dropped from v4; with no CVE_STATUS entry it stays visible as
Unpatched in cve-check reports. I've asked on the public bug 2044575
and via secalert@redhat.com for bug 2040604 to be opened or the
affected files named, and will follow up here when Red Hat responds.

All other comments will be addressed in v4 as suggested.

Thanks a lot for your time and help.

