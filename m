Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17A1CA0FE6
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.11323.1755263219462838417
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lnagfbDa;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VcNLjnx/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010198add74215-9456b997-47d1-476c-9548-ef774acb7a84-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A6rYRMORyYN+QP9TXCQrv2BulgufmjcNteNTmWJHuMk=;
	b=lnagfbDanOLeu1WN8ThIRguGGdVjF3bLGofYAbpNcjnMda/pONcnSRLCucdrlkaB
	jyXmy8p/+abMVnObR1e5MV7+B4cPbNwdq7PODgZ3U1A9PDDA/QAlJQCNUSJN3m3AWD7
	bRSTNyMqFQNvUnrSkHApAC/ohxsp0oxvK0fIc984=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A6rYRMORyYN+QP9TXCQrv2BulgufmjcNteNTmWJHuMk=;
	b=VcNLjnx/SKGei5DstTIRp5tj3d3IFvlR9S39lq6GvQaXhyXtNjjizOkhG8W5HuJK
	Wgh49bg+3nKAg0vidnK9J1nzcoW8/HBV9VygzCWINKrPYt68/9qJUaYHQA7c22rQMUo
	XaddUE0iXcbFOx+uqOh4PTZbvWpUI9kc2cmh3XjA=
Content-Type: multipart/mixed; boundary="===============3579317700388887053=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-binary-native: upgrading to 1.25.0 SUCCEEDED
Message-ID: <01010198add74215-9456b997-47d1-476c-9548-ef774acb7a84-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221901

--===============3579317700388887053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-binary-native* to *1.25.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-go-binary-native-upgrade-1.24.6-1.25.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From f3dbb1e15474b8e0a8e0e231e0b56869cd7c85d4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 08:34:30 +0000
Subject: [PATCH] go-binary-native: upgrade 1.24.6 -> 1.25.0

---
 ...{go-binary-native_1.24.6.bb => go-binary-native_1.25.0.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.6.bb => go-binary-native_1.25.0.bb} (79%)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.24.6.bb b/meta/recipes-devtools/go/go-binary-native_1.25.0.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.24.6.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.0.bb
index d5c92bdea5..08b4bdcbc9 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.6.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.0.bb
@@ -9,9 +9,7 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "bbca37cc395c974ffa4893ee35819ad23ebb27426df87af92e93a9ec66ef8712"
-SRC_URI[go_linux_arm64.sha256sum] = "124ea6033a8bf98aa9fbab53e58d134905262d45a022af3a90b73320f3c3afd5"
-SRC_URI[go_linux_ppc64le.sha256sum] = "63fc9559a3d6dfd63aa902f714375b879bbc848466181c035c122489b9646e27"
+SRC_URI[go_linux_amd64.sha256sum] = "2852af0cb20a13139b3448992e69b868e50ed0f8a1e5940ee1de9e19a123b613"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.47.1


