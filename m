Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16402C98315
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 05:34:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1370.1790228071204375540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 22:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Wj+iRCmb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gGl30BZn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0d1e87dcd-8511a9dd-5c23-499c-a726-2a02a790c1c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790228070;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o0v6KiJhtUThiPuz8kMH0RsJ7qiscvfdZtLlPATsGLs=;
	b=Wj+iRCmbICnRj226+OUshkYsN2fR1lBcsfe/d6Njw+3Y3XDL4IxHnBNTIds5+c3M
	LOZjpIGOa/j+2RZilg3md0FUDvFwGEVOfhiKqPeBqMxqAjIIeZkOLhFmaZX1iQYWIqV
	qYO5hmKicm++hUFByRa934KbxtU5hRkIyshWZxlg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790228070;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o0v6KiJhtUThiPuz8kMH0RsJ7qiscvfdZtLlPATsGLs=;
	b=gGl30BZnbCbga1Xwwtn+91Yhhzu0G5ADODaf4pheiZK2tGE6R6CN/79bUQNYuJyr
	bhkZFtPjD8Iss2hoGbh634QhQap3PGlP5uy5WmrfqWblECHwC+EHTwcEncRML4XN/Dv
	BOqJcZbe+wYvyXTnSh21OXCQcUPO5IFZhNX1FiBU=
Content-Type: multipart/mixed; boundary="===============3197684573769887654=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytz: upgrading to 2026.4 SUCCEEDED
Message-ID: <010101a0d1e87dcd-8511a9dd-5c23-499c-a726-2a02a790c1c6-000000@us-west-2.amazonses.com>
Date: Thu, 24 Sep 2026 05:34:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.24-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 05:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246560

--===============3197684573769887654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pytz* to *2026.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytz-upgrade-2026.3.post1-2026.4.patch
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
From 116447549cab56008c6dee19835206bce8062911 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 24 Sep 2026 05:13:27 +0000
Subject: [PATCH] python3-pytz: upgrade 2026.3.post1 -> 2026.4

---
 .../{python3-pytz_2026.3.post1.bb => python3-pytz_2026.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2026.3.post1.bb => python3-pytz_2026.4.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb b/meta/recipes-devtools/python/python3-pytz_2026.4.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb
rename to meta/recipes-devtools/python/python3-pytz_2026.4.bb
index 72a74db357..4a2eda07a6 100644
--- a/meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2026.4.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "2211d3fcf9a797d3405cac96ac7f61d80e6a644f72a3309607282fe8a2010c5d"
+SRC_URI[sha256sum] = "464303645bafafd72418898368b2429458f709cf1eb6a15372fbcc396b64da63"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \
-- 
2.47.1


--===============3197684573769887654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info -> /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info was added
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/zip-safe was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/zip-safe was removed

--===============3197684573769887654==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytz-upgrade-2026.3.post1-2026.4.patch"

RnJvbSAxMTY0NDc1NDljYWI1NjAwOGM2ZGVlMTk4MzUyMDZiY2U4MDYyOTExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjQgU2VwIDIwMjYgMDU6MTM6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dHo6IHVwZ3JhZGUgMjAyNi4zLnBvc3QxIC0+IDIwMjYuNAoKLS0tCiAuLi4ve3B5
dGhvbjMtcHl0el8yMDI2LjMucG9zdDEuYmIgPT4gcHl0aG9uMy1weXR6XzIwMjYuNC5iYn0gICAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5dHpfMjAyNi4zLnBv
c3QxLmJiID0+IHB5dGhvbjMtcHl0el8yMDI2LjQuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyNi4zLnBvc3QxLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyNi40LmJiCnNpbWls
YXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weXR6XzIwMjYuMy5wb3N0MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyNi40LmJiCmluZGV4IDcyYTc0ZGIzNTcuLjRhMmVk
YTA3YTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eXR6XzIwMjYuMy5wb3N0MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHl0el8yMDI2LjQuYmIKQEAgLTcsNyArNyw3IEBAIGluaGVyaXQgcHlwaSBzZXR1cHRv
b2xzMyBwdGVzdC1weXRob24tcHl0ZXN0CiAKIFBURVNUX1BZVEVTVF9ESVIgPSAicHl0ei90ZXN0
cyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIyMTFkM2ZjZjlhNzk3ZDM0MDVjYWM5NmFjN2Y2
MWQ4MGU2YTY0NGY3MmEzMzA5NjA3MjgyZmU4YTIwMTBjNWQiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNDY0MzAzNjQ1YmFmYWZkNzI0MTg4OTgzNjhiMjQyOTQ1OGY3MDljZjFlYjZhMTUzNzJmYmNj
Mzk2YjY0ZGE2MyIKIAogUkRFUEVORFM6JHtQTn06Y2xhc3MtdGFyZ2V0ICs9ICJcCiAgICAgcHl0
aG9uMy1kYXRldGltZSBcCi0tIAoyLjQ3LjEKCg==

--===============3197684573769887654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pytz: PV changed from "2026.3.post1" to "2026.4"
packages/x86-64-v3-poky-linux/python3-pytz: PKGV changed from 2026.3.post1 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-pytz: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2026.3.post1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2026.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dbg: PV changed from "2026.3.post1" to "2026.4"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dbg: PKGV changed from 2026.3.post1 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dev: PV changed from "2026.3.post1" to "2026.4"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dev: PKGV changed from 2026.3.post1 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-doc: PV changed from "2026.3.post1" to "2026.4"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-doc: PKGV changed from 2026.3.post1 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-locale: PV changed from "2026.3.post1" to "2026.4"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-locale: PKGV changed from 2026.3.post1 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-ptest: PV changed from "2026.3.post1" to "2026.4"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-ptest: PKGV changed from 2026.3.post1 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-ptest: PKGSIZE changed from 60079 to 61173 (+2%)
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-src: PV changed from "2026.3.post1" to "2026.4"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-src: PKGV changed from 2026.3.post1 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-staticdev: PV changed from "2026.3.post1" to "2026.4"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-staticdev: PKGV changed from 2026.3.post1 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PV changed from "2026.3.post1" to "2026.4"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PKGV changed from 2026.3.post1 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PKGSIZE changed from 1042572 to 1039895 (-0%)
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info -> /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info was added
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pytz-2026.4.dist-info/zip-safe was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/zip-safe was removed

--===============3197684573769887654==--

