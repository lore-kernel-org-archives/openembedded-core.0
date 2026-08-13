Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F900C5CFCF
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 05:55:59 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12998.1786600554732232898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 22:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ISj4dA3W;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cxNJ8WEk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019ff9b0fd0e-3db81860-d6a9-4d1a-852e-e17a69faca4b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786600553;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=wrp0X3K+UcBxpEa5G0BccPnjL1D73f0dJTQAc6HUL1s=;
	b=ISj4dA3WSuoqIgrO7Zu8lQiGR8CIs0oNZ94Rd9blncsMglKk8jXeWBUGdhlLTff0
	CgVqQQuQtBNNdmKt2Fg3XqX+XAosmCyiZMiOlRiQbo8cWmT+2WAaiXAF/GtsRNmz+X6
	LgYP1GvqMEzxIX56Eq+wqzD8QRlNFARsc0v9AsnU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786600553;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=wrp0X3K+UcBxpEa5G0BccPnjL1D73f0dJTQAc6HUL1s=;
	b=cxNJ8WEkkoBS5BsxU5LjiqE3fvMFAagcM0LownE7oSW//a4CbYzWxJFokKYkIwJZ
	n0nb9JyENat/qJY6IWfp9Tn523gL6UC307Y/zIIpUPpMXOp6szdRzm4DXY4ql8dPWpq
	z9c+qb1x0TOxYXLU+WtyiCWDrO2bVgd4Okx/pUE0=
Content-Type: multipart/mixed; boundary="===============2412458096093140857=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] boost-build-native: upgrading to 1.92.0 SUCCEEDED
Message-ID: <0101019ff9b0fd0e-3db81860-d6a9-4d1a-852e-e17a69faca4b-000000@us-west-2.amazonses.com>
Date: Thu, 13 Aug 2026 05:55:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.13-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 05:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243329

--===============2412458096093140857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *boost-build-native* to *1.92.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-boost-build-native-upgrade-1.91.0-1.92.0.patch
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
From 356dfda433ea0c6d1bbc3cba18657dfecf5a8d9f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 13 Aug 2026 05:46:36 +0000
Subject: [PATCH] boost-build-native: upgrade 1.91.0 -> 1.92.0

