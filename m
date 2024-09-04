Return-Path: <vrushti.dabhi@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D65CCA0ED3
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 06:34:46 +0000 (UTC)
Received: from naesa05.arrow.com (naesa05.arrow.com [216.150.161.26])
 by mx.groups.io with SMTP id smtpd.web10.43968.1725431680827479917
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 23:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=SZ7SU4vn;
 spf=pass (domain: einfochips.com, ip: 216.150.161.26, mailfrom: vrushti.dabhi@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=1693; q=dns/txt;
  s=NAESA-Selector1; t=1725431681; x=1756967681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ox4rEP1zi+RTUDZIOUaKgyFnhxH5AwYV+T3I3zOJc+c=;
  b=SZ7SU4vnt74afIIwHS4Hi2MYPxZFBvBsAlxjILYXaz5JIbEEdphmPm+g
   8FeegfQU0AX2+kF2Xda5wmNKm8bNlsn6P0MfsRYrynp8NyFWu0wB9zJ1C
   Q8bdbcuFkE/RRzMZaAV0/ebw0sTAsDNxVqLTWmtYnc/1r9egE5OO+Blao
   UYBYYeCr+CHrhGhe4CUdNb3hi561jnIi0xsRwbxr6jcegjC56wwwmBfwA
   YPY1gzugkWlAxcokr7ttsOPlsPq7lJTqkmgLr+GlvmdDKhmsEPCRZEL8i
   oU5LYLTZ2NpfQ+AWJEceAEYm1QDnOh6LjiR9YQo89U+ca+GuPx6tPjqEf
   Q==;
X-CSE-ConnectionGUID: 36A2KQkqTY2xiSxMMUL37g==
X-CSE-MsgGUID: /oj5QyR0R6G6atQspO32bQ==
X-IronPort-AV: E=Sophos;i="6.10,201,1719900000"; 
   d="scan'208";a="7174388"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 04 Sep 2024 00:34:39 -0600
Received: from AHMCPU2167.ap.corp.arrow.com ([172.25.9.210]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Wed, 4 Sep 2024 12:04:38 +0530
From: Vrushti Dabhi <vrushti.dabhi@einfochips.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Vrushti Dabhi <vrushti.dabhi@einfochips.com>
Subject: [kirkstone] [PATCH 2/2] sqlite3: Rename patch for CVE-2022-35737
Date: Wed,  4 Sep 2024 12:04:10 +0530
Message-Id: <20240904063410.2206579-2-vrushti.dabhi@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240904063410.2206579-1-vrushti.dabhi@einfochips.com>
References: <20240904063410.2206579-1-vrushti.dabhi@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Sep 2024 06:34:38.0686 (UTC) FILETIME=[842ABFE0:01DAFE94]
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 06:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204189

The patch "0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch"
fixes CVE-2022-35737.

Signed-off-by: Vrushti Dabhi <vrushti.dabhi@einfochips.com>
---
 ...-in-the-printf-implementation.patch => CVE-2022-35737.patch} | 0
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb                   | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/files/{0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch => CVE-2022-35737.patch} (100%)

diff --git a/meta/recipes-support/sqlite/files/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch b/meta/recipes-support/sqlite/files/CVE-2022-35737.patch
similarity index 100%
rename from meta/recipes-support/sqlite/files/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch
rename to meta/recipes-support/sqlite/files/CVE-2022-35737.patch
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index b3d5029365..0a7a136c53 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-           file://0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch \
+           file://CVE-2022-35737.patch \
            file://CVE-2022-46908.patch \
            file://CVE-2023-36191.patch \
            file://CVE-2023-7104.patch \
-- 
2.25.1


