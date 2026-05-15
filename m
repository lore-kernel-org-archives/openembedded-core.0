Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998A9CD5BB0
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:36 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34830.1778851231454480199
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lIS22Elk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SCI+b+eS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019e2bcbc183-8318a2c8-9e0d-42b1-8c1c-6df11d4c82ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851234;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E93PS7NJrwNbXBcZtOWFm838N5axQ1YpIkcGHxqegLg=;
	b=lIS22ElkTrKs52qsJheriIfz8DuhMeMRW0hbPAwj/S1+cauWCgzGUFvTRFIYPIjy
	vvlUTRmM7dD0fG2o1q3vpFhHy1VdWlDAjGlHMP7QNABlS/DnuD2z/C+ysf7jQh+H8eK
	SimUA2PM+SffS+ZYOyAiOYa+tZ5TVGcsP1yi/ha0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851234;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E93PS7NJrwNbXBcZtOWFm838N5axQ1YpIkcGHxqegLg=;
	b=SCI+b+eSloumHMVmyXekZfhkDg0o1oKPORxRjh5137vfg10sDVuep80AxQhAz4wK
	88nJG3cWr50EFQZdHh31AyyoFJmtL4eMPZ9wu/1vZH3ShY8E7Z+JuWJXpeaMCfXvYo7
	kQHlZmA2fNTKWAjKoYfhuc/BERci5mheFwR/A6wg=
Content-Type: multipart/mixed; boundary="===============6059152662432682388=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.7.0 SUCCEEDED
Message-ID: <0101019e2bcbc183-8318a2c8-9e0d-42b1-8c1c-6df11d4c82ad-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237124

--===============6059152662432682388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wcwidth* to *0.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.6.0-0.7.0.patch
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
From c2140e014d3056e6afd52d4ce24589158bc88fa5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 09:18:35 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.6.0 -> 0.7.0

---
 .../{python3-wcwidth_0.6.0.bb => python3-wcwidth_0.7.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.6.0.bb => python3-wcwidth_0.7.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb b/meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb
index 874b30b7dd..cd5e40b080 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "cdc4e4262d6ef9a1a57e018384cbeb1208d8abbc64176027e2c2455c81313159"
+SRC_URI[sha256sum] = "90e3a7ea092341c44b99562e75d09e4d5160fe7a3974c6fb842a101a95e7eed0"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.1


--===============6059152662432682388==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.6.0-0.7.0.patch"

RnJvbSBjMjE0MGUwMTRkMzA1NmU2YWZkNTJkNGNlMjQ1ODkxNThiYzg4ZmE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDk6MTg6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdjd2lkdGg6IHVwZ3JhZGUgMC42LjAgLT4gMC43LjAKCi0tLQogLi4uL3tweXRob24z
LXdjd2lkdGhfMC42LjAuYmIgPT4gcHl0aG9uMy13Y3dpZHRoXzAuNy4wLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13Y3dpZHRoXzAuNi4wLmJiID0+
IHB5dGhvbjMtd2N3aWR0aF8wLjcuMC5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjYuMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuNy4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13
Y3dpZHRoXzAuNi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd2N3aWR0aF8wLjcuMC5iYgppbmRleCA4NzRiMzBiN2RkLi5jZDVlNDBiMDgwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjYu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8w
LjcuMC5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2px
dWFzdC93Y3dpZHRoIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT1iMTU5NzljMzlhMjU0Mzg5MmZjYThjZDg2YjRiNTJjYiIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImNkYzRlNDI2MmQ2ZWY5YTFhNTdlMDE4Mzg0Y2JlYjEyMDhkOGFiYmM2
NDE3NjAyN2UyYzI0NTVjODEzMTMxNTkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTBlM2E3ZWEw
OTIzNDFjNDRiOTk1NjJlNzVkMDllNGQ1MTYwZmU3YTM5NzRjNmZiODQyYTEwMWE5NWU3ZWVkMCIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0t
IAoyLjQ3LjEKCg==

--===============6059152662432682388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.6.0.tar.gz;downloadfilename=wcwidth-0.6.0.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.7.0.tar.gz;downloadfilename=wcwidth-0.7.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-wcwidth: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 118993 to 164307 (+38%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: added "/usr/lib/python3-wcwidth/ptest/tests/test_hyperlink.py /usr/lib/python3-wcwidth/ptest/tests/test_text_sizing.py /usr/lib/python3-wcwidth/ptest/tests/test_clip_cjk_emoji.py /usr/lib/python3-wcwidth/ptest/tests/test_clip_overtyping.py"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 483083 to 582094 (+20%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/wcwidth/__pycache__/_clip.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/align.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/text_sizing.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/_width.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcswidth.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/hyperlink.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_constants.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/text_sizing.py /usr/lib/python3.14/site-packages/wcwidt
 h/align.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_width.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/_constants.py /usr/lib/python3.14/site-packages/wcwidth/hyperlink.py /usr/lib/python3.14/site-packages/wcwidth/_wcwidth.py /usr/lib/python3.14/site-packages/wcwidth/_clip.py /usr/lib/python3.14/site-packages/wcwidth/_wcswidth.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcwidth.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info
  /usr/lib/python3.14/site-packages/wcwidth/align.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_clip.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_constants.py was added
  /usr/lib/python3.14/site-packages/wcwidth/hyperlink.py was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/align.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_clip.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_constants.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/hyperlink.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/text_sizing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcswidth.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcwidth.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_width.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/text_sizing.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_wcswidth.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_wcwidth.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_width.py was added

--===============6059152662432682388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 118993 to 164307 (+38%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: added "/usr/lib/python3-wcwidth/ptest/tests/test_clip_cjk_emoji.py /usr/lib/python3-wcwidth/ptest/tests/test_clip_overtyping.py /usr/lib/python3-wcwidth/ptest/tests/test_text_sizing.py /usr/lib/python3-wcwidth/ptest/tests/test_hyperlink.py"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 483083 to 582094 (+20%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcswidth.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/_constants.py /usr/lib/python3.14/site-packages/wcwidth/hyperlink.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_width.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/_width.py /usr/lib/python3.14/site-packages/wcwidth/text_sizing.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcwidth.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_clip.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/hyperlink.cpython-314.pyc /usr/lib/pyt
 hon3.14/site-packages/wcwidth/__pycache__/align.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/align.py /usr/lib/python3.14/site-packages/wcwidth/_wcswidth.py /usr/lib/python3.14/site-packages/wcwidth/_clip.py /usr/lib/python3.14/site-packages/wcwidth/_wcwidth.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_constants.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/text_sizing.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info
  /usr/lib/python3.14/site-packages/wcwidth/align.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_clip.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_constants.py was added
  /usr/lib/python3.14/site-packages/wcwidth/hyperlink.py was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/align.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_clip.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_constants.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/hyperlink.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/text_sizing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcswidth.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcwidth.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_width.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/text_sizing.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_wcswidth.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_wcwidth.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_width.py was added

--===============6059152662432682388==--