--===============3579317700388887053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/api/go1.25.txt was added
  /usr/lib/go/src/bufio/net_test.go was added
  /usr/lib/go/src/bytes/iter_test.go was added
  /usr/lib/go/src/cmd/cgo/internal/testsanitizers/lsan_test.go was added
  /usr/lib/go/src/cmd/compile/internal/noder/doc.go was added
  /usr/lib/go/src/cmd/compile/internal/ssa/generate_test.go was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/go was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/go/ast was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/go/ast/astutil was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/go/ast/astutil/enclosing.go was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/go/ast/astutil/imports.go was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/go/ast/astutil/rewrite.go was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/go/ast/astutil/util.go was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/LICENSE was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/PATENTS was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/modules.txt was added
  /usr/lib/go/src/cmd/compile/internal/ssa/pair.go was added
  /usr/lib/go/src/cmd/compile/internal/test/issue71943_test.go was added
  /usr/lib/go/src/cmd/compile/internal/test/locals_test.go was added
  /usr/lib/go/src/cmd/compile/internal/test/stack_test.go was added
  /usr/lib/go/src/cmd/compile/internal/types2/range.go was added
  /usr/lib/go/src/cmd/doc/doc.go was added
  /usr/lib/go/src/cmd/go/internal/doc/doc_bootstrap.go was added
  /usr/lib/go/src/cmd/internal/doc was added
  /usr/lib/go/src/cmd/internal/doc/dirs.go was added
  /usr/lib/go/src/cmd/internal/doc/doc_test.go was added
  /usr/lib/go/src/cmd/internal/doc/main.go was added
  /usr/lib/go/src/cmd/internal/doc/pkg.go was added
  /usr/lib/go/src/cmd/internal/doc/signal_notunix.go was added
  /usr/lib/go/src/cmd/internal/doc/signal_unix.go was added
  /usr/lib/go/src/cmd/internal/obj/riscv/obj_test.go was added
  /usr/lib/go/src/cmd/link/internal/ld/macho_test.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/sys/unix/auxv.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/sys/unix/auxv_unsupported.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/analysis/passes/hostport was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/analysis/passes/hostport/hostport.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/analysis/passes/waitgroup was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/analysis/passes/waitgroup/doc.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/analysis/passes/waitgroup/waitgroup.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/ast/edge was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/ast/edge/edge.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/ast/inspector/cursor.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/ast/inspector/walk.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/analysisinternal/typeindex was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/analysisinternal/typeindex/typeindex.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/astutil was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/astutil/clone.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/astutil/comment.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/astutil/util.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/fmtstr was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/fmtstr/parse.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/stdlib/deps.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/stdlib/import.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/typesinternal/classify_call.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/typesinternal/qualifier.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/typesinternal/typeindex was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/typesinternal/typeindex/typeindex.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/typesinternal/varkind.go was added
  /usr/lib/go/src/crypto/crypto_test.go was added
  /usr/lib/go/src/crypto/fips140/fips140_test.go was added
  /usr/lib/go/src/crypto/internal/cryptotest/methods.go was added
  /usr/lib/go/src/crypto/internal/fips140cache was added
  /usr/lib/go/src/crypto/internal/fips140cache/cache.go was added
  /usr/lib/go/src/crypto/internal/fips140cache/cache_test.go was added
  /usr/lib/go/src/crypto/internal/fips140/sha3/sha3_arm64.go was added
  /usr/lib/go/src/crypto/internal/fips140/sha3/sha3_arm64.s was added
  /usr/lib/go/src/crypto/internal/fips140/subtle/constant_time_test.go was added
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_asm.go was added
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_mips64x.s was added
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_mipsx.s was added
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_riscv64.s was added
  /usr/lib/go/src/crypto/sha1/_asm/sha1block_amd64_shani.go was added
  /usr/lib/go/src/crypto/tls/bogo_shim_notunix_test.go was added
  /usr/lib/go/src/crypto/tls/bogo_shim_unix_test.go was added
  /usr/lib/go/src/crypto/tls/defaults_boring.go was added
  /usr/lib/go/src/crypto/tls/defaults_fips140.go was added
  /usr/lib/go/src/crypto/tls/fips140_test.go was added
  /usr/lib/go/src/encoding/json/internal was added
  /usr/lib/go/src/encoding/json/internal/internal.go was added
  /usr/lib/go/src/encoding/json/internal/jsonflags was added
  /usr/lib/go/src/encoding/json/internal/jsonflags/flags.go was added
  /usr/lib/go/src/encoding/json/internal/jsonflags/flags_test.go was added
  /usr/lib/go/src/encoding/json/internal/jsonopts was added
  /usr/lib/go/src/encoding/json/internal/jsonopts/options.go was added
  /usr/lib/go/src/encoding/json/internal/jsonopts/options_test.go was added
  /usr/lib/go/src/encoding/json/internal/jsontest was added
  /usr/lib/go/src/encoding/json/internal/jsontest/testcase.go was added
  /usr/lib/go/src/encoding/json/internal/jsontest/testdata.go was added
  /usr/lib/go/src/encoding/json/internal/jsonwire was added
  /usr/lib/go/src/encoding/json/internal/jsonwire/decode.go was added
  /usr/lib/go/src/encoding/json/internal/jsonwire/decode_test.go was added
  /usr/lib/go/src/encoding/json/internal/jsonwire/encode.go was added
  /usr/lib/go/src/encoding/json/internal/jsonwire/encode_test.go was added
  /usr/lib/go/src/encoding/json/internal/jsonwire/wire.go was added
  /usr/lib/go/src/encoding/json/internal/jsonwire/wire_test.go was added
  /usr/lib/go/src/encoding/json/jsontext was added
  /usr/lib/go/src/encoding/json/jsontext/coder_test.go was added
  /usr/lib/go/src/encoding/json/jsontext/decode.go was added
  /usr/lib/go/src/encoding/json/jsontext/decode_test.go was added
  /usr/lib/go/src/encoding/json/jsontext/doc.go was added
  /usr/lib/go/src/encoding/json/jsontext/encode.go was added
  /usr/lib/go/src/encoding/json/jsontext/encode_test.go was added
  /usr/lib/go/src/encoding/json/jsontext/errors.go was added
  /usr/lib/go/src/encoding/json/jsontext/example_test.go was added
  /usr/lib/go/src/encoding/json/jsontext/export.go was added
  /usr/lib/go/src/encoding/json/jsontext/fuzz_test.go was added
  /usr/lib/go/src/encoding/json/jsontext/options.go was added
  /usr/lib/go/src/encoding/json/jsontext/pools.go was added
  /usr/lib/go/src/encoding/json/jsontext/quote.go was added
  /usr/lib/go/src/encoding/json/jsontext/state.go was added
  /usr/lib/go/src/encoding/json/jsontext/state_test.go was added
  /usr/lib/go/src/encoding/json/jsontext/token.go was added
  /usr/lib/go/src/encoding/json/jsontext/token_test.go was added
  /usr/lib/go/src/encoding/json/jsontext/value.go was added
  /usr/lib/go/src/encoding/json/jsontext/value_test.go was added
  /usr/lib/go/src/encoding/json/v2 was added
  /usr/lib/go/src/encoding/json/v2/arshal_any.go was added
  /usr/lib/go/src/encoding/json/v2/arshal_default.go was added
  /usr/lib/go/src/encoding/json/v2/arshal_funcs.go was added
  /usr/lib/go/src/encoding/json/v2/arshal.go was added
  /usr/lib/go/src/encoding/json/v2/arshal_inlined.go was added
  /usr/lib/go/src/encoding/json/v2/arshal_methods.go was added
  /usr/lib/go/src/encoding/json/v2/arshal_test.go was added
  /usr/lib/go/src/encoding/json/v2/arshal_time.go was added
  /usr/lib/go/src/encoding/json/v2/arshal_time_test.go was added
  /usr/lib/go/src/encoding/json/v2/bench_test.go was added
  /usr/lib/go/src/encoding/json/v2_bench_test.go was added
  /usr/lib/go/src/encoding/json/v2_decode.go was added
  /usr/lib/go/src/encoding/json/v2_decode_test.go was added
  /usr/lib/go/src/encoding/json/v2_diff_test.go was added
  /usr/lib/go/src/encoding/json/v2/doc.go was added
  /usr/lib/go/src/encoding/json/v2_encode.go was added
  /usr/lib/go/src/encoding/json/v2_encode_test.go was added
  /usr/lib/go/src/encoding/json/v2/errors.go was added
  /usr/lib/go/src/encoding/json/v2/errors_test.go was added
  /usr/lib/go/src/encoding/json/v2_example_marshaling_test.go was added
  /usr/lib/go/src/encoding/json/v2/example_orderedobject_test.go was added
  /usr/lib/go/src/encoding/json/v2/example_test.go was added
  /usr/lib/go/src/encoding/json/v2_example_test.go was added
  /usr/lib/go/src/encoding/json/v2_example_text_marshaling_test.go was added
  /usr/lib/go/src/encoding/json/v2/fields.go was added
  /usr/lib/go/src/encoding/json/v2/fields_test.go was added
  /usr/lib/go/src/encoding/json/v2/fold.go was added
  /usr/lib/go/src/encoding/json/v2/fold_test.go was added
  /usr/lib/go/src/encoding/json/v2/fuzz_test.go was added
  /usr/lib/go/src/encoding/json/v2_fuzz_test.go was added
  /usr/lib/go/src/encoding/json/v2_indent.go was added
  /usr/lib/go/src/encoding/json/v2_inject.go was added
  /usr/lib/go/src/encoding/json/v2/inline_test.go was added
  /usr/lib/go/src/encoding/json/v2/intern.go was added
  /usr/lib/go/src/encoding/json/v2/intern_test.go was added
  /usr/lib/go/src/encoding/json/v2/options.go was added
  /usr/lib/go/src/encoding/json/v2_options.go was added
  /usr/lib/go/src/encoding/json/v2_scanner.go was added
  /usr/lib/go/src/encoding/json/v2_scanner_test.go was added
  /usr/lib/go/src/encoding/json/v2_stream.go was added
  /usr/lib/go/src/encoding/json/v2_stream_test.go was added
  /usr/lib/go/src/encoding/json/v2_tagkey_test.go was added
  /usr/lib/go/src/go/ast/import_test.go was added
  /usr/lib/go/src/go/token/export_test.go was added
  /usr/lib/go/src/go/token/tree.go was added
  /usr/lib/go/src/go/token/tree_test.go was added
  /usr/lib/go/src/go/types/range.go was added
  /usr/lib/go/src/internal/bytealg/count_loong64.s was added
  /usr/lib/go/src/internal/bytealg/count_mips64x.s was added
  /usr/lib/go/src/internal/cgrouptest was added
  /usr/lib/go/src/internal/cgrouptest/cgrouptest_linux.go was added
  /usr/lib/go/src/internal/cgrouptest/cgrouptest_linux_test.go was added
  /usr/lib/go/src/internal/chacha8rand/chacha8_loong64.s was added
  /usr/lib/go/src/internal/cpu/cpu_riscv64_linux.go was added
  /usr/lib/go/src/internal/cpu/cpu_riscv64_other.go was added
  /usr/lib/go/src/internal/goexperiment/exp_dwarf5_off.go was added
  /usr/lib/go/src/internal/goexperiment/exp_dwarf5_on.go was added
  /usr/lib/go/src/internal/goexperiment/exp_greenteagc_off.go was added
  /usr/lib/go/src/internal/goexperiment/exp_greenteagc_on.go was added
  /usr/lib/go/src/internal/goexperiment/exp_jsonv2_off.go was added
  /usr/lib/go/src/internal/goexperiment/exp_jsonv2_on.go was added
  /usr/lib/go/src/internal/routebsd was added
  /usr/lib/go/src/internal/routebsd/address_darwin_test.go was added
  /usr/lib/go/src/internal/routebsd/address.go was added
  /usr/lib/go/src/internal/routebsd/address_test.go was added
  /usr/lib/go/src/internal/routebsd/binary.go was added
  /usr/lib/go/src/internal/routebsd/interface_classic.go was added
  /usr/lib/go/src/internal/routebsd/interface_freebsd.go was added
  /usr/lib/go/src/internal/routebsd/interface.go was added
  /usr/lib/go/src/internal/routebsd/interface_multicast.go was added
  /usr/lib/go/src/internal/routebsd/interface_openbsd.go was added
  /usr/lib/go/src/internal/routebsd/message_darwin_test.go was added
  /usr/lib/go/src/internal/routebsd/message_freebsd_test.go was added
  /usr/lib/go/src/internal/routebsd/message.go was added
  /usr/lib/go/src/internal/routebsd/message_test.go was added
  /usr/lib/go/src/internal/routebsd/route.go was added
  /usr/lib/go/src/internal/routebsd/route_test.go was added
  /usr/lib/go/src/internal/routebsd/sys_darwin.go was added
  /usr/lib/go/src/internal/routebsd/sys_dragonfly.go was added
  /usr/lib/go/src/internal/routebsd/sys_freebsd.go was added
  /usr/lib/go/src/internal/routebsd/sys.go was added
  /usr/lib/go/src/internal/routebsd/sys_netbsd.go was added
  /usr/lib/go/src/internal/routebsd/sys_openbsd.go was added
  /usr/lib/go/src/internal/runtime/atomic/xchg8.go was added
  /usr/lib/go/src/internal/runtime/cgroup was added
  /usr/lib/go/src/internal/runtime/cgroup/cgroup_linux.go was added
  /usr/lib/go/src/internal/runtime/cgroup/cgroup_linux_test.go was added
  /usr/lib/go/src/internal/runtime/cgroup/export_linux_test.go was added
  /usr/lib/go/src/internal/runtime/cgroup/export_test.go was added
  /usr/lib/go/src/internal/runtime/cgroup/line_reader.go was added
  /usr/lib/go/src/internal/runtime/cgroup/line_reader_test.go was added
  /usr/lib/go/src/internal/runtime/cgroup/runtime.go was added
  /usr/lib/go/src/internal/runtime/gc was added
  /usr/lib/go/src/internal/runtime/gc/malloc.go was added
  /usr/lib/go/src/internal/runtime/gc/mksizeclasses.go was added
  /usr/lib/go/src/internal/runtime/gc/scan.go was added
  /usr/lib/go/src/internal/runtime/gc/sizeclasses.go was added
  /usr/lib/go/src/internal/runtime/startlinetest was added
  /usr/lib/go/src/internal/runtime/startlinetest/func_amd64.go was added
  /usr/lib/go/src/internal/runtime/startlinetest/func_amd64.s was added
  /usr/lib/go/src/internal/runtime/strconv was added
  /usr/lib/go/src/internal/runtime/strconv/atoi.go was added
  /usr/lib/go/src/internal/runtime/strconv/atoi_test.go was added
  /usr/lib/go/src/internal/runtime/wasitest was added
  /usr/lib/go/src/internal/runtime/wasitest/host_test.go was added
  /usr/lib/go/src/internal/runtime/wasitest/nonblock_test.go was added
  /usr/lib/go/src/internal/runtime/wasitest/tcpecho_test.go was added
  /usr/lib/go/src/internal/syscall/unix/renameat2_sysnum_linux.go was added
  /usr/lib/go/src/internal/syscall/unix/renameat_sysnum_linux.go was added
  /usr/lib/go/src/internal/syscall/unix/utimes.go was added
  /usr/lib/go/src/internal/syscall/unix/utimes_wasip1.go was added
  /usr/lib/go/src/internal/syscall/windows/nonblocking_windows.go was added
  /usr/lib/go/src/internal/testhash was added
  /usr/lib/go/src/internal/testhash/hash.go was added
  /usr/lib/go/src/internal/trace/export_reader_test.go was added
  /usr/lib/go/src/internal/trace/internal/testgen/trace.go was added
  /usr/lib/go/src/internal/trace/internal/tracev1 was added
  /usr/lib/go/src/internal/trace/internal/tracev1/order.go was added
  /usr/lib/go/src/internal/trace/internal/tracev1/parser.go was added
  /usr/lib/go/src/internal/trace/internal/tracev1/parser_test.go was added
  /usr/lib/go/src/internal/trace/tracev1.go was added
  /usr/lib/go/src/internal/trace/tracev1_test.go was added
  /usr/lib/go/src/internal/trace/tracev2 was added
  /usr/lib/go/src/internal/trace/tracev2/doc.go was added
  /usr/lib/go/src/internal/trace/tracev2/events.go was added
  /usr/lib/go/src/internal/trace/tracev2/events_test.go was added
  /usr/lib/go/src/internal/trace/tracev2/EXPERIMENTS.md was added
  /usr/lib/go/src/internal/trace/tracev2/spec.go was added
  /usr/lib/go/src/internal/trace/traceviewer/fakep.go was added
  /usr/lib/go/src/io/fs/readlink.go was added
  /usr/lib/go/src/io/fs/readlink_test.go was added
  /usr/lib/go/src/math/big/arith_amd64_test.go was added
  /usr/lib/go/src/math/big/arithvec_s390x.go was added
  /usr/lib/go/src/math/big/arithvec_s390x.s was added
  /usr/lib/go/src/math/big/calibrate_graph.go was added
  /usr/lib/go/src/math/big/calibrate.md was added
  /usr/lib/go/src/math/big/escape_test.go was added
  /usr/lib/go/src/math/big/internal was added
  /usr/lib/go/src/math/big/internal/asmgen was added
  /usr/lib/go/src/math/big/internal/asmgen/386.go was added
  /usr/lib/go/src/math/big/internal/asmgen/add.go was added
  /usr/lib/go/src/math/big/internal/asmgen/amd64.go was added
  /usr/lib/go/src/math/big/internal/asmgen/arch.go was added
  /usr/lib/go/src/math/big/internal/asmgen/arm64.go was added
  /usr/lib/go/src/math/big/internal/asmgen/arm.go was added
  /usr/lib/go/src/math/big/internal/asmgen/asm.go was added
  /usr/lib/go/src/math/big/internal/asmgen/cheat.go was added
  /usr/lib/go/src/math/big/internal/asmgen/func.go was added
  /usr/lib/go/src/math/big/internal/asmgen/loong64.go was added
  /usr/lib/go/src/math/big/internal/asmgen/main.go was added
  /usr/lib/go/src/math/big/internal/asmgen/main_test.go was added
  /usr/lib/go/src/math/big/internal/asmgen/mips64.go was added
  /usr/lib/go/src/math/big/internal/asmgen/mips.go was added
  /usr/lib/go/src/math/big/internal/asmgen/mul.go was added
  /usr/lib/go/src/math/big/internal/asmgen/pipe.go was added
  /usr/lib/go/src/math/big/internal/asmgen/ppc64.go was added
  /usr/lib/go/src/math/big/internal/asmgen/riscv64.go was added
  /usr/lib/go/src/math/big/internal/asmgen/s390x.go was added
  /usr/lib/go/src/math/big/internal/asmgen/shift.go was added
  /usr/lib/go/src/math/big/natmul.go was added
  /usr/lib/go/src/math/exp_loong64.s was added
  /usr/lib/go/src/net/file_posix.go was added
  /usr/lib/go/src/net/http/csrf.go was added
  /usr/lib/go/src/net/http/csrf_test.go was added
  /usr/lib/go/src/net/http/internal/httpcommon was added
  /usr/lib/go/src/net/http/internal/httpcommon/httpcommon.go was added
  /usr/lib/go/src/net/platform_plan9_test.go was added
  /usr/lib/go/src/net/platform_unix_test.go was added
  /usr/lib/go/src/net/platform_windows_test.go was added
  /usr/lib/go/src/net/sendfile.go was added
  /usr/lib/go/src/net/sendfile_nonwindows.go was added
  /usr/lib/go/src/net/sockoptip4_bsdvar.go was added
  /usr/lib/go/src/net/sockoptip4_linux.go was added
  /usr/lib/go/src/net/sockoptip4_posix_nonlinux.go was added
  /usr/lib/go/src/net/sockoptip4_windows.go was added
  /usr/lib/go/src/net/sockoptip6_posix.go was added
  /usr/lib/go/src/os/file_test.go was added
  /usr/lib/go/src/os/removeall_unix.go was added
  /usr/lib/go/src/os/removeall_windows.go was added
  /usr/lib/go/src/os/root_unix_test.go was added
  /usr/lib/go/src/os/timeout_unix_test.go was added
  /usr/lib/go/src/os/timeout_windows_test.go was added
  /usr/lib/go/src/runtime/cgroup_linux.go was added
  /usr/lib/go/src/runtime/cgroup_linux_test.go was added
  /usr/lib/go/src/runtime/cgroup_stubs.go was added
  /usr/lib/go/src/runtime/gomaxprocs_windows_test.go was added
  /usr/lib/go/src/runtime/libfuzzer_loong64.s was added
  /usr/lib/go/src/runtime/mgcmark_greenteagc.go was added
  /usr/lib/go/src/runtime/mgcmark_nogreenteagc.go was added
  /usr/lib/go/src/runtime/race_loong64.s was added
  /usr/lib/go/src/runtime/race/race_linux_loong64.syso was added
  /usr/lib/go/src/runtime/set_vma_name_linux.go was added
  /usr/lib/go/src/runtime/set_vma_name_stub.go was added
  /usr/lib/go/src/runtime/time_plan9.go was added
  /usr/lib/go/src/runtime/trace/batch.go was added
  /usr/lib/go/src/runtime/trace/encoding.go was added
  /usr/lib/go/src/runtime/trace/flightrecorder.go was added
  /usr/lib/go/src/runtime/trace/flightrecorder_test.go was added
  /usr/lib/go/src/runtime/trace/recorder.go was added
  /usr/lib/go/src/runtime/tracestack_test.go was added
  /usr/lib/go/src/runtime/trace/subscribe.go was added
  /usr/lib/go/src/runtime/trace/subscribe_test.go was added
  /usr/lib/go/src/runtime/valgrind0.go was added
  /usr/lib/go/src/runtime/valgrind_amd64.s was added
  /usr/lib/go/src/runtime/valgrind_arm64.s was added
  /usr/lib/go/src/runtime/valgrind.go was added
  /usr/lib/go/src/strings/iter_test.go was added
  /usr/lib/go/src/testing/synctest/example_test.go was added
  /usr/lib/go/src/testing/synctest/helper_test.go was added
  /usr/lib/go/src/testing/synctest/run.go was added
  /usr/lib/go/src/testing/synctest/synctest_test.go was added
  /usr/lib/go/src/unique/canonmap.go was added
  /usr/lib/go/src/unique/canonmap_test.go was added
  /usr/lib/go/src/vendor/golang.org/x/crypto/internal/poly1305/sum_asm.go was added
  /usr/lib/go/src/vendor/golang.org/x/crypto/internal/poly1305/sum_loong64.s was added
  /usr/lib/go/src/vendor/golang.org/x/sys/cpu/cpu_linux_loong64.go was added
  /usr/lib/go/src/vendor/golang.org/x/sys/cpu/cpu_loong64.s was added
  /usr/lib/go/test/codegen/issue70409.go was added
  /usr/lib/go/test/codegen/issue72832.go was added
  /usr/lib/go/test/codegen/load_type_from_itab.go was added
  /usr/lib/go/test/codegen/multiply.go was added
  /usr/lib/go/test/codegen/schedule.go was added
  /usr/lib/go/test/codegen/unique.go was added
  /usr/lib/go/test/escape6.go was added
  /usr/lib/go/test/escape_iface_data.go was added
  /usr/lib/go/test/escape_make_non_const.go was added
  /usr/lib/go/test/escape_unique.go was added
  /usr/lib/go/test/fixedbugs/issue71184.go was added
  /usr/lib/go/test/fixedbugs/issue71225.go was added
  /usr/lib/go/test/fixedbugs/issue71226.go was added
  /usr/lib/go/test/fixedbugs/issue71759.go was added
  /usr/lib/go/test/fixedbugs/issue72844.go was added
  /usr/lib/go/test/fixedbugs/issue72860.go was added
  /usr/lib/go/test/fixedbugs/issue73180.go was added
  /usr/lib/go/test/fixedbugs/issue73200.go was added
  /usr/lib/go/test/fixedbugs/issue73309b.go was added
  /usr/lib/go/test/fixedbugs/issue73309.go was added
  /usr/lib/go/test/fixedbugs/issue73476.go was added
  /usr/lib/go/test/fixedbugs/issue73476.out was added
  /usr/lib/go/test/fixedbugs/issue73483.go was added
  /usr/lib/go/test/fixedbugs/issue73491.go was added
  /usr/lib/go/test/fixedbugs/issue73716.go was added
  /usr/lib/go/test/fixedbugs/issue73823.go was added
  /usr/lib/go/test/fixedbugs/issue73888b.go was added
  /usr/lib/go/test/fixedbugs/issue73888.go was added
  /usr/lib/go/test/fixedbugs/issue74379b.go was added
  /usr/lib/go/test/fixedbugs/issue74379c.go was added
  /usr/lib/go/test/fixedbugs/issue74379.go was added
  /usr/lib/go/test/prove_popcount.go was added
  /usr/lib/go/doc/go1.17_spec.html was removed
  /usr/lib/go/misc/linkcheck was removed
  /usr/lib/go/misc/linkcheck/linkcheck.go was removed
  /usr/lib/go/pkg/tool/linux_amd64/addr2line was removed
  /usr/lib/go/pkg/tool/linux_amd64/buildid was removed
  /usr/lib/go/pkg/tool/linux_amd64/covdata was removed
  /usr/lib/go/pkg/tool/linux_amd64/doc was removed
  /usr/lib/go/pkg/tool/linux_amd64/fix was removed
  /usr/lib/go/pkg/tool/linux_amd64/nm was removed
  /usr/lib/go/pkg/tool/linux_amd64/objdump was removed
  /usr/lib/go/pkg/tool/linux_amd64/pack was removed
  /usr/lib/go/pkg/tool/linux_amd64/pprof was removed
  /usr/lib/go/pkg/tool/linux_amd64/test2json was removed
  /usr/lib/go/pkg/tool/linux_amd64/trace was removed
  /usr/lib/go/src/cmd/doc/dirs.go was removed
  /usr/lib/go/src/cmd/doc/doc_test.go was removed
  /usr/lib/go/src/cmd/doc/main.go was removed
  /usr/lib/go/src/cmd/doc/pkg.go was removed
  /usr/lib/go/src/cmd/internal/bio/must.go was removed
  /usr/lib/go/src/cmd/vendor/golang.org/x/sync/errgroup/go120.go was removed
  /usr/lib/go/src/cmd/vendor/golang.org/x/sync/errgroup/pre_go120.go was removed
  /usr/lib/go/src/cmd/vendor/golang.org/x/telemetry/counter/countertest/countertest_go121.go was removed
  /usr/lib/go/src/cmd/vendor/golang.org/x/telemetry/internal/crashmonitor/crash_go123.go was removed
  /usr/lib/go/src/crypto/elliptic/nistec_p256.go was removed
  /usr/lib/go/src/crypto/internal/fips140/edwards25519/field/fe_arm64.go was removed
  /usr/lib/go/src/crypto/internal/fips140/edwards25519/field/fe_arm64_noasm.go was removed
  /usr/lib/go/src/crypto/internal/fips140/edwards25519/field/fe_arm64.s was removed
  /usr/lib/go/src/crypto/internal/fips140/hash.go was removed
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_amd64.go was removed
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_arm64.go was removed
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_ppc64x.go was removed
  /usr/lib/go/src/crypto/sha1/fallback_test.go was removed
  /usr/lib/go/src/crypto/tls/fips_test.go was removed
  /usr/lib/go/src/go/ast/internal was removed
  /usr/lib/go/src/go/ast/internal/tests was removed
  /usr/lib/go/src/go/ast/internal/tests/sortimports_test.go was removed
  /usr/lib/go/src/go/build/zcgo.go was removed
  /usr/lib/go/src/internal/goexperiment/exp_coverageredesign_off.go was removed
  /usr/lib/go/src/internal/goexperiment/exp_coverageredesign_on.go was removed
  /usr/lib/go/src/internal/goexperiment/exp_spinbitmutex_off.go was removed
  /usr/lib/go/src/internal/goexperiment/exp_spinbitmutex_on.go was removed
  /usr/lib/go/src/internal/poll/export_windows_test.go was removed
  /usr/lib/go/src/internal/runtime/maps/runtime_noswiss.go was removed
  /usr/lib/go/src/internal/trace/event was removed
  /usr/lib/go/src/internal/trace/event/event.go was removed
  /usr/lib/go/src/internal/trace/event/go122 was removed
  /usr/lib/go/src/internal/trace/event/go122/event.go was removed
  /usr/lib/go/src/internal/trace/event/requirements.go was removed
  /usr/lib/go/src/internal/trace/internal/oldtrace was removed
  /usr/lib/go/src/internal/trace/internal/oldtrace/order.go was removed
  /usr/lib/go/src/internal/trace/internal/oldtrace/parser.go was removed
  /usr/lib/go/src/internal/trace/internal/oldtrace/parser_test.go was removed
  /usr/lib/go/src/internal/trace/internal/testgen/go122 was removed
  /usr/lib/go/src/internal/trace/internal/testgen/go122/trace.go was removed
  /usr/lib/go/src/internal/trace/oldtrace.go was removed
  /usr/lib/go/src/internal/trace/oldtrace_test.go was removed
  /usr/lib/go/src/internal/trace/parser.go was removed
  /usr/lib/go/src/log/slog/internal/slogtest was removed
  /usr/lib/go/src/log/slog/internal/slogtest/slogtest.go was removed
  /usr/lib/go/src/math/big/arith_decl_s390x.go was removed
  /usr/lib/go/src/net/sendfile_linux.go was removed
  /usr/lib/go/src/net/sendfile_unix_alt.go was removed
  /usr/lib/go/src/net/sockoptip_bsdvar.go was removed
  /usr/lib/go/src/net/sockoptip_linux.go was removed
  /usr/lib/go/src/net/sockoptip_posix.go was removed
  /usr/lib/go/src/net/sockoptip_windows.go was removed
  /usr/lib/go/src/runtime/internal was removed
  /usr/lib/go/src/runtime/internal/startlinetest was removed
  /usr/lib/go/src/runtime/internal/startlinetest/func_amd64.go was removed
  /usr/lib/go/src/runtime/internal/startlinetest/func_amd64.s was removed
  /usr/lib/go/src/runtime/internal/wasitest was removed
  /usr/lib/go/src/runtime/internal/wasitest/host_test.go was removed
  /usr/lib/go/src/runtime/internal/wasitest/nonblock_test.go was removed
  /usr/lib/go/src/runtime/internal/wasitest/tcpecho_test.go was removed
  /usr/lib/go/src/runtime/lock_futex_tristate.go was removed
  /usr/lib/go/src/runtime/lock_sema_tristate.go was removed
  /usr/lib/go/src/runtime/mksizeclasses.go was removed
  /usr/lib/go/src/runtime/sizeclasses.go was removed
  /usr/lib/go/src/runtime/traceexp.go was removed
  /usr/lib/go/src/testing/synctest/context_example_test.go was removed
  /usr/lib/go/src/vendor/golang.org/x/crypto/internal/poly1305/sum_amd64.go was removed
  /usr/lib/go/src/vendor/golang.org/x/crypto/internal/poly1305/sum_ppc64x.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/address.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/binary.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/empty.s was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/interface_announce.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/interface_classic.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/interface_freebsd.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/interface.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/interface_multicast.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/interface_openbsd.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/message.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/route_classic.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/route.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/route_openbsd.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/syscall.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/sys_darwin.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/sys_dragonfly.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/sys_freebsd.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/sys.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/sys_netbsd.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/sys_openbsd.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_darwin.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_dragonfly.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_freebsd_386.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_freebsd_amd64.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_freebsd_arm64.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_freebsd_arm.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_freebsd_riscv64.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_netbsd.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_openbsd.go was removed

