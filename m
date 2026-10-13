Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FE7CC6B0E
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 07:08:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1673.1791875288776054721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 00:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y+9c5i2q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xJyBqzV4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a134170a58-995adbc2-447f-4ed4-a97b-2bceb8ea281c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791875287;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/mnMoHaCbfZeG9ELr3POG4CspOCLC3WApGb+Jp0pguY=;
	b=Y+9c5i2qDN0eEAULeWawqYQRTVVJfa1UM467dad3jYKyRRWOkQh6ftmGk32hSAnU
	dwqOR1F4CF01VWUB9yyGWpBWLSa96+6y+cB37NbI9H6uilClrEhG+MHzWWszVRbyX/j
	VPw8uoXJa228u7nGKmEozwbJxHQtx8AAuHAj+92Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791875287;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/mnMoHaCbfZeG9ELr3POG4CspOCLC3WApGb+Jp0pguY=;
	b=xJyBqzV42sQZ6/n8FjsQcpzfyb73f1MLUcLOvCVQSdmEvVADivar9iVepX20pWjF
	rT0y8zUGTkQyyfj2h665O84+gjX76Oe9zrFTUVcBSCgIqoNGo8ihXJc/UteWxfakORA
	bf+BntR2psDYvdLv+3KhcGA39XLG6ZD5ismk5bXs=
Content-Type: multipart/mixed; boundary="===============7748832771710106702=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to 0817afa577428da457b6482c027d7202cd01fcbf
 SUCCEEDED
Message-ID: <010101a134170a58-995adbc2-447f-4ed4-a97b-2bceb8ea281c-000000@us-west-2.amazonses.com>
Date: Tue, 13 Oct 2026 07:08:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.13-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 07:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247698

--===============7748832771710106702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *0817afa577428da457b6482c027d7202cd01fcbf* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gn-upgrade-to-latest-revision.patch
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
From 2a62dcac4c44fd3d619baa2d195b92e36e3ff5b2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 13 Oct 2026 05:44:09 +0000
Subject: [PATCH] gn: upgrade to latest revision

Make StringAtom use pointer equality and hashing
Fix "Ouput" typos
Add no_check_generated_targets .gn variable
Improve the suggestion heuristic for depending on targets.
Do not generate last_commit_position.h in debug builds.
Enable check_includes_strict by default.
Disable rust formatter on main branch.
Add include sorting configuration to .clang-format and reformat
Delayed generated_file() writes if they collect validations metadata
Stop forwarding private hard_deps on check_includes_strict targets
Add `collect_validations_metadata` boolean flag to generated_file() targets.
Add new experimental_collect_validations_metadata .gn variable
Move generated_file() writes to dedicated function.
Avoid canonicalization + string comparisons during metadata collection.
Use internal state struct for Target::GetMetadata().
Fix minor Scheduler data races.
rust: Don't make rlibs depend on non-Rust link inputs
gn edit: keep build files alive for warnings
Add instructions for agent to build GN and run code / tests
Write phony rules for harddeps
Support conditional sources for gn check.
Don't write order-only deps reachable through direct deps
When suggestions have a known includer target, don't complain that they don't
resolve to a single target.
rust_project_writer: Support aliased_deps in rust-project.json
Header check: validate includes before building diagnostics
Header check: defer unrestricted dependency walks
Header check: batch reachability and file checking tasks
Header check: select files from the existing file map
Add an allowlist for allow_circular_includes_from.
[gn] Use std::unordered_map for waiting_map_
[gn] Shard StringAtomSet to avoid lock contention
[gn] Use DCHECK in Target::info()
[gn] Make ResolvedTargetData stateless
[recipe] Enable THP for jemalloc build in GN recipe
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 6e8626dc32..895577e9ce 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
 "
