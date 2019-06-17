Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 3ACC17E865
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 22:12:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jun 2019 15:12:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,386,1557212400"; d="scan'208";a="185891250"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2019 15:12:02 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 15:11:40 -0700
Message-Id: <7653dc666b59b345d3b42d3c70379dbfac626ea1.1560809373.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1560809373.git.timothy.t.orling@linux.intel.com>
References: <cover.1560809373.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] perl-rdepends.txt: more ptest dependencies fixes
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
X-List-Received-Date: Mon, 17 Jun 2019 22:12:02 -0000
Content-Transfer-Encoding: 8bit

* File::Spec::Unix runtime depends on Cwd and constant
* Module::Metadata runtime depends on version
* CPAN::Meta runtime depends on Parse::CPAN::Meta and JSON::PP
* ExtUtils::MakeMaker runtime depends on ExtUtils::MM_Unix
* TAP::Base runtime depends on TAP::Object
* TAP::Parser::SourceHandler::Perl runtime depends on
  TAP::Parser::SourceHandler::Executable
* TAP::Harness runtime depends on TAP::Formatter::File
* TAP::Formatter::File runtime depends on TAP::Formatter::Session
  and TAP::Formatter::Base
* Many TAP::Harness::* dependencies
* POD::Simple::Transcode runtime depends on POD::Simple::Transcode{dumb,smart}

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../perl-sanity/files/perl-rdepends.txt       | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt b/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
index 8d3e513ec5c..331a44d3088 100644
--- a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
@@ -451,6 +451,7 @@ RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-ipc-cmd"
 RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-strict"
 RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-text-parsewords"
 RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder += "perl-module-extutils-cbuilder-base"
 RDEPENDS_perl-module-extutils-cbuilder += "perl-module-file-basename"
 RDEPENDS_perl-module-extutils-cbuilder += "perl-module-file-path"
 RDEPENDS_perl-module-extutils-cbuilder += "perl-module-strict"
@@ -797,6 +798,8 @@ RDEPENDS_perl-module-file-path += "perl-module-exporter"
 RDEPENDS_perl-module-file-path += "perl-module-file-basename"
 RDEPENDS_perl-module-file-path += "perl-module-strict"
 RDEPENDS_perl-module-file-path += "perl-module-vars"
+RDEPENDS_perl-module-file-spec += "perl-module-constant"
+RDEPENDS_perl-module-file-spec += "perl-module-cwd"
 RDEPENDS_perl-module-file-spec += "perl-module-strict"
 RDEPENDS_perl-module-file-spec += "perl-module-file-spec-unix"
 RDEPENDS_perl-module-file-stat += "perl-module-class-struct"
@@ -1358,6 +1361,7 @@ RDEPENDS_perl-module-math-complex += "perl-module-warnings"
 RDEPENDS_perl-module-math-trig += "perl-module-exporter"
 RDEPENDS_perl-module-math-trig += "perl-module-math-complex"
 RDEPENDS_perl-module-math-trig += "perl-module-strict"
+RDEPENDS_perl-module-metadata += "perl-module-version"
 RDEPENDS_perl-module-memoize-anydbm-file += "perl-module-vars"
 RDEPENDS_perl-module-memoize += "perl-module-config"
 RDEPENDS_perl-module-memoize += "perl-module-exporter"
@@ -1784,6 +1788,7 @@ RDEPENDS_perl-module-sys-syslog += "perl-module-xsloader"
 RDEPENDS_perl-module-tap-base += "perl-module-base"
 RDEPENDS_perl-module-tap-base += "perl-module-constant"
 RDEPENDS_perl-module-tap-base += "perl-module-strict"
+RDEPENDS_perl-module-tap-base += "perl-module-tap-object"
 RDEPENDS_perl-module-tap-base += "perl-module-warnings"
 RDEPENDS_perl-module-tap-formatter-base += "perl-module-base"
 RDEPENDS_perl-module-tap-formatter-base += "perl-module-posix"