--===============3579317700388887053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86_64-linux/go-binary-native (sysroot):
  /usr/lib/go/api/go1.25.txt was added
  /usr/lib/go/src/bufio/net_test.go was added
  /usr/lib/go/src/bytes/iter_test.go was added
  /usr/lib/go/src/cmd/cgo/internal/testsanitizers/lsan_test.go was added
  /usr/lib/go/src/cmd/compile/internal/noder/doc.go was added
  /usr/lib/go/src/cmd/compile/internal/ssa/generate_test.go was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/go was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/go/ast was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/go/ast/astutil was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/go/ast/astutil/enclosing.go was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/go/ast/astutil/imports.go was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/go/ast/astutil/rewrite.go was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/go/ast/astutil/util.go was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/LICENSE was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/golang.org/x/tools/PATENTS was added
  /usr/lib/go/src/cmd/compile/internal/ssa/_gen/vendor/modules.txt was added
  /usr/lib/go/src/cmd/compile/internal/ssa/pair.go was added
  /usr/lib/go/src/cmd/compile/internal/test/issue71943_test.go was added
  /usr/lib/go/src/cmd/compile/internal/test/locals_test.go was added
  /usr/lib/go/src/cmd/compile/internal/test/stack_test.go was added
  /usr/lib/go/src/cmd/compile/internal/types2/range.go was added
  /usr/lib/go/src/cmd/doc/doc.go was added
  /usr/lib/go/src/cmd/go/internal/doc/doc_bootstrap.go was added
  /usr/lib/go/src/cmd/internal/doc was added
  /usr/lib/go/src/cmd/internal/doc/dirs.go was added
  /usr/lib/go/src/cmd/internal/doc/doc_test.go was added
  /usr/lib/go/src/cmd/internal/doc/main.go was added
  /usr/lib/go/src/cmd/internal/doc/pkg.go was added
  /usr/lib/go/src/cmd/internal/doc/signal_notunix.go was added
  /usr/lib/go/src/cmd/internal/doc/signal_unix.go was added
  /usr/lib/go/src/cmd/internal/obj/riscv/obj_test.go was added
  /usr/lib/go/src/cmd/link/internal/ld/macho_test.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/sys/unix/auxv.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/sys/unix/auxv_unsupported.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/analysis/passes/hostport was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/analysis/passes/hostport/hostport.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/analysis/passes/waitgroup was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/analysis/passes/waitgroup/doc.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/analysis/passes/waitgroup/waitgroup.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/ast/edge was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/ast/edge/edge.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/ast/inspector/cursor.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/go/ast/inspector/walk.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/analysisinternal/typeindex was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/analysisinternal/typeindex/typeindex.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/astutil was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/astutil/clone.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/astutil/comment.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/astutil/util.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/fmtstr was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/fmtstr/parse.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/stdlib/deps.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/stdlib/import.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/typesinternal/classify_call.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/typesinternal/qualifier.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/typesinternal/typeindex was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/typesinternal/typeindex/typeindex.go was added
  /usr/lib/go/src/cmd/vendor/golang.org/x/tools/internal/typesinternal/varkind.go was added
  /usr/lib/go/src/crypto/crypto_test.go was added
  /usr/lib/go/src/crypto/fips140/fips140_test.go was added
  /usr/lib/go/src/crypto/internal/cryptotest/methods.go was added
  /usr/lib/go/src/crypto/internal/fips140cache was added
  /usr/lib/go/src/crypto/internal/fips140cache/cache.go was added
  /usr/lib/go/src/crypto/internal/fips140cache/cache_test.go was added
  /usr/lib/go/src/crypto/internal/fips140/sha3/sha3_arm64.go was added
  /usr/lib/go/src/crypto/internal/fips140/sha3/sha3_arm64.s was added
  /usr/lib/go/src/crypto/internal/fips140/subtle/constant_time_test.go was added
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_asm.go was added
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_mips64x.s was added
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_mipsx.s was added
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_riscv64.s was added
  /usr/lib/go/src/crypto/sha1/_asm/sha1block_amd64_shani.go was added
  /usr/lib/go/src/crypto/tls/bogo_shim_notunix_test.go was added
  /usr/lib/go/src/crypto/tls/bogo_shim_unix_test.go was added
  /usr/lib/go/src/crypto/tls/defaults_boring.go was added
  /usr/lib/go/src/crypto/tls/defaults_fips140.go was added
  /usr/lib/go/src/crypto/tls/fips140_test.go was added
  /usr/lib/go/src/encoding/json/internal was added
  /usr/lib/go/src/encoding/json/internal/internal.go was added
  /usr/lib/go/src/encoding/json/internal/jsonflags was added
  /usr/lib/go/src/encoding/json/internal/jsonflags/flags.go was added
  /usr/lib/go/src/encoding/json/internal/jsonflags/flags_test.go was added
  /usr/lib/go/src/encoding/json/internal/jsonopts was added
  /usr/lib/go/src/encoding/json/internal/jsonopts/options.go was added
  /usr/lib/go/src/encoding/json/internal/jsonopts/options_test.go was added
  /usr/lib/go/src/encoding/json/internal/jsontest was added
  /usr/lib/go/src/encoding/json/internal/jsontest/testcase.go was added
  /usr/lib/go/src/encoding/json/internal/jsontest/testdata.go was added
  /usr/lib/go/src/encoding/json/internal/jsonwire was added
  /usr/lib/go/src/encoding/json/internal/jsonwire/decode.go was added
  /usr/lib/go/src/encoding/json/internal/jsonwire/decode_test.go was added
  /usr/lib/go/src/encoding/json/internal/jsonwire/encode.go was added
  /usr/lib/go/src/encoding/json/internal/jsonwire/encode_test.go was added
  /usr/lib/go/src/encoding/json/internal/jsonwire/wire.go was added
  /usr/lib/go/src/encoding/json/internal/jsonwire/wire_test.go was added
  /usr/lib/go/src/encoding/json/jsontext was added
  /usr/lib/go/src/encoding/json/jsontext/coder_test.go was added
  /usr/lib/go/src/encoding/json/jsontext/decode.go was added
  /usr/lib/go/src/encoding/json/jsontext/decode_test.go was added
  /usr/lib/go/src/encoding/json/jsontext/doc.go was added
  /usr/lib/go/src/encoding/json/jsontext/encode.go was added
  /usr/lib/go/src/encoding/json/jsontext/encode_test.go was added
  /usr/lib/go/src/encoding/json/jsontext/errors.go was added
  /usr/lib/go/src/encoding/json/jsontext/example_test.go was added
  /usr/lib/go/src/encoding/json/jsontext/export.go was added
  /usr/lib/go/src/encoding/json/jsontext/fuzz_test.go was added
  /usr/lib/go/src/encoding/json/jsontext/options.go was added
  /usr/lib/go/src/encoding/json/jsontext/pools.go was added
  /usr/lib/go/src/encoding/json/jsontext/quote.go was added
  /usr/lib/go/src/encoding/json/jsontext/state.go was added
  /usr/lib/go/src/encoding/json/jsontext/state_test.go was added
  /usr/lib/go/src/encoding/json/jsontext/token.go was added
  /usr/lib/go/src/encoding/json/jsontext/token_test.go was added
  /usr/lib/go/src/encoding/json/jsontext/value.go was added
  /usr/lib/go/src/encoding/json/jsontext/value_test.go was added
  /usr/lib/go/src/encoding/json/v2 was added
  /usr/lib/go/src/encoding/json/v2/arshal_any.go was added
  /usr/lib/go/src/encoding/json/v2/arshal_default.go was added
  /usr/lib/go/src/encoding/json/v2/arshal_funcs.go was added
  /usr/lib/go/src/encoding/json/v2/arshal.go was added
  /usr/lib/go/src/encoding/json/v2/arshal_inlined.go was added
  /usr/lib/go/src/encoding/json/v2/arshal_methods.go was added
  /usr/lib/go/src/encoding/json/v2/arshal_test.go was added
  /usr/lib/go/src/encoding/json/v2/arshal_time.go was added
  /usr/lib/go/src/encoding/json/v2/arshal_time_test.go was added
  /usr/lib/go/src/encoding/json/v2/bench_test.go was added
  /usr/lib/go/src/encoding/json/v2_bench_test.go was added
  /usr/lib/go/src/encoding/json/v2_decode.go was added
  /usr/lib/go/src/encoding/json/v2_decode_test.go was added
  /usr/lib/go/src/encoding/json/v2_diff_test.go was added
  /usr/lib/go/src/encoding/json/v2/doc.go was added
  /usr/lib/go/src/encoding/json/v2_encode.go was added
  /usr/lib/go/src/encoding/json/v2_encode_test.go was added
  /usr/lib/go/src/encoding/json/v2/errors.go was added
  /usr/lib/go/src/encoding/json/v2/errors_test.go was added
  /usr/lib/go/src/encoding/json/v2_example_marshaling_test.go was added
  /usr/lib/go/src/encoding/json/v2/example_orderedobject_test.go was added
  /usr/lib/go/src/encoding/json/v2/example_test.go was added
  /usr/lib/go/src/encoding/json/v2_example_test.go was added
  /usr/lib/go/src/encoding/json/v2_example_text_marshaling_test.go was added
  /usr/lib/go/src/encoding/json/v2/fields.go was added
  /usr/lib/go/src/encoding/json/v2/fields_test.go was added
  /usr/lib/go/src/encoding/json/v2/fold.go was added
  /usr/lib/go/src/encoding/json/v2/fold_test.go was added
  /usr/lib/go/src/encoding/json/v2/fuzz_test.go was added
  /usr/lib/go/src/encoding/json/v2_fuzz_test.go was added
  /usr/lib/go/src/encoding/json/v2_indent.go was added
  /usr/lib/go/src/encoding/json/v2_inject.go was added
  /usr/lib/go/src/encoding/json/v2/inline_test.go was added
  /usr/lib/go/src/encoding/json/v2/intern.go was added
  /usr/lib/go/src/encoding/json/v2/intern_test.go was added
  /usr/lib/go/src/encoding/json/v2/options.go was added
  /usr/lib/go/src/encoding/json/v2_options.go was added
  /usr/lib/go/src/encoding/json/v2_scanner.go was added
  /usr/lib/go/src/encoding/json/v2_scanner_test.go was added
  /usr/lib/go/src/encoding/json/v2_stream.go was added
  /usr/lib/go/src/encoding/json/v2_stream_test.go was added
  /usr/lib/go/src/encoding/json/v2_tagkey_test.go was added
  /usr/lib/go/src/go/ast/import_test.go was added
  /usr/lib/go/src/go/token/export_test.go was added
  /usr/lib/go/src/go/token/tree.go was added
  /usr/lib/go/src/go/token/tree_test.go was added
  /usr/lib/go/src/go/types/range.go was added
  /usr/lib/go/src/internal/bytealg/count_loong64.s was added
  /usr/lib/go/src/internal/bytealg/count_mips64x.s was added
  /usr/lib/go/src/internal/cgrouptest was added
  /usr/lib/go/src/internal/cgrouptest/cgrouptest_linux.go was added
  /usr/lib/go/src/internal/cgrouptest/cgrouptest_linux_test.go was added
  /usr/lib/go/src/internal/chacha8rand/chacha8_loong64.s was added
  /usr/lib/go/src/internal/cpu/cpu_riscv64_linux.go was added
  /usr/lib/go/src/internal/cpu/cpu_riscv64_other.go was added
  /usr/lib/go/src/internal/goexperiment/exp_dwarf5_off.go was added
  /usr/lib/go/src/internal/goexperiment/exp_dwarf5_on.go was added
  /usr/lib/go/src/internal/goexperiment/exp_greenteagc_off.go was added
  /usr/lib/go/src/internal/goexperiment/exp_greenteagc_on.go was added
  /usr/lib/go/src/internal/goexperiment/exp_jsonv2_off.go was added
  /usr/lib/go/src/internal/goexperiment/exp_jsonv2_on.go was added
  /usr/lib/go/src/internal/routebsd was added
  /usr/lib/go/src/internal/routebsd/address_darwin_test.go was added
  /usr/lib/go/src/internal/routebsd/address.go was added
  /usr/lib/go/src/internal/routebsd/address_test.go was added
  /usr/lib/go/src/internal/routebsd/binary.go was added
  /usr/lib/go/src/internal/routebsd/interface_classic.go was added
  /usr/lib/go/src/internal/routebsd/interface_freebsd.go was added
  /usr/lib/go/src/internal/routebsd/interface.go was added
  /usr/lib/go/src/internal/routebsd/interface_multicast.go was added
  /usr/lib/go/src/internal/routebsd/interface_openbsd.go was added
  /usr/lib/go/src/internal/routebsd/message_darwin_test.go was added
  /usr/lib/go/src/internal/routebsd/message_freebsd_test.go was added
  /usr/lib/go/src/internal/routebsd/message.go was added
  /usr/lib/go/src/internal/routebsd/message_test.go was added
  /usr/lib/go/src/internal/routebsd/route.go was added
  /usr/lib/go/src/internal/routebsd/route_test.go was added
  /usr/lib/go/src/internal/routebsd/sys_darwin.go was added
  /usr/lib/go/src/internal/routebsd/sys_dragonfly.go was added
  /usr/lib/go/src/internal/routebsd/sys_freebsd.go was added
  /usr/lib/go/src/internal/routebsd/sys.go was added
  /usr/lib/go/src/internal/routebsd/sys_netbsd.go was added
  /usr/lib/go/src/internal/routebsd/sys_openbsd.go was added
  /usr/lib/go/src/internal/runtime/atomic/xchg8.go was added
  /usr/lib/go/src/internal/runtime/cgroup was added
  /usr/lib/go/src/internal/runtime/cgroup/cgroup_linux.go was added
  /usr/lib/go/src/internal/runtime/cgroup/cgroup_linux_test.go was added
  /usr/lib/go/src/internal/runtime/cgroup/export_linux_test.go was added
  /usr/lib/go/src/internal/runtime/cgroup/export_test.go was added
  /usr/lib/go/src/internal/runtime/cgroup/line_reader.go was added
  /usr/lib/go/src/internal/runtime/cgroup/line_reader_test.go was added
  /usr/lib/go/src/internal/runtime/cgroup/runtime.go was added
  /usr/lib/go/src/internal/runtime/gc was added
  /usr/lib/go/src/internal/runtime/gc/malloc.go was added
  /usr/lib/go/src/internal/runtime/gc/mksizeclasses.go was added
  /usr/lib/go/src/internal/runtime/gc/scan.go was added
  /usr/lib/go/src/internal/runtime/gc/sizeclasses.go was added
  /usr/lib/go/src/internal/runtime/startlinetest was added
  /usr/lib/go/src/internal/runtime/startlinetest/func_amd64.go was added
  /usr/lib/go/src/internal/runtime/startlinetest/func_amd64.s was added
  /usr/lib/go/src/internal/runtime/strconv was added
  /usr/lib/go/src/internal/runtime/strconv/atoi.go was added
  /usr/lib/go/src/internal/runtime/strconv/atoi_test.go was added
  /usr/lib/go/src/internal/runtime/wasitest was added
  /usr/lib/go/src/internal/runtime/wasitest/host_test.go was added
  /usr/lib/go/src/internal/runtime/wasitest/nonblock_test.go was added
  /usr/lib/go/src/internal/runtime/wasitest/tcpecho_test.go was added
  /usr/lib/go/src/internal/syscall/unix/renameat2_sysnum_linux.go was added
  /usr/lib/go/src/internal/syscall/unix/renameat_sysnum_linux.go was added
  /usr/lib/go/src/internal/syscall/unix/utimes.go was added
  /usr/lib/go/src/internal/syscall/unix/utimes_wasip1.go was added
  /usr/lib/go/src/internal/syscall/windows/nonblocking_windows.go was added
  /usr/lib/go/src/internal/testhash was added
  /usr/lib/go/src/internal/testhash/hash.go was added
  /usr/lib/go/src/internal/trace/export_reader_test.go was added
  /usr/lib/go/src/internal/trace/internal/testgen/trace.go was added
  /usr/lib/go/src/internal/trace/internal/tracev1 was added
  /usr/lib/go/src/internal/trace/internal/tracev1/order.go was added
  /usr/lib/go/src/internal/trace/internal/tracev1/parser.go was added
  /usr/lib/go/src/internal/trace/internal/tracev1/parser_test.go was added
  /usr/lib/go/src/internal/trace/tracev1.go was added
  /usr/lib/go/src/internal/trace/tracev1_test.go was added
  /usr/lib/go/src/internal/trace/tracev2 was added
  /usr/lib/go/src/internal/trace/tracev2/doc.go was added
  /usr/lib/go/src/internal/trace/tracev2/events.go was added
  /usr/lib/go/src/internal/trace/tracev2/events_test.go was added
  /usr/lib/go/src/internal/trace/tracev2/EXPERIMENTS.md was added
  /usr/lib/go/src/internal/trace/tracev2/spec.go was added
  /usr/lib/go/src/internal/trace/traceviewer/fakep.go was added
  /usr/lib/go/src/io/fs/readlink.go was added
  /usr/lib/go/src/io/fs/readlink_test.go was added
  /usr/lib/go/src/math/big/arith_amd64_test.go was added
  /usr/lib/go/src/math/big/arithvec_s390x.go was added
  /usr/lib/go/src/math/big/arithvec_s390x.s was added
  /usr/lib/go/src/math/big/calibrate_graph.go was added
  /usr/lib/go/src/math/big/calibrate.md was added
  /usr/lib/go/src/math/big/escape_test.go was added
  /usr/lib/go/src/math/big/internal was added
  /usr/lib/go/src/math/big/internal/asmgen was added
  /usr/lib/go/src/math/big/internal/asmgen/386.go was added
  /usr/lib/go/src/math/big/internal/asmgen/add.go was added
  /usr/lib/go/src/math/big/internal/asmgen/amd64.go was added
  /usr/lib/go/src/math/big/internal/asmgen/arch.go was added
  /usr/lib/go/src/math/big/internal/asmgen/arm64.go was added
  /usr/lib/go/src/math/big/internal/asmgen/arm.go was added
  /usr/lib/go/src/math/big/internal/asmgen/asm.go was added
  /usr/lib/go/src/math/big/internal/asmgen/cheat.go was added
  /usr/lib/go/src/math/big/internal/asmgen/func.go was added
  /usr/lib/go/src/math/big/internal/asmgen/loong64.go was added
  /usr/lib/go/src/math/big/internal/asmgen/main.go was added
  /usr/lib/go/src/math/big/internal/asmgen/main_test.go was added
  /usr/lib/go/src/math/big/internal/asmgen/mips64.go was added
  /usr/lib/go/src/math/big/internal/asmgen/mips.go was added
  /usr/lib/go/src/math/big/internal/asmgen/mul.go was added
  /usr/lib/go/src/math/big/internal/asmgen/pipe.go was added
  /usr/lib/go/src/math/big/internal/asmgen/ppc64.go was added
  /usr/lib/go/src/math/big/internal/asmgen/riscv64.go was added
  /usr/lib/go/src/math/big/internal/asmgen/s390x.go was added
  /usr/lib/go/src/math/big/internal/asmgen/shift.go was added
  /usr/lib/go/src/math/big/natmul.go was added
  /usr/lib/go/src/math/exp_loong64.s was added
  /usr/lib/go/src/net/file_posix.go was added
  /usr/lib/go/src/net/http/csrf.go was added
  /usr/lib/go/src/net/http/csrf_test.go was added
  /usr/lib/go/src/net/http/internal/httpcommon was added
  /usr/lib/go/src/net/http/internal/httpcommon/httpcommon.go was added
  /usr/lib/go/src/net/platform_plan9_test.go was added
  /usr/lib/go/src/net/platform_unix_test.go was added
  /usr/lib/go/src/net/platform_windows_test.go was added
  /usr/lib/go/src/net/sendfile.go was added
  /usr/lib/go/src/net/sendfile_nonwindows.go was added
  /usr/lib/go/src/net/sockoptip4_bsdvar.go was added
  /usr/lib/go/src/net/sockoptip4_linux.go was added
  /usr/lib/go/src/net/sockoptip4_posix_nonlinux.go was added
  /usr/lib/go/src/net/sockoptip4_windows.go was added
  /usr/lib/go/src/net/sockoptip6_posix.go was added
  /usr/lib/go/src/os/file_test.go was added
  /usr/lib/go/src/os/removeall_unix.go was added
  /usr/lib/go/src/os/removeall_windows.go was added
  /usr/lib/go/src/os/root_unix_test.go was added
  /usr/lib/go/src/os/timeout_unix_test.go was added
  /usr/lib/go/src/os/timeout_windows_test.go was added
  /usr/lib/go/src/runtime/cgroup_linux.go was added
  /usr/lib/go/src/runtime/cgroup_linux_test.go was added
  /usr/lib/go/src/runtime/cgroup_stubs.go was added
  /usr/lib/go/src/runtime/gomaxprocs_windows_test.go was added
  /usr/lib/go/src/runtime/libfuzzer_loong64.s was added
  /usr/lib/go/src/runtime/mgcmark_greenteagc.go was added
  /usr/lib/go/src/runtime/mgcmark_nogreenteagc.go was added
  /usr/lib/go/src/runtime/race_loong64.s was added
  /usr/lib/go/src/runtime/race/race_linux_loong64.syso was added
  /usr/lib/go/src/runtime/set_vma_name_linux.go was added
  /usr/lib/go/src/runtime/set_vma_name_stub.go was added
  /usr/lib/go/src/runtime/time_plan9.go was added
  /usr/lib/go/src/runtime/trace/batch.go was added
  /usr/lib/go/src/runtime/trace/encoding.go was added
  /usr/lib/go/src/runtime/trace/flightrecorder.go was added
  /usr/lib/go/src/runtime/trace/flightrecorder_test.go was added
  /usr/lib/go/src/runtime/trace/recorder.go was added
  /usr/lib/go/src/runtime/tracestack_test.go was added
  /usr/lib/go/src/runtime/trace/subscribe.go was added
  /usr/lib/go/src/runtime/trace/subscribe_test.go was added
  /usr/lib/go/src/runtime/valgrind0.go was added
  /usr/lib/go/src/runtime/valgrind_amd64.s was added
  /usr/lib/go/src/runtime/valgrind_arm64.s was added
  /usr/lib/go/src/runtime/valgrind.go was added
  /usr/lib/go/src/strings/iter_test.go was added
  /usr/lib/go/src/testing/synctest/example_test.go was added
  /usr/lib/go/src/testing/synctest/helper_test.go was added
  /usr/lib/go/src/testing/synctest/run.go was added
  /usr/lib/go/src/testing/synctest/synctest_test.go was added
  /usr/lib/go/src/unique/canonmap.go was added
  /usr/lib/go/src/unique/canonmap_test.go was added
  /usr/lib/go/src/vendor/golang.org/x/crypto/internal/poly1305/sum_asm.go was added
  /usr/lib/go/src/vendor/golang.org/x/crypto/internal/poly1305/sum_loong64.s was added
  /usr/lib/go/src/vendor/golang.org/x/sys/cpu/cpu_linux_loong64.go was added
  /usr/lib/go/src/vendor/golang.org/x/sys/cpu/cpu_loong64.s was added
  /usr/lib/go/test/codegen/issue70409.go was added
  /usr/lib/go/test/codegen/issue72832.go was added
  /usr/lib/go/test/codegen/load_type_from_itab.go was added
  /usr/lib/go/test/codegen/multiply.go was added
  /usr/lib/go/test/codegen/schedule.go was added
  /usr/lib/go/test/codegen/unique.go was added
  /usr/lib/go/test/escape6.go was added
  /usr/lib/go/test/escape_iface_data.go was added
  /usr/lib/go/test/escape_make_non_const.go was added
  /usr/lib/go/test/escape_unique.go was added
  /usr/lib/go/test/fixedbugs/issue71184.go was added
  /usr/lib/go/test/fixedbugs/issue71225.go was added
  /usr/lib/go/test/fixedbugs/issue71226.go was added
  /usr/lib/go/test/fixedbugs/issue71759.go was added
  /usr/lib/go/test/fixedbugs/issue72844.go was added
  /usr/lib/go/test/fixedbugs/issue72860.go was added
  /usr/lib/go/test/fixedbugs/issue73180.go was added
  /usr/lib/go/test/fixedbugs/issue73200.go was added
  /usr/lib/go/test/fixedbugs/issue73309b.go was added
  /usr/lib/go/test/fixedbugs/issue73309.go was added
  /usr/lib/go/test/fixedbugs/issue73476.go was added
  /usr/lib/go/test/fixedbugs/issue73476.out was added
  /usr/lib/go/test/fixedbugs/issue73483.go was added
  /usr/lib/go/test/fixedbugs/issue73491.go was added
  /usr/lib/go/test/fixedbugs/issue73716.go was added
  /usr/lib/go/test/fixedbugs/issue73823.go was added
  /usr/lib/go/test/fixedbugs/issue73888b.go was added
  /usr/lib/go/test/fixedbugs/issue73888.go was added
  /usr/lib/go/test/fixedbugs/issue74379b.go was added
  /usr/lib/go/test/fixedbugs/issue74379c.go was added
  /usr/lib/go/test/fixedbugs/issue74379.go was added
  /usr/lib/go/test/prove_popcount.go was added
  /usr/lib/go/doc/go1.17_spec.html was removed
  /usr/lib/go/misc/linkcheck was removed
  /usr/lib/go/misc/linkcheck/linkcheck.go was removed
  /usr/lib/go/pkg/tool/linux_amd64/addr2line was removed
  /usr/lib/go/pkg/tool/linux_amd64/buildid was removed
  /usr/lib/go/pkg/tool/linux_amd64/covdata was removed
  /usr/lib/go/pkg/tool/linux_amd64/doc was removed
  /usr/lib/go/pkg/tool/linux_amd64/fix was removed
  /usr/lib/go/pkg/tool/linux_amd64/nm was removed
  /usr/lib/go/pkg/tool/linux_amd64/objdump was removed
  /usr/lib/go/pkg/tool/linux_amd64/pack was removed
  /usr/lib/go/pkg/tool/linux_amd64/pprof was removed
  /usr/lib/go/pkg/tool/linux_amd64/test2json was removed
  /usr/lib/go/pkg/tool/linux_amd64/trace was removed
  /usr/lib/go/src/cmd/doc/dirs.go was removed
  /usr/lib/go/src/cmd/doc/doc_test.go was removed
  /usr/lib/go/src/cmd/doc/main.go was removed
  /usr/lib/go/src/cmd/doc/pkg.go was removed
  /usr/lib/go/src/cmd/internal/bio/must.go was removed
  /usr/lib/go/src/cmd/vendor/golang.org/x/sync/errgroup/go120.go was removed
  /usr/lib/go/src/cmd/vendor/golang.org/x/sync/errgroup/pre_go120.go was removed
  /usr/lib/go/src/cmd/vendor/golang.org/x/telemetry/counter/countertest/countertest_go121.go was removed
  /usr/lib/go/src/cmd/vendor/golang.org/x/telemetry/internal/crashmonitor/crash_go123.go was removed
  /usr/lib/go/src/crypto/elliptic/nistec_p256.go was removed
  /usr/lib/go/src/crypto/internal/fips140/edwards25519/field/fe_arm64.go was removed
  /usr/lib/go/src/crypto/internal/fips140/edwards25519/field/fe_arm64_noasm.go was removed
  /usr/lib/go/src/crypto/internal/fips140/edwards25519/field/fe_arm64.s was removed
  /usr/lib/go/src/crypto/internal/fips140/hash.go was removed
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_amd64.go was removed
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_arm64.go was removed
  /usr/lib/go/src/crypto/internal/fips140/subtle/xor_ppc64x.go was removed
  /usr/lib/go/src/crypto/sha1/fallback_test.go was removed
  /usr/lib/go/src/crypto/tls/fips_test.go was removed
  /usr/lib/go/src/go/ast/internal was removed
  /usr/lib/go/src/go/ast/internal/tests was removed
  /usr/lib/go/src/go/ast/internal/tests/sortimports_test.go was removed
  /usr/lib/go/src/go/build/zcgo.go was removed
  /usr/lib/go/src/internal/goexperiment/exp_coverageredesign_off.go was removed
  /usr/lib/go/src/internal/goexperiment/exp_coverageredesign_on.go was removed
  /usr/lib/go/src/internal/goexperiment/exp_spinbitmutex_off.go was removed
  /usr/lib/go/src/internal/goexperiment/exp_spinbitmutex_on.go was removed
  /usr/lib/go/src/internal/poll/export_windows_test.go was removed
  /usr/lib/go/src/internal/runtime/maps/runtime_noswiss.go was removed
  /usr/lib/go/src/internal/trace/event was removed
  /usr/lib/go/src/internal/trace/event/event.go was removed
  /usr/lib/go/src/internal/trace/event/go122 was removed
  /usr/lib/go/src/internal/trace/event/go122/event.go was removed
  /usr/lib/go/src/internal/trace/event/requirements.go was removed
  /usr/lib/go/src/internal/trace/internal/oldtrace was removed
  /usr/lib/go/src/internal/trace/internal/oldtrace/order.go was removed
  /usr/lib/go/src/internal/trace/internal/oldtrace/parser.go was removed
  /usr/lib/go/src/internal/trace/internal/oldtrace/parser_test.go was removed
  /usr/lib/go/src/internal/trace/internal/testgen/go122 was removed
  /usr/lib/go/src/internal/trace/internal/testgen/go122/trace.go was removed
  /usr/lib/go/src/internal/trace/oldtrace.go was removed
  /usr/lib/go/src/internal/trace/oldtrace_test.go was removed
  /usr/lib/go/src/internal/trace/parser.go was removed
  /usr/lib/go/src/log/slog/internal/slogtest was removed
  /usr/lib/go/src/log/slog/internal/slogtest/slogtest.go was removed
  /usr/lib/go/src/math/big/arith_decl_s390x.go was removed
  /usr/lib/go/src/net/sendfile_linux.go was removed
  /usr/lib/go/src/net/sendfile_unix_alt.go was removed
  /usr/lib/go/src/net/sockoptip_bsdvar.go was removed
  /usr/lib/go/src/net/sockoptip_linux.go was removed
  /usr/lib/go/src/net/sockoptip_posix.go was removed
  /usr/lib/go/src/net/sockoptip_windows.go was removed
  /usr/lib/go/src/runtime/internal was removed
  /usr/lib/go/src/runtime/internal/startlinetest was removed
  /usr/lib/go/src/runtime/internal/startlinetest/func_amd64.go was removed
  /usr/lib/go/src/runtime/internal/startlinetest/func_amd64.s was removed
  /usr/lib/go/src/runtime/internal/wasitest was removed
  /usr/lib/go/src/runtime/internal/wasitest/host_test.go was removed
  /usr/lib/go/src/runtime/internal/wasitest/nonblock_test.go was removed
  /usr/lib/go/src/runtime/internal/wasitest/tcpecho_test.go was removed
  /usr/lib/go/src/runtime/lock_futex_tristate.go was removed
  /usr/lib/go/src/runtime/lock_sema_tristate.go was removed
  /usr/lib/go/src/runtime/mksizeclasses.go was removed
  /usr/lib/go/src/runtime/sizeclasses.go was removed
  /usr/lib/go/src/runtime/traceexp.go was removed
  /usr/lib/go/src/testing/synctest/context_example_test.go was removed
  /usr/lib/go/src/vendor/golang.org/x/crypto/internal/poly1305/sum_amd64.go was removed
  /usr/lib/go/src/vendor/golang.org/x/crypto/internal/poly1305/sum_ppc64x.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/address.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/binary.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/empty.s was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/interface_announce.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/interface_classic.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/interface_freebsd.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/interface.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/interface_multicast.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/interface_openbsd.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/message.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/route_classic.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/route.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/route_openbsd.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/syscall.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/sys_darwin.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/sys_dragonfly.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/sys_freebsd.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/sys.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/sys_netbsd.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/sys_openbsd.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_darwin.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_dragonfly.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_freebsd_386.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_freebsd_amd64.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_freebsd_arm64.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_freebsd_arm.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_freebsd_riscv64.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_netbsd.go was removed
  /usr/lib/go/src/vendor/golang.org/x/net/route/zsys_openbsd.go was removed

