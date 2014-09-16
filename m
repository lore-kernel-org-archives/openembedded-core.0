Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5388D7149C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 15:07:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8GF7KZq028612
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Sep 2014 08:07:20 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 16 Sep 2014 08:07:19 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 16 Sep 2014 23:06:30 +0800
Message-ID: <21ec391160434407e70d89fe334515ede221d354.1410879378.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410879378.git.kai.kang@windriver.com>
References: <cover.1410879378.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org, jslater@windriver.com
Subject: [PATCH 9/9] perf: disable libunwind support for aarch64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Sep 2014 15:07:19 -0000
Content-Type: text/plain

Disable libunwind support of perl for aarch aarch64 that libunwind
doesn't support aarch64.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-kernel/perf/perf-features.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf-features.inc b/meta/recipes-kernel/perf/perf-features.inc
index 2dbbb47..1782ae6 100644
--- a/meta/recipes-kernel/perf/perf-features.inc
+++ b/meta/recipes-kernel/perf/perf-features.inc
@@ -1,4 +1,5 @@
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui perf-libunwind"
+PERF_FEATURES_ENABLE_aarch64 ?= "perf-scripting perf-tui"
 
 def perf_feature_enabled(feature, trueval, falseval, d):
     """
-- 
1.9.1


