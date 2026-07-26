Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9924C53219
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 05:19:27 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5938.1785043159738268709
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 22:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=l4QbTS1H;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kGMTTf/t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f9cdd0617-f8d0924e-a13f-4705-9c23-2166a08648ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785043158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vk1TkOvTvNYhxKHNVrUdPOs6eU9d3szjg+aiPD9z6ok=;
	b=l4QbTS1HK0pkVKycy1IpE8YkIAN23d1N79VCVDhNxyEXxsBdO/tgcBFUfgVzTI1G
	GhIjkDD524Sv/33Ry0mOKa45AcGIrBHyr9T1VoeN9wV8dONa4FI/p9Y/tE815hkVTep
	4vjnX+BmUGHKrYcuejcKlbPpiLiQh8ad540A9zs0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785043158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vk1TkOvTvNYhxKHNVrUdPOs6eU9d3szjg+aiPD9z6ok=;
	b=kGMTTf/tQRI7u/ouIqKKJaA2Gt+b1VnU/3H1IKxjJHcM0/ncFmHlECdjR8/8oNBS
	LMVecb9yBwqF0oKlp6CvMKr7Pv9/iz2h920096xEoHy4PbFgjpagLMFUMZB/4lNJuP+
	sHJTa6c6o/OpYQcX1YzCOBEOajXWtXnNm2bXod/Y=
Content-Type: multipart/mixed; boundary="===============0078638147950066542=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytz: upgrading to 2026.3 SUCCEEDED
Message-ID: <0101019f9cdd0617-f8d0924e-a13f-4705-9c23-2166a08648ff-000000@us-west-2.amazonses.com>
Date: Sun, 26 Jul 2026 05:19:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.26-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 05:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241977

--===============0078638147950066542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pytz* to *2026.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytz-upgrade-2026.2-2026.3.patch
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
From 9b8351e4afe0cc53f4ca5a642893afdb51a77f7f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 26 Jul 2026 05:13:43 +0000
Subject: [PATCH] python3-pytz: upgrade 2026.2 -> 2026.3

---
 .../python/{python3-pytz_2026.2.bb => python3-pytz_2026.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2026.2.bb => python3-pytz_2026.3.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2026.2.bb b/meta/recipes-devtools/python/python3-pytz_2026.3.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pytz_2026.2.bb
rename to meta/recipes-devtools/python/python3-pytz_2026.3.bb
index 1365897d85..cfcf33c837 100644
--- a/meta/recipes-devtools/python/python3-pytz_2026.2.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2026.3.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "0e60b47b29f21574376f218fe21abc009894a2321ea16c6754f3cad6eb7cdd6a"
+SRC_URI[sha256sum] = "3a30feb7a1a04cf0fa0be1624415930843b02f012eb800380f36f906a723e4ae"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \
-- 
2.47.1


--===============0078638147950066542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pytz: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/python3-pytz: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/python3-pytz: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2026.2.tar.gz;downloadfilename=pytz-2026.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2026.3.tar.gz;downloadfilename=pytz-2026.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dbg: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dbg: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dev: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dev: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-doc: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-doc: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-locale: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-locale: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-ptest: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-ptest: PKGSIZE changed from 59390 to 60073 (+1%)
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-ptest: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-src: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-src: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-staticdev: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-staticdev: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PKGSIZE changed from 1047946 to 1042555 (-1%)
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytz-2026.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pytz-2026.2.dist-info -> /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PKGV changed from 2026.2 [default] to 2026.3 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.14/site-packages/pytz-2026.2.dist-info moved to /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info

--===============0078638147950066542==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytz-upgrade-2026.2-2026.3.patch"

RnJvbSA5YjgzNTFlNGFmZTBjYzUzZjRjYTVhNjQyODkzYWZkYjUxYTc3ZjdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjYgSnVsIDIwMjYgMDU6MTM6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dHo6IHVwZ3JhZGUgMjAyNi4yIC0+IDIwMjYuMwoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXB5dHpfMjAyNi4yLmJiID0+IHB5dGhvbjMtcHl0el8yMDI2LjMuYmJ9ICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5dHpfMjAyNi4yLmJiID0+IHB5
dGhvbjMtcHl0el8yMDI2LjMuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyNi4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyNi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjYu
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpf
MjAyNi4zLmJiCmluZGV4IDEzNjU4OTdkODUuLmNmY2YzM2M4MzcgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjYuMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDI2LjMuYmIKQEAgLTcsNyAr
Nyw3IEBAIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMyBwdGVzdC1weXRob24tcHl0ZXN0CiAKIFBU
RVNUX1BZVEVTVF9ESVIgPSAicHl0ei90ZXN0cyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBl
NjBiNDdiMjlmMjE1NzQzNzZmMjE4ZmUyMWFiYzAwOTg5NGEyMzIxZWExNmM2NzU0ZjNjYWQ2ZWI3
Y2RkNmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2EzMGZlYjdhMWEwNGNmMGZhMGJlMTYyNDQx
NTkzMDg0M2IwMmYwMTJlYjgwMDM4MGYzNmY5MDZhNzIzZTRhZSIKIAogUkRFUEVORFM6JHtQTn06
Y2xhc3MtdGFyZ2V0ICs9ICJcCiAgICAgcHl0aG9uMy1kYXRldGltZSBcCi0tIAoyLjQ3LjEKCg==

--===============0078638147950066542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytz-2026.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pytz-2026.2.dist-info -> /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.14/site-packages/pytz-2026.2.dist-info moved to /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info

--===============0078638147950066542==--

