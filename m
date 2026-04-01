Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466BC10FCAE0
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:07 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14756.1775054162642108036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Brhc+Z+h;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dwysi0Ql;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019d497907b7-b455d273-9712-4dc6-85cf-35c683ae0b19-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054162;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1pQkfejnj+yylKuoFyOyIZUWNLnD4G2hZtLiOKDTn1Q=;
	b=Brhc+Z+hF2pJ9ITkX3QSzQzCMThcwHbnW5Bp9CXPU1VRziP5Swzts480qT+mfhBh
	kntPuW7Od+Rz2KOMqlyiVVdN5cIaqVzS/xdkLmtA3dlFNKgK+SsL8NCnkH0b4dWbCv8
	9m97Yz/KYWoBRz2yNnRfH9C70D0xzlYnwMQF8p94=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054162;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1pQkfejnj+yylKuoFyOyIZUWNLnD4G2hZtLiOKDTn1Q=;
	b=dwysi0QlwieLewWBiP26lvEEGQOQIYkF30iKgqXSGUPZakmumcomVzX3tqWreHvH
	sxzDf8aq34aer3TRYeRcbfUfUvDPwgYzZtdUFb2Pdhx4OalH6KNyjmqUABO4DBpk6eK
	p+5AhC+KyFl4mzuyjjrCSEmh06sI9HKEW+CgROtA=
Content-Type: multipart/mixed; boundary="===============4384166615460917563=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.26.7 SUCCEEDED
Message-ID: <0101019d497907b7-b455d273-9712-4dc6-85cf-35c683ae0b19-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234382

--===============4384166615460917563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.26.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.26.6-2.26.7.patch
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
From 4984d09c586e303092f9bc6abb05841772c2d9b2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 10:06:55 +0000
Subject: [PATCH] python3-pdm: upgrade 2.26.6 -> 2.26.7

---
 .../python/{python3-pdm_2.26.6.bb => python3-pdm_2.26.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.6.bb => python3-pdm_2.26.7.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.6.bb b/meta/recipes-devtools/python/python3-pdm_2.26.7.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.6.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.7.bb
index 72f6415dbc..5e6cdcb4cf 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.6.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.7.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "771f95b9a484f9eb34dcf8d851be6ff95333e4f3c46189f9004cfd5cc2e925f9"
+SRC_URI[sha256sum] = "0a96a6fb4d60dfeacc1f68bf77efda39503833f6c01866cc8700ea403f0183b7"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============4384166615460917563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.6.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.6.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.26.6.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info

--===============4384166615460917563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.26.6" to "2.26.7"
packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.6.tar.gz;downloadfilename=pdm-2.26.6.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.7.tar.gz;downloadfilename=pdm-2.26.7.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.26.6" to "2.26.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.26.6" to "2.26.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.26.6" to "2.26.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.26.6" to "2.26.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.26.6" to "2.26.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.26.6" to "2.26.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2491822 to 2496904 (+0%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.6.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.6.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.26.6 [default] to 2.26.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.26.6" to "2.26.7"
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.26.6.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.26.7.dist-info

--===============4384166615460917563==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.26.6-2.26.7.patch"

RnJvbSA0OTg0ZDA5YzU4NmUzMDMwOTJmOWJjNmFiYjA1ODQxNzcyYzJkOWIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMDowNjo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGRtOiB1cGdyYWRlIDIuMjYuNiAtPiAyLjI2LjcKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1wZG1fMi4yNi42LmJiID0+IHB5dGhvbjMtcGRtXzIuMjYuNy5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZG1fMi4yNi42LmJiID0+IHB5dGhv
bjMtcGRtXzIuMjYuNy5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuNi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wZG1fMi4yNi43LmJiCnNpbWlsYXJpdHkgaW5kZXggODAlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yNi42LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuNy5i
YgppbmRleCA3MmY2NDE1ZGJjLi41ZTZjZGNiNGNmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuNy5iYgpAQCAtNCw3ICs0LDcgQEAgTElD
RU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTJlYjMxYTJjYzFhNzU4YzM0YjQ5OWYyODdkZDA0ZWYyIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzcxZjk1YjlhNDg0ZjllYjM0ZGNmOGQ4NTFiZTZmZjk1
MzMzZTRmM2M0NjE4OWY5MDA0Y2ZkNWNjMmU5MjVmOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIw
YTk2YTZmYjRkNjBkZmVhY2MxZjY4YmY3N2VmZGEzOTUwMzgzM2Y2YzAxODY2Y2M4NzAwZWE0MDNm
MDE4M2I3IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3BkbQogCi0tIAoyLjQ3LjEKCg==

--===============4384166615460917563==--