-SRCREV = "cfcd774b98f3433e18b722f9a7ff06119825b8eb"
+SRCREV = "0817afa577428da457b6482c027d7202cd01fcbf"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============7748832771710106702==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSAyYTYyZGNhYzRjNDRmZDNkNjE5YmFhMmQxOTViOTJlMzZlM2ZmNWIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTMgT2N0IDIwMjYgMDU6NDQ6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bjogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCk1ha2UgU3RyaW5nQXRvbSB1c2UgcG9pbnRl
ciBlcXVhbGl0eSBhbmQgaGFzaGluZwpGaXggIk91cHV0IiB0eXBvcwpBZGQgbm9fY2hlY2tfZ2Vu
ZXJhdGVkX3RhcmdldHMgLmduIHZhcmlhYmxlCkltcHJvdmUgdGhlIHN1Z2dlc3Rpb24gaGV1cmlz
dGljIGZvciBkZXBlbmRpbmcgb24gdGFyZ2V0cy4KRG8gbm90IGdlbmVyYXRlIGxhc3RfY29tbWl0
X3Bvc2l0aW9uLmggaW4gZGVidWcgYnVpbGRzLgpFbmFibGUgY2hlY2tfaW5jbHVkZXNfc3RyaWN0
IGJ5IGRlZmF1bHQuCkRpc2FibGUgcnVzdCBmb3JtYXR0ZXIgb24gbWFpbiBicmFuY2guCkFkZCBp
bmNsdWRlIHNvcnRpbmcgY29uZmlndXJhdGlvbiB0byAuY2xhbmctZm9ybWF0IGFuZCByZWZvcm1h
dApEZWxheWVkIGdlbmVyYXRlZF9maWxlKCkgd3JpdGVzIGlmIHRoZXkgY29sbGVjdCB2YWxpZGF0
aW9ucyBtZXRhZGF0YQpTdG9wIGZvcndhcmRpbmcgcHJpdmF0ZSBoYXJkX2RlcHMgb24gY2hlY2tf
aW5jbHVkZXNfc3RyaWN0IHRhcmdldHMKQWRkIGBjb2xsZWN0X3ZhbGlkYXRpb25zX21ldGFkYXRh
YCBib29sZWFuIGZsYWcgdG8gZ2VuZXJhdGVkX2ZpbGUoKSB0YXJnZXRzLgpBZGQgbmV3IGV4cGVy
aW1lbnRhbF9jb2xsZWN0X3ZhbGlkYXRpb25zX21ldGFkYXRhIC5nbiB2YXJpYWJsZQpNb3ZlIGdl
bmVyYXRlZF9maWxlKCkgd3JpdGVzIHRvIGRlZGljYXRlZCBmdW5jdGlvbi4KQXZvaWQgY2Fub25p
Y2FsaXphdGlvbiArIHN0cmluZyBjb21wYXJpc29ucyBkdXJpbmcgbWV0YWRhdGEgY29sbGVjdGlv
bi4KVXNlIGludGVybmFsIHN0YXRlIHN0cnVjdCBmb3IgVGFyZ2V0OjpHZXRNZXRhZGF0YSgpLgpG
aXggbWlub3IgU2NoZWR1bGVyIGRhdGEgcmFjZXMuCnJ1c3Q6IERvbid0IG1ha2UgcmxpYnMgZGVw
ZW5kIG9uIG5vbi1SdXN0IGxpbmsgaW5wdXRzCmduIGVkaXQ6IGtlZXAgYnVpbGQgZmlsZXMgYWxp
dmUgZm9yIHdhcm5pbmdzCkFkZCBpbnN0cnVjdGlvbnMgZm9yIGFnZW50IHRvIGJ1aWxkIEdOIGFu
ZCBydW4gY29kZSAvIHRlc3RzCldyaXRlIHBob255IHJ1bGVzIGZvciBoYXJkZGVwcwpTdXBwb3J0
IGNvbmRpdGlvbmFsIHNvdXJjZXMgZm9yIGduIGNoZWNrLgpEb24ndCB3cml0ZSBvcmRlci1vbmx5
IGRlcHMgcmVhY2hhYmxlIHRocm91Z2ggZGlyZWN0IGRlcHMKV2hlbiBzdWdnZXN0aW9ucyBoYXZl
IGEga25vd24gaW5jbHVkZXIgdGFyZ2V0LCBkb24ndCBjb21wbGFpbiB0aGF0IHRoZXkgZG9uJ3QK
cmVzb2x2ZSB0byBhIHNpbmdsZSB0YXJnZXQuCnJ1c3RfcHJvamVjdF93cml0ZXI6IFN1cHBvcnQg
YWxpYXNlZF9kZXBzIGluIHJ1c3QtcHJvamVjdC5qc29uCkhlYWRlciBjaGVjazogdmFsaWRhdGUg
aW5jbHVkZXMgYmVmb3JlIGJ1aWxkaW5nIGRpYWdub3N0aWNzCkhlYWRlciBjaGVjazogZGVmZXIg
dW5yZXN0cmljdGVkIGRlcGVuZGVuY3kgd2Fsa3MKSGVhZGVyIGNoZWNrOiBiYXRjaCByZWFjaGFi
aWxpdHkgYW5kIGZpbGUgY2hlY2tpbmcgdGFza3MKSGVhZGVyIGNoZWNrOiBzZWxlY3QgZmlsZXMg
ZnJvbSB0aGUgZXhpc3RpbmcgZmlsZSBtYXAKQWRkIGFuIGFsbG93bGlzdCBmb3IgYWxsb3dfY2ly
Y3VsYXJfaW5jbHVkZXNfZnJvbS4KW2duXSBVc2Ugc3RkOjp1bm9yZGVyZWRfbWFwIGZvciB3YWl0
aW5nX21hcF8KW2duXSBTaGFyZCBTdHJpbmdBdG9tU2V0IHRvIGF2b2lkIGxvY2sgY29udGVudGlv
bgpbZ25dIFVzZSBEQ0hFQ0sgaW4gVGFyZ2V0OjppbmZvKCkKW2duXSBNYWtlIFJlc29sdmVkVGFy
Z2V0RGF0YSBzdGF0ZWxlc3MKW3JlY2lwZV0gRW5hYmxlIFRIUCBmb3IgamVtYWxsb2MgYnVpbGQg
aW4gR04gcmVjaXBlCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5iYiB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ24vZ25fZ2l0LmJiCmluZGV4IDZlODYyNmRjMzIuLjg5NTU3N2U5Y2UgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2duL2duX2dpdC5iYgpAQCAtOCw3ICs4LDcgQEAgVVBTVFJFQU1fQ0hFQ0tf
Q09NTUlUUyA9ICIxIgogCiBTUkNfVVJJID0gImdpdDovL2duLmdvb2dsZXNvdXJjZS5jb20vZ247
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogIgotU1JDUkVWID0gImNmY2Q3NzRiOThmMzQz
M2UxOGI3MjJmOWE3ZmYwNjExOTgyNWI4ZWIiCitTUkNSRVYgPSAiMDgxN2FmYTU3NzQyOGRhNDU3
YjY0ODJjMDI3ZDcyMDJjZDAxZmNiZiIKIFBWID0gIjArZ2l0IgogCiBCQl9HSVRfU0hBTExPVyA9
ICIiCi0tIAoyLjQ3LjEKCg==