@@ -1823,39 +1828,50 @@ RDEPENDS_perl-module-tap-harness-env += "perl-module-tap-object"
 RDEPENDS_perl-module-tap-harness-env += "perl-module-text-parsewords"
 RDEPENDS_perl-module-tap-harness-env += "perl-module-warnings"
 RDEPENDS_perl-module-tap-harness += "perl-module-base"
+RDEPENDS_perl-module-tap-harness += "perl-module-carp"
 RDEPENDS_perl-module-tap-harness += "perl-module-file-path"
+RDEPENDS_perl-module-tap-harness += "perl-module-file-spec"
 RDEPENDS_perl-module-tap-harness += "perl-module-io-handle"
 RDEPENDS_perl-module-tap-harness += "perl-module-strict"
+RDEPENDS_perl-module-tap-harness += "perl-module-tap-base"
 RDEPENDS_perl-module-tap-harness += "perl-module-warnings"
 RDEPENDS_perl-module-tap-object += "perl-module-strict"
 RDEPENDS_perl-module-tap-object += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-aggregator += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-aggregator += "perl-module-benchmark"
 RDEPENDS_perl-module-tap-parser-aggregator += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-aggregator += "perl-module-tap-object"
 RDEPENDS_perl-module-tap-parser-aggregator += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-grammar += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-grammar += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-grammar += "perl-module-tap-object"
 RDEPENDS_perl-module-tap-parser-grammar += "perl-module-tap-parser-resultfactory"
 RDEPENDS_perl-module-tap-parser-grammar += "perl-module-tap-parser-yamlish-reader"
 RDEPENDS_perl-module-tap-parser-grammar += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-iterator-array += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-iterator-array += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iterator-array += "perl-module-tap-parser-iterator"
 RDEPENDS_perl-module-tap-parser-iterator-array += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-carp"
 RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-constant"
 RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-file-basename"
 RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-tap-object"
 RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-iterator += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-iterator += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iterator += "perl-module-tap-object"
 RDEPENDS_perl-module-tap-parser-iterator += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-config"
 RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-io-handle"
 RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-tap-parser-iterator"
 RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-iterator-stream += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-iterator-stream += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iterator-stream += "perl-module-tap-parser-iterator"
 RDEPENDS_perl-module-tap-parser-iterator-stream += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-constant"
@@ -1863,6 +1879,7 @@ RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-io-select"
 RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-strict"
 RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser += "perl-module-base"
+RDEPENDS_perl-module-tap-parser += "perl-module-carp"
 RDEPENDS_perl-module-tap-parser += "perl-module-strict"
 RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-grammar"
 RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-iterator"
@@ -1878,12 +1895,15 @@ RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-sourcehandler-rawtap"
 RDEPENDS_perl-module-tap-parser += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-result-bailout += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-result-bailout += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-bailout += "perl-module-tap-parser-result"
 RDEPENDS_perl-module-tap-parser-result-bailout += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-result-comment += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-result-comment += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-comment += "perl-module-tap-parser-result"
 RDEPENDS_perl-module-tap-parser-result-comment += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-object"
 RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-bailout"
 RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-comment"
 RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-plan"
