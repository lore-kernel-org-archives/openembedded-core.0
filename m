Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29471.1795324411099223215
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 21:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MjzdWeng;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KqOWA8d2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a201ac78f1-391dc5f4-bddb-4607-a136-abda940d6b4a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795324410;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7KHvuSY1d3lNahWAIXHTZ0nb8IaqTCkC5JM9OOEE94w=;
	b=MjzdWeng5eiip9shb4MIM3DLD7SmtASszfS2I/F6OfTo/RAPQmzWanJ8hkymffSe
	CJqbfbW0EB8TDcsK6YUhd9RX1WTtXu/YRaHwMCYjK70ZF9Qu/g1GX7JNjAswzeSufYp
	Ezq0QdrpxXkEb+hbBok6pYNJtDga06guoCka11B4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795324410;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7KHvuSY1d3lNahWAIXHTZ0nb8IaqTCkC5JM9OOEE94w=;
	b=KqOWA8d2T/ou+ViZmduvWCyhRlKxP7/g+3By4/HbgD6Xngo86L3ndUaP+6XoYEFd
	wWFZ5tGKdl7BquR21oPdVDijs53YE7HAwWeEJNufIP84ZZc9Y29bjrKmbpYg2XVM51c
	MTQdW5Dt1HNgKSnGUPVphTbiOUPfvRk7mKfYmhMk=
Content-Type: multipart/mixed; boundary="===============7188534788554011218=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fastfloat: upgrading to 8.4.0 SUCCEEDED
Message-ID: <010101a201ac78f1-391dc5f4-bddb-4607-a136-abda940d6b4a-000000@us-west-2.amazonses.com>
Date: Sun, 22 Nov 2026 05:13:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.22-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 05:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250862

--===============7188534788554011218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fastfloat* to *8.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fastfloat-upgrade-8.3.2-8.4.0.patch
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
From 6c2687a2c4e18245e17b68929c748af76294dbf4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 22 Nov 2026 05:05:57 +0000
Subject: [PATCH] fastfloat: upgrade 8.3.2 -> 8.4.0

