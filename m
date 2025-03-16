Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E470C282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:51:23 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.32622.1742143877031228117
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZFQDgadq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202503161651139e269b27fe70045e93-manh0z@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202503161651139e269b27fe70045e93
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Mar 2025 17:51:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ouyqSSmQ0klpruXPlgiSbbVpas6jutFRATAOsLfWi4s=;
 b=ZFQDgadqeUZg2tSSfMtGTbxgwWSe7k8Hk4AVI2h2YY8pcxzQiHK4QDhC+M9XNXjBXy2A7t
 boRuuUwbk4y4ik5ua4pOIW6rVS4o5BKnJULO+Sx11leVowALqGROduK8yiNijqhB+Ppj7F9F
 +NRbqOaTr6AEp1gd4fx7NrDYNxa1xQ/Z74OK25YdxKaNf8Eb4Ogya57lN12hnfyL9eAkbb+8
 eGFtBX9HQ62pq6Kyo8KtdwD+sGRAjtRz54n/BepqzZEvQukXE5j8FYYlpr8ylqHt8FErG6Tt
 UrBhsBjlL6soRm2fUGbHGzWuSoSEUU2wVnHqnQ7ALOa2CjS11kW9X7cg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] tiff: mark CVE-2023-30774 as patched
Date: Sun, 16 Mar 2025 17:50:25 +0100
Message-Id: <20250316165025.2234714-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:51:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213049

From: Peter Marko <peter.marko@siemens.com>

[1] points tu issue [2] which was fixed by [3] together with lot of
other issues.
We already have this patch, so mark CVE-2023-30774 in it.

Also split CVE tag to separate entries.

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-30774
[2] https://gitlab.com/libtiff/libtiff/-/issues/463
[3] https://gitlab.com/libtiff/libtiff/-/merge_requests/385

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch b/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
index 17b37be041..261421b399 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
@@ -23,7 +23,9 @@ This MR will close the following issues:  #149, #150, #152, #168 (to be checked)
 
 It also fixes the old bug at http://bugzilla.maptools.org/show_bug.cgi?id=2599, for which the limitation of `NumberOfInks = SPP` was introduced, which is in my opinion not necessary and does not solve the general issue.
 
-CVE: CVE-2022-3599 CVE-2022-4645
+CVE: CVE-2022-3599
+CVE: CVE-2022-4645
+CVE: CVE-2023-30774
 Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246.patch]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>

