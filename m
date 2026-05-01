Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7E7CD37AD
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:41 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15606.1777645529533463501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2nCjaeE7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1j2Wa1ek;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de3ee4d5e-85d40298-f620-4316-b224-acdf148ee342-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kpQuTIhou/fspVHl3cN55wKGrJzv2xhFC0rW/uueme8=;
	b=2nCjaeE7nLJRDsyJUIL8aGyHpso3MpVNGZmLMcMC/zYskzq+3Vyz50JORBzrfaor
	WAmQ9VglApauM6XAGnufiWdEQcDp5ITewspUV+pC1JS0cKUEOs84+czQY4FvQ/vORg1
	pUekJZBr9Rkku7Zkln68KWU+FzwnjWzDlVZWHD5E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kpQuTIhou/fspVHl3cN55wKGrJzv2xhFC0rW/uueme8=;
	b=1j2Wa1ekQWCE8svxrtr2N92RvJVj+yYYqdGFaN3e9rolRN7tRH7Zm6Wc/NoUTKqD
	77shiHh1Nbr1hux4x7ZOH/6fKogNsWtWeC3TL0ePMMa5kOzJkGEPyCk6JI6pDHyA+lm
	p51vvR1KIsSQAI8JFt/Xe7Mw0jDhvUVFc5ofUg+M=
Content-Type: multipart/mixed; boundary="===============8223599234362972892=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-click: upgrading to 8.3.3 SUCCEEDED
Message-ID: <0101019de3ee4d5e-85d40298-f620-4316-b224-acdf148ee342-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236231

--===============8223599234362972892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-click* to *8.3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-click-upgrade-8.3.1-8.3.3.patch
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
From a6a4a72eb60b9e6bbbb9da31ee16c40fc8f0ea7c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 08:14:12 +0000
Subject: [PATCH] python3-click: upgrade 8.3.1 -> 8.3.3