Version 8.4.0
Merge pull request #440 from fastfloat/indeterminate-bigint
CI: run the Alpine workflow on ubuntu-24.04
Avoid zero-filling bigint buffers in the slow path (C++26 [[indeterminate]])
Merge pull request #433 from fastfloat/benchmark-rounds-to-nearest
Benchmark fast_float with and without FASTFLOAT_ROUNDS_TO_NEAREST
Merge pull request #432 from fastfloat/rounds-to-nearest-macro
Add FASTFLOAT_ROUNDS_TO_NEAREST to skip the rounding-mode check
Version 8.3.3
Merge pull request #430 from CODER-7777/fix-427-unlikely-cxx20-ext-warning
Merge pull request #431 from aikhanjum/codex/fastfloat-correctness
Reject integer_times_pow10 arguments wider than 64 bits
Silence -Wc++20-extensions at the remaining [[unlikely]] sites (fixes #427)
Run clang-format
Merge pull request #426 from sahvx655-wq/power-negative-shift
Avoid right-shifting a negative value in detail::power()
Merge pull request #425 from fastfloat/fix-424-fixed-width-invalid
Leave std::float32_t/std::float64_t unmodified on invalid input (fixes #424)
Merge pull request #423 from sahvx655-wq/fuzz-coverage
extend fuzzer to wide char types, integer parsing and all formats
---
 .../fastfloat/{fastfloat_8.3.2.bb => fastfloat_8.4.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.3.2.bb => fastfloat_8.4.0.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.3.2.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.4.0.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.3.2.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.4.0.bb
index db4312bfd9..11fc4889e0 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.3.2.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.4.0.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "42f254836ee416ffcf2f4e6576260003ac33d48c"
+SRCREV = "517e6b8e008341fc4ebf80cc709d8b51610a888e"
 
 inherit cmake
-- 
2.47.1


--===============7188534788554011218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PV changed from "8.3.2" to "8.4.0"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PKGV changed from 8.3.2 [default] to 8.4.0 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PV changed from "8.3.2" to "8.4.0"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGSIZE changed from 191509 to 194371 (+1%)
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGV changed from 8.3.2 [default] to 8.4.0 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PV changed from "8.3.2" to "8.4.0"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PKGV changed from 8.3.2 [default] to 8.4.0 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PV changed from "8.3.2" to "8.4.0"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PKGV changed from 8.3.2 [default] to 8.4.0 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PV changed from "8.3.2" to "8.4.0"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PKGV changed from 8.3.2 [default] to 8.4.0 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PV changed from "8.3.2" to "8.4.0"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PKGV changed from 8.3.2 [default] to 8.4.0 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PV changed from "8.3.2" to "8.4.0"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PKGV changed from 8.3.2 [default] to 8.4.0 [default]
packages/x86-64-v3-poky-linux/fastfloat: SRC_URI changed from "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.3.2" to "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.4.0"
packages/x86-64-v3-poky-linux/fastfloat: PV changed from "8.3.2" to "8.4.0"
packages/x86-64-v3-poky-linux/fastfloat: PKGV changed from 8.3.2 [default] to 8.4.0 [default]

--===============7188534788554011218==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fastfloat-upgrade-8.3.2-8.4.0.patch"

RnJvbSA2YzI2ODdhMmM0ZTE4MjQ1ZTE3YjY4OTI5Yzc0OGFmNzYyOTRkYmY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjIgTm92IDIwMjYgMDU6MDU6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
YXN0ZmxvYXQ6IHVwZ3JhZGUgOC4zLjIgLT4gOC40LjAKClZlcnNpb24gOC40LjAKTWVyZ2UgcHVs
bCByZXF1ZXN0ICM0NDAgZnJvbSBmYXN0ZmxvYXQvaW5kZXRlcm1pbmF0ZS1iaWdpbnQKQ0k6IHJ1
biB0aGUgQWxwaW5lIHdvcmtmbG93IG9uIHVidW50dS0yNC4wNApBdm9pZCB6ZXJvLWZpbGxpbmcg
YmlnaW50IGJ1ZmZlcnMgaW4gdGhlIHNsb3cgcGF0aCAoQysrMjYgW1tpbmRldGVybWluYXRlXV0p
Ck1lcmdlIHB1bGwgcmVxdWVzdCAjNDMzIGZyb20gZmFzdGZsb2F0L2JlbmNobWFyay1yb3VuZHMt
dG8tbmVhcmVzdApCZW5jaG1hcmsgZmFzdF9mbG9hdCB3aXRoIGFuZCB3aXRob3V0IEZBU1RGTE9B
VF9ST1VORFNfVE9fTkVBUkVTVApNZXJnZSBwdWxsIHJlcXVlc3QgIzQzMiBmcm9tIGZhc3RmbG9h
dC9yb3VuZHMtdG8tbmVhcmVzdC1tYWNybwpBZGQgRkFTVEZMT0FUX1JPVU5EU19UT19ORUFSRVNU
IHRvIHNraXAgdGhlIHJvdW5kaW5nLW1vZGUgY2hlY2sKVmVyc2lvbiA4LjMuMwpNZXJnZSBwdWxs
IHJlcXVlc3QgIzQzMCBmcm9tIENPREVSLTc3NzcvZml4LTQyNy11bmxpa2VseS1jeHgyMC1leHQt
d2FybmluZwpNZXJnZSBwdWxsIHJlcXVlc3QgIzQzMSBmcm9tIGFpa2hhbmp1bS9jb2RleC9mYXN0
ZmxvYXQtY29ycmVjdG5lc3MKUmVqZWN0IGludGVnZXJfdGltZXNfcG93MTAgYXJndW1lbnRzIHdp
ZGVyIHRoYW4gNjQgYml0cwpTaWxlbmNlIC1XYysrMjAtZXh0ZW5zaW9ucyBhdCB0aGUgcmVtYWlu
aW5nIFtbdW5saWtlbHldXSBzaXRlcyAoZml4ZXMgIzQyNykKUnVuIGNsYW5nLWZvcm1hdApNZXJn
ZSBwdWxsIHJlcXVlc3QgIzQyNiBmcm9tIHNhaHZ4NjU1LXdxL3Bvd2VyLW5lZ2F0aXZlLXNoaWZ0
CkF2b2lkIHJpZ2h0LXNoaWZ0aW5nIGEgbmVnYXRpdmUgdmFsdWUgaW4gZGV0YWlsOjpwb3dlcigp
Ck1lcmdlIHB1bGwgcmVxdWVzdCAjNDI1IGZyb20gZmFzdGZsb2F0L2ZpeC00MjQtZml4ZWQtd2lk
dGgtaW52YWxpZApMZWF2ZSBzdGQ6OmZsb2F0MzJfdC9zdGQ6OmZsb2F0NjRfdCB1bm1vZGlmaWVk
IG9uIGludmFsaWQgaW5wdXQgKGZpeGVzICM0MjQpCk1lcmdlIHB1bGwgcmVxdWVzdCAjNDIzIGZy
b20gc2Fodng2NTUtd3EvZnV6ei1jb3ZlcmFnZQpleHRlbmQgZnV6emVyIHRvIHdpZGUgY2hhciB0
eXBlcywgaW50ZWdlciBwYXJzaW5nIGFuZCBhbGwgZm9ybWF0cwotLS0KIC4uLi9mYXN0ZmxvYXQv
e2Zhc3RmbG9hdF84LjMuMi5iYiA9PiBmYXN0ZmxvYXRfOC40LjAuYmJ9ICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQve2Zhc3RmbG9hdF84LjMuMi5iYiA9PiBmYXN0
ZmxvYXRfOC40LjAuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2Zhc3RmbG9hdC9mYXN0ZmxvYXRfOC4zLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFz
dGZsb2F0L2Zhc3RmbG9hdF84LjQuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjMuMi5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Zhc3RmbG9hdC9mYXN0ZmxvYXRfOC40LjAuYmIK
aW5kZXggZGI0MzEyYmZkOS4uMTFmYzQ4ODllMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Zhc3RmbG9hdC9mYXN0ZmxvYXRfOC4zLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Zhc3RmbG9hdC9mYXN0ZmxvYXRfOC40LjAuYmIKQEAgLTksNiArOSw2IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiIFwKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2Zhc3RmbG9h
dC9mYXN0X2Zsb2F0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9diR7UFZ9Igog
Ci1TUkNSRVYgPSAiNDJmMjU0ODM2ZWU0MTZmZmNmMmY0ZTY1NzYyNjAwMDNhYzMzZDQ4YyIKK1NS
Q1JFViA9ICI1MTdlNmI4ZTAwODM0MWZjNGViZjgwY2M3MDlkOGI1MTYxMGE4ODhlIgogCiBpbmhl
cml0IGNtYWtlCi0tIAoyLjQ3LjEKCg==

--===============7188534788554011218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="fastfloat-changelog.txt"

Version 8.4.0
Merge pull request #440 from fastfloat/indeterminate-bigint
CI: run the Alpine workflow on ubuntu-24.04
Avoid zero-filling bigint buffers in the slow path (C++26 [[indeterminate]])
Merge pull request #433 from fastfloat/benchmark-rounds-to-nearest
Benchmark fast_float with and without FASTFLOAT_ROUNDS_TO_NEAREST
Merge pull request #432 from fastfloat/rounds-to-nearest-macro
Add FASTFLOAT_ROUNDS_TO_NEAREST to skip the rounding-mode check
Version 8.3.3
Merge pull request #430 from CODER-7777/fix-427-unlikely-cxx20-ext-warning
Merge pull request #431 from aikhanjum/codex/fastfloat-correctness
Reject integer_times_pow10 arguments wider than 64 bits
Silence -Wc++20-extensions at the remaining [[unlikely]] sites (fixes #427)
Run clang-format
Merge pull request #426 from sahvx655-wq/power-negative-shift
Avoid right-shifting a negative value in detail::power()
Merge pull request #425 from fastfloat/fix-424-fixed-width-invalid
Leave std::float32_t/std::float64_t unmodified on invalid input (fixes #424)
Merge pull request #423 from sahvx655-wq/fuzz-coverage
extend fuzzer to wide char types, integer parsing and all formats

--===============7188534788554011218==--
