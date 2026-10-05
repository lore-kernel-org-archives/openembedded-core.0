Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C768CA5FF5
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 05:28:41 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13593.1791178115235063634
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 22:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eKvigpk/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Y+vQ3QDA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a10a89047f-16a65d32-58b7-4e0b-94ef-3cd7fd1e5920-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791178114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PbWGKZCbF9FudqRzqsCwk5Jm1O1QZPz2W/1X1WptHZY=;
	b=eKvigpk/xx8mkGwcjEcX+QzOavFVNHIlSgu0R06wOmCnk8oaIXx0+rQESQQivRXy
	HjUpHsPTrKPZXvGiUItjj2E9UK80jYXEdRW951/nLvoSuef3DYGs9JKa4Rp4It5bazH
	Y/1iqPlLBFsYXfhpcJTUTEh3fxVYchc2jmCBCSZs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791178114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PbWGKZCbF9FudqRzqsCwk5Jm1O1QZPz2W/1X1WptHZY=;
	b=Y+vQ3QDAvDLC+uUkELagnxt4h6oEIlPJ1zS/L1pu+TYgLIVWvV18h3urnJJI7dKT
	5DiKpMLbqhIWneBPMptu9cW/v6W1+xCKMq+Yfrr/+8C66dxPuPusS3kWVXD5FqlfO5h
	HEAX1mhc+5FTvEx89rqKdaAPxEdBiZZKkEhJZEf4=
Content-Type: multipart/mixed; boundary="===============5968817819105672524=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fastfloat: upgrading to 8.3.1 SUCCEEDED
Message-ID: <010101a10a89047f-16a65d32-58b7-4e0b-94ef-3cd7fd1e5920-000000@us-west-2.amazonses.com>
Date: Mon, 5 Oct 2026 05:28:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 05:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247207

--===============5968817819105672524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fastfloat* to *8.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fastfloat-upgrade-8.3.0-8.3.1.patch
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
From c721ddef2defcb00461755f33a797d9028400d1f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 5 Oct 2026 05:12:36 +0000
Subject: [PATCH] fastfloat: upgrade 8.3.0 -> 8.3.1

