Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B897C5DF97
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 02:14:33 +0000 (UTC)
Received: from mta1.migadu.com (mta1.migadu.com [95.215.58.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8375.1787537670416676988
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 19:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.dev header.s=key1 header.b=W7pTJvh/;
 spf=pass (domain: linux.dev, ip: 95.215.58.176, mailfrom: junjie.cao@linux.dev)
X-Envelope-To: openembedded-core@lists.openembedded.org
DKIM-Signature: a=rsa-sha256; bh=yKvHaQWrzZ2oMcA4NwQWtggpc4zTiYnS8acqO4vTpwY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787537668; v=1; x=1788142468;
 b=W7pTJvh/ocI2qsBf0/c+P+tf6Vzp+0SWK7jJSzlR+zgMhw8PDi6/z896k5ndUZIvn9wHBHB2
 NGdVERvDWy929qs1KjlO8XXYmyOKGM1rrMyz6pKuCFY11GBCSEllnn/iqEKbZgS6ICwEXSIvOMg
 q8mh2C3Xqbu4UGa5X+zhA1r8=
X-Envelope-To: openembedded-core@lists.openembedded.org
Received: from localhost (2408:8806:52:f8ea:7c60:14c3:11bd:80b0)
	by smtp.migadu.com with ESMTPS id 8a23384b5d49c4cb;
	Mon, 24 Aug 2026 02:14:28 +0000
X-Mizu-Trace-ID: 8a23384b5d49c4cb
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev
Subject: Re: [OE-core][PATCH v3 0/9] cve-exclusions: triage nine kernel CVEs lacking upstream fix data
Date: Sun, 23 Aug 2026 23:13:22 -0500
Message-ID: <20260824041322.1455350-1-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819104351.726529-1-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev> <7b18fd3a5e6b660b9c605671da2b188b5abbf4ba.camel@pbarker.dev> <20260819104351.726529-1-junjie.cao@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 02:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244045

On Wed, 2026-08-19 at 05:43 -0500, Junjie Cao wrote:
> I've asked on the public bug 2044575 and via secalert@redhat.com for
> bug 2040604 to be opened or the affected files named, and will
> follow up here when Red Hat responds.

Red Hat PSIRT responded and named the affected code: an unvalidated
v2_ext_offset in the SMC CLC proposal parsing, which is the issue
fixed in v6.13 and tracked upstream as CVE-2024-49568. Details are on
the public bug:

  https://bugzilla.redhat.com/show_bug.cgi?id=2044575

v4 with the eight reviewed entries follows as agreed; CVE-2022-0400
comes as a separate fixed-version patch, since it is new analysis
rather than a rework of the reviewed one.

