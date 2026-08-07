Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE178C5AC81
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 05:30:41 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36317.1786080635042624574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 22:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VrHKj2kK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IAOugPEU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019fdab3a4d1-e80dffad-7a6d-4e57-a090-ee6ef1061074-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786080634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zBrgnUcyaOKObie3XO0ks8OkLDRARHOcKhPcxBak0SY=;
	b=VrHKj2kKW/kFwWs9OLZ3opPaS1uR654v/egz/ruvTrt5eudy4p1uovGBmzrLGhQ4
	JaoX24IrcmvU09mKyC7bmcLPEbzzSdMN7O3BvPafc0TBA4f5CQzm1xi/FTVA7XGRdVM
	vqP/OfiPj9bz57lqeeY3lO15VHDD7tFClyKDVmR0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786080634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zBrgnUcyaOKObie3XO0ks8OkLDRARHOcKhPcxBak0SY=;
	b=IAOugPEUQPcNglshjWpMaY+Z1tTkzsdkkMckG6crAU4sYRdNOPznWdtAsOTsO1OQ
	HmcahuA6UV9OmUN8R2nS6aeqW7a8d0TR0Qvy61Fjq4mILeuIL2Js1rvruiY/aJGOO56
	ItBxK2xL7Kxk0SGTiJ/YKK0CFLVznVpx4zgUlWho=
Content-Type: multipart/mixed; boundary="===============6972104474679990654=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fontconfig: upgrading to 2.18.3 SUCCEEDED
Message-ID: <0101019fdab3a4d1-e80dffad-7a6d-4e57-a090-ee6ef1061074-000000@us-west-2.amazonses.com>
Date: Fri, 7 Aug 2026 05:30:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.07-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 05:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242977

--===============6972104474679990654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fontconfig* to *2.18.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fontconfig-upgrade-2.18.2-2.18.3.patch
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
From 853b830bf505dd79f3befdb69b22fd1148550edb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 7 Aug 2026 05:12:39 +0000
Subject: [PATCH] fontconfig: upgrade 2.18.2 -> 2.18.3

Source: NEWS

Version 2.18.3
                              2026-08-06
2.18.3

Akira TAGOH (33):
      ci: Add --werror option to the build script
      fc-cat: exit with non-zero if not successfully done
      Workaround a longstanding use-after-free warning
      Fix a null pointer dereference
      Add Noto Sans as system-ui for fallback
      Drop Noto Sans CJK KR from 60-nonlatin.conf
      Correct sat.orth
      Add an orth file for Balinese
      Update orth files for jv, so, su, tl to use native scripts
      Add orth files for scripts used by Noto font families
      Update mni.orth to use Meetei Mayek script
      Add orth files for Cuneiform languages (akk, sux, hit)
      ci: Suppress abidiff false positives for all internal structs
      test: Add cache format compatibility tests for orth file additions
      Add orth files for ancient scripts (xna, hlu, ecy)
      fc-cache: Create backward-compatible cache symlinks for cross-version discovery
      ci: Update dependencies
      Add implicit rule to update genericfamily property against syntactic-sugar
      fc-genconf: Use alias syntactic-sugar instead of the pair of test-edit config
      Allow to limit the targeted family for TTC
      test: Fix test_genconf.py to avoid unexpected family name in testing conf
      ci: Enable -Werror in CI
      ci: drop duplicate pipelines
      ci: cleanup
      ci: gate distro jobs until all tests passed
      ci: reduce more duplicate jobs
      ci: Update base ci-templates
      test: Fix compiler warnings
      fc-fontations: Allow unnecessary_transmutes lint in bindgen-generated Rust code
      Fix another compiler warnings
      ci: Bump FreeBSD version to 14.4
      Fix the compiler warnings on MinGW
      Update INSTALL

Julien Nabet (2):
      Fix "FileType is deprecated"
      Fix unknown type name locale_t on macOS
