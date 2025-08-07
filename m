Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C3BC87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 17:18:12 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.1562.1754587082019240056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 10:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Ly4pCouX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025080717175783e9c119c8252e313a-xbipnu@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025080717175783e9c119c8252e313a
        for <openembedded-core@lists.openembedded.org>;
        Thu, 07 Aug 2025 19:17:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Q0PEmBlNR3MFMQUp8NeGRUQNBmHGkUavX/wboTNsDzo=;
 b=Ly4pCouXkZyM2qeDdf1xD8FqGSNQPqQE+JQV/KpU/4rp8aiATfYclDvq9tXrGHDLUiBxzm
 tROSpRfeO1776pqM0JNmdwsqR9eCIcwFXd6L3DbOE8iAfCFFNPlTT/M4tgQuEHktYEbW8rx8
 10ooRh94PA3YRKnlH1337fQ2u8jFhRABJdRpT1U3GwnvVWN0+E65Unr7Bwr46lwgMDkG3nOH
 bbEzwWORvLxqlIqoUAvBSom7rmQgAGCfZorBPhBVMUMGzrEABknw0C4FP7J9bZajJAGURBiq
 H1RJmezecR7mOhxOX/QvuLUXbUn6gBFhSPDCoBo4ZZnh9jCL/L9JB/TA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH v2] glibc: stable 2.41 branch updates
Date: Thu,  7 Aug 2025 19:17:02 +0200
Message-Id: <20250807171702.11890-1-peter.marko@siemens.com>
In-Reply-To: <20250730220952.14457-1-peter.marko@siemens.com>
References: <20250730220952.14457-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 17:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221569

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline 6e489c17f827317bcf8544efefa65f13b5a079dc..e7c419a2957590fb657900fc92a89708f41abd9d
e7c419a295 (origin/release/2.41/master, release/2.41/master) iconv: iconv -o should not create executable files (bug 33164)
1e16d0096d posix: Fix double-free after allocation failure in regcomp (bug 33185)

Add CVE-2025-8058 to CVE ignore list as this is (bug 33185) commit.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: fixed glibc version in commit title

 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.41.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a2cfd0f308..881a9cce2c 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "6e489c17f827317bcf8544efefa65f13b5a079dc"
+SRCREV_glibc ?= "e7c419a2957590fb657900fc92a89708f41abd9d"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.41.bb
index 7ddf7f9127..8a65e8ce9f 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-4802 CVE-2025-5702 CVE-2025-5745"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-4802 CVE-2025-5702 CVE-2025-5745 CVE-2025-8058"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

