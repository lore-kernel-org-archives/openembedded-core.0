Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [])
 by mx.groups.io with SMTP id smtpd.web09.702.1616629634996761080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 16:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vpb5DBPb;
 spf=neutral (domain: fujitsu.com, ip: <nil>, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616629638; i=@fujitsu.com;
	bh=Iw9hS97Xe7DVWTEYQq63Cy2gfZ2F8UxzlQ4qnZpBt88=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vpb5DBPbfFrk5CI4v9F9xdeD0Zl4twx2R+frCUIAHg+2Q+ZiEY/SdDlSltwQel1fh
	 ZRjdRmzCzNeZXu16qJuecEzWtvP3R09rujRCmr7epq6M1u2kGEGcq+48ULF8wp8d2U
	 uJ4ANMP/8l9zwqwmnrf+t67RVaJlH0zgGJpQNeMm9iKoCpW6U8O6Ama/QVGR+tCIeV
	 Iqqghb5pn2fQu5cekVySh4ITORfM03G+7QQJ5qs31cYuK5URTQqHugfw9eYb9m+kFu
	 jJW8b68vnMw231M5ZexOWMoxzrOiPsoEZifpMcSNOY/KsM1pz0CvAQyk+wmTVYxaZA
	 aTOwZza6i0e+A==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 05/D4-60958-68FCB506; Wed, 24 Mar 2021 23:47:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MRott6Pjr
  B4FqfscWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnGrfyVrQTtnxcu+f2wNjPM4uhi5OIQENjNJ
  zG06ytrFyAnknGCUaNypAWKzCahJTL91AyjOwSEioCdx9Z8oSJhZQF3i0roWFhBbWMBCYsO/+
  YwgNouAqsS3Z6/B4rwCThJzN/wAGykhoCAx5eF7ZhCbU8BZYtP96SwQq5wkPvfPZISoF5Q4Of
  MJC8R8CYmDL14wQ/QqSsy+3MwCYVdJrOmYxjaBkX8WkpZZSFoWMDKtYrRIKspMzyjJTczM0TU
  0MNA1NDTSNbS00DU0NtBLrNJN0kst1S1PLS7RNdRLLC/WK67MTc5J0ctLLdnECAzGlIJjTTsY
  T77+oHeIUZKDSUmU13pDdIIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6tZ4FygkWp6akVaZk5w
  MiASUtw8CiJ8C4HSfMWFyTmFmemQ6ROMSpKifNuPAeUEABJZJTmwbXBovESo6yUMC8jAwODEE
  9BalFuZgmq/CtGcQ5GJWFeR5ApPJl5JXDTXwEtZgJavPFHJMjikkSElFQDU/XC/MjimSkyCw/
  vY/t0W+ynolimm0uc3597f+qickz6D/9/lvdFtTR+tU+M1NLSfaVV1pwpzVnuR/8uU2FOTnKo
  iJy8uu52/6ssJbEOp+jNyZ+ubryfVRE6Y7Gy+DZlv0l7mlOdWgTmrnr6c/P+6NkNq00e6+dNT
  M9T8ayNSFy1rULcf9NHjws+TKGi/D9mvK0IDJom+Hfv1PPtZ98tL2a/f8a/7VTLMoOo1wvFqs
  7+sfu14vjmQjY/9XvSd9nOHuG5svr+/I0iN99nfi04eGrq9sVZ1gsWfBTt+/vpv0/VimV+RQ0
  veSL2l+zyOX973qeTD8qmdmxmPHr+7ZpJodas+wtn8mZWK1y6vFFJ1VGJpTgj0VCLuag4EQAV
  hEzDQQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-36.tower-287.messagelabs.com!1616629637!568956!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27868 invoked from network); 24 Mar 2021 23:47:17 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-36.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2021 23:47:17 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ONlCLn013851
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 23:47:17 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Mar 2021 23:47:11 +0000
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] vte: upgrade 0.62.2 -> 0.62.3
Date: Thu, 25 Mar 2021 07:46:54 +0800
Message-ID: <1616629614-44093-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616629614-44093-1-git-send-email-wangmy@fujitsu.com>
References: <1616629614-44093-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-support/vte/{vte_0.62.2.bb => vte_0.62.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.62.2.bb => vte_0.62.3.bb} (95%)

diff --git a/meta/recipes-support/vte/vte_0.62.2.bb b/meta/recipes-support/vte/vte_0.62.3.bb
similarity index 95%
rename from meta/recipes-support/vte/vte_0.62.2.bb
rename to meta/recipes-support/vte/vte_0.62.3.bb
index a2164f43d3..8d2470cad8 100644
--- a/meta/recipes-support/vte/vte_0.62.2.bb
+++ b/meta/recipes-support/vte/vte_0.62.3.bb
@@ -20,7 +20,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "b0300bbcf0c02df5812a10a3cb8e4fff723bab92c08c97a0a90c167cf543aff0"
+SRC_URI[archive.sha256sum] = "f5770285a52cc23a3c0428a43d492b7c0ba458ce7b8a73768a7d4f1e8a7db3b4"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.25.1

