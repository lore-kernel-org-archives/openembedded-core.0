Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992B8CA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 06:31:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5326.1790836300624696147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 23:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gwjp+pJ/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TagRg7ne;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0f6296255-40ccf3c8-7957-45cc-abc7-200dd5f678ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790836302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=F2/cuqI+ZobujrweF11aM2iLz/RCB3BKXgBFyAmffYU=;
	b=gwjp+pJ/JZFdcdRoH+4oLP83L/ahbyY+7H4duFE7865dhk9Q+BG1WE/B8SO1V3NY
	zjScMOvjveaiM85OJAM50rKtZVP/4Ja7aPNxHLPRoS+pr8MJoQa9AqKfY+VfEFmzEfC
	YMfkew1FGzHGCPc/HW29fJ2KKHfxWPuvPT1piUd8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790836302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=F2/cuqI+ZobujrweF11aM2iLz/RCB3BKXgBFyAmffYU=;
	b=TagRg7ne1XqgO0CJZxxy39lahMRFCERVKZXl2uCDtVfBkuUdEUfphaMqBfI5lgwY
	XXBbqEsmtHHkz6I0IbC2SCpXjM3MRildh2FQUGEXRCZ4Hf+5BMR0jVSrVgOIcycgZqg
	YYcQzYraEn9TZIlOEKlkwDRbALwFFJOMGT2QkOaQ=
Content-Type: multipart/mixed; boundary="===============3542463060162404154=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm-backend: upgrading to 2.5.0 SUCCEEDED
Message-ID: <010101a0f6296255-40ccf3c8-7957-45cc-abc7-200dd5f678ae-000000@us-west-2.amazonses.com>
Date: Thu, 1 Oct 2026 06:31:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 06:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247004

--===============3542463060162404154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm-backend* to *2.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-backend-upgrade-2.4.10-2.5.0.patch
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
From d83e05b78a8983c2cb1481b98dc4a57264aa98dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Oct 2026 05:22:49 +0000
Subject: [PATCH] python3-pdm-backend: upgrade 2.4.10 -> 2.5.0

---
 ...thon3-pdm-backend_2.4.10.bb => python3-pdm-backend_2.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.10.bb => python3-pdm-backend_2.5.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.5.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.5.0.bb
index 1458f514b4..1253b912a1 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.5.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "551b049379d4f270cba18f5bf73031cc229a4f883e085265465d326d4a636861"
+SRC_URI[sha256sum] = "7953b994563d3151755e3364b9d0cfe817ed0eaecdf27c8f777f412d26bcd98a"
 
 inherit pypi python_pep517
 
-- 
2.47.1


--===============3542463060162404154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info -> /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info, added "/usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/_spdx.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/errors.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/pylock.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/_ranges.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/__pycache__/_spdx.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vend
 or/packaging/licenses/__init__.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/direct_url.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/pyproject_metadata/__pycache__/_dispatch.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/ranges.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/pylock.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/pyproject_metadata/_dispatch.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/pdm/backe
 nd/_vendor/packaging/__pycache__/errors.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGSIZE changed from 843165 to 1595731 (+89%)
Changes to packages/x86-64-v3-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/__init__.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/__pycache__ was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/__pycache__/_spdx.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/_spdx.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/errors.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/pylock.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/ranges.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/pyproject_metadata/_dispatch.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/pyproject_metadata/__pycache__/_dispatch.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/WHEEL was removed

--===============3542463060162404154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm-backend: PV changed from "2.4.10" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-pdm-backend: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.10.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.5.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm-backend: PKGV changed from 2.4.10 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PV changed from "2.4.10" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PKGV changed from 2.4.10 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PV changed from "2.4.10" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PKGV changed from 2.4.10 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PV changed from "2.4.10" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PKGV changed from 2.4.10 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PV changed from "2.4.10" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PKGV changed from 2.4.10 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PV changed from "2.4.10" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PKGV changed from 2.4.10 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PV changed from "2.4.10" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PKGV changed from 2.4.10 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGSIZE changed from 843165 to 1595731 (+89%)
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PV changed from "2.4.10" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGV changed from 2.4.10 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info -> /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info, added "/usr/lib/python3.14/site-packages/pdm/backend/_vendor/pyproject_metadata/_dispatch.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/direct_url.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/__pycache__/_spdx.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/ranges.cpython-314.pyc /usr/lib/python
 3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/pylock.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/ranges.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/_ranges.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/errors.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/pyproject_metadata/__pycache__/_dispatch.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/__init__.py /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/_spdx.py /usr/lib/python3.1
 4/site-packages/pdm/backend/_vendor/packaging/pylock.py"
Changes to packages/x86-64-v3-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.5.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/__init__.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/__pycache__ was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/__pycache__/_spdx.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/licenses/_spdx.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/errors.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/__pycache__/ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/pylock.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/packaging/ranges.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/pyproject_metadata/_dispatch.py was added
  /usr/lib/python3.14/site-packages/pdm/backend/_vendor/pyproject_metadata/__pycache__/_dispatch.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.10.dist-info/WHEEL was removed

--===============3542463060162404154==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-backend-upgrade-2.4.10-2.5.0.patch"

RnJvbSBkODNlMDViNzhhODk4M2MyY2IxNDgxYjk4ZGM0YTU3MjY0YWE5OGRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBPY3QgMjAyNiAwNToyMjo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGRtLWJhY2tlbmQ6IHVwZ3JhZGUgMi40LjEwIC0+IDIuNS4wCgotLS0KIC4uLnRob24z
LXBkbS1iYWNrZW5kXzIuNC4xMC5iYiA9PiBweXRob24zLXBkbS1iYWNrZW5kXzIuNS4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40
LjEwLmJiID0+IHB5dGhvbjMtcGRtLWJhY2tlbmRfMi41LjAuYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbS1iYWNrZW5kXzIuNC4x
MC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG0tYmFja2VuZF8y
LjUuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDc5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjEwLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi41LjAuYmIKaW5k
ZXggMTQ1OGY1MTRiNC4uMTI1M2I5MTJhMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbS1iYWNrZW5kXzIuNC4xMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi41LjAuYmIKQEAgLTQsNyAr
NCw3IEBAIExJQ0VOU0UgPSAiTUlUIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT00YTU2NDI5N2IzYzViNjI5YTUyOGI5MmZk
OGZmNjFlYSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU1MWIwNDkzNzlkNGYyNzBjYmExOGY1
YmY3MzAzMWNjMjI5YTRmODgzZTA4NTI2NTQ2NWQzMjZkNGE2MzY4NjEiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNzk1M2I5OTQ1NjNkMzE1MTc1NWUzMzY0YjlkMGNmZTgxN2VkMGVhZWNkZjI3Yzhm
Nzc3ZjQxMmQyNmJjZDk4YSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9wZXA1MTcKIAotLSAKMi40
Ny4xCgo=

--===============3542463060162404154==--

