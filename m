Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.285.1794201493129191347
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 21:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=p86tju3w;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=26PYG31D;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1bebe1a8f-265cfe5f-06b6-4cc3-bfc5-10eb1d226d12-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794201492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G+x4v4Ddmj2Fh8beNe4Je6HBP7u1dLM7lvsyCHGe07g=;
	b=p86tju3wBo9kV+UxbUKTQ9M+K/FSw5IN67E6SB02FejZFXmBR2HDWk3jDlVw243R
	gZLm/bNUKOe2eqEs+2bVveFLqzZhC7bACY/RXIkmZwwuL5O0wj+dT7gL5siOg3nAhA3
	WyI1v5BM4OvmuIv6IxN0A/aqXX3brHhKr6w+0UO0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794201492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G+x4v4Ddmj2Fh8beNe4Je6HBP7u1dLM7lvsyCHGe07g=;
	b=26PYG31De1QpQgXBlR/ZS5YOWeqSLAdkgVSJkU/IE8kIDdPJhjYctWHpxmyYkrTo
	Aea3oQaDcYLttvwkh/G0eUNlnlF2+fU29cMm/lQ42jOYfp0b8E8vxS1S5xn+z5Xk1Pf
	tN86Vd4YC5FfARA6fd8/eFZTHWvXFqn0VlrCwrco=
Content-Type: multipart/mixed; boundary="===============8761904596302467445=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Sumanth Gavini <sumanth.gavini@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.14.3 SUCCEEDED
Message-ID: <010101a1bebe1a8f-265cfe5f-06b6-4cc3-bfc5-10eb1d226d12-000000@us-west-2.amazonses.com>
Date: Mon, 9 Nov 2026 05:18:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.09-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 05:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249785

--===============8761904596302467445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.14.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.14.2-4.14.3.patch
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
From a4720dc49f6e9c17ef5684aa8dc1e193c69fdc92 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 9 Nov 2026 05:08:27 +0000
Subject: [PATCH] ccache: upgrade 4.14.2 -> 4.14.3

== Ccache 4.14.3
Release date: 2026-11-08
=== Bug fixes and improvements

- Fixed an abort when standard error is closed. +
  [small]#_[contributed by GitHub user Skytuhua]_#

- Fixed detection of assembler `.incbin` directives with macro operands,
  preventing false cache hits. +
  [small]#_[contributed by Oleg Sidorkin]_#

- Fixed escaping of backslashes in temporary MSVC response files for long
  command lines, restoring correct behavior of options such as `/d1trimfile`. +
  [small]#_[contributed by Vaibhav Awale]_#

- Fixed depend mode to fall back to the compiler when a GCC precompiled header
  cannot be located, preventing false cache hits. +
  [small]#_[contributed by Don Yin]_#

- Fixed display of diagnostic colors and Unicode text on Windows consoles. +
  [small]#_[contributed by GitHub user Peter0x44]_#

