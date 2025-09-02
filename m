Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6A6CAC599
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:43 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.89785.1756850180049651740
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vMgc0TEr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Iv53fWb2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101990c6e8e95-984f8ad4-0d4c-4bc9-9f0c-c0f768cded74-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850196;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=upBmIsGcOfywTQCt4BI/EAC9lEG+mcxoNwQm9Fm5Rok=;
	b=vMgc0TErtqTqLiCSLIK0t0mddX6WmIM6cYAc9ccXByGY04rVM/mxH+n/YRqnCw98
	eoqczCRNAvXdYgky4fhk8SapxDiWzAgvIJUzkNTHqfzh0AU21xQ75YjpXMMxrPR/5Ad
	GBoPEhXp8NALDLdVEJqxxGIad9aysI/J8KBoIf0g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850196;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=upBmIsGcOfywTQCt4BI/EAC9lEG+mcxoNwQm9Fm5Rok=;
	b=Iv53fWb2pZF2tMS9/Ck4jJ7jdHdQTma2UZTxcRum+hpzkyOSE98nlgeSp0EMyBrj
	8vASzQQ+7ed5vBk1r5kRV7XGWyb2AWpVO+f+N/bo3cjBdIMn4cmA+LDRKaPl/j3grZA
	cCZsIiN6i6oPUZErh1Zra9sSPyL3Fd1N9OZUeWxw=
Content-Type: multipart/mixed; boundary="===============1322688275074631129=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsolv: upgrading to 0.7.35 SUCCEEDED
Message-ID: <010101990c6e8e95-984f8ad4-0d4c-4bc9-9f0c-c0f768cded74-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222799

--===============1322688275074631129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsolv* to *0.7.35* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsolv-upgrade-0.7.34-0.7.35.patch
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
From ee0bebaeab4ff30e78cca911c54fe21fbde3dbdd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 19:18:37 +0000
Subject: [PATCH] libsolv: upgrade 0.7.34 -> 0.7.35

