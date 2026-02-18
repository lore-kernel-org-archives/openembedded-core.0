Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28CFE9A058
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1421.1771440099547804679
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tcbKznl4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=m5zLzxHd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c720edd35-9236884d-27e6-45a0-ba5e-e34afa46938f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440102;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y2aeoYAPVuCOmVcLMX8h8QzPYiJ7YJbdEPLr9boElbg=;
	b=tcbKznl4WanklnucjSx10fLSXnjV3BJ+jGad71r0triHs9Ei/FW9j8ra7SsuBqnz
	htNWYEhRv954rZvGOZDNKIMGJA2+iuSQeYHUD/QWOK8PfqokSsEsWqS2KFZvsZX5WOe
	e6FQFR5kQoesO94oanLJ41Zml8vEnY2r7JJMm8Yo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440102;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y2aeoYAPVuCOmVcLMX8h8QzPYiJ7YJbdEPLr9boElbg=;
	b=m5zLzxHdErKYz0vH1yPSCedpjXBwiHCw+oIUBDjKqnXxON88oJjSRH4MOIg7jSix
	2BW2488Rn1/0vC67rvOtxH5z8bvvMujIa379n1Xqnetnr74lxTA//9QA9ktj8vAUSwy
	u8m6p0nQA1t1zuV+65lDcXgdR+zfNHZdvn5ofmUA=
Content-Type: multipart/mixed; boundary="===============6839445669727957807=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyproject-metadata: upgrading to 0.11.0 SUCCEEDED
Message-ID: <0101019c720edd35-9236884d-27e6-45a0-ba5e-e34afa46938f-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231356

--===============6839445669727957807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyproject-metadata* to *0.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyproject-metadata-upgrade-0.10.0-0.11.0.patch
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
From 47358dfa0f80827902a4069135ec8ae568252d82 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 13:42:26 +0000
Subject: [PATCH] python3-pyproject-metadata: upgrade 0.10.0 -> 0.11.0

---
 ...-metadata_0.10.0.bb => python3-pyproject-metadata_0.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-metadata_0.10.0.bb => python3-pyproject-metadata_0.11.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.10.0.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyproject-metadata_0.10.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
index 5b5396fdd7..02a9064f2a 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.10.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "7f5bd0ef398b60169556cb17ea261d715caf7f8561238151f51b2305084ba8d4"
+SRC_URI[sha256sum] = "c72fa49418bb7c5a10f25e050c418009898d1c051721d19f98a6fb6da59a66cf"
 
 RDEPENDS:${PN} += " \
     python3-logging \
-- 
2.47.1


--===============6839445669727957807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PKGSIZE changed from 142902 to 166428 (+16%)
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyproject_metadata-0.10.0.dist-info -> /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pyproject_metadata-0.10.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/pyproject_metadata/__pycache__/_dispatch.cpython-314.pyc /usr/lib/python3.14/site-packages/pyproject_metadata/_dispatch.py"
Changes to packages/x86-64-v3-poky-linux/python3-pyproject-metadata (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_metadata-0.10.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info
  /usr/lib/python3.14/site-packages/pyproject_metadata/_dispatch.py was added
  /usr/lib/python3.14/site-packages/pyproject_metadata/__pycache__/_dispatch.cpython-314.pyc was added

--===============6839445669727957807==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyproject-metadata-upgrade-0.10.0-0.11.0.patch"

RnJvbSA0NzM1OGRmYTBmODA4Mjc5MDJhNDA2OTEzNWVjOGFlNTY4MjUyZDgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTM6NDI6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5cHJvamVjdC1tZXRhZGF0YTogdXBncmFkZSAwLjEwLjAgLT4gMC4xMS4wCgotLS0K
IC4uLi1tZXRhZGF0YV8wLjEwLjAuYmIgPT4gcHl0aG9uMy1weXByb2plY3QtbWV0YWRhdGFfMC4x
MS4wLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlwcm9q
ZWN0LW1ldGFkYXRhXzAuMTAuMC5iYiA9PiBweXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjEx
LjAuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjEwLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuMTEuMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuMTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjExLjAuYmIKaW5kZXgg
NWI1Mzk2ZmRkNy4uMDJhOTA2NGYyYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjEwLjAuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjExLjAu
YmIKQEAgLTE3LDcgKzE3LDcgQEAgVVBTVFJFQU1fQ0hFQ0tfUFlQSV9QQUNLQUdFID0gIiR7UFlQ
SV9QQUNLQUdFfSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9mbGl0X2NvcmUKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjdmNWJkMGVmMzk4YjYwMTY5NTU2Y2IxN2VhMjYxZDcxNWNhZjdmODU2MTIz
ODE1MWY1MWIyMzA1MDg0YmE4ZDQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzcyZmE0OTQxOGJi
N2M1YTEwZjI1ZTA1MGM0MTgwMDk4OThkMWMwNTE3MjFkMTlmOThhNmZiNmRhNTlhNjZjZiIKIAog
UkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1sb2dnaW5nIFwKLS0gCjIuNDcuMQoK

--===============6839445669727957807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyproject-metadata: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyproject_metadata/pyproject_metadata-0.10.0.tar.gz;downloadfilename=pyproject_metadata-0.10.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyproject_metadata/pyproject_metadata-0.11.0.tar.gz;downloadfilename=pyproject_metadata-0.11.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dbg: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dbg: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dev: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dev: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-doc: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-doc: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-locale: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-locale: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-src: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-src: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-staticdev: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-staticdev: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PKGSIZE changed from 142902 to 166428 (+16%)
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PV changed from "0.10.0" to "0.11.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PKGV changed from 0.10.0 [default] to 0.11.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyproject_metadata-0.10.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyproject_metadata-0.10.0.dist-info -> /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info, added "/usr/lib/python3.14/site-packages/pyproject_metadata/_dispatch.py /usr/lib/python3.14/site-packages/pyproject_metadata/__pycache__/_dispatch.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pyproject-metadata (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_metadata-0.10.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info
  /usr/lib/python3.14/site-packages/pyproject_metadata/_dispatch.py was added
  /usr/lib/python3.14/site-packages/pyproject_metadata/__pycache__/_dispatch.cpython-314.pyc was added

--===============6839445669727957807==--

