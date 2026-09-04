Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4C0C79F81
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 05:38:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7584.1788500295506170412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 22:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V1ev2mVu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pKdzRkib;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a06aecbafd-58e81961-11c6-4a0c-ac7f-bbcf22c80f9a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788500294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IBToUgJ2tBXFq4NrLe4jkUCuukOM7FIUW8jhg+mi8TI=;
	b=V1ev2mVuqOIU/yEG1sFbX4lCSsUT0UMg+UFbSwGlCvvaZGM40T1aOAhOGibPOEGo
	JxF47djiMelbCABNeDKMdEdyAbzTq5YgvE0bXM+pz86OG8ND724YDZUAC+MCvGsY3jW
	iyAYIz5VDZSi3Y1uVpLyDejoQ1IVzCOyqI57sDhk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788500294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IBToUgJ2tBXFq4NrLe4jkUCuukOM7FIUW8jhg+mi8TI=;
	b=pKdzRkib7nUoewwcobfnraeQpv73afEWjvVxdSAKmFbxjk6HHfsdsQnMoImRy/Dc
	gwLkswavCBeRdFMJCGVvye2cDNHA9471sjcYe7QaA33zT8wTMevggwr9IWH++6mD7+e
	/ozG8m67kUqeWmS/Z76z0W9w/I3HW7ielhUTTSFM=
Content-Type: multipart/mixed; boundary="===============4036593180501892137=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 10.2.3 SUCCEEDED
Message-ID: <010101a06aecbafd-58e81961-11c6-4a0c-ac7f-bbcf22c80f9a-000000@us-west-2.amazonses.com>
Date: Fri, 4 Sep 2026 05:38:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.04-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 05:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245056

--===============4036593180501892137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-scm* to *10.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-10.2.2-10.2.3.patch
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
From b73f5920772703b7b084fee54eae7cb6f3c01e61 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 4 Sep 2026 05:22:40 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 10.2.2 -> 10.2.3

Source: CHANGELOG.md

## 10.2.3 (2026-09-03)

### Miscellaneous

- Do not run the xmlsec download regression test on Python 3.8, where no lxml wheel exists and `--no-build-isolation` leaves pip without a build toolchain for the lxml sdist. ([#1516](https://github.com/pypa/setuptools-scm/issues/1516))
---
 ...etuptools-scm_10.2.2.bb => python3-setuptools-scm_10.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_10.2.2.bb => python3-setuptools-scm_10.2.3.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
index d6f23321d0..0af4bd24f5 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "36b5dcef6bbeee0bc76b7756d1b574b3762e2138611a4f18e898f22f1aaee462"
+SRC_URI[sha256sum] = "f179ed3e2a63cf5823e5ee9aa9ca08386219400443a0553224d72dde3f206b44"
 
 PYPI_PACKAGE = "setuptools_scm"
 
-- 
2.47.1


--===============4036593180501892137==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-10.2.2-10.2.3.patch"

RnJvbSBiNzNmNTkyMDc3MjcwM2I3YjA4NGZlZTU0ZWFlN2NiNmYzYzAxZTYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNCBTZXAgMjAyNiAwNToyMjo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29scy1zY206IHVwZ3JhZGUgMTAuMi4yIC0+IDEwLjIuMwoKU291cmNlOiBD
SEFOR0VMT0cubWQKCiMjIDEwLjIuMyAoMjAyNi0wOS0wMykKCiMjIyBNaXNjZWxsYW5lb3VzCgot
IERvIG5vdCBydW4gdGhlIHhtbHNlYyBkb3dubG9hZCByZWdyZXNzaW9uIHRlc3Qgb24gUHl0aG9u
IDMuOCwgd2hlcmUgbm8gbHhtbCB3aGVlbCBleGlzdHMgYW5kIGAtLW5vLWJ1aWxkLWlzb2xhdGlv
bmAgbGVhdmVzIHBpcCB3aXRob3V0IGEgYnVpbGQgdG9vbGNoYWluIGZvciB0aGUgbHhtbCBzZGlz
dC4gKFsjMTUxNl0oaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvc2V0dXB0b29scy1zY20vaXNzdWVz
LzE1MTYpKQotLS0KIC4uLmV0dXB0b29scy1zY21fMTAuMi4yLmJiID0+IHB5dGhvbjMtc2V0dXB0
b29scy1zY21fMTAuMi4zLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5
dGhvbjMtc2V0dXB0b29scy1zY21fMTAuMi4yLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1zY21f
MTAuMi4zLmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4yLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21fMTAuMi4zLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
ZXR1cHRvb2xzLXNjbV8xMC4yLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4yLjMuYmIKaW5kZXggZDZmMjMzMjFkMC4u
MGFmNGJkMjRmNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHMtc2NtXzEwLjIuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21fMTAuMi4zLmJiCkBAIC02LDcgKzYsNyBAQCBh
cmd1bWVudCBvciBpbiBhIFNDTSBtYW5hZ2VkIGZpbGUuIgogTElDRU5TRSA9ICJNSVQiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT04MzhjMzY2ZjY5YjcyYzVkZjA1Yzk2
ZGZmNzliMzVmMiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM2YjVkY2VmNmJiZWVlMGJjNzZi
Nzc1NmQxYjU3NGIzNzYyZTIxMzg2MTFhNGYxOGU4OThmMjJmMWFhZWU0NjIiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiZjE3OWVkM2UyYTYzY2Y1ODIzZTVlZTlhYTljYTA4Mzg2MjE5NDAwNDQzYTA1
NTMyMjRkNzJkZGUzZjIwNmI0NCIKIAogUFlQSV9QQUNLQUdFID0gInNldHVwdG9vbHNfc2NtIgog
Ci0tIAoyLjQ3LjEKCg==

--===============4036593180501892137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-setuptools-scm-changelog.txt"

Changelog for python3-setuptools-scm: 10.2.2 -> 10.2.3
Source: CHANGELOG.md

## 10.2.3 (2026-09-03)

### Miscellaneous

- Do not run the xmlsec download regression test on Python 3.8, where no lxml wheel exists and `--no-build-isolation` leaves pip without a build toolchain for the lxml sdist. ([#1516](https://github.com/pypa/setuptools-scm/issues/1516))

--===============4036593180501892137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-setuptools-scm: PV changed from "10.2.2" to "10.2.3"
packages/x86-64-v3-poky-linux/python3-setuptools-scm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-10.2.2.tar.gz;downloadfilename=setuptools_scm-10.2.2.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-10.2.3.tar.gz;downloadfilename=setuptools_scm-10.2.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-setuptools-scm: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PV changed from "10.2.2" to "10.2.3"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PV changed from "10.2.2" to "10.2.3"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PV changed from "10.2.2" to "10.2.3"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PV changed from "10.2.2" to "10.2.3"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PV changed from "10.2.2" to "10.2.3"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PV changed from "10.2.2" to "10.2.3"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PV changed from "10.2.2" to "10.2.3"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools_scm-10.2.2.dist-info -> /usr/lib/python3.14/site-packages/setuptools_scm-10.2.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools_scm-10.2.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools_scm-10.2.3.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGV changed from 10.2.2 [default] to 10.2.3 [default]
Changes to packages/x86-64-v3-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_scm-10.2.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_scm-10.2.3.dist-info

--===============4036593180501892137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools_scm-10.2.2.dist-info -> /usr/lib/python3.14/site-packages/setuptools_scm-10.2.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools_scm-10.2.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools_scm-10.2.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_scm-10.2.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_scm-10.2.3.dist-info

--===============4036593180501892137==--

