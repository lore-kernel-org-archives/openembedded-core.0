Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D32D32D6B
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:46 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.82431.1731403533470941677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jib5hptL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403540; x=1762939540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YMMQE4RESH2t8YZaE4L66Qxv/yAXqXqKjq020P5wMUE=;
  b=Jib5hptLgD+fx/ApNQwWi3O3TdBymbO9/ee392hSfHGleeCMDsIJ6+6x
   oEN72T4VFef56lOSFdbxuvNY6dgtdI6YePB1O7+OJANcO8LOBTAGtFH8/
   GfV3cAQTSObj+dt4o2edADMVd808H4xfLGqGtF8SJe040OEXUjqEn8IPR
   0fh87VSRQxzuxQc0xydNg54oqElHKQwycakJW0JoYmoffTSp/mp5lihsr
   q5yvSICrY9ACzw+P1TUVBEotneRhy96ATHl3a0jLkVGaWwg6ca8BpgGyZ
   tkpSE8PL2L7/DcB4brnAvsMN3JVjnPWdT2PBPma7+6Lo+PmLVhGDM+fzn
   g==;
X-CSE-ConnectionGUID: UGcfieY2TqSRz6ZS72x+fQ==
X-CSE-MsgGUID: M/hxwuOqT+e4mdQlPtQp8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180062638"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180062638"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:38 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 77887D29F1
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C664E4AE3
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A12EF6BCC2
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4DB791A000A;
	Tue, 12 Nov 2024 17:25:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 34/47] python3-packaging: upgrade 24.1 -> 24.2
Date: Tue, 12 Nov 2024 17:24:30 +0800
Message-Id: <1731403483-21399-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--14.385800-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrSLyuC617NWkxS15ZQ8SWU9v9
	Yxcv46SLN2sidPm7TK/hXLS/BKAPcJT6aKfZ6tn9qoeab9Xgz88CtGYG0znilOjMOEZ5AL0SRbN
	5XR1zwhx3xxz0Xodf3ybsEvLvj/qQvJ+06XVEG4fjB2htmJXMOGl5nVxdmJvHbySxTHGUOe8wFu
	W3vOCUwVJnfVABlsCtDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZcFfXzPlfY7e1PWu
	s3yxQNW7LPa//3cO7cGFBbDeVn4hbT5k413CvlTngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIfiAq
	rjYtFiQABRHRGY5fkN5E35Tvw8O4n/4pQvtIDp0shvYPa063wX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207021

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- The source is auto-formatted with ruff, not black
- Bump the github-actions group across 1 directory with 3 updates
- Apply ruff rules (RUF)
- Fix typo in Version __str__
- Bump the github-actions group with 3 updates
- Get rid of duplicate test cases
- Fix doc for canonicalize_version and a typo in a docstring
- docs: public/base_version comparison
- Apply ruff/bugbear rules (B)
- Apply ruff/pyupgrade rules (UP)
- Add a changelog entry for dropping Python 3.7 support
- Patch python_full_version unconditionally
- Refactor canonicalize_version
- Allow creating a SpecifierSet from a list of specifiers
- Fix uninformative error message
- Fix prerelease detection for > and <
- Bump the github-actions group across 1 directory with 4 updates
- Add support for PEP 730 iOS tags.
- Update the changelog to reflect 24.1 changes
- Mention updating changelog in release process
- Add a comment as to why Metadata.name isn't normalized
- Use !r formatter for error messages with filenames.
- PEP 639: Implement License-Expression and License-File
- Bump the github-actions group with 4 updates
- Upgrade to latest mypy
- Extraneous quotes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-packaging_24.1.bb => python3-packaging_24.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_24.1.bb => python3-packaging_24.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-packaging_24.1.bb b/meta/recipes-devtools/python/python3-packaging_24.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-packaging_24.1.bb
rename to meta/recipes-devtools/python/python3-packaging_24.2.bb
index 6986880ac5..97c9ac5241 100644
--- a/meta/recipes-devtools/python/python3-packaging_24.1.bb
+++ b/meta/recipes-devtools/python/python3-packaging_24.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "026ed72c8ed3fcce5bf8950572258698927fd1dbda10a5e981cdf0ac37f4f002"
+SRC_URI[sha256sum] = "c228a6dc5e932d346bc5739379109d49e8853dd8223571c7c5b55260edc0b97f"
 
 SRC_URI += "file://run-ptest.in"
 
-- 
2.34.1