---
 .../python/{python3-click_8.3.1.bb => python3-click_8.3.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.3.1.bb => python3-click_8.3.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.3.1.bb b/meta/recipes-devtools/python/python3-click_8.3.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.3.1.bb
rename to meta/recipes-devtools/python/python3-click_8.3.3.bb
index 1f42fe1a50..12fd3cbfbd 100644
--- a/meta/recipes-devtools/python/python3-click_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-click_8.3.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
+SRC_URI[sha256sum] = "398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============8223599234362972892==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-click-upgrade-8.3.1-8.3.3.patch"

RnJvbSBhNmE0YTcyZWI2MGI5ZTZiYmJiOWRhMzFlZTE2YzQwZmM4ZjBlYTdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwODoxNDoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2xpY2s6IHVwZ3JhZGUgOC4zLjEgLT4gOC4zLjMKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1jbGlja184LjMuMS5iYiA9PiBweXRob24zLWNsaWNrXzguMy4zLmJifSAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jbGlja184LjMuMS5iYiA9PiBweXRo
b24zLWNsaWNrXzguMy4zLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jbGlja184LjMuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jbGlja184LjMuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4zLjEu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184
LjMuMy5iYgppbmRleCAxZjQyZmUxYTUwLi4xMmZkM2NiZmJkIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4zLjEuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMy4zLmJiCkBAIC04LDcgKzgs
NyBAQCBIT01FUEFHRSA9ICJodHRwOi8vY2xpY2sucG9jb28ub3JnLyIKIExJQ0VOU0UgPSAiQlNE
LTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTFm
YTk4MjMyZmQ2NDU2MDg5MzdhMGZkYzgyZTk5OWI4IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MTJmZjQ3ODVkMzM3YTFiYjQ5MGJiN2U5YzJiMWVlNWRhMzExMmU5NGE4NjIyZjI2YTZjNzdmNWQy
ZmM2ODQyYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzOTgzMjlhZDQ4MzdiMmZmN2NiZTFkZDE2
NmE0YzBmODkwMGMzY2EzYTIxOGRlMDQ0NjZmMzhmNjQ5N2YxOGEyIgogCiBpbmhlcml0IHB5cGkg
cHl0aG9uX2ZsaXRfY29yZSBwdGVzdC1weXRob24tcHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============8223599234362972892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 477026 to 537604 (+13%)
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/commands.rst /usr/lib/python3-click/ptest/docs/commands-and-groups.rst /usr/lib/python3-click/ptest/docs/click-concepts.rst /usr/lib/python3-click/ptest/docs/entry-points.rst /usr/lib/python3-click/ptest/docs/exceptions.rst /usr/lib/python3-click/ptest/docs/arguments.rst /usr/lib/python3-click/ptest/docs/complex.rst", added "/usr/lib/python3-click/ptest/docs/commands-and-groups.md /usr/lib/python3-click/ptest/docs/standalone-apps.md /usr/lib/python3-click/ptest/docs/complex.md /usr/lib/python3-click/ptest/docs/commands.md /usr/lib/python3-click/ptest/tests/test_stream_lifecycle.py /usr/lib/python3-click/ptest/docs/exceptions.md /usr/lib/python3-click/ptest/docs/contributing.md /usr/lib/python3-click/ptest/docs/arguments.md /usr/lib/python3-click/ptest/docs/upgrade-guides.md /usr/lib/python3-click/ptest/docs/click-concepts.md /usr/lib/python3-click/ptest/docs/entry-poi
 nts.md"
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.14/site-packages/click-8.3.1.dist-info -> /usr/lib/python3.14/site-packages/click-8.3.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/click-8.3.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/click-8.3.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.14/site-packages/click-8.3.1.dist-info moved to /usr/lib/python3.14/site-packages/click-8.3.3.dist-info

--===============8223599234362972892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-click: PKGV changed from 8.3.1 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/python3-click: PV changed from "8.3.1" to "8.3.3"
packages/x86-64-v3-poky-linux/python3-click: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/click/click-8.3.1.tar.gz;downloadfilename=click-8.3.1.tar.gz" to "https://files.pythonhosted.org/packages/source/c/click/click-8.3.3.tar.gz;downloadfilename=click-8.3.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PKGV changed from 8.3.1 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PV changed from "8.3.1" to "8.3.3"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PKGV changed from 8.3.1 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PV changed from "8.3.1" to "8.3.3"
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PKGV changed from 8.3.1 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PV changed from "8.3.1" to "8.3.3"
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PKGV changed from 8.3.1 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PV changed from "8.3.1" to "8.3.3"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGV changed from 8.3.1 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 477026 to 537604 (+13%)
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PV changed from "8.3.1" to "8.3.3"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/click-concepts.rst /usr/lib/python3-click/ptest/docs/entry-points.rst /usr/lib/python3-click/ptest/docs/arguments.rst /usr/lib/python3-click/ptest/docs/complex.rst /usr/lib/python3-click/ptest/docs/commands-and-groups.rst /usr/lib/python3-click/ptest/docs/commands.rst /usr/lib/python3-click/ptest/docs/exceptions.rst", added "/usr/lib/python3-click/ptest/tests/test_stream_lifecycle.py /usr/lib/python3-click/ptest/docs/commands-and-groups.md /usr/lib/python3-click/ptest/docs/exceptions.md /usr/lib/python3-click/ptest/docs/complex.md /usr/lib/python3-click/ptest/docs/contributing.md /usr/lib/python3-click/ptest/docs/upgrade-guides.md /usr/lib/python3-click/ptest/docs/click-concepts.md /usr/lib/python3-click/ptest/docs/standalone-apps.md /usr/lib/python3-click/ptest/docs/commands.md /usr/lib/python3-click/ptest/docs/entry-points.md /usr/lib/python3-click/ptest/docs/argume
 nts.md"
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PKGV changed from 8.3.1 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PV changed from "8.3.1" to "8.3.3"
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PKGV changed from 8.3.1 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PV changed from "8.3.1" to "8.3.3"
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGV changed from 8.3.1 [default] to 8.3.3 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGSIZE changed from 907069 to 921506 (+2%)
packages/x86-64-v3-poky-linux/python3-click/python3-click: PV changed from "8.3.1" to "8.3.3"
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.14/site-packages/click-8.3.1.dist-info -> /usr/lib/python3.14/site-packages/click-8.3.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/click-8.3.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/click-8.3.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.14/site-packages/click-8.3.1.dist-info moved to /usr/lib/python3.14/site-packages/click-8.3.3.dist-info

--===============8223599234362972892==--