--===============7748832771710106702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1992 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-1620df10631579bc692ce5375f1bbcfc66f6f1b4"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:1620df10631579bc692ce5375f1bbcfc66f6f1b4"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 209 Local 198 Mirrors 0 Missed 11 Current 145 (94% match, 96% complete)
done.
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 8 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 224 of 354 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 239 of 354 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 243 of 354 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_create_spdx_setscene)
NOTE: Running task 385 of 990 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_fetch)
NOTE: recipe gn-0+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gn-0+git-r0: task do_fetch: Started
NOTE: recipe glibc-2.44+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ninja-native-1.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gn-0+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ninja-native-1.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 276 of 354 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.44+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 287 of 354 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ninja-native-1.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 308 of 354 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ninja-native-1.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 343 of 354 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/re2c/re2c_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 354 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ninja-native-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe re2c-native-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ninja-native-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe re2c-native-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 347 of 354 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/re2c/re2c_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe re2c-native-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe re2c-native-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 349 of 354 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 354 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 354 of 354 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gn-0+git-r0: task do_fetch: Succeeded
NOTE: Running task 973 of 990 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_unpack)
NOTE: Running task 974 of 990 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gn-0+git-r0: task do_unpack: Started
NOTE: recipe gn-0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gn-0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gn-0+git-r0: task do_unpack: Succeeded
NOTE: Running task 975 of 990 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_patch)
NOTE: recipe gn-0+git-r0: task do_patch: Started
NOTE: recipe gn-0+git-r0: task do_patch: Succeeded
NOTE: Running task 976 of 990 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 977 of 990 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_lic)
NOTE: recipe gn-0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gn-0+git-r0: task do_populate_lic: Started
NOTE: recipe gn-0+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_lic unihash changed to 32e669a88727ba263a70b54286ad69cf4555b4e66cecdf2c8872bb05d50a2cf6
NOTE: recipe gn-0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 978 of 990 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_configure)
NOTE: recipe gn-0+git-r0: task do_configure: Started
NOTE: recipe gn-0+git-r0: task do_configure: Succeeded
NOTE: Running task 979 of 990 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_compile)
NOTE: recipe gn-0+git-r0: task do_compile: Started
NOTE: recipe gn-0+git-r0: task do_compile: Succeeded
NOTE: Running task 980 of 990 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_install)
NOTE: recipe gn-0+git-r0: task do_install: Started
NOTE: recipe gn-0+git-r0: task do_install: Succeeded
NOTE: Running task 981 of 990 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_package)
NOTE: Running task 982 of 990 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_sysroot)
NOTE: recipe gn-0+git-r0: task do_populate_sysroot: Started
NOTE: recipe gn-0+git-r0: task do_package: Started
NOTE: recipe gn-0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_sysroot unihash changed to 576576634539b0ff0d2ed748599481f5ea3dd753e7812753d7f953cc73fbc7a2
NOTE: Setscene tasks completed
NOTE: recipe gn-0+git-r0: task do_package: Succeeded
NOTE: Running task 983 of 990 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata)
NOTE: recipe gn-0+git-r0: task do_packagedata: Started
NOTE: recipe gn-0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 983 tasks of which 971 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261013054235.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261013054235.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gn/0+git/temp/log.do_packagedata.2059184
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-src went backwards which would break package feeds (from 0:0+git0+cfcd774b98-r0 to 0:0+git0+0817afa577-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-dbg went backwards which would break package feeds (from 0:0+git0+cfcd774b98-r0 to 0:0+git0+0817afa577-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-staticdev went backwards which would break package feeds (from 0:0+git0+cfcd774b98-r0 to 0:0+git0+0817afa577-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-dev went backwards which would break package feeds (from 0:0+git0+cfcd774b98-r0 to 0:0+git0+0817afa577-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-doc went backwards which would break package feeds (from 0:0+git0+cfcd774b98-r0 to 0:0+git0+0817afa577-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-locale went backwards which would break package feeds (from 0:0+git0+cfcd774b98-r0 to 0:0+git0+0817afa577-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn went backwards which would break package feeds (from 0:0+git0+cfcd774b98-r0 to 0:0+git0+0817afa577-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gn/0+git/temp/log.do_packagedata.2059184
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata) failed with exit code '1'

--===============7748832771710106702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="gn-changelog.txt"

Make StringAtom use pointer equality and hashing
Fix "Ouput" typos
Add no_check_generated_targets .gn variable
Improve the suggestion heuristic for depending on targets.
Do not generate last_commit_position.h in debug builds.
Enable check_includes_strict by default.
Disable rust formatter on main branch.
Add include sorting configuration to .clang-format and reformat
Delayed generated_file() writes if they collect validations metadata
Stop forwarding private hard_deps on check_includes_strict targets
Add `collect_validations_metadata` boolean flag to generated_file() targets.
Add new experimental_collect_validations_metadata .gn variable
Move generated_file() writes to dedicated function.
Avoid canonicalization + string comparisons during metadata collection.
Use internal state struct for Target::GetMetadata().
Fix minor Scheduler data races.
rust: Don't make rlibs depend on non-Rust link inputs
gn edit: keep build files alive for warnings
Add instructions for agent to build GN and run code / tests
Write phony rules for harddeps
Support conditional sources for gn check.
Don't write order-only deps reachable through direct deps
When suggestions have a known includer target, don't complain that they don't
resolve to a single target.
rust_project_writer: Support aliased_deps in rust-project.json
Header check: validate includes before building diagnostics
Header check: defer unrestricted dependency walks
Header check: batch reachability and file checking tasks
Header check: select files from the existing file map
Add an allowlist for allow_circular_includes_from.
[gn] Use std::unordered_map for waiting_map_
[gn] Shard StringAtomSet to avoid lock contention
[gn] Use DCHECK in Target::info()
[gn] Make ResolvedTargetData stateless
[recipe] Enable THP for jemalloc build in GN recipe

--===============7748832771710106702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+cfcd774b98 to 0+git0+0817afa577
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 114538736 to 115707152 (+1%)
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+cfcd774b98 to 0+git0+0817afa577
packages/x86-64-v3-poky-linux/gn/gn-dev: RRECOMMENDS: removed "gn (['= 0+git0+cfcd774b98-r0'])", added "gn (['= 0+git0+0817afa577-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+cfcd774b98 to 0+git0+0817afa577
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+cfcd774b98 to 0+git0+0817afa577
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+cfcd774b98 to 0+git0+0817afa577
packages/x86-64-v3-poky-linux/gn/gn-src: PKGSIZE changed from 3380363 to 3422257 (+1%)
packages/x86-64-v3-poky-linux/gn/gn-src: FILELIST: added "/usr/src/debug/gn/0+git/src/gn/generated_file_writer.h /usr/src/debug/gn/0+git/src/gn/generated_file_writer.cc"
packages/x86-64-v3-poky-linux/gn/gn-staticdev: RDEPENDS: removed "gn-dev (['= 0+git0+cfcd774b98-r0'])", added "gn-dev (['= 0+git0+0817afa577-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+cfcd774b98 to 0+git0+0817afa577
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+cfcd774b98 to 0+git0+0817afa577
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 4358376 to 4362472 (+0%)

--===============7748832771710106702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+cfcd774b98 to 0+git0+0817afa577
packages/x86-64-v3-poky-linux/gn/gn-dev: RRECOMMENDS: removed "gn (['= 0+git0+cfcd774b98-r0'])", added "gn (['= 0+git0+0817afa577-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+cfcd774b98 to 0+git0+0817afa577
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+cfcd774b98 to 0+git0+0817afa577
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+cfcd774b98 to 0+git0+0817afa577
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+cfcd774b98 to 0+git0+0817afa577
packages/x86-64-v3-poky-linux/gn/gn-staticdev: RDEPENDS: removed "gn-dev (['= 0+git0+cfcd774b98-r0'])", added "gn-dev (['= 0+git0+0817afa577-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+cfcd774b98 to 0+git0+0817afa577
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+cfcd774b98 to 0+git0+0817afa577

--===============7748832771710106702==--