Version 8.3.1
Merge pull request #420 from fastfloat/release-workflow
Add manually triggered release workflow; fix on-release asset upload
Merge pull request #419 from fastfloat/fix-418-struct-layout
Reorder parsed_number_string_t fields to avoid padding (fixes #418)
Merge pull request #417 from fastfloat/fix-alpine-ci
CI: pin Alpine to v3.22 (setup-alpine v1 fails with apk-tools v3)
Merge pull request #409 from caolanm/main
Merge pull request #415 from Algunenano/fix-benchmark-branch-misses
Average branch misses over the repetitions in the benchmark
Merge pull request #408 from jadidbourbaki/float16-exactness
Avoid right-shifting a negative value in subnormal_ties_possible()
Merge pull request #413 from fastfloat/clang-format-fold
Fold the format at compile time under clang, mark cold checks unlikely
Merge pull request #412 from fastfloat/strncasecmp-simple
Restore the simple loop in fastfloat_strncasecmp
Merge pull request #410 from Algunenano/javascript-fmt-hot-path
Keep chars_format::javascript out of the common hot path
Gate the subnormal tie test on a compile-time predicate
drop the unreachable tail of parse_mantissa
Fix std::float16_t rounding of subnormal ties and fast-path overflow
---
 .../fastfloat/{fastfloat_8.3.0.bb => fastfloat_8.3.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.3.0.bb => fastfloat_8.3.1.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.3.1.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.3.1.bb
index a041f32988..aca0a5701d 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.3.1.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "b0ab987b3dfdde13fa1915f65ef2a5c068d9208c"
+SRCREV = "f3f02c8ad0afd8181166dabce6a9e69f8aec24de"
 
 inherit cmake
-- 
2.47.1


--===============5968817819105672524==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fastfloat-upgrade-8.3.0-8.3.1.patch"

RnJvbSBjNzIxZGRlZjJkZWZjYjAwNDYxNzU1ZjMzYTc5N2Q5MDI4NDAwZDFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgNSBPY3QgMjAyNiAwNToxMjozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZh
c3RmbG9hdDogdXBncmFkZSA4LjMuMCAtPiA4LjMuMQoKVmVyc2lvbiA4LjMuMQpNZXJnZSBwdWxs
IHJlcXVlc3QgIzQyMCBmcm9tIGZhc3RmbG9hdC9yZWxlYXNlLXdvcmtmbG93CkFkZCBtYW51YWxs
eSB0cmlnZ2VyZWQgcmVsZWFzZSB3b3JrZmxvdzsgZml4IG9uLXJlbGVhc2UgYXNzZXQgdXBsb2Fk
Ck1lcmdlIHB1bGwgcmVxdWVzdCAjNDE5IGZyb20gZmFzdGZsb2F0L2ZpeC00MTgtc3RydWN0LWxh
eW91dApSZW9yZGVyIHBhcnNlZF9udW1iZXJfc3RyaW5nX3QgZmllbGRzIHRvIGF2b2lkIHBhZGRp
bmcgKGZpeGVzICM0MTgpCk1lcmdlIHB1bGwgcmVxdWVzdCAjNDE3IGZyb20gZmFzdGZsb2F0L2Zp
eC1hbHBpbmUtY2kKQ0k6IHBpbiBBbHBpbmUgdG8gdjMuMjIgKHNldHVwLWFscGluZSB2MSBmYWls
cyB3aXRoIGFway10b29scyB2MykKTWVyZ2UgcHVsbCByZXF1ZXN0ICM0MDkgZnJvbSBjYW9sYW5t
L21haW4KTWVyZ2UgcHVsbCByZXF1ZXN0ICM0MTUgZnJvbSBBbGd1bmVuYW5vL2ZpeC1iZW5jaG1h
cmstYnJhbmNoLW1pc3NlcwpBdmVyYWdlIGJyYW5jaCBtaXNzZXMgb3ZlciB0aGUgcmVwZXRpdGlv
bnMgaW4gdGhlIGJlbmNobWFyawpNZXJnZSBwdWxsIHJlcXVlc3QgIzQwOCBmcm9tIGphZGlkYm91
cmJha2kvZmxvYXQxNi1leGFjdG5lc3MKQXZvaWQgcmlnaHQtc2hpZnRpbmcgYSBuZWdhdGl2ZSB2
YWx1ZSBpbiBzdWJub3JtYWxfdGllc19wb3NzaWJsZSgpCk1lcmdlIHB1bGwgcmVxdWVzdCAjNDEz
IGZyb20gZmFzdGZsb2F0L2NsYW5nLWZvcm1hdC1mb2xkCkZvbGQgdGhlIGZvcm1hdCBhdCBjb21w
aWxlIHRpbWUgdW5kZXIgY2xhbmcsIG1hcmsgY29sZCBjaGVja3MgdW5saWtlbHkKTWVyZ2UgcHVs
bCByZXF1ZXN0ICM0MTIgZnJvbSBmYXN0ZmxvYXQvc3RybmNhc2VjbXAtc2ltcGxlClJlc3RvcmUg
dGhlIHNpbXBsZSBsb29wIGluIGZhc3RmbG9hdF9zdHJuY2FzZWNtcApNZXJnZSBwdWxsIHJlcXVl
c3QgIzQxMCBmcm9tIEFsZ3VuZW5hbm8vamF2YXNjcmlwdC1mbXQtaG90LXBhdGgKS2VlcCBjaGFy
c19mb3JtYXQ6OmphdmFzY3JpcHQgb3V0IG9mIHRoZSBjb21tb24gaG90IHBhdGgKR2F0ZSB0aGUg
c3Vibm9ybWFsIHRpZSB0ZXN0IG9uIGEgY29tcGlsZS10aW1lIHByZWRpY2F0ZQpkcm9wIHRoZSB1
bnJlYWNoYWJsZSB0YWlsIG9mIHBhcnNlX21hbnRpc3NhCkZpeCBzdGQ6OmZsb2F0MTZfdCByb3Vu
ZGluZyBvZiBzdWJub3JtYWwgdGllcyBhbmQgZmFzdC1wYXRoIG92ZXJmbG93Ci0tLQogLi4uL2Zh
c3RmbG9hdC97ZmFzdGZsb2F0XzguMy4wLmJiID0+IGZhc3RmbG9hdF84LjMuMS5iYn0gICAgICAg
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Zhc3RmbG9hdC97ZmFzdGZsb2F0XzguMy4wLmJi
ID0+IGZhc3RmbG9hdF84LjMuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjMuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMy4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84
LjMuMS5iYgppbmRleCBhMDQxZjMyOTg4Li5hY2EwYTU3MDFkIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjMuMC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjMuMS5iYgpAQCAtOSw2ICs5LDYg
QEAgTElDX0ZJTEVTX0NIS1NVTSA9ICIgXAogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
ZmFzdGZsb2F0L2Zhc3RfZmxvYXQuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3RhZz12
JHtQVn0iCiAKLVNSQ1JFViA9ICJiMGFiOTg3YjNkZmRkZTEzZmExOTE1ZjY1ZWYyYTVjMDY4ZDky
MDhjIgorU1JDUkVWID0gImYzZjAyYzhhZDBhZmQ4MTgxMTY2ZGFiY2U2YTllNjlmOGFlYzI0ZGUi
CiAKIGluaGVyaXQgY21ha2UKLS0gCjIuNDcuMQoK

--===============5968817819105672524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="fastfloat-changelog.txt"

Version 8.3.1
Merge pull request #420 from fastfloat/release-workflow
Add manually triggered release workflow; fix on-release asset upload
Merge pull request #419 from fastfloat/fix-418-struct-layout
Reorder parsed_number_string_t fields to avoid padding (fixes #418)
Merge pull request #417 from fastfloat/fix-alpine-ci
CI: pin Alpine to v3.22 (setup-alpine v1 fails with apk-tools v3)
Merge pull request #409 from caolanm/main
Merge pull request #415 from Algunenano/fix-benchmark-branch-misses
Average branch misses over the repetitions in the benchmark
Merge pull request #408 from jadidbourbaki/float16-exactness
Avoid right-shifting a negative value in subnormal_ties_possible()
Merge pull request #413 from fastfloat/clang-format-fold
Fold the format at compile time under clang, mark cold checks unlikely
Merge pull request #412 from fastfloat/strncasecmp-simple
Restore the simple loop in fastfloat_strncasecmp
Merge pull request #410 from Algunenano/javascript-fmt-hot-path
Keep chars_format::javascript out of the common hot path
Gate the subnormal tie test on a compile-time predicate
drop the unreachable tail of parse_mantissa
Fix std::float16_t rounding of subnormal ties and fast-path overflow

--===============5968817819105672524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PKGV changed from 8.3.0 [default] to 8.3.1 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PV changed from "8.3.0" to "8.3.1"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGSIZE changed from 185076 to 190921 (+3%)
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGV changed from 8.3.0 [default] to 8.3.1 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PV changed from "8.3.0" to "8.3.1"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PKGV changed from 8.3.0 [default] to 8.3.1 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PV changed from "8.3.0" to "8.3.1"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PKGV changed from 8.3.0 [default] to 8.3.1 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PV changed from "8.3.0" to "8.3.1"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PKGV changed from 8.3.0 [default] to 8.3.1 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PV changed from "8.3.0" to "8.3.1"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PKGV changed from 8.3.0 [default] to 8.3.1 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PV changed from "8.3.0" to "8.3.1"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PKGV changed from 8.3.0 [default] to 8.3.1 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PV changed from "8.3.0" to "8.3.1"
packages/x86-64-v3-poky-linux/fastfloat: PKGV changed from 8.3.0 [default] to 8.3.1 [default]
packages/x86-64-v3-poky-linux/fastfloat: SRC_URI changed from "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.3.0" to "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.3.1"
packages/x86-64-v3-poky-linux/fastfloat: PV changed from "8.3.0" to "8.3.1"

--===============5968817819105672524==--

