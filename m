Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4277E5C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 18:32:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2019 11:32:50 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga004.jf.intel.com with ESMTP; 31 May 2019 11:32:49 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 11:32:24 -0700
Message-Id: <20190531183225.7597-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531183225.7597-1-timothy.t.orling@linux.intel.com>
References: <20190531183225.7597-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] perl-rdepends.txt: improve dependencies for perl module ptests
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
X-List-Received-Date: Fri, 31 May 2019 18:32:49 -0000
Content-Transfer-Encoding: 8bit

A number of dependencies for Test::Builder and other perl ptest
modules were missing, especially Test2::API and its like.

Fixes [YOCTO #13200]

Signel-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../perl-sanity/files/perl-rdepends.txt       | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt b/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
index 3efc3f7b34b..bff31a17411 100644
--- a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
@@ -153,6 +153,9 @@ RDEPENDS_perl-module-b-xref += "perl-module-b"
 RDEPENDS_perl-module-b-xref += "perl-module-config"
 RDEPENDS_perl-module-b-xref += "perl-module-strict"
 RDEPENDS_perl-module-bytes += "perl-module-bytes-heavy"
+RDEPENDS_perl-module-carp += "perl-module-exporter"
+RDEPENDS_perl-module-carp += "perl-module-strict"
+RDEPENDS_perl-module-carp += "perl-module-warnings"
 RDEPENDS_perl-module--charnames += "perl-module-bytes"
 RDEPENDS_perl-module-charnames += "perl-module-bytes"
 RDEPENDS_perl-module-charnames += "perl-module--charnames"
@@ -801,6 +804,7 @@ RDEPENDS_perl-module-file-stat += "perl-module-overload "
 RDEPENDS_perl-module-file-stat += "perl-module-strict"
 RDEPENDS_perl-module-file-stat += "perl-module-warnings"
 RDEPENDS_perl-module-file-stat += "perl-module-warnings-register"
+RDEPENDS_perl-module-file-temp += "perl-module-carp"
 RDEPENDS_perl-module-file-temp += "perl-module-constant"
 RDEPENDS_perl-module-file-temp += "perl-module-cwd"
 RDEPENDS_perl-module-file-temp += "perl-module-errno"
@@ -1725,6 +1729,11 @@ RDEPENDS_perl-module-safe += "perl-module-b"
 RDEPENDS_perl-module-safe += "perl-module-opcode"
 RDEPENDS_perl-module-safe += "perl-module-strict"
 RDEPENDS_perl-module-safe += "perl-module-utf8"
+RDEPENDS_perl-module-scalar-util += "perl-module-carp"
+RDEPENDS_perl-module-scalar-util += "perl-module-exporter"
+RDEPENDS_perl-module-scalar-util += "perl-module-list-util"
+RDEPENDS_perl-module-scalar-util += "perl-module-strict"
+RDEPENDS_perl-module-scalar-util += "perl-module-warnings"
 RDEPENDS_perl-module-sdbm-file += "perl-module-exporter"
 RDEPENDS_perl-module-sdbm-file += "perl-module-strict"
 RDEPENDS_perl-module-sdbm-file += "perl-module-tie-hash"
@@ -1975,8 +1984,14 @@ RDEPENDS_perl-module-test-builder += "perl-module-strict"
 RDEPENDS_perl-module-test-builder += "perl-module-scalar-util"
 RDEPENDS_perl-module-test-builder += "perl-module-test-builder-formatter"
 RDEPENDS_perl-module-test-builder += "perl-module-test-builder-tododiag"
+RDEPENDS_perl-module-test-builder += "perl-module-test2-api"
 RDEPENDS_perl-module-test-builder += "perl-module-test2-util"
 RDEPENDS_perl-module-test-builder += "perl-module-warnings"
+RDEPENDS_perl-module-test-builder-formatter += "perl-module-strict"
+RDEPENDS_perl-module-test-builder-formatter += "perl-module-test2-formatter"
+RDEPENDS_perl-module-test-builder-formatter += "perl-module-test2-formatter-tap"
+RDEPENDS_perl-module-test-builder-formatter += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test-builder-formatter += "perl-module-warnings"
 RDEPENDS_perl-module-test-builder-tester-color += "perl-module-strict"
 RDEPENDS_perl-module-test-builder-tester-color += "perl-module-test-builder-tester"
 RDEPENDS_perl-module-test-builder-tester += "perl-module-exporter"
@@ -1994,6 +2009,7 @@ RDEPENDS_perl-module-test-harness += "perl-module-tap-parser-source"
 RDEPENDS_perl-module-test-harness += "perl-module-tap-parser-sourcehandler-perl"
 RDEPENDS_perl-module-test-harness += "perl-module-text-parsewords"
 RDEPENDS_perl-module-test-harness += "perl-module-warnings"
+RDEPENDS_perl-module-test-more += "perl-module-file-temp"
 RDEPENDS_perl-module-test-more += "perl-module-strict"
 RDEPENDS_perl-module-test-more += "perl-module-test-builder-module"
 RDEPENDS_perl-module-test-more += "perl-module-warnings"
@@ -2019,6 +2035,100 @@ RDEPENDS_perl-module-test-tester += "perl-module-test-builder"
 RDEPENDS_perl-module-test-tester += "perl-module-test-tester-capturerunner"
 RDEPENDS_perl-module-test-tester += "perl-module-test-tester-delegate"
 RDEPENDS_perl-module-test-tester += "perl-module-vars"
+RDEPENDS_perl-module-test2-api += "perl-module-carp"
+RDEPENDS_perl-module-test2-api += "perl-module-exporter"
+RDEPENDS_perl-module-test2-api += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-api += "perl-module-strict"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-api-context"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-api-instance"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-api-stack"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-bail"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-diag"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-exception"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-fail"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-note"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-ok"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-plan"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-skip"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-subtest"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-waiting"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-eventfacet-trace"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-hub"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-hub-interceptor"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-hub-interceptor-terminator"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-hub-subtest"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-util-trace"
+RDEPENDS_perl-module-test2-api += "perl-module-warnings"
+RDEPENDS_perl-module-test2-api-context += "perl-module-carp"
+RDEPENDS_perl-module-test2-api-context += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-api-context += "perl-module-strict"
+RDEPENDS_perl-module-test2-api-context += "perl-module-test2-api"
+RDEPENDS_perl-module-test2-api-context += "perl-module-test2-event-v2"
+RDEPENDS_perl-module-test2-api-context += "perl-module-test2-eventfacet"
+RDEPENDS_perl-module-test2-api-context += "perl-module-test2-eventfacet-trace"
+RDEPENDS_perl-module-test2-api-context += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-api-context += "perl-module-test2-util-externalmeta"
+RDEPENDS_perl-module-test2-api-context += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-api-context += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event += "perl-module-carp"
+RDEPENDS_perl-module-test2-event += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-event += "perl-module-strict"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-about"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-amnesty"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-assert"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-control"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-error"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-hub"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-info"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-meta"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-parent"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-plan"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-trace"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-util-externalmeta"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-util-trace"
+RDEPENDS_perl-module-test2-event += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-v2 += "perl-module-carp"
+RDEPENDS_perl-module-test2-event-v2 += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-event-v2 += "perl-module-test2-util-facets2legacy"
+RDEPENDS_perl-module-test2-event-v2 += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-v2 += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-v2 += "perl-module-warnings"
+RDEPENDS_perl-module-test2-eventfacet += "perl-module-carp"
+RDEPENDS_perl-module-test2-eventfacet += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-eventfacet += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-eventfacet += "perl-module-strict"
+RDEPENDS_perl-module-test2-eventfacet += "perl-module-warnings"
+RDEPENDS_perl-module-test2-hub += "perl-module-carp"
+RDEPENDS_perl-module-test2-hub += "perl-module-list-util"
+RDEPENDS_perl-module-test2-hub += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-hub += "perl-module-strict"
+RDEPENDS_perl-module-test2-hub += "perl-module-test2-event-ok"
+RDEPENDS_perl-module-test2-hub += "perl-module-test2-event-pass"
+RDEPENDS_perl-module-test2-hub += "perl-module-test2-event-plan"
+RDEPENDS_perl-module-test2-hub += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-hub += "perl-module-test2-util-externalmeta"
+RDEPENDS_perl-module-test2-hub += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-hub += "perl-module-warnings"
+RDEPENDS_perl-module-test2-util += "perl-module-carp"
+RDEPENDS_perl-module-test2-util += "perl-module-config"
+RDEPENDS_perl-module-test2-util += "perl-module-posix"
+RDEPENDS_perl-module-test2-util += "perl-module-strict"
+RDEPENDS_perl-module-test2-util += "perl-module-warnings"
+RDEPENDS_perl-module-test2-util-facets2legacy += "perl-module-base"
+RDEPENDS_perl-module-test2-util-facets2legacy += "perl-module-carp"
+RDEPENDS_perl-module-test2-util-facets2legacy += "perl-module-exporter"
+RDEPENDS_perl-module-test2-util-facets2legacy += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-util-facets2legacy += "perl-module-strict"
+RDEPENDS_perl-module-test2-util-facets2legacy += "perl-module-warnings"
+RDEPENDS_perl-module-test2-util-hashbase += "perl-module-carp"
+RDEPENDS_perl-module-test2-util-hashbase += "perl-module-mro"
+RDEPENDS_perl-module-test2-util-hashbase += "perl-module-strict"
+RDEPENDS_perl-module-test2-util-hashbase += "perl-module-warnings"
 RDEPENDS_perl-module-text-abbrev += "perl-module-exporter"
 RDEPENDS_perl-module-text-balanced += "perl-module-exporter"
 RDEPENDS_perl-module-text-balanced += "perl-module-overload"
-- 
2.20.1


