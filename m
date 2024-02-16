Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155E9C48BF8
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 11:40:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.web10.16724.1708083641400806033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 03:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=WnARWUhg;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708083645; x=1739619645;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=D6/7z9pz7EnvNMqyE15GNucF2bUvLZCv+FkkP3yKxow=;
  b=WnARWUhgU1tKNHfEOLsDDn0AfR6RjGlG4/D4U4scWoeWH4K6u35B6bt9
   q8TDo0TGDhApUxRh/PKDJDBANLrub6pzN/FVN0gJslUbFO9oZZBRf5Kdr
   JyCRBRTmglQ1bUhCW1HNBFpZYIoiN0xxd9xLIfIalvqX4E1rQlmaTPCSE
   oV56B/rw69m7OTJ22XKUX57wp6NmOVQE9/IXNn85Vr/OOaLrGJ2rUy90s
   Fqr/7BbHLWYWFEzvdH6y2OpwUFtt+Yp6oyx+bBn7M7Wc34d3sp3Li1NgU
   JlG8LwstdLarn1/5l6Fwq0EZMFe9U4S+ahPR137itJTA3mC17w1FQBxiw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2612861"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2612861"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912349727"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="912349727"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.118.3])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:43 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] sqlite3: upgrade 3.44.2 -> 3.45.1
Date: Fri, 16 Feb 2024 19:40:29 +0800
Message-ID: <20240216114034.109257-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240216114034.109257-1-anuj.mittal@intel.com>
References: <20240216114034.109257-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195751

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sqlite/{sqlite3_3.44.2.bb => sqlite3_3.45.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.44.2.bb => sqlite3_3.45.1.bb} (62%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.44.2.bb b/meta/recipes-support/sqlite/sqlite3_3.45.1.bb
similarity index 62%
rename from meta/recipes-support/sqlite/sqlite3_3.44.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.45.1.bb
index 459884a5581..2ca8bc5bc9a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.44.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.1.bb
@@ -3,8 +3,8 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "1c6719a148bc41cf0f2bbbe3926d7ce3f5ca09d878f1246fcc20767b175bb407"
+SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI[sha256sum] = "cd9c27841b7a5932c9897651e20b86c701dd740556989b01ca596fcfa3d49a0a"
 
 CVE_STATUS[CVE-2023-36191] = "disputed: The error is a bug. It has been fixed upstream. But it is not a vulnerability"
 
-- 
2.43.2


