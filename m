Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DEFF8922D
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20402.1776765412223009380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ib7hNKTD;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765422; x=1808301422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3IbbJ8DMDp4kZn0P7qTbBPmwVUEc7jA4km+T2dFl6Dw=;
  b=ib7hNKTDoIHRLRmD4CDMK+0anKrQ/CsrIpYF1WA73AiGTxK8OQYlhDYl
   lx2JYn0ADM2MKms9yXrzqphjC8AkC8MwOWaI3lW8LDQTMyr5Asf1xy9UG
   QHOmKyf50B82lCA7MrnQNwZkC3QbVk10bKGzbuVcFf/x0YTDC2Ti2BBMp
   C+QahTfy+39ZSQlC7IgeCIbJD/+EZENXQvOkXZsTRPuxSlj+GuhPLm1fx
   v6QkbCB+H7/KR+RUcVA8++QY3z/a0jISMPT8XYlq9inH3/BPvkOB+WFGb
   LGcxqtBlXuhctFbQcOdY6iGwXED/6kA9GAOPGb0VEKZB3uxWY5g537xYK
   g==;
X-CSE-ConnectionGUID: QJROALr2Rl+z1/XpdVnuIg==
X-CSE-MsgGUID: GdrFN5ZBShOtCkeCEyokFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="216474330"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="216474330"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:01 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1114542A335
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:02 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B0128C00569
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 320A9140027F;
	Tue, 21 Apr 2026 09:56:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/49] python3-poetry-core: upgrade 2.3.1 -> 2.3.2
Date: Tue, 21 Apr 2026 17:55:41 +0800
Message-ID: <20260421095559.1856-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235639

From: Wang Mingyu <wangmy@fujitsu.com>

Changed
========
- Update list of supported licenses (#917).

Fixed
======
- Fix an issue where platform_release could not be parsed on Debian Trixie
- Fix an issue where using project.readme.text in the pyproject.toml file
  resulted in broken metadata
- Fix an issue where dependency groups were considered equal when their
  resolved dependencies were equal, even if the groups themselves were not
- Fix an issue where removing a dependency from a group that included another
  group resulted in other dependencies being added to the included group
- Fix an issue where PEP 735 include-group entries were lost when
  [tool.poetry.group] also defined include-groups for the same group
- Fix an issue where the union of <value> not in <marker> constraints was
  wrongly treated as always satisfied
- Fix an issue where a post release with a local version identifier was wrongly
  allowed by a > version constraint
- Fix an issue where a version with the local version identifier 0 was treated
  as equal to the corresponding public version
- Fix an issue where a != <version> constraint wrongly disallowed pre releases
  and post releases of the specified version
- Fix an issue where in and not in constraints were wrongly not allowed by
  specific compound constraints
- Fix an issue where data entries in generated setup.py files were duplicated

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-poetry-core_2.3.1.bb => python3-poetry-core_2.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.3.1.bb => python3-poetry-core_2.3.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb b/meta/recipes-devtools/python/python3-poetry-core_2.3.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.3.2.bb
index 705e08d98b..0f55368d13 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.3.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.3.2.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "96f791d5d7d4e040f3983d76779425cf9532690e2756a24fd5ca0f86af19ef82"
+SRC_URI[sha256sum] = "20cb71be27b774628da9f384effd9183dfceb53bcef84063248a8672aa47031f"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