05b6b638b Merge remote-tracking branch 'bfgroup.b2/release' into develop
cf13ad0ea Bump and doc for version 5.5.3.
26ad6ed14 Fix using ccache with clang-linux toolset  (#605)
6a09df528 Merge remote-tracking branch 'bfgroup.b2/release' into develop
10d899da5 Fix grep stalling randomly.
bf3810199 Mark and note 5.5.2 patch release.
8e77291db Fix early exit of group tasks.
f73986332 Fix use of obsolete/deprecated `-single_module` option in darwin/mscOS tooling.
f53a50ecd Pick llvm ar when using clang when possible (#602)
e5c46cf90 Use nfs share for freebsd to hopefully get back the results.
bbf46b6a2 Add freebsd portable package.build.
9d66d9c74 Merge remote-tracking branch 'bfgroup.b2/release' into develop
c695f7644 Fix 5.5.1 release note.
3654ef73c Don't bother with GhostBSD testing.
234b64b50 Fix args error in pyton config when ldd errors.
7454adf1e Merge remote-tracking branch 'bfgroup.b2/release' into develop
04477614d Fix portable installer release procedure.
44d411365 Release 5.5.0 (and gix note typo).
f2261c2c0 Final note for 5.5.0 release. [skip ci]
ce8d821e2 Make the linux/macos install builds run on preleases also.
75cc92246 Basic support for bootstrap and detection of filc.
65c6f353f Update tested compilers/OS.
0ef020e61 Fixed 2 compiler warnings emitted from ./bootstrap.sh --cxx=g++
50f853546 Experimental "version" feature type.
e3330f4e7 build/property-set.jam review
797b4e1aa util/order.jam (and engine/mod_order.cpp) review
a034fe4a1 util/sequence.jam review
557c39710 fixed builtin SUBST rule (fix #571)
963c4d2cc Documentation maintenance.
2f98c4e56 Fix quoting in os conditions.
d9cb9f6da Fix vm action switch.
fb4520c5a Account for slow running tests that timeout.
88dd81a6a Simplify sans-arm-gcc to just the exclude.
1ca606270 Remove broken riscv64 and try and skip arm-gcc.
7007c70de And yet another attempt at aarch64 and riscv64 FreeBSD testing.
d91813523 Another attempt at aarch64 and riscv64 FreeBSD testing.
5042c6728 Add aarch64 and riscv64 FreeBSD testing.
35b66b67a Add GHA BSD.
eee99b2d6 more on debugger-mi.py (and TestCmd.py)
d3cf31214 build/project.jam review
d88176e2c Rework delay logic in various tests to be consistent.
cf28fdac7 Refactor output (err) functions.
1d97d3684 Set correct setup-msys2 action version.
e814dab4f Remove no longer supported mingw32 system from testing.
7d3db3ae2 Can't do static builds on macos.
f42911a16 Add macos portable binaries.
e491d8292 Add linux arm portable exec "installer".
adfc4ef04 Fix warning/error for unintialized read of LOL elements.
9e226c3c1 CI: Update tested compilers, and add Boost 1.91.
0804facea Avoid unused var warning.
aeefaf131 Args and regex.escape change notes.
ddebdf20e Fix multi-string command-db capture.
ba64d01f5 Change regex.escape to accept a list of strings to escape.
ee10ed930 Fix missing native rule arg checking.
5a6943dbf Fix path to checksum file. [skip ci]
cf45ffd41 CI debugging [skip ci]
8a8f33165 Fix paths to generated archive [skip ci]
d0c10531d CI debugging [ski

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...oost-build-native_1.91.0.bb => boost-build-native_1.92.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-build-native_1.91.0.bb => boost-build-native_1.92.0.bb} (92%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.91.0.bb b/meta/recipes-support/boost/boost-build-native_1.92.0.bb
similarity index 92%
rename from meta/recipes-support/boost/boost-build-native_1.91.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.92.0.bb
index c276cf436d..008bdacf5e 100644
--- a/meta/recipes-support/boost/boost-build-native_1.91.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.92.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master;tag=boost-${PV}"
-SRCREV = "85252c9d6a3817daca23ddae94ce16c7be4d2c12"
+SRCREV = "05b6b638b54e1f013fb8b281f5020e337be31363"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"
-- 
2.47.1


--===============2412458096093140857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86_64-linux/boost-build-native (sysroot):
  /usr/share/b2/src/tools/brotli.jam was added
  /usr/share/b2/src/tools/filc.jam was added

--===============2412458096093140857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="boost-build-native-changelog.txt"

Changelog for boost-build-native: 1.91.0 -> 1.92.0

05b6b638b Merge remote-tracking branch 'bfgroup.b2/release' into develop
cf13ad0ea Bump and doc for version 5.5.3.
26ad6ed14 Fix using ccache with clang-linux toolset  (#605)
6a09df528 Merge remote-tracking branch 'bfgroup.b2/release' into develop
10d899da5 Fix grep stalling randomly.
bf3810199 Mark and note 5.5.2 patch release.
8e77291db Fix early exit of group tasks.
f73986332 Fix use of obsolete/deprecated `-single_module` option in darwin/mscOS tooling.
f53a50ecd Pick llvm ar when using clang when possible (#602)
e5c46cf90 Use nfs share for freebsd to hopefully get back the results.
bbf46b6a2 Add freebsd portable package.build.
9d66d9c74 Merge remote-tracking branch 'bfgroup.b2/release' into develop
c695f7644 Fix 5.5.1 release note.
3654ef73c Don't bother with GhostBSD testing.
234b64b50 Fix args error in pyton config when ldd errors.
7454adf1e Merge remote-tracking branch 'bfgroup.b2/release' into develop
04477614d Fix portable installer release procedure.
44d411365 Release 5.5.0 (and gix note typo).
f2261c2c0 Final note for 5.5.0 release. [skip ci]
ce8d821e2 Make the linux/macos install builds run on preleases also.
75cc92246 Basic support for bootstrap and detection of filc.
65c6f353f Update tested compilers/OS.
0ef020e61 Fixed 2 compiler warnings emitted from ./bootstrap.sh --cxx=g++
50f853546 Experimental "version" feature type.
e3330f4e7 build/property-set.jam review
797b4e1aa util/order.jam (and engine/mod_order.cpp) review
a034fe4a1 util/sequence.jam review
557c39710 fixed builtin SUBST rule (fix #571)
963c4d2cc Documentation maintenance.
2f98c4e56 Fix quoting in os conditions.
d9cb9f6da Fix vm action switch.
fb4520c5a Account for slow running tests that timeout.
88dd81a6a Simplify sans-arm-gcc to just the exclude.
1ca606270 Remove broken riscv64 and try and skip arm-gcc.
7007c70de And yet another attempt at aarch64 and riscv64 FreeBSD testing.
d91813523 Another attempt at aarch64 and riscv64 FreeBSD testing.
5042c6728 Add aarch64 and riscv64 FreeBSD testing.
35b66b67a Add GHA BSD.
eee99b2d6 more on debugger-mi.py (and TestCmd.py)
d3cf31214 build/project.jam review
d88176e2c Rework delay logic in various tests to be consistent.
cf28fdac7 Refactor output (err) functions.
1d97d3684 Set correct setup-msys2 action version.
e814dab4f Remove no longer supported mingw32 system from testing.
7d3db3ae2 Can't do static builds on macos.
f42911a16 Add macos portable binaries.
e491d8292 Add linux arm portable exec "installer".
adfc4ef04 Fix warning/error for unintialized read of LOL elements.
9e226c3c1 CI: Update tested compilers, and add Boost 1.91.
0804facea Avoid unused var warning.
aeefaf131 Args and regex.escape change notes.
ddebdf20e Fix multi-string command-db capture.
ba64d01f5 Change regex.escape to accept a list of strings to escape.
ee10ed930 Fix missing native rule arg checking.
5a6943dbf Fix path to checksum file. [skip ci]
cf45ffd41 CI debugging [skip ci]
8a8f33165 Fix paths to generated archive [skip ci]
d0c10531d CI debugging [skip ci]
a37fc0bb3 Fix matching for files to upload for linux build.
46867569a Call correct bootstrap in linux install.
224132aca Add build+package for linux exec.
6f387581a Add b2-release target for standalone and portable b2.
3a9c9fe43 Update Lyra to 1.8.0.
7229fd731 Update nlohmann json to 3.12.0.
0f952148c add brotli.jam (#552)
ac2c65ad6 Tighten feature=value parsing CLI args.
4d3057876 build-system.jam review et al
0f1eed420 Fix option parsing conflict with build request.
09fd2d4bd Add VS-2026 testing.
fc07a6f98 Fix occasional rescan_header test errors.
8430b98ec Minor improvements to jam files
ef3e3f046 Minor cleanup of bindjam.h and mp.h.
60681b3a6 Fixed and restored test/debugger-mi test.
c972623c8 Implement reading JSON data into property_db.
36e4bc67c Add `starts_with` and `pop_back` to `list_(c)ref`
1b73b49c2 Add bind marshalling for `unsigned long`.
a692e3025 Use stable number to_string formatting for values.
cd5bd5d53 Change list_cmp to use value type specific compares.
a5d6951bf util/numbers.jam review
baca2756e better error message from Tester.read (fix #572)
9658ccea8 Added support for BSD ar extended filename to GLOB_ARCHIVE builtin rule.
a15c7c74e Fixed feature.minimize call with unexpanded properties.
9e05d5e46 Fix python linking to missing libutil.
8063989ac Fix macOS/BSD hangs for parallel grep.
8bd19190c fixed crashes in mod_db (#563)
380a9ce50 fixed missing JAMUNAME on LINUX (#561)
c5257a26b documentation maintanence (#560)
801e585cb let HDRRULE work with build system too (fix #502)
1874e742b optimized test/link.py
426f0e91f fixed default jobs on testing (fixes #556)
61d83a1cb Add pr branches to AZP Ci testing.
c48c11fb8 Remove unused/extra file.
c31f2f53a fixed test/default_toolset.py
27f46350c targets.jam (and project.jam, property-set.jam) review
58656045d Fix search for clang-win assembler.
7474224f6 Increment latest windows image to try and resolve missing llvm assembler.
6cca1b00d Print test value directly to avoid unreadable binary print.
64edbd4c7 Tighten spacing for code blocks.
935111aef [HARDENING] Limit backport initiation to repo collaborators.
995da7c32 md5 updated for proper usage of C compatibility
5f49bc595 More cleanups of tests and jam code.
509c328c8 Various documentation/help cleanups.
8ca50e6a5 Update fil-c version.
d009ba92b Switch to forked and working docker-run-action for QEMU tests.
db868c3b7 Fixed test/core_multifile_actions.py, fix #164
ab806fe14 Fix typo (#546)
a4848c347 engine's headers review
ca718213c Add pr branches to CI.
437f027e2 md5 updated to use C++ std headers and linking (#533)
72934feec let git ignore Makefile and object files (#531)
861787156 Add note for empty env var fix.
708353cde Fix crash in var_defines when define string is empty (#535)
b3b3d4e62 new C++ outerr module and error format (#539)
c92215864 Fix flag arguments (#538)
3e6e5ca74 Fix `--abbreviate-paths` eating following arg.
a6d3ca875 Limit macOS on azp tests to 30 minutes to not waste as much time on the stalled tests.
11e6bf34d Missed some incorrect uses of string_view::size as value instead of function.
7bb8df3d2 Some cleanup of value type.
63dac68e0 Revert "Replace kludgy value::str_view with real string_view (Boost version)."
7e5031d05 Replace kludgy value::str_view with real string_view (Boost version).
93f912636 Clang 11 no longer available in FreeBSD.
1c702c00b documentation maintenance (#530)
e1983b7b2 documentation maintenance (#527)
8d0d3f5db added documentation for GLOB_RECURSIVELY, (#520)
0b0516437 Note for stack clean functions. [skip ci]
2ff317859 Fix arguments mismatch for stack item cleanup functions.
9655c801f Do the fil-c test as debug to get better problem info.
fa4eea08e No vfork in filc.
4eb0d5044 Fix lang option.
8f838d893 Get predefs for filc to adjust jam.h config.
55520a0e4 Annoyingly we need to "interact" with the filc setup script.
af556ff2a Run filv setup as root.
771f9aba6 Use full filc opt distro to resolve missing libc functions.
64dcee74e Fix b2 work dirs for the tests.
fbf002343 Fix extract location refs.
8e54d5708 Add basic CI testing with Fil-C.
c7eb116ac Add note for regex fixes/improvements. [skip ci]
6db262ae4 portable EOL matching test added in  match_list.py (#524)
26db65127 util/doc.jam regexp review
ea7c7695f build/generators.jam, tools/borland.jam, and
9e314e9a2 tools/intel-vxworks.jam regex review
36ff9cc4d Fix again intel-darwin.jam
268dae1e1 util/option.jam regexp review
5178c5157 tools/embarcadero.jam regexp review
d0abf86d1 tools/cray.jam regexp review
40bde8c47 tools/mpi.jam regexp review
0c83d785b tools/python.jam regexp review
53483799c simpler error format and more consistent backtrace (#512)
740f8df11 tools/stage.jam regexp review (#506)
49a1ca22c tools/intel-darwin.jam regexp review (#514)
2d4784375 tools/testing.jam regexp review (#513)
cc7ac5710 tools/common.jam regexp review (#509)
1e061c6f3 tools/stlport.jam regexp review (#508)
02b5e1914 tools/intel-win.jam regexp review (#507)
600a06395 build-system.jam regexp review (#505)
166cea089 partially revert of #500 build/build-request.jam regexp review (#511)
cab306244 tools/asciidoctor.jam regexp review (#504)
d3f44381a tools/qt4.jam, tools/qt5.jam, test/qt4/jamroot.jam regexp review (#503)
fec822cdb tools/types/register.jam regexp review (#501)
b54c02a57 build/feature.jam and build/build-request.jam regexp review (#500)
ee02ebeed tools/msvc.jam regexp review (#499)
c4ba45209 tools/python.jam regexp review, et al... (#498)
f78db523e discontinued HDRMACRO and NOTIME builtin rules, (#496)
7790d6f13 fixed b2::value::has_value (#497)
d9946f077 let regex regerror() always exit with error, (#495)
45ca9187c __init_features|generators__.jam regexp review (#494)
5dcb3c881 build/toolset.jam regexp review (#493)
a16fd86e3 enabling runtime argument checking for free (part 3) (#492)
29ec63872 Regular expressions does not crash anymore (cont) (#490)
d82f4263b New test for regular expression match_list.py (#491)
ce5309a17 flaw in b2::bind::operator+ fixed (#485)
e64dc99a5 Bump version to 5.5.0.

--===============2412458096093140857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/boost-build-native (sysroot):
  /usr/share/b2/src/tools/brotli.jam was added
  /usr/share/b2/src/tools/filc.jam was added

--===============2412458096093140857==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-boost-build-native-upgrade-1.91.0-1.92.0.patch"

RnJvbSAzNTZkZmRhNDMzZWEwYzZkMWJiYzNjYmExODY1N2RmZWNmNWE4ZDlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTMgQXVnIDIwMjYgMDU6NDY6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
b29zdC1idWlsZC1uYXRpdmU6IHVwZ3JhZGUgMS45MS4wIC0+IDEuOTIuMAoKMDViNmI2MzhiIE1l
cmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ2JmZ3JvdXAuYjIvcmVsZWFzZScgaW50byBkZXZl
bG9wCmNmMTNhZDBlYSBCdW1wIGFuZCBkb2MgZm9yIHZlcnNpb24gNS41LjMuCjI2YWQ2ZWQxNCBG
aXggdXNpbmcgY2NhY2hlIHdpdGggY2xhbmctbGludXggdG9vbHNldCAgKCM2MDUpCjZhMDlkZjUy
OCBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdiZmdyb3VwLmIyL3JlbGVhc2UnIGludG8g
ZGV2ZWxvcAoxMGQ4OTlkYTUgRml4IGdyZXAgc3RhbGxpbmcgcmFuZG9tbHkuCmJmMzgxMDE5OSBN
YXJrIGFuZCBub3RlIDUuNS4yIHBhdGNoIHJlbGVhc2UuCjhlNzcyOTFkYiBGaXggZWFybHkgZXhp
dCBvZiBncm91cCB0YXNrcy4KZjczOTg2MzMyIEZpeCB1c2Ugb2Ygb2Jzb2xldGUvZGVwcmVjYXRl
ZCBgLXNpbmdsZV9tb2R1bGVgIG9wdGlvbiBpbiBkYXJ3aW4vbXNjT1MgdG9vbGluZy4KZjUzYTUw
ZWNkIFBpY2sgbGx2bSBhciB3aGVuIHVzaW5nIGNsYW5nIHdoZW4gcG9zc2libGUgKCM2MDIpCmU1
YzQ2Y2Y5MCBVc2UgbmZzIHNoYXJlIGZvciBmcmVlYnNkIHRvIGhvcGVmdWxseSBnZXQgYmFjayB0
aGUgcmVzdWx0cy4KYmJmNDZiNmEyIEFkZCBmcmVlYnNkIHBvcnRhYmxlIHBhY2thZ2UuYnVpbGQu
CjlkNjZkOWM3NCBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdiZmdyb3VwLmIyL3JlbGVh
c2UnIGludG8gZGV2ZWxvcApjNjk1Zjc2NDQgRml4IDUuNS4xIHJlbGVhc2Ugbm90ZS4KMzY1NGVm
NzNjIERvbid0IGJvdGhlciB3aXRoIEdob3N0QlNEIHRlc3RpbmcuCjIzNGI2NGI1MCBGaXggYXJn
cyBlcnJvciBpbiBweXRvbiBjb25maWcgd2hlbiBsZGQgZXJyb3JzLgo3NDU0YWRmMWUgTWVyZ2Ug
cmVtb3RlLXRyYWNraW5nIGJyYW5jaCAnYmZncm91cC5iMi9yZWxlYXNlJyBpbnRvIGRldmVsb3AK
MDQ0Nzc2MTRkIEZpeCBwb3J0YWJsZSBpbnN0YWxsZXIgcmVsZWFzZSBwcm9jZWR1cmUuCjQ0ZDQx
MTM2NSBSZWxlYXNlIDUuNS4wIChhbmQgZ2l4IG5vdGUgdHlwbykuCmYyMjYxYzJjMCBGaW5hbCBu
b3RlIGZvciA1LjUuMCByZWxlYXNlLiBbc2tpcCBjaV0KY2U4ZDgyMWUyIE1ha2UgdGhlIGxpbnV4
L21hY29zIGluc3RhbGwgYnVpbGRzIHJ1biBvbiBwcmVsZWFzZXMgYWxzby4KNzVjYzkyMjQ2IEJh
c2ljIHN1cHBvcnQgZm9yIGJvb3RzdHJhcCBhbmQgZGV0ZWN0aW9uIG9mIGZpbGMuCjY1YzZmMzUz
ZiBVcGRhdGUgdGVzdGVkIGNvbXBpbGVycy9PUy4KMGVmMDIwZTYxIEZpeGVkIDIgY29tcGlsZXIg
d2FybmluZ3MgZW1pdHRlZCBmcm9tIC4vYm9vdHN0cmFwLnNoIC0tY3h4PWcrKwo1MGY4NTM1NDYg
RXhwZXJpbWVudGFsICJ2ZXJzaW9uIiBmZWF0dXJlIHR5cGUuCmUzMzMwZjRlNyBidWlsZC9wcm9w
ZXJ0eS1zZXQuamFtIHJldmlldwo3OTdiNGUxYWEgdXRpbC9vcmRlci5qYW0gKGFuZCBlbmdpbmUv
bW9kX29yZGVyLmNwcCkgcmV2aWV3CmEwMzRmZTRhMSB1dGlsL3NlcXVlbmNlLmphbSByZXZpZXcK
NTU3YzM5NzEwIGZpeGVkIGJ1aWx0aW4gU1VCU1QgcnVsZSAoZml4ICM1NzEpCjk2M2M0ZDJjYyBE
b2N1bWVudGF0aW9uIG1haW50ZW5hbmNlLgoyZjk4YzRlNTYgRml4IHF1b3RpbmcgaW4gb3MgY29u
ZGl0aW9ucy4KZDljYjlmNmRhIEZpeCB2bSBhY3Rpb24gc3dpdGNoLgpmYjQ1MjBjNWEgQWNjb3Vu
dCBmb3Igc2xvdyBydW5uaW5nIHRlc3RzIHRoYXQgdGltZW91dC4KODhkZDgxYTZhIFNpbXBsaWZ5
IHNhbnMtYXJtLWdjYyB0byBqdXN0IHRoZSBleGNsdWRlLgoxY2E2MDYyNzAgUmVtb3ZlIGJyb2tl
biByaXNjdjY0IGFuZCB0cnkgYW5kIHNraXAgYXJtLWdjYy4KNzAwN2M3MGRlIEFuZCB5ZXQgYW5v
dGhlciBhdHRlbXB0IGF0IGFhcmNoNjQgYW5kIHJpc2N2NjQgRnJlZUJTRCB0ZXN0aW5nLgpkOTE4
MTM1MjMgQW5vdGhlciBhdHRlbXB0IGF0IGFhcmNoNjQgYW5kIHJpc2N2NjQgRnJlZUJTRCB0ZXN0
aW5nLgo1MDQyYzY3MjggQWRkIGFhcmNoNjQgYW5kIHJpc2N2NjQgRnJlZUJTRCB0ZXN0aW5nLgoz
NWI2NmI2N2EgQWRkIEdIQSBCU0QuCmVlZTk5YjJkNiBtb3JlIG9uIGRlYnVnZ2VyLW1pLnB5IChh
bmQgVGVzdENtZC5weSkKZDNjZjMxMjE0IGJ1aWxkL3Byb2plY3QuamFtIHJldmlldwpkODgxNzZl
MmMgUmV3b3JrIGRlbGF5IGxvZ2ljIGluIHZhcmlvdXMgdGVzdHMgdG8gYmUgY29uc2lzdGVudC4K
Y2YyOGZkYWM3IFJlZmFjdG9yIG91dHB1dCAoZXJyKSBmdW5jdGlvbnMuCjFkOTdkMzY4NCBTZXQg
Y29ycmVjdCBzZXR1cC1tc3lzMiBhY3Rpb24gdmVyc2lvbi4KZTgxNGRhYjRmIFJlbW92ZSBubyBs
b25nZXIgc3VwcG9ydGVkIG1pbmd3MzIgc3lzdGVtIGZyb20gdGVzdGluZy4KN2QzZGIzYWUyIENh
bid0IGRvIHN0YXRpYyBidWlsZHMgb24gbWFjb3MuCmY0MjkxMWExNiBBZGQgbWFjb3MgcG9ydGFi
bGUgYmluYXJpZXMuCmU0OTFkODI5MiBBZGQgbGludXggYXJtIHBvcnRhYmxlIGV4ZWMgImluc3Rh
bGxlciIuCmFkZmM0ZWYwNCBGaXggd2FybmluZy9lcnJvciBmb3IgdW5pbnRpYWxpemVkIHJlYWQg
b2YgTE9MIGVsZW1lbnRzLgo5ZTIyNmMzYzEgQ0k6IFVwZGF0ZSB0ZXN0ZWQgY29tcGlsZXJzLCBh
bmQgYWRkIEJvb3N0IDEuOTEuCjA4MDRmYWNlYSBBdm9pZCB1bnVzZWQgdmFyIHdhcm5pbmcuCmFl
ZWZhZjEzMSBBcmdzIGFuZCByZWdleC5lc2NhcGUgY2hhbmdlIG5vdGVzLgpkZGViZGYyMGUgRml4
IG11bHRpLXN0cmluZyBjb21tYW5kLWRiIGNhcHR1cmUuCmJhNjRkMDFmNSBDaGFuZ2UgcmVnZXgu
ZXNjYXBlIHRvIGFjY2VwdCBhIGxpc3Qgb2Ygc3RyaW5ncyB0byBlc2NhcGUuCmVlMTBlZDkzMCBG
aXggbWlzc2luZyBuYXRpdmUgcnVsZSBhcmcgY2hlY2tpbmcuCjVhNjk0M2RiZiBGaXggcGF0aCB0
byBjaGVja3N1bSBmaWxlLiBbc2tpcCBjaV0KY2Y0NWZmZDQxIENJIGRlYnVnZ2luZyBbc2tpcCBj
aV0KOGE4ZjMzMTY1IEZpeCBwYXRocyB0byBnZW5lcmF0ZWQgYXJjaGl2ZSBbc2tpcCBjaV0KZDBj
MTA1MzFkIENJIGRlYnVnZ2luZyBbc2tpCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNl
ZWRzIDMwMDAgY2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBh
biBhdHRhY2htZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4ub29zdC1idWlsZC1uYXRpdmVf
MS45MS4wLmJiID0+IGJvb3N0LWJ1aWxkLW5hdGl2ZV8xLjkyLjAuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvYm9vc3Qve2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjkxLjAuYmIgPT4gYm9vc3Qt
YnVpbGQtbmF0aXZlXzEuOTIuMC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9ib29zdC9ib29zdC1idWlsZC1uYXRpdmVfMS45MS4wLmJiIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYm9vc3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuOTIuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC1idWls
ZC1uYXRpdmVfMS45MS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9i
b29zdC1idWlsZC1uYXRpdmVfMS45Mi4wLmJiCmluZGV4IGMyNzZjZjQzNmQuLjAwOGJkYWNmNWUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L2Jvb3N0LWJ1aWxkLW5hdGl2
ZV8xLjkxLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QtYnVpbGQt
bmF0aXZlXzEuOTIuMC5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJCU0wtMS4wIgogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PWU0MjI0Y2NhZWNiMTRkOTQy
YzcxZDMxYmVmMjBkNzhjIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vYm9vc3Rvcmcv
YnVpbGQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0YWc9Ym9vc3QtJHtQVn0iCi1TUkNS
RVYgPSAiODUyNTJjOWQ2YTM4MTdkYWNhMjNkZGFlOTRjZTE2YzdiZTRkMmMxMiIKK1NSQ1JFViA9
ICIwNWI2YjYzOGI1NGUxZjAxM2ZiOGIyODFmNTAyMGUzMzdiZTMxMzYzIgogUEUgPSAiMSIKIAog
VVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiYm9vc3QtKD9QPHB2ZXI+KFxkKyhcLlxkKykr
KSkiCi0tIAoyLjQ3LjEKCg==

--===============2412458096093140857==--

