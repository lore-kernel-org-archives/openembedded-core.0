Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8410AC61DD2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:59:58 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6369.1787723991939945856
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EHEpIb5l;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4LEFr6Pe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a03ca74785-a025482d-b77e-443d-8cd9-fa6671fa5600-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787723991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4I5SJkW3LPfesnC2r+m9R9fnNCxsd72ip1RTvQZXiCA=;
	b=EHEpIb5lWoNvjy+v4RpLb/o1rlL+3wgQl0DUPnunBArKP05yHd+tSJY9WpoCo27/
	eN+wFiwWzh2B1gh0p67pTSoBhc9ausFUUxJ80qLrbUlgCk1ojvNDORO1LABFqMEy/6u
	djMqcqILDa2iiIDk4+juJM3qQkQ5JPq5USlvReC4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787723991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4I5SJkW3LPfesnC2r+m9R9fnNCxsd72ip1RTvQZXiCA=;
	b=4LEFr6Pe/1STzXFxz6MrnB1W3tQnGLrwfo3+7zAVP8ZERd1fd295Hu5thtw1ik7h
	Btxj09D2NJH08+YTrXjW+H0NFhP+570QWJtK4giJ8mX22x46OdnobudFiLF9qyk82bS
	7IbHQuvn4Mbw4mqQ+PFrEdgNvqhDiv3EA4TKoYi8=
Content-Type: multipart/mixed; boundary="===============2961193986619937580=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 7.1.2 SUCCEEDED
Message-ID: <010101a03ca74785-a025482d-b77e-443d-8cd9-fa6671fa5600-000000@us-west-2.amazonses.com>
Date: Wed, 26 Aug 2026 05:59:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.26-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244311

--===============2961193986619937580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pbr* to *7.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pbr-upgrade-7.1.0-7.1.2.patch
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
From 330351eb958f6d4d99dfc57f2f454af80f5d37dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 26 Aug 2026 05:51:54 +0000
Subject: [PATCH] python3-pbr: upgrade 7.1.0 -> 7.1.2

Source: ChangeLog

7.1.2
-----

* Set setuptools min in requirements.txt

7.1.1
-----

* Fix hook ordering race that drops subpackages from wheels
---
 .../python/{python3-pbr_7.1.0.bb => python3-pbr_7.1.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pbr_7.1.0.bb => python3-pbr_7.1.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb b/meta/recipes-devtools/python/python3-pbr_7.1.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pbr_7.1.0.bb
rename to meta/recipes-devtools/python/python3-pbr_7.1.2.bb
index 7fc227e6bb..9aeb50268d 100644
--- a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pbr_7.1.2.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += "python3-setuptools"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "66ece3a2f5c4f05e5f37569213e755193f6e00b8aa361bfb190533ea8ee8b10c"
+SRC_URI[sha256sum] = "4639b87cc91d0d58471b7bda1f28b7d0849ba43d7935c4c482f3c74fef719804"
-- 
2.47.1


--===============2961193986619937580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pbr: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pbr/pbr-7.1.0.tar.gz;downloadfilename=pbr-7.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pbr/pbr-7.1.2.tar.gz;downloadfilename=pbr-7.1.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dbg: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dbg: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dev: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-dev: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-doc: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-doc: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-locale: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-locale: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-src: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-src: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-staticdev: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr-staticdev: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PV changed from "7.1.0" to "7.1.2"
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PKGSIZE changed from 740279 to 740475 (+0%)
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pbr-7.1.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info -> /usr/lib/python3.14/site-packages/pbr-7.1.2.dist-info
packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: PKGV changed from 7.1.0 [default] to 7.1.2 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info moved to /usr/lib/python3.14/site-packages/pbr-7.1.2.dist-info

--===============2961193986619937580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pbr-changelog.txt"

Changelog for python3-pbr: 7.1.0 -> 7.1.2
Source: ChangeLog

7.1.2
-----

* Set setuptools min in requirements.txt

7.1.1
-----

* Fix hook ordering race that drops subpackages from wheels

--===============2961193986619937580==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pbr-upgrade-7.1.0-7.1.2.patch"

RnJvbSAzMzAzNTFlYjk1OGY2ZDRkOTlkZmM1N2YyZjQ1NGFmODBmNWQzN2RkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjYgQXVnIDIwMjYgMDU6NTE6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBicjogdXBncmFkZSA3LjEuMCAtPiA3LjEuMgoKU291cmNlOiBDaGFuZ2VMb2cKCjcu
MS4yCi0tLS0tCgoqIFNldCBzZXR1cHRvb2xzIG1pbiBpbiByZXF1aXJlbWVudHMudHh0Cgo3LjEu
MQotLS0tLQoKKiBGaXggaG9vayBvcmRlcmluZyByYWNlIHRoYXQgZHJvcHMgc3VicGFja2FnZXMg
ZnJvbSB3aGVlbHMKLS0tCiAuLi4vcHl0aG9uL3tweXRob24zLXBicl83LjEuMC5iYiA9PiBweXRo
b24zLXBicl83LjEuMi5iYn0gICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3tweXRob24zLXBicl83LjEuMC5iYiA9PiBweXRob24zLXBicl83LjEuMi5iYn0gKDgzJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGJyXzcuMS4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBicl83LjEuMi5iYgpz
aW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcGJyXzcuMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGJyXzcuMS4yLmJiCmluZGV4IDdmYzIyN2U2YmIuLjlhZWI1MDI2OGQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYnJfNy4x
LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBicl83LjEu
Mi5iYgpAQCAtMTMsNCArMTMsNCBAQCBSREVQRU5EUzoke1BOfSArPSAicHl0aG9uMy1zZXR1cHRv
b2xzIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI2NmVjZTNhMmY1YzRmMDVlNWYzNzU2OTIxM2U3NTUxOTNmNmUwMGI4YWEzNjFi
ZmIxOTA1MzNlYThlZThiMTBjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ2MzliODdjYzkxZDBk
NTg0NzFiN2JkYTFmMjhiN2QwODQ5YmE0M2Q3OTM1YzRjNDgyZjNjNzRmZWY3MTk4MDQiCi0tIAoy
LjQ3LjEKCg==

--===============2961193986619937580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pbr/python3-pbr: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pbr-7.1.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info -> /usr/lib/python3.14/site-packages/pbr-7.1.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.14/site-packages/pbr-7.1.0.dist-info moved to /usr/lib/python3.14/site-packages/pbr-7.1.2.dist-info

--===============2961193986619937580==--