---
 .../fontconfig/fontconfig/revert-static-pkgconfig.patch         | 2 +-
 .../fontconfig/{fontconfig_2.18.2.bb => fontconfig_2.18.3.bb}   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.18.2.bb => fontconfig_2.18.3.bb} (96%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
index 4337da724f..be90a5d1f9 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
+++ b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 1de775180219a57c85a0cdcc62fc6482ef8e581e Mon Sep 17 00:00:00 2001
+From d30924b17c93f8085f8357640b766e139a022d95 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 23 Apr 2015 20:35:32 -0700
 Subject: [PATCH] fontconfig: Fix pkgconfig file generation to not have
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb
similarity index 96%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb
index 792d44b7f0..16037aeaa3 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.18.2.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb
@@ -23,7 +23,7 @@ DEPENDS = "expat freetype zlib gperf-native util-linux"
 SRC_URI = "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/${PV}/fontconfig-${PV}.tar.xz \
            file://revert-static-pkgconfig.patch \
            "
-SRC_URI[sha256sum] = "cf8e6576ef0484c15079bdaf77cd9c51c464df5365814ada4d3ee7331ea31eb5"
+SRC_URI[sha256sum] = "4f7b554a38cdf78c033f666c8871f3749e14a094f65a07f630c91ed0b43d35e3"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/fontconfig/fontconfig/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.1


--===============6972104474679990654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="fontconfig-changelog.txt"

Changelog for fontconfig: 2.18.2 -> 2.18.3
Source: NEWS

Version 2.18.3
                              2026-08-06
2.18.3

Akira TAGOH (33):
      ci: Add --werror option to the build script
      fc-cat: exit with non-zero if not successfully done
      Workaround a longstanding use-after-free warning
      Fix a null pointer dereference
      Add Noto Sans as system-ui for fallback
      Drop Noto Sans CJK KR from 60-nonlatin.conf
      Correct sat.orth
      Add an orth file for Balinese
      Update orth files for jv, so, su, tl to use native scripts
      Add orth files for scripts used by Noto font families
      Update mni.orth to use Meetei Mayek script
      Add orth files for Cuneiform languages (akk, sux, hit)
      ci: Suppress abidiff false positives for all internal structs
      test: Add cache format compatibility tests for orth file additions
      Add orth files for ancient scripts (xna, hlu, ecy)
      fc-cache: Create backward-compatible cache symlinks for cross-version discovery
      ci: Update dependencies
      Add implicit rule to update genericfamily property against syntactic-sugar
      fc-genconf: Use alias syntactic-sugar instead of the pair of test-edit config
      Allow to limit the targeted family for TTC
      test: Fix test_genconf.py to avoid unexpected family name in testing conf
      ci: Enable -Werror in CI
      ci: drop duplicate pipelines
      ci: cleanup
      ci: gate distro jobs until all tests passed
      ci: reduce more duplicate jobs
      ci: Update base ci-templates
      test: Fix compiler warnings
      fc-fontations: Allow unnecessary_transmutes lint in bindgen-generated Rust code
      Fix another compiler warnings
      ci: Bump FreeBSD version to 14.4
      Fix the compiler warnings on MinGW
      Update INSTALL

Julien Nabet (2):
      Fix "FileType is deprecated"
      Fix unknown type name locale_t on macOS

--===============6972104474679990654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PKGV changed from 2.18.2 [default] to 2.18.3 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PKGSIZE changed from 2843696 to 3022808 (+6%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PV changed from "2.18.2" to "2.18.3"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dev: PKGV changed from 2.18.2 [default] to 2.18.3 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dev: PKGSIZE changed from 45176 to 45210 (+0%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dev: PV changed from "2.18.2" to "2.18.3"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-doc: PKGV changed from 2.18.2 [default] to 2.18.3 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-doc: PV changed from "2.18.2" to "2.18.3"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-ka: PKGV changed from 2.18.2 [default] to 2.18.3 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-ka: PV changed from "2.18.2" to "2.18.3"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-zh-cn: PKGV changed from 2.18.2 [default] to 2.18.3 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-zh-cn: PV changed from "2.18.2" to "2.18.3"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PKGV changed from 2.18.2 [default] to 2.18.3 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: FILELIST: directory renamed /usr/src/debug/fontconfig/2.18.2/fc-match -> /usr/src/debug/fontconfig/2.18.3/fc-match, directory renamed /usr/src/debug/fontconfig/2.18.2/fc-list -> /usr/src/debug/fontconfig/2.18.3/fc-list, directory renamed /usr/src/debug/fontconfig/2.18.2/src -> /usr/src/debug/fontconfig/2.18.3/src, directory renamed /usr/src/debug/fontconfig/2.18.2/fc-validate -> /usr/src/debug/fontconfig/2.18.3/fc-validate, directory renamed /usr/src/debug/fontconfig/2.18.2/fc-cache -> /usr/src/debug/fontconfig/2.18.3/fc-cache, directory renamed /usr/src/debug/fontconfig/2.18.2/fc-case -> /usr/src/debug/fontconfig/2.18.3/fc-case, directory renamed /usr/src/debug/fontconfig/2.18.2/fc-cat -> /usr/src/debug/fontconfig/2.18.3/fc-cat, directory renamed /usr/src/debug/fontconfig/2.18.2/fc-lang -> /usr/src/debug/fontconfig/2.18.3/fc-lang, directory renamed /usr/src/debug/fontconfig/2.18.2/fc-query -> /usr/src/debug/fontconfig/2.18.3/f
 c-query, directory renamed /usr/src/debug/fontconfig/2.18.2/fc-genericfamily -> /usr/src/debug/fontconfig/2.18.3/fc-genericfamily, directory renamed /usr/src/debug/fontconfig/2.18.2/fc-pattern -> /usr/src/debug/fontconfig/2.18.3/fc-pattern, directory renamed /usr/src/debug/fontconfig/2.18.2/fc-genconf -> /usr/src/debug/fontconfig/2.18.3/fc-genconf, directory renamed /usr/src/debug/fontconfig/2.18.2/fc-scan -> /usr/src/debug/fontconfig/2.18.3/fc-scan, directory renamed /usr/src/debug/fontconfig/2.18.2 -> /usr/src/debug/fontconfig/2.18.3, directory renamed /usr/src/debug/fontconfig/2.18.2/fontconfig -> /usr/src/debug/fontconfig/2.18.3/fontconfig, directory renamed /usr/src/debug/fontconfig/2.18.2/fc-const -> /usr/src/debug/fontconfig/2.18.3/fc-const, directory renamed /usr/src/debug/fontconfig/2.18.2/fc-conflist -> /usr/src/debug/fontconfig/2.18.3/fc-conflist
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PKGSIZE changed from 1104491 to 1129859 (+2%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PV changed from "2.18.2" to "2.18.3"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-staticdev: PKGV changed from 2.18.2 [default] to 2.18.3 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-staticdev: PV changed from "2.18.2" to "2.18.3"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: PKGV changed from 2.18.2 [default] to 2.18.3 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: PV changed from "2.18.2" to "2.18.3"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PKGV changed from 2.18.2 [default] to 2.18.3 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PKGSIZE changed from 643819 to 662895 (+3%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PV changed from "2.18.2" to "2.18.3"
packages/x86-64-v3-poky-linux/fontconfig: SRC_URI changed from "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.18.2/fontconfig-2.18.2.tar.xz file://revert-static-pkgconfig.patch" to "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.18.3/fontconfig-2.18.3.tar.xz file://revert-static-pkgconfig.patch"
packages/x86-64-v3-poky-linux/fontconfig: PKGV changed from 2.18.2 [default] to 2.18.3 [default]
packages/x86-64-v3-poky-linux/fontconfig: PV changed from "2.18.2" to "2.18.3"

--===============6972104474679990654==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fontconfig-upgrade-2.18.2-2.18.3.patch"

RnJvbSA4NTNiODMwYmY1MDVkZDc5ZjNiZWZkYjY5YjIyZmQxMTQ4NTUwZWRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNyBBdWcgMjAyNiAwNToxMjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZv
bnRjb25maWc6IHVwZ3JhZGUgMi4xOC4yIC0+IDIuMTguMwoKU291cmNlOiBORVdTCgpWZXJzaW9u
IDIuMTguMwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyMDI2LTA4LTA2CjIuMTguMwoK
QWtpcmEgVEFHT0ggKDMzKToKICAgICAgY2k6IEFkZCAtLXdlcnJvciBvcHRpb24gdG8gdGhlIGJ1
aWxkIHNjcmlwdAogICAgICBmYy1jYXQ6IGV4aXQgd2l0aCBub24temVybyBpZiBub3Qgc3VjY2Vz
c2Z1bGx5IGRvbmUKICAgICAgV29ya2Fyb3VuZCBhIGxvbmdzdGFuZGluZyB1c2UtYWZ0ZXItZnJl
ZSB3YXJuaW5nCiAgICAgIEZpeCBhIG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZQogICAgICBBZGQg
Tm90byBTYW5zIGFzIHN5c3RlbS11aSBmb3IgZmFsbGJhY2sKICAgICAgRHJvcCBOb3RvIFNhbnMg
Q0pLIEtSIGZyb20gNjAtbm9ubGF0aW4uY29uZgogICAgICBDb3JyZWN0IHNhdC5vcnRoCiAgICAg
IEFkZCBhbiBvcnRoIGZpbGUgZm9yIEJhbGluZXNlCiAgICAgIFVwZGF0ZSBvcnRoIGZpbGVzIGZv
ciBqdiwgc28sIHN1LCB0bCB0byB1c2UgbmF0aXZlIHNjcmlwdHMKICAgICAgQWRkIG9ydGggZmls
ZXMgZm9yIHNjcmlwdHMgdXNlZCBieSBOb3RvIGZvbnQgZmFtaWxpZXMKICAgICAgVXBkYXRlIG1u
aS5vcnRoIHRvIHVzZSBNZWV0ZWkgTWF5ZWsgc2NyaXB0CiAgICAgIEFkZCBvcnRoIGZpbGVzIGZv
ciBDdW5laWZvcm0gbGFuZ3VhZ2VzIChha2ssIHN1eCwgaGl0KQogICAgICBjaTogU3VwcHJlc3Mg
YWJpZGlmZiBmYWxzZSBwb3NpdGl2ZXMgZm9yIGFsbCBpbnRlcm5hbCBzdHJ1Y3RzCiAgICAgIHRl
c3Q6IEFkZCBjYWNoZSBmb3JtYXQgY29tcGF0aWJpbGl0eSB0ZXN0cyBmb3Igb3J0aCBmaWxlIGFk
ZGl0aW9ucwogICAgICBBZGQgb3J0aCBmaWxlcyBmb3IgYW5jaWVudCBzY3JpcHRzICh4bmEsIGhs
dSwgZWN5KQogICAgICBmYy1jYWNoZTogQ3JlYXRlIGJhY2t3YXJkLWNvbXBhdGlibGUgY2FjaGUg
c3ltbGlua3MgZm9yIGNyb3NzLXZlcnNpb24gZGlzY292ZXJ5CiAgICAgIGNpOiBVcGRhdGUgZGVw
ZW5kZW5jaWVzCiAgICAgIEFkZCBpbXBsaWNpdCBydWxlIHRvIHVwZGF0ZSBnZW5lcmljZmFtaWx5
IHByb3BlcnR5IGFnYWluc3Qgc3ludGFjdGljLXN1Z2FyCiAgICAgIGZjLWdlbmNvbmY6IFVzZSBh
bGlhcyBzeW50YWN0aWMtc3VnYXIgaW5zdGVhZCBvZiB0aGUgcGFpciBvZiB0ZXN0LWVkaXQgY29u
ZmlnCiAgICAgIEFsbG93IHRvIGxpbWl0IHRoZSB0YXJnZXRlZCBmYW1pbHkgZm9yIFRUQwogICAg
ICB0ZXN0OiBGaXggdGVzdF9nZW5jb25mLnB5IHRvIGF2b2lkIHVuZXhwZWN0ZWQgZmFtaWx5IG5h
bWUgaW4gdGVzdGluZyBjb25mCiAgICAgIGNpOiBFbmFibGUgLVdlcnJvciBpbiBDSQogICAgICBj
aTogZHJvcCBkdXBsaWNhdGUgcGlwZWxpbmVzCiAgICAgIGNpOiBjbGVhbnVwCiAgICAgIGNpOiBn
YXRlIGRpc3RybyBqb2JzIHVudGlsIGFsbCB0ZXN0cyBwYXNzZWQKICAgICAgY2k6IHJlZHVjZSBt
b3JlIGR1cGxpY2F0ZSBqb2JzCiAgICAgIGNpOiBVcGRhdGUgYmFzZSBjaS10ZW1wbGF0ZXMKICAg
ICAgdGVzdDogRml4IGNvbXBpbGVyIHdhcm5pbmdzCiAgICAgIGZjLWZvbnRhdGlvbnM6IEFsbG93
IHVubmVjZXNzYXJ5X3RyYW5zbXV0ZXMgbGludCBpbiBiaW5kZ2VuLWdlbmVyYXRlZCBSdXN0IGNv
ZGUKICAgICAgRml4IGFub3RoZXIgY29tcGlsZXIgd2FybmluZ3MKICAgICAgY2k6IEJ1bXAgRnJl
ZUJTRCB2ZXJzaW9uIHRvIDE0LjQKICAgICAgRml4IHRoZSBjb21waWxlciB3YXJuaW5ncyBvbiBN
aW5HVwogICAgICBVcGRhdGUgSU5TVEFMTAoKSnVsaWVuIE5hYmV0ICgyKToKICAgICAgRml4ICJG
aWxlVHlwZSBpcyBkZXByZWNhdGVkIgogICAgICBGaXggdW5rbm93biB0eXBlIG5hbWUgbG9jYWxl
X3Qgb24gbWFjT1MKLS0tCiAuLi4vZm9udGNvbmZpZy9mb250Y29uZmlnL3JldmVydC1zdGF0aWMt
cGtnY29uZmlnLnBhdGNoICAgICAgICAgfCAyICstCiAuLi4vZm9udGNvbmZpZy97Zm9udGNvbmZp
Z18yLjE4LjIuYmIgPT4gZm9udGNvbmZpZ18yLjE4LjMuYmJ9ICAgfCAyICstCiAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy97Zm9udGNvbmZpZ18yLjE4LjIuYmIgPT4gZm9udGNvbmZp
Z18yLjE4LjMuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2Zv
bnRjb25maWcvZm9udGNvbmZpZy9yZXZlcnQtc3RhdGljLXBrZ2NvbmZpZy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9mb250Y29uZmlnL2ZvbnRjb25maWcvcmV2ZXJ0LXN0YXRpYy1wa2dj
b25maWcucGF0Y2gKaW5kZXggNDMzN2RhNzI0Zi4uYmU5MGE1ZDFmOSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZy9yZXZlcnQtc3RhdGljLXBr
Z2NvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy9mb250
Y29uZmlnL3JldmVydC1zdGF0aWMtcGtnY29uZmlnLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSAxZGU3NzUxODAyMTlhNTdjODVhMGNkY2M2MmZjNjQ4MmVmOGU1ODFlIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBkMzA5MjRiMTdjOTNmODA4NWY4MzU3NjQwYjc2NmUxMzlhMDIyZDk1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KIERhdGU6IFRodSwgMjMgQXByIDIwMTUgMjA6MzU6MzIgLTA3MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gZm9udGNvbmZpZzogRml4IHBrZ2NvbmZpZyBmaWxlIGdlbmVyYXRpb24gdG8gbm90IGhh
dmUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9mb250Y29uZmlnL2ZvbnRjb25m
aWdfMi4xOC4yLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZp
Z18yLjE4LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE4LjIuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9mb250Y29uZmlnL2ZvbnRjb25maWdfMi4xOC4zLmJiCmluZGV4IDc5
MmQ0NGI3ZjAuLjE2MDM3YWVhYTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9m
b250Y29uZmlnL2ZvbnRjb25maWdfMi4xOC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9mb250Y29uZmlnL2ZvbnRjb25maWdfMi4xOC4zLmJiCkBAIC0yMyw3ICsyMyw3IEBAIERFUEVO
RFMgPSAiZXhwYXQgZnJlZXR5cGUgemxpYiBncGVyZi1uYXRpdmUgdXRpbC1saW51eCIKIFNSQ19V
UkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2FwaS92NC9wcm9qZWN0cy84OTAv
cGFja2FnZXMvZ2VuZXJpYy9mb250Y29uZmlnLyR7UFZ9L2ZvbnRjb25maWctJHtQVn0udGFyLnh6
IFwKICAgICAgICAgICAgZmlsZTovL3JldmVydC1zdGF0aWMtcGtnY29uZmlnLnBhdGNoIFwKICAg
ICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImNmOGU2NTc2ZWYwNDg0YzE1MDc5YmRh
Zjc3Y2Q5YzUxYzQ2NGRmNTM2NTgxNGFkYTRkM2VlNzMzMWVhMzFlYjUiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNGY3YjU1NGEzOGNkZjc4YzAzM2Y2NjZjODg3MWYzNzQ5ZTE0YTA5NGY2NWEwN2Y2
MzBjOTFlZDBiNDNkMzVlMyIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9mb250Y29uZmlnL2ZvbnRjb25maWcvLS90YWdzIgogVVBTVFJFQU1f
Q0hFQ0tfUkVHRVggPSAicmVsZWFzZXMvKD9QPHB2ZXI+LispIgotLSAKMi40Ny4xCgo=

--===============6972104474679990654==--

