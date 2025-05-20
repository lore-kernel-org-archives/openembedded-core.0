Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734E2C54E90
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 20:22:04 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.1106.1747772520386310440
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 13:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bWkoyNDg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250520202158cde83d4f2b54cecbab-vvofpi@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250520202158cde83d4f2b54cecbab
        for <openembedded-core@lists.openembedded.org>;
        Tue, 20 May 2025 22:21:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=SXci/0W8ZsqBZyaA7aas6edhRsx5v81uryOF6Ni15B8=;
 b=bWkoyNDgyCgYsbf744XoJYQxwD+EuSc0OvrUVZGbQz8jngpxyUO841twSs34r79cT+c5JQ
 s5/BELDcIrK9WfEShurZ47/90Bow9rvlL9W+PBqoR7VhkUIaeFVNuOYI7WOY8UNJvI3JjhVa
 2pruP7ZmfX1i10fuhxePqA5X55rB07zh9vxyb2aafu+P2PtQ/3xbpeMyIYPOBUew4DxD9/wK
 JCrgChbe18HcH5+3zISDIcvoAm56dwDo1HnEsnWs4ZIw7msbcQNNOGcpxQZP7jDJo/Bw5r9O
 2OkuRVkno03+xCB61WsrGtN3JIasEMxQLYl8jcvgusnGY4HEMEv5j5Qw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][walnascar][PATCH 5/8] libarchive: upgrade 3.7.8 -> 3.7.9
Date: Tue, 20 May 2025 22:20:30 +0200
Message-Id: <20250520202033.2352749-5-peter.marko@siemens.com>
In-Reply-To: <20250520202033.2352749-1-peter.marko@siemens.com>
References: <20250520202033.2352749-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 20:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216947

From: Peter Marko <peter.marko@siemens.com>

https://github.com/libarchive/libarchive/releases/tag/v3.7.9

Libarchive 3.7.9 is a bugfix release
Important bugfixes:
* a regression in libarchive 3.7.8 regarding GNU sparse entries was fixed (#2558)

Also remove CVE_STATUS which was obsolete already before this upgrade.

(From OE-Core rev: 670f3fa028f3e873acf4c5265d3f5e4a3aa0ec89)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libarchive/{libarchive_3.7.8.bb => libarchive_3.7.9.bb}   | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.8.bb => libarchive_3.7.9.bb} (91%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.8.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
similarity index 91%
rename from meta/recipes-extended/libarchive/libarchive_3.7.8.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index d78b38d3e9..9d134f7d38 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.8.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -33,9 +33,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "a123d87b1bd8adb19e8c187da17ae2d957c7f9596e741b929e6b9ceefea5ad0f"
-
-CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
+SRC_URI[sha256sum] = "aa90732c5a6bdda52fda2ad468ac98d75be981c15dde263d7b5cf6af66fd009f"
 
 inherit autotools update-alternatives pkgconfig
 