---
 .../libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch | 2 +-
 .../libsolv/{libsolv_0.7.34.bb => libsolv_0.7.35.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.34.bb => libsolv_0.7.35.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
index d6e983dec8..b3d3905f21 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
@@ -1,4 +1,4 @@
-From da99bf09e83469612e2c821696025a4e591bb95c Mon Sep 17 00:00:00 2001
+From a1ac8d4adedf8b64eb0d819834f393a4293dd528 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Oct 2021 22:28:45 -0700
 Subject: [PATCH] utils: Conside musl when wrapping qsort_r
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.34.bb b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.34.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.35.bb
index 7e2bd686d4..ec74308bb5 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.34.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;ta
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "262e8efa0239a78770910fde1579158725cc6ffa"
+SRCREV = "fb4b4340d46108cb365113e432642d6024886c7a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============1322688275074631129==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.34-0.7.35.patch"

RnJvbSBlZTBiZWJhZWFiNGZmMzBlNzhjY2E5MTFjNTRmZTIxZmJkZTNkYmRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxOToxODozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNvbHY6IHVwZ3JhZGUgMC43LjM0IC0+IDAuNy4zNQoKLS0tCiAuLi4vbGlic29sdi8wMDAxLXV0
aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0Y2ggfCAyICstCiAuLi4v
bGlic29sdi97bGlic29sdl8wLjcuMzQuYmIgPT4gbGlic29sdl8wLjcuMzUuYmJ9ICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi97bGlic29sdl8wLjcuMzQu
YmIgPT4gbGlic29sdl8wLjcuMzUuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdy
YXBwaW5nLXFzb3J0X3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJz
b2x2LzAwMDEtdXRpbHMtQ29uc2lkZS1tdXNsLXdoZW4td3JhcHBpbmctcXNvcnRfci5wYXRjaApp
bmRleCBkNmU5ODNkZWM4Li5iM2QzOTA1ZjIxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbGlic29sdi9saWJzb2x2LzAwMDEtdXRpbHMtQ29uc2lkZS1tdXNsLXdoZW4td3JhcHBp
bmctcXNvcnRfci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJz
b2x2LzAwMDEtdXRpbHMtQ29uc2lkZS1tdXNsLXdoZW4td3JhcHBpbmctcXNvcnRfci5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gZGE5OWJmMDllODM0Njk2MTJlMmM4MjE2OTYwMjVhNGU1OTFi
Yjk1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTFhYzhkNGFkZWRmOGI2NGViMGQ4
MTk4MzRmMzkzYTQyOTNkZDUyOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDI4IE9jdCAyMDIxIDIyOjI4OjQ1
IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHV0aWxzOiBDb25zaWRlIG11c2wgd2hlbiB3cmFwcGlu
ZyBxc29ydF9yCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJz
b2x2XzAuNy4zNC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHZfMC43
LjM1LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRl
bmRlZC9saWJzb2x2L2xpYnNvbHZfMC43LjM0LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4zNS5iYgppbmRleCA3ZTJiZDY4NmQ0Li5lYzc0MzA4
YmI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAu
Ny4zNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4z
NS5iYgpAQCAtMTIsNyArMTIsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vb3BlblNV
U0UvbGlic29sdi5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwczt0YQogICAgICAgICAg
ICBmaWxlOi8vMDAwMS11dGlscy1Db25zaWRlLW11c2wtd2hlbi13cmFwcGluZy1xc29ydF9yLnBh
dGNoIFwKICIKIAotU1JDUkVWID0gIjI2MmU4ZWZhMDIzOWE3ODc3MDkxMGZkZTE1NzkxNTg3MjVj
YzZmZmEiCitTUkNSRVYgPSAiZmI0YjQzNDBkNDYxMDhjYjM2NTExM2U0MzI2NDJkNjAyNDg4NmM3
YSIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSsp
IgogCi0tIAoyLjQ3LjEKCg==

--===============1322688275074631129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libsolv: PV changed from "0.7.34" to "0.7.35"
packages/x86-64-v3-poky-linux/libsolv: SRC_URI changed from "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=0.7.34 file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch" to "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=0.7.35 file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch"
packages/x86-64-v3-poky-linux/libsolv: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.34" to "0.7.35"
packages/x86-64-v3-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-dbg: PKGSIZE changed from 2874776 to 2888280 (+0%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.34" to "0.7.35"
packages/x86-64-v3-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-dev: PKGSIZE changed from 130401 to 130595 (+0%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.34" to "0.7.35"
packages/x86-64-v3-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-doc: PKGSIZE changed from 299491 to 300175 (+0%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.34" to "0.7.35"
packages/x86-64-v3-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: PV changed from "0.7.34" to "0.7.35"
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1661094 to 1665321 (+0%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-src: FILELIST: directory renamed /usr/src/debug/libsolv/0.7.34/ext -> /usr/src/debug/libsolv/0.7.35/ext, directory renamed /usr/src/debug/libsolv/0.7.34/tools -> /usr/src/debug/libsolv/0.7.35/tools, removed "/usr/src/debug/libsolv/0.7.34/src/sha1.c /usr/src/debug/libsolv/0.7.34/src/cplxdeps.c /usr/src/debug/libsolv/0.7.34/src/transaction.c /usr/src/debug/libsolv/0.7.34/src/solver_private.h /usr/src/debug/libsolv/0.7.34/src/poolarch.c /usr/src/debug/libsolv/0.7.34/src/sha1.h /usr/src/debug/libsolv/0.7.34/src/repo.c /usr/src/debug/libsolv/0.7.34/src/poolarch.h /usr/src/debug/libsolv/0.7.34/src/transaction.h /usr/src/debug/libsolv/0.7.34/src/cplxdeps.h /usr/src/debug/libsolv/0.7.34/src/repo_solv.h /usr/src/debug/libsolv/0.7.34/src/filelistfilter.c /usr/src/debug/libsolv/0.7.34/src/chksum.c /usr/src/debug/libsolv/0.7.34/src/bitmap.c /usr/src/debug/libsolv/0.7.34/src/policy.c /usr/src/debug/libsolv/0.7.34/src/poolid.c /usr/src/debug/libsolv/0.
 7.34/src/solver.c /usr/src/debug/libsolv/0.7.34/src/repo_solv.c /usr/src/debug/libsolv/0.7.34/src/chksum.h /usr/src/debug/libsolv/0.7.34/src/bitmap.h /usr/src/debug/libsolv/0.7.34/src/fileprovides.c /usr/src/debug/libsolv/0.7.34/src/policy.h /usr/src/debug/libsolv/0.7.34/src/poolid.h /usr/src/debug/libsolv/0.7.34/src/selection.h /usr/src/debug/libsolv/0.7.34/src/solver.h /usr/src/debug/libsolv/0.7.34/src/suse.c /usr/src/debug/libsolv/0.7.34/src/diskusage.c /usr/src/debug/libsolv/0.7.34/src/queue.h /usr/src/debug/libsolv/0.7.34/src/rules.h /usr/src/debug/libsolv/0.7.34/src/selection.c /usr/src/debug/libsolv/0.7.34/src/solver_util.c /usr/src/debug/libsolv/0.7.34/src/order.c /usr/src/debug/libsolv/0.7.34/src/queue.c /usr/src/debug/libsolv/0.7.34/src/rules.c /usr/src/debug/libsolv/0.7.34/src/util.c /usr/src/debug/libsolv/0.7.34/src/repopage.c /usr/src/debug/libsolv/0.7.34/src/repopage.h /usr/src/debug/libsolv/0.7.34/src/hash.h /usr/src/debug/libsolv/0.7.34/src/cleandeps.c /usr/src/debug
 /libsolv/0.7.34/src/util.h /usr/src/debug/libsolv/0.7.34/src/decision.c /usr/src/debug/libsolv/0.7.34/src/problems.h /usr/src/debug/libsolv/0.7.34/src/repo_write.h /usr/src/debug/libsolv/0.7.34/src/solvable.c /usr/src/debug/libsolv/0.7.34/src/knownid.h /usr/src/debug/libsolv/0.7.34/src/solvable.h /usr/src/debug/libsolv/0.7.34/src/problems.c /usr/src/debug/libsolv/0.7.34/src/apk.h /usr/src/debug/libsolv/0.7.34/src/repo_write.c /usr/src/debug/libsolv/0.7.34/src/repodata.h /usr/src/debug/libsolv/0.7.34/src/solverdebug.h /usr/src/debug/libsolv/0.7.34/src/md5.c /usr/src/debug/libsolv/0.7.34/src/pooltypes.h /usr/src/debug/libsolv/0.7.34/src/userinstalled.c /usr/src/debug/libsolv/0.7.34/src/solverdebug.c /usr/src/debug/libsolv/0.7.34/src/repodata.c /usr/src/debug/libsolv/0.7.34/src/apk.c /usr/src/debug/libsolv/0.7.34/src/md5.h /usr/src/debug/libsolv/0.7.34/src/pool.c /usr/src/debug/libsolv/0.7.34/src/dirpool.h /usr/src/debug/libsolv/0.7.34/src/evr.h /usr/src/debug/libsolv/0.7.34/src/datait
 erator.h /usr/src/debug/libsolv/0.7.34/src/strpool.h /usr/src/debug/libsolv/0.7.34/src/dirpool.c /usr/src/debug/libsolv/0.7.34/src/evr.c /usr/src/debug/libsolv/0.7.34/src/pool.h /usr/src/debug/libsolv/0.7.34/src/strpool.c /usr/src/debug/libsolv/0.7.34/src/poolvendor.h /usr/src/debug/libsolv/0.7.34/src/repo.h /usr/src/debug/libsolv/0.7.34/src/solvversion.c /usr/src/debug/libsolv/0.7.34/src/sha2.h /usr/src/debug/libsolv/0.7.34/src/poolvendor.c /usr/src/debug/libsolv/0.7.34/src/repopack.h /usr/src/debug/libsolv/0.7.34/src/sha2.c /usr/src/debug/libsolv/0.7.34/src/solvversion.h", added "/usr/src/debug/libsolv/0.7.35/src/transaction.c /usr/src/debug/libsolv/0.7.35/src/poolarch.c /usr/src/debug/libsolv/0.7.35/src/poolarch.h /usr/src/debug/libsolv/0.7.35/src/transaction.h /usr/src/debug/libsolv/0.7.35/src/filelistfilter.c /usr/src/debug/libsolv/0.7.35/src/chksum.c /usr/src/debug/libsolv/0.7.35/src/bitmap.c /usr/src/debug/libsolv/0.7.35/src/policy.c /usr/src/debug/libsolv/0.7.35/src/poolid.c
  /usr/src/debug/libsolv/0.7.35/src/solver.c /usr/src/debug/libsolv/0.7.35/src/bitmap.h /usr/src/debug/libsolv/0.7.35/src/policy.h /usr/src/debug/libsolv/0.7.35/src/poolid.h /usr/src/debug/libsolv/0.7.35/src/solver.h /usr/src/debug/libsolv/0.7.35/src/chksum.h /usr/src/debug/libsolv/0.7.35/src/selection.h /usr/src/debug/libsolv/0.7.35/src/selection.c /usr/src/debug/libsolv/0.7.35/src/cleandeps.c /usr/src/debug/libsolv/0.7.35/src/poolwhatprovides.c /usr/src/debug/libsolv/0.7.35/src/repodata.h /usr/src/debug/libsolv/0.7.35/src/userinstalled.c /usr/src/debug/libsolv/0.7.35/src/repodata.c /usr/src/debug/libsolv/0.7.35/src/pool.c /usr/src/debug/libsolv/0.7.35/src/evr.h /usr/src/debug/libsolv/0.7.35/src/evr.c /usr/src/debug/libsolv/0.7.35/src/pool.h /usr/src/debug/libsolv/0.7.35/src/pooldep.c /usr/src/debug/libsolv/0.7.35/src/solver_private.h /usr/src/debug/libsolv/0.7.35/src/fileprovides.c /usr/src/debug/libsolv/0.7.35/src/queue.h /usr/src/debug/libsolv/0.7.35/src/rules.h /usr/src/debug/li
 bsolv/0.7.35/src/solver_util.c /usr/src/debug/libsolv/0.7.35/src/order.c /usr/src/debug/libsolv/0.7.35/src/queue.c /usr/src/debug/libsolv/0.7.35/src/rules.c /usr/src/debug/libsolv/0.7.35/src/repopage.c /usr/src/debug/libsolv/0.7.35/src/repopage.h /usr/src/debug/libsolv/0.7.35/src/knownid.h /usr/src/debug/libsolv/0.7.35/src/solverdebug.h /usr/src/debug/libsolv/0.7.35/src/md5.c /usr/src/debug/libsolv/0.7.35/src/pooltypes.h /usr/src/debug/libsolv/0.7.35/src/solverdebug.c /usr/src/debug/libsolv/0.7.35/src/md5.h /usr/src/debug/libsolv/0.7.35/src/dirpool.h /usr/src/debug/libsolv/0.7.35/src/strpool.h /usr/src/debug/libsolv/0.7.35/src/dataiterator.h /usr/src/debug/libsolv/0.7.35/src/dirpool.c /usr/src/debug/libsolv/0.7.35/src/strpool.c /usr/src/debug/libsolv/0.7.35/src/poolvendor.h /usr/src/debug/libsolv/0.7.35/src/poolvendor.c /usr/src/debug/libsolv/0.7.35/src/sha1.c /usr/src/debug/libsolv/0.7.35/src/cplxdeps.c /usr/src/debug/libsolv/0.7.35/src/sha1.h /usr/src/debug/libsolv/0.7.35/src/cplx
 deps.h /usr/src/debug/libsolv/0.7.35/src/diskusage.c /usr/src/debug/libsolv/0.7.35/src/decision.c /usr/src/debug/libsolv/0.7.35/src/problems.h /usr/src/debug/libsolv/0.7.35/src/problems.c /usr/src/debug/libsolv/0.7.35/src/sha2.h /usr/src/debug/libsolv/0.7.35/src/repopack.h /usr/src/debug/libsolv/0.7.35/src/sha2.c /usr/src/debug/libsolv/0.7.35/src/repo_solv.h /usr/src/debug/libsolv/0.7.35/src/repo_solv.c /usr/src/debug/libsolv/0.7.35/src/suse.c /usr/src/debug/libsolv/0.7.35/src/util.c /usr/src/debug/libsolv/0.7.35/src/hash.h /usr/src/debug/libsolv/0.7.35/src/util.h /usr/src/debug/libsolv/0.7.35/src/repo_write.h /usr/src/debug/libsolv/0.7.35/src/solvable.c /usr/src/debug/libsolv/0.7.35/src/solvable.h /usr/src/debug/libsolv/0.7.35/src/repo_write.c /usr/src/debug/libsolv/0.7.35/src/apk.h /usr/src/debug/libsolv/0.7.35/src/apk.c /usr/src/debug/libsolv/0.7.35/src/solvversion.c /usr/src/debug/libsolv/0.7.35/src/repo.h /usr/src/debug/libsolv/0.7.35/src/repo.c /usr/src/debug/libsolv/0.7.35/sr
 c/solvversion.h"
packages/x86-64-v3-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.34" to "0.7.35"
packages/x86-64-v3-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv-staticdev: PKGSIZE changed from 4399142 to 4438490 (+1%)
packages/x86-64-v3-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.34" to "0.7.35"
packages/x86-64-v3-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolv: PV changed from "0.7.34" to "0.7.35"
packages/x86-64-v3-poky-linux/libsolv/libsolv: PKGV changed from 0.7.34 [default] to 0.7.35 [default]
packages/x86-64-v3-poky-linux/libsolv/libsolvext: PV changed from "0.7.34" to "0.7.35"
packages/x86-64-v3-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.34 [default] to 0.7.35 [default]

--===============1322688275074631129==--