@@ -1895,31 +1915,41 @@ RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-
 RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-result += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-result += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result += "perl-module-tap-object"
 RDEPENDS_perl-module-tap-parser-result += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-result-plan += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-result-plan += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-plan += "perl-module-tap-parser-result"
 RDEPENDS_perl-module-tap-parser-result-plan += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-result-pragma += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-result-pragma += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-pragma += "perl-module-tap-parser-result"
 RDEPENDS_perl-module-tap-parser-result-pragma += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-result-test += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-result-test += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-test += "perl-module-tap-parser-result"
 RDEPENDS_perl-module-tap-parser-result-test += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-result-unknown += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-result-unknown += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-unknown += "perl-module-tap-parser-result"
 RDEPENDS_perl-module-tap-parser-result-unknown += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-result-version += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-result-version += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-version += "perl-module-tap-parser-result"
 RDEPENDS_perl-module-tap-parser-result-version += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-result-yaml += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-result-yaml += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-yaml += "perl-module-tap-parser-result"
 RDEPENDS_perl-module-tap-parser-result-yaml += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-scheduler-job += "perl-module-carp"
 RDEPENDS_perl-module-tap-parser-scheduler-job += "perl-module-strict"
 RDEPENDS_perl-module-tap-parser-scheduler-job += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-scheduler += "perl-module-carp"
 RDEPENDS_perl-module-tap-parser-scheduler += "perl-module-strict"
 RDEPENDS_perl-module-tap-parser-scheduler += "perl-module-tap-parser-scheduler-job"
 RDEPENDS_perl-module-tap-parser-scheduler += "perl-module-tap-parser-scheduler-spinner"
 RDEPENDS_perl-module-tap-parser-scheduler += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-scheduler-spinner += "perl-module-carp"
 RDEPENDS_perl-module-tap-parser-scheduler-spinner += "perl-module-strict"
 RDEPENDS_perl-module-tap-parser-scheduler-spinner += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-base"
@@ -1927,18 +1957,21 @@ RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-constan
 RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-strict"
 RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-tap-parser-iteratorfactory"
 RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-tap-parser-iterator-process"
+RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-tap-parser-sourcehandler"
 RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-constant"
 RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-strict"
 RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-tap-parser-iteratorfactory"
 RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-tap-parser-iterator-stream"
+RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-tap-parser-sourcehandler"
 RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-constant"
 RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-strict"
 RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-tap-parser-iteratorfactory"
 RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-tap-parser-iterator-stream"
+RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-tap-parser-sourcehandler"
 RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-sourcehandler += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-sourcehandler += "perl-module-strict"
@@ -1950,23 +1983,28 @@ RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-constant"
 RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-strict"
 RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-tap-parser-iteratorfactory"
 RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-tap-parser-iterator-process"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-tap-parser-sourcehandler-executable"
 RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-text-parsewords"
 RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-strict"
 RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-tap-parser-iterator-array"
 RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-tap-parser-iteratorfactory"
+RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-tap-parser-sourcehandler"
 RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-source += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-source += "perl-module-constant"
 RDEPENDS_perl-module-tap-parser-source += "perl-module-file-basename"
 RDEPENDS_perl-module-tap-parser-source += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-source += "perl-module-tap-object"
 RDEPENDS_perl-module-tap-parser-source += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-yamlish-reader += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-yamlish-reader += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-yamlish-reader += "perl-module-tap-object"
 RDEPENDS_perl-module-tap-parser-yamlish-reader += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-yamlish-writer += "perl-module-base"
 RDEPENDS_perl-module-tap-parser-yamlish-writer += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-yamlish-writer += "perl-module-tap-object"
 RDEPENDS_perl-module-tap-parser-yamlish-writer += "perl-module-warnings"
 RDEPENDS_perl-module-term-ansicolor += "perl-module-exporter"
 RDEPENDS_perl-module-term-ansicolor += "perl-module-strict"
@@ -2491,9 +2529,11 @@ RDEPENDS_perl-module-cpan += "perl-module-file-copy"
 RDEPENDS_perl-module-cpan += "perl-module-file-find"
 RDEPENDS_perl-module-cpan += "perl-module-filehandle"
 RDEPENDS_perl-module-cpan += "perl-module-file-path"
+RDEPENDS_perl-module-cpan += "perl-module-json-pp"
 RDEPENDS_perl-module-cpan += "perl-module-lib"
 RDEPENDS_perl-module-cpan += "perl-module-net-ping"
 RDEPENDS_perl-module-cpan += "perl-module-overload"