- Fixed matching of `ignore_headers_in_manifest` entries against header paths
  starting with `.\` on Windows. +
  [small]#_[contributed by Chris Burr]_#

- Reduced memory usage and copying when reading local cache entries, hashing
  binary files and storing compilation results. +
  [small]#_[contributed by Joel Rosdahl]_#

=== Test improvements

- Made tests skip unsupported `-march=native` and `-gz` configurations when the
  compiler only emits a warning, and skip Clang profiling tests when the
  profiling runtime is unavailable. +
  [small]#_[contributed by Chris Burr]_#

- Fixed ThinLTO index generation with `lld-link` and comparison of debug object
  files containing CodeView information. +
  [small]#_[contributed by Chris Burr]_#

- Fixed storage server and helper cleanup to avoid blocking removal of test
  directories on Windows. +
  [small]#_[contributed by Joel Rosdahl]_#

- Removed an invalid check for split DWARF debug logs. +
  [small]#_[contributed by Joel Rosdahl]_#

=== Documentation improvements

- Clarified that configuring remote storage disables `file_clone` and
  `hard_link` for the local cache as well. +
  [small]#_[contributed by Joel Rosdahl]_#
---
 .../ccache/{ccache_4.14.2.bb => ccache_4.14.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.14.2.bb => ccache_4.14.3.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.14.2.bb b/meta/recipes-devtools/ccache/ccache_4.14.3.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.14.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.14.3.bb
index eae9a33536..b05058b20c 100644
--- a/meta/recipes-devtools/ccache/ccache_4.14.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.14.3.bb
@@ -16,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "35921f80a93d6453a874525f2e4bd97264c46ddc349d87aacc1032cde4dd2924"
+SRC_URI[sha256sum] = "d50587abd5b787a7ba48cb1d76f7a4f09036e0181e742fc7383a8b154d73f0ba"
 
 inherit cmake github-releases
 
-- 
2.47.1


--===============8761904596302467445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PV changed from "4.14.2" to "4.14.3"
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 42214616 to 42329672 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PV changed from "4.14.2" to "4.14.3"
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PV changed from "4.14.2" to "4.14.3"
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PV changed from "4.14.2" to "4.14.3"
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-src: PV changed from "4.14.2" to "4.14.3"
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-src: FILELIST: directory renamed /usr/src/debug/ccache/4.14.2/src/third_party/blake3/blake3 -> /usr/src/debug/ccache/4.14.3/src/third_party/blake3/blake3, directory renamed /usr/src/debug/ccache/4.14.2/src/ccache/util -> /usr/src/debug/ccache/4.14.3/src/ccache/util, directory renamed /usr/src/debug/ccache/4.14.2/src/third_party/cpp-httplib -> /usr/src/debug/ccache/4.14.3/src/third_party/cpp-httplib, directory renamed /usr/src/debug/ccache/4.14.2/src/ccache/storage -> /usr/src/debug/ccache/4.14.3/src/ccache/storage, directory renamed /usr/src/debug/ccache/4.14.2/src/ccache/compiler -> /usr/src/debug/ccache/4.14.3/src/ccache/compiler, directory renamed /usr/src/debug/ccache/4.14.2/src/ccache/storage/remote -> /usr/src/debug/ccache/4.14.3/src/ccache/storage/remote, directory renamed /usr/src/debug/ccache/4.14.2/src/ccache/core -> /usr/src/debug/ccache/4.14.3/src/ccache/core, directory renamed /usr/src/debug/ccache/4.14.2/src/third_party/cxxurl
 /cxxurl -> /usr/src/debug/ccache/4.14.3/src/third_party/cxxurl/cxxurl, directory renamed /usr/src/debug/ccache/4.14.2/src/ccache -> /usr/src/debug/ccache/4.14.3/src/ccache, directory renamed /usr/src/debug/ccache/4.14.2/src/third_party/tl-expected/tl -> /usr/src/debug/ccache/4.14.3/src/third_party/tl-expected/tl, directory renamed /usr/src/debug/ccache/4.14.2/src/ccache/storage/local -> /usr/src/debug/ccache/4.14.3/src/ccache/storage/local
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGSIZE changed from 1880976 to 1897294 (+1%)
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PV changed from "4.14.2" to "4.14.3"
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache: PV changed from "4.14.2" to "4.14.3"
packages/x86-64-v3-poky-linux/ccache/ccache: PKGV changed from 4.14.2 [default] to 4.14.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache: PKGSIZE changed from 2124328 to 2132520 (+0%)
packages/x86-64-v3-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.14.2/ccache-4.14.2.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.14.3/ccache-4.14.3.tar.gz"
packages/x86-64-v3-poky-linux/ccache: PV changed from "4.14.2" to "4.14.3"
packages/x86-64-v3-poky-linux/ccache: PKGV changed from 4.14.2 [default] to 4.14.3 [default]

--===============8761904596302467445==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.14.2-4.14.3.patch"

RnJvbSBhNDcyMGRjNDlmNmU5YzE3ZWY1Njg0YWE4ZGMxZTE5M2M2OWZkYzkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgOSBOb3YgMjAyNiAwNTowODoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNj
YWNoZTogdXBncmFkZSA0LjE0LjIgLT4gNC4xNC4zCgo9PSBDY2FjaGUgNC4xNC4zClJlbGVhc2Ug
ZGF0ZTogMjAyNi0xMS0wOAo9PT0gQnVnIGZpeGVzIGFuZCBpbXByb3ZlbWVudHMKCi0gRml4ZWQg
YW4gYWJvcnQgd2hlbiBzdGFuZGFyZCBlcnJvciBpcyBjbG9zZWQuICsKICBbc21hbGxdI19bY29u
dHJpYnV0ZWQgYnkgR2l0SHViIHVzZXIgU2t5dHVodWFdXyMKCi0gRml4ZWQgZGV0ZWN0aW9uIG9m
IGFzc2VtYmxlciBgLmluY2JpbmAgZGlyZWN0aXZlcyB3aXRoIG1hY3JvIG9wZXJhbmRzLAogIHBy
ZXZlbnRpbmcgZmFsc2UgY2FjaGUgaGl0cy4gKwogIFtzbWFsbF0jX1tjb250cmlidXRlZCBieSBP
bGVnIFNpZG9ya2luXV8jCgotIEZpeGVkIGVzY2FwaW5nIG9mIGJhY2tzbGFzaGVzIGluIHRlbXBv
cmFyeSBNU1ZDIHJlc3BvbnNlIGZpbGVzIGZvciBsb25nCiAgY29tbWFuZCBsaW5lcywgcmVzdG9y
aW5nIGNvcnJlY3QgYmVoYXZpb3Igb2Ygb3B0aW9ucyBzdWNoIGFzIGAvZDF0cmltZmlsZWAuICsK
ICBbc21hbGxdI19bY29udHJpYnV0ZWQgYnkgVmFpYmhhdiBBd2FsZV1fIwoKLSBGaXhlZCBkZXBl
bmQgbW9kZSB0byBmYWxsIGJhY2sgdG8gdGhlIGNvbXBpbGVyIHdoZW4gYSBHQ0MgcHJlY29tcGls
ZWQgaGVhZGVyCiAgY2Fubm90IGJlIGxvY2F0ZWQsIHByZXZlbnRpbmcgZmFsc2UgY2FjaGUgaGl0
cy4gKwogIFtzbWFsbF0jX1tjb250cmlidXRlZCBieSBEb24gWWluXV8jCgotIEZpeGVkIGRpc3Bs
YXkgb2YgZGlhZ25vc3RpYyBjb2xvcnMgYW5kIFVuaWNvZGUgdGV4dCBvbiBXaW5kb3dzIGNvbnNv
bGVzLiArCiAgW3NtYWxsXSNfW2NvbnRyaWJ1dGVkIGJ5IEdpdEh1YiB1c2VyIFBldGVyMHg0NF1f
IwoKLSBGaXhlZCBtYXRjaGluZyBvZiBgaWdub3JlX2hlYWRlcnNfaW5fbWFuaWZlc3RgIGVudHJp
ZXMgYWdhaW5zdCBoZWFkZXIgcGF0aHMKICBzdGFydGluZyB3aXRoIGAuXGAgb24gV2luZG93cy4g
KwogIFtzbWFsbF0jX1tjb250cmlidXRlZCBieSBDaHJpcyBCdXJyXV8jCgotIFJlZHVjZWQgbWVt
b3J5IHVzYWdlIGFuZCBjb3B5aW5nIHdoZW4gcmVhZGluZyBsb2NhbCBjYWNoZSBlbnRyaWVzLCBo
YXNoaW5nCiAgYmluYXJ5IGZpbGVzIGFuZCBzdG9yaW5nIGNvbXBpbGF0aW9uIHJlc3VsdHMuICsK
ICBbc21hbGxdI19bY29udHJpYnV0ZWQgYnkgSm9lbCBSb3NkYWhsXV8jCgo9PT0gVGVzdCBpbXBy
b3ZlbWVudHMKCi0gTWFkZSB0ZXN0cyBza2lwIHVuc3VwcG9ydGVkIGAtbWFyY2g9bmF0aXZlYCBh
bmQgYC1nemAgY29uZmlndXJhdGlvbnMgd2hlbiB0aGUKICBjb21waWxlciBvbmx5IGVtaXRzIGEg
d2FybmluZywgYW5kIHNraXAgQ2xhbmcgcHJvZmlsaW5nIHRlc3RzIHdoZW4gdGhlCiAgcHJvZmls
aW5nIHJ1bnRpbWUgaXMgdW5hdmFpbGFibGUuICsKICBbc21hbGxdI19bY29udHJpYnV0ZWQgYnkg
Q2hyaXMgQnVycl1fIwoKLSBGaXhlZCBUaGluTFRPIGluZGV4IGdlbmVyYXRpb24gd2l0aCBgbGxk
LWxpbmtgIGFuZCBjb21wYXJpc29uIG9mIGRlYnVnIG9iamVjdAogIGZpbGVzIGNvbnRhaW5pbmcg
Q29kZVZpZXcgaW5mb3JtYXRpb24uICsKICBbc21hbGxdI19bY29udHJpYnV0ZWQgYnkgQ2hyaXMg
QnVycl1fIwoKLSBGaXhlZCBzdG9yYWdlIHNlcnZlciBhbmQgaGVscGVyIGNsZWFudXAgdG8gYXZv
aWQgYmxvY2tpbmcgcmVtb3ZhbCBvZiB0ZXN0CiAgZGlyZWN0b3JpZXMgb24gV2luZG93cy4gKwog
IFtzbWFsbF0jX1tjb250cmlidXRlZCBieSBKb2VsIFJvc2RhaGxdXyMKCi0gUmVtb3ZlZCBhbiBp
bnZhbGlkIGNoZWNrIGZvciBzcGxpdCBEV0FSRiBkZWJ1ZyBsb2dzLiArCiAgW3NtYWxsXSNfW2Nv
bnRyaWJ1dGVkIGJ5IEpvZWwgUm9zZGFobF1fIwoKPT09IERvY3VtZW50YXRpb24gaW1wcm92ZW1l
bnRzCgotIENsYXJpZmllZCB0aGF0IGNvbmZpZ3VyaW5nIHJlbW90ZSBzdG9yYWdlIGRpc2FibGVz
IGBmaWxlX2Nsb25lYCBhbmQKICBgaGFyZF9saW5rYCBmb3IgdGhlIGxvY2FsIGNhY2hlIGFzIHdl
bGwuICsKICBbc21hbGxdI19bY29udHJpYnV0ZWQgYnkgSm9lbCBSb3NkYWhsXV8jCi0tLQogLi4u
L2NjYWNoZS97Y2NhY2hlXzQuMTQuMi5iYiA9PiBjY2FjaGVfNC4xNC4zLmJifSAgICAgICAgICAg
ICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS97Y2NhY2hlXzQuMTQuMi5iYiA9
PiBjY2FjaGVfNC4xNC4zLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9jY2FjaGUvY2NhY2hlXzQuMTQuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2Fj
aGUvY2NhY2hlXzQuMTQuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjE0LjIuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTQuMy5iYgppbmRleCBlYWU5YTMzNTM2
Li5iMDUwNThiMjBjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2Nj
YWNoZV80LjE0LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVf
NC4xNC4zLmJiCkBAIC0xNiw3ICsxNiw3IEBAIERFUEVORFMgPSAienN0ZCBmbXQgeHhoYXNoIgog
CiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vJHtCUH0udGFy
Lmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzU5MjFmODBhOTNkNjQ1M2E4NzQ1MjVmMmU0
YmQ5NzI2NGM0NmRkYzM0OWQ4N2FhY2MxMDMyY2RlNGRkMjkyNCIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJkNTA1ODdhYmQ1Yjc4N2E3YmE0OGNiMWQ3NmY3YTRmMDkwMzZlMDE4MWU3NDJmYzczODNh
OGIxNTRkNzNmMGJhIgogCiBpbmhlcml0IGNtYWtlIGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjQ3
LjEKCg==

--===============8761904596302467445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ccache-changelog.txt"

== Ccache 4.14.3
Release date: 2026-11-08
=== Bug fixes and improvements

- Fixed an abort when standard error is closed. +
  [small]#_[contributed by GitHub user Skytuhua]_#

- Fixed detection of assembler `.incbin` directives with macro operands,
  preventing false cache hits. +
  [small]#_[contributed by Oleg Sidorkin]_#

- Fixed escaping of backslashes in temporary MSVC response files for long
  command lines, restoring correct behavior of options such as `/d1trimfile`. +
  [small]#_[contributed by Vaibhav Awale]_#

- Fixed depend mode to fall back to the compiler when a GCC precompiled header
  cannot be located, preventing false cache hits. +
  [small]#_[contributed by Don Yin]_#

- Fixed display of diagnostic colors and Unicode text on Windows consoles. +
  [small]#_[contributed by GitHub user Peter0x44]_#

- Fixed matching of `ignore_headers_in_manifest` entries against header paths
  starting with `.\` on Windows. +
  [small]#_[contributed by Chris Burr]_#

- Reduced memory usage and copying when reading local cache entries, hashing
  binary files and storing compilation results. +
  [small]#_[contributed by Joel Rosdahl]_#

=== Test improvements

- Made tests skip unsupported `-march=native` and `-gz` configurations when the
  compiler only emits a warning, and skip Clang profiling tests when the
  profiling runtime is unavailable. +
  [small]#_[contributed by Chris Burr]_#

- Fixed ThinLTO index generation with `lld-link` and comparison of debug object
  files containing CodeView information. +
  [small]#_[contributed by Chris Burr]_#

- Fixed storage server and helper cleanup to avoid blocking removal of test
  directories on Windows. +
  [small]#_[contributed by Joel Rosdahl]_#

- Removed an invalid check for split DWARF debug logs. +
  [small]#_[contributed by Joel Rosdahl]_#

=== Documentation improvements

- Clarified that configuring remote storage disables `file_clone` and
  `hard_link` for the local cache as well. +
  [small]#_[contributed by Joel Rosdahl]_#

--===============8761904596302467445==--