--===============3579317700388887053==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-binary-native-upgrade-1.24.6-1.25.0.patch"

RnJvbSBmM2RiYjFlMTU0NzRiOGUwYThlMGUyMzFlMGI1Njg2OWNkN2M4NWQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDg6MzQ6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
by1iaW5hcnktbmF0aXZlOiB1cGdyYWRlIDEuMjQuNiAtPiAxLjI1LjAKCi0tLQogLi4ue2dvLWJp
bmFyeS1uYXRpdmVfMS4yNC42LmJiID0+IGdvLWJpbmFyeS1uYXRpdmVfMS4yNS4wLmJifSB8IDQg
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby97Z28tYmluYXJ5LW5hdGl2ZV8xLjI0LjYuYmIg
PT4gZ28tYmluYXJ5LW5hdGl2ZV8xLjI1LjAuYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNC42LmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dvL2dvLWJpbmFyeS1uYXRpdmVfMS4yNS4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0
aXZlXzEuMjQuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLWJpbmFy
eS1uYXRpdmVfMS4yNS4wLmJiCmluZGV4IGQ1YzkyYmRlYTUuLjA4YjRiZGNiYzkgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1iaW5hcnktbmF0aXZlXzEuMjQuNi5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tYmluYXJ5LW5hdGl2ZV8xLjI1LjAuYmIK
QEAgLTksOSArOSw3IEBAIFBST1ZJREVTID0gImdvLW5hdGl2ZSIKIAogIyBDaGVja3N1bXMgYXZh
aWxhYmxlIGF0IGh0dHBzOi8vZ28uZGV2L2RsLwogU1JDX1VSSSA9ICJodHRwczovL2RsLmdvb2ds
ZS5jb20vZ28vZ28ke1BWfS4ke0JVSUxEX0dPT1N9LSR7QlVJTERfR09BUkNIfS50YXIuZ3o7bmFt
ZT1nb18ke0JVSUxEX0dPVFVQTEV9IgotU1JDX1VSSVtnb19saW51eF9hbWQ2NC5zaGEyNTZzdW1d
ID0gImJiY2EzN2NjMzk1Yzk3NGZmYTQ4OTNlZTM1ODE5YWQyM2ViYjI3NDI2ZGY4N2FmOTJlOTNh
OWVjNjZlZjg3MTIiCi1TUkNfVVJJW2dvX2xpbnV4X2FybTY0LnNoYTI1NnN1bV0gPSAiMTI0ZWE2
MDMzYThiZjk4YWE5ZmJhYjUzZTU4ZDEzNDkwNTI2MmQ0NWEwMjJhZjNhOTBiNzMzMjBmM2MzYWZk
NSIKLVNSQ19VUklbZ29fbGludXhfcHBjNjRsZS5zaGEyNTZzdW1dID0gIjYzZmM5NTU5YTNkNmRm
ZDYzYWE5MDJmNzE0Mzc1Yjg3OWJiYzg0ODQ2NjE4MWMwMzVjMTIyNDg5Yjk2NDZlMjciCitTUkNf
VVJJW2dvX2xpbnV4X2FtZDY0LnNoYTI1NnN1bV0gPSAiMjg1MmFmMGNiMjBhMTMxMzliMzQ0ODk5
MmU2OWI4NjhlNTBlZDBmOGExZTU5NDBlZTFkZTllMTlhMTIzYjYxMyIKIAogVVBTVFJFQU1fQ0hF
Q0tfVVJJID0gImh0dHBzOi8vZ29sYW5nLm9yZy9kbC8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJnbyg/UDxwdmVyPlxkKyhcLlxkKykrKVwubGludXgiCi0tIAoyLjQ3LjEKCg==

--===============3579317700388887053==--