+RDEPENDS_perl-module-cpan += "perl-module-parse-cpan-meta"
 RDEPENDS_perl-module-cpan += "perl-module-posix"
 RDEPENDS_perl-module-cpan += "perl-module-safe"
 RDEPENDS_perl-module-cpan += "perl-module-strict"
@@ -2845,6 +2885,7 @@ RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-makemaker-confi
 RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-makemaker-version"
 RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-manifest"
 RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-mm"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-mm-unix"
 RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-my"
 RDEPENDS_perl-module-extutils-makemaker += "perl-module-file-path"
 RDEPENDS_perl-module-extutils-makemaker += "perl-module-strict"
@@ -3945,6 +3986,8 @@ RDEPENDS_perl-module-pod-simple-tiedoutfh += "perl-module-vars"
 RDEPENDS_perl-module-pod-simple-transcodedumb += "perl-module-strict"
 RDEPENDS_perl-module-pod-simple-transcodedumb += "perl-module-vars"
 RDEPENDS_perl-module-pod-simple-transcode += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-transcode += "perl-module-pod-simple-transcodedumb"
+RDEPENDS_perl-module-pod-simple-transcode += "perl-module-pod-simple-transcodesmart"
 RDEPENDS_perl-module-pod-simple-transcode += "perl-module-vars"
 RDEPENDS_perl-module-pod-simple-transcodesmart += "perl-module-encode"
 RDEPENDS_perl-module-pod-simple-transcodesmart += "perl-module-pod-simple"
@@ -4038,6 +4081,7 @@ RDEPENDS_perl-module-sys-syslog += "perl-module-xsloader"
 RDEPENDS_perl-module-tap-base += "perl-module-base"
 RDEPENDS_perl-module-tap-base += "perl-module-constant"
 RDEPENDS_perl-module-tap-base += "perl-module-strict"
+RDEPENDS_perl-module-tap-base += "perl-module-tap-object"
 RDEPENDS_perl-module-tap-base += "perl-module-warnings"
 RDEPENDS_perl-module-tap-formatter-base += "perl-module-base"
 RDEPENDS_perl-module-tap-formatter-base += "perl-module-posix"
@@ -4063,7 +4107,9 @@ RDEPENDS_perl-module-tap-formatter-console-session += "perl-module-warnings"
 RDEPENDS_perl-module-tap-formatter-file += "perl-module-base"
 RDEPENDS_perl-module-tap-formatter-file += "perl-module-posix"
 RDEPENDS_perl-module-tap-formatter-file += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-file += "perl-module-tap-formatter-base"
 RDEPENDS_perl-module-tap-formatter-file += "perl-module-tap-formatter-file-session"
+RDEPENDS_perl-module-tap-formatter-file += "perl-module-tap-formatter-session"
 RDEPENDS_perl-module-tap-formatter-file += "perl-module-warnings"
 RDEPENDS_perl-module-tap-formatter-file-session += "perl-module-base"
 RDEPENDS_perl-module-tap-formatter-file-session += "perl-module-strict"
@@ -4080,6 +4126,7 @@ RDEPENDS_perl-module-tap-harness += "perl-module-base"
 RDEPENDS_perl-module-tap-harness += "perl-module-file-path"
 RDEPENDS_perl-module-tap-harness += "perl-module-io-handle"
 RDEPENDS_perl-module-tap-harness += "perl-module-strict"
+RDEPENDS_perl-module-tap-harness += "perl-module-tap-formatter-file"
 RDEPENDS_perl-module-tap-harness += "perl-module-warnings"
 RDEPENDS_perl-module-tap-object += "perl-module-strict"
 RDEPENDS_perl-module-tap-object += "perl-module-warnings"
@@ -4204,6 +4251,7 @@ RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-constant"
 RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-strict"
 RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-tap-parser-iteratorfactory"
 RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-tap-parser-iterator-process"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-tap-parser-sourcehandler-executable"
 RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-text-parsewords"
 RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-warnings"
 RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-base"
-- 
2.20.1


