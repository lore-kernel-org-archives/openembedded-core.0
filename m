Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097FFFF885D
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 12:03:42 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17274.1777205011810701718
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 05:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=WLB3Ahme;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260426120329c971408c6100020707-hhmvkz@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260426120329c971408c6100020707
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 14:03:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8AAqE8X78DjtwSfHeC/IGifFct47ZeJLltFt58E3tFA=;
 b=WLB3AhmeZzfGM4VOWXBWFwD5KNWjrvbWFJNxxYLxMfFUadbPsRc0dWQk7ZXia0NJH0kQOm
 ggZWqzocAs4n+rfUY/MV3m8hSYv7ke5LM6+uh2opY3gRNjV9ZSeF3pzeg/ag4kl451gtKG9y
 rVAdmPvsuA8b7oyZGTn+zpU4G6VXyfSEzwLn1qLqrTv0gblrlfhHQ+QA1VN8S9JbDgGCq47B
 N4w/Ybf31jQpweXwq6mAdtF3HtS6GPk3XZwyvmaBo66kj5tiD5fUXpjvzuRzJhlrUoZe6HDg
 eew1GTval2vwDbYcMBR8r+Zw4ZxFtM362NiFSfztuyhVi4YA8bkpluIg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/8] cve-extra-exclusions: ignore CVE-2019-2708
Date: Sun, 26 Apr 2026 14:02:48 +0200
Message-ID: <20260426120253.825060-3-peter.marko@siemens.com>
In-Reply-To: <20260426120253.825060-1-peter.marko@siemens.com>
References: <20260426120253.825060-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 12:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235954

From: Peter Marko <peter.marko@siemens.com>

Yet another CVE for berkeley DB, ignore as all others.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index ffbbb7bef1..0685549e00 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -49,7 +49,7 @@ CVE_STATUS_DB = "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-201
 CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 \
 CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4783 CVE-2015-4784 \
 CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
-CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
+CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2019-2708 CVE-2020-2981"
 CVE_STATUS_DB[status] = "upstream-wontfix: cpe:*:berkeley_db: Since Oracle relicensed bdb, the open source community is slowly but surely \
 replacing bdb with supported and open source friendly alternatives. As a result this CVE is unlikely to ever be fixed."
 

