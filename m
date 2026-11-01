Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10139.1793510038991507232
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2026 22:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZUcL6Ddf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yfQwHVEx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1958759b3-a4c6d1f3-61b8-4da2-bfa5-6ccf7140983d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793510038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RLqoo0VMAYxiyzHdIt0f3UXdrREbk6ixU96JJ0iHwO4=;
	b=ZUcL6Ddf1WXQjkXJNPY2hc/PChwhJR/yvE1vUhSK6MGimrwJP84sLYGrjNyealCk
	ewjkji8HlyI+QXOTqw/GoPwxVqZ8fx2AJz1FF0Kp6y39HjkFWcm6iTgegKvm0IBKyqC
	wOLU27wzEadEVcofBKJY53FHigck7yvZKXHAAxQk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793510038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RLqoo0VMAYxiyzHdIt0f3UXdrREbk6ixU96JJ0iHwO4=;
	b=yfQwHVExbQ+WFLSIPFI/dlfEC0emUEH+TEVI2vW4FvRY0ukVke9bv6hfytrvSkDi
	rAJnFMz3yFhKTtddp4wP0b+aEI1plDROe355qj+h/RUWPsg/u6zHnxnmijkSmqyOnE1
	tqsAVlzR1+z3H+5WdBzeYSueNGlHbCVtP2Ntkhvk=
Content-Type: multipart/mixed; boundary="===============8058038421056388057=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fastfloat: upgrading to 8.3.3 SUCCEEDED
Message-ID: <010101a1958759b3-a4c6d1f3-61b8-4da2-bfa5-6ccf7140983d-000000@us-west-2.amazonses.com>
Date: Sun, 1 Nov 2026 05:13:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 05:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249150

--===============8058038421056388057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fastfloat* to *8.3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fastfloat-upgrade-8.3.2-8.3.3.patch
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
From fd16dad461af008458beff0a3fb23b268bdafada Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Nov 2026 05:11:39 +0000
Subject: [PATCH] fastfloat: upgrade 8.3.2 -> 8.3.3

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
 .../fastfloat/{fastfloat_8.3.2.bb => fastfloat_8.3.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.3.2.bb => fastfloat_8.3.3.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.3.2.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.3.3.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.3.2.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.3.3.bb
index db4312bfd9..31a8a25bd5 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.3.2.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.3.3.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "42f254836ee416ffcf2f4e6576260003ac33d48c"
+SRCREV = "dbeabeeb3e6791cb96994c2a7a084c36e62ccfb2"
 
 inherit cmake
-- 
2.47.1


--===============8058038421056388057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="fastfloat-changelog.txt"

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

--===============8058038421056388057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PV changed from "8.3.2" to "8.3.3"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PKGV changed from 8.3.2 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PV changed from "8.3.2" to "8.3.3"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGV changed from 8.3.2 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGSIZE changed from 191509 to 193067 (+1%)
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PV changed from "8.3.2" to "8.3.3"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PKGV changed from 8.3.2 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PV changed from "8.3.2" to "8.3.3"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PKGV changed from 8.3.2 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PV changed from "8.3.2" to "8.3.3"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PKGV changed from 8.3.2 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PV changed from "8.3.2" to "8.3.3"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PKGV changed from 8.3.2 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PV changed from "8.3.2" to "8.3.3"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PKGV changed from 8.3.2 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/fastfloat: SRC_URI changed from "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.3.2" to "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.3.3"
packages/x86-64-v3-poky-linux/fastfloat: PV changed from "8.3.2" to "8.3.3"
packages/x86-64-v3-poky-linux/fastfloat: PKGV changed from 8.3.2 [default] to 8.3.3 [default]

--===============8058038421056388057==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fastfloat-upgrade-8.3.2-8.3.3.patch"

RnJvbSBmZDE2ZGFkNDYxYWYwMDg0NThiZWZmMGEzZmIyM2IyNjhiZGFmYWRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBOb3YgMjAyNiAwNToxMTozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZh
c3RmbG9hdDogdXBncmFkZSA4LjMuMiAtPiA4LjMuMwoKVmVyc2lvbiA4LjMuMwpNZXJnZSBwdWxs
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
e2Zhc3RmbG9hdF84LjMuMi5iYiA9PiBmYXN0ZmxvYXRfOC4zLjMuYmJ9ICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQve2Zhc3RmbG9hdF84LjMuMi5iYiA9PiBmYXN0
ZmxvYXRfOC4zLjMuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2Zhc3RmbG9hdC9mYXN0ZmxvYXRfOC4zLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFz
dGZsb2F0L2Zhc3RmbG9hdF84LjMuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjMuMi5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Zhc3RmbG9hdC9mYXN0ZmxvYXRfOC4zLjMuYmIK
aW5kZXggZGI0MzEyYmZkOS4uMzFhOGEyNWJkNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Zhc3RmbG9hdC9mYXN0ZmxvYXRfOC4zLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Zhc3RmbG9hdC9mYXN0ZmxvYXRfOC4zLjMuYmIKQEAgLTksNiArOSw2IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiIFwKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2Zhc3RmbG9h
dC9mYXN0X2Zsb2F0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9diR7UFZ9Igog
Ci1TUkNSRVYgPSAiNDJmMjU0ODM2ZWU0MTZmZmNmMmY0ZTY1NzYyNjAwMDNhYzMzZDQ4YyIKK1NS
Q1JFViA9ICJkYmVhYmVlYjNlNjc5MWNiOTY5OTRjMmE3YTA4NGMzNmU2MmNjZmIyIgogCiBpbmhl
cml0IGNtYWtlCi0tIAoyLjQ3LjEKCg==

--===============8058038421056388057==--
