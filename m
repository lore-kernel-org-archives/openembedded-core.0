Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2747C5479B
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.11037.1747312311729584053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WfK2RRpo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=V9MZAMK/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010196d3ee0f5f-c017dd88-5dec-4555-b337-87f4a3cb833d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312316;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SItTNKXc3aZ45SbKBeJyhh+q/uT63i6IaXKZ6i6KOLs=;
	b=WfK2RRpoggld8BHnvLtFZG8eM1Q8mbmH7izt3wBirHiV3BzUX2XgNwIdWE6vxtoU
	r5lFFuv1/WeWuIXf93d2ANSJQ1l7iBb9HLe/luWvO6P0mgZ7e+Ou9jQqhEg4h97Uj41
	1StCeEr6lcHziBJSGAwU4vElDVpxpUdF/Qw2ca7w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312316;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SItTNKXc3aZ45SbKBeJyhh+q/uT63i6IaXKZ6i6KOLs=;
	b=V9MZAMK/8BZ6OeKDA3XSvXioOZzEUoTkBcva6oM7KgcQ6n9AixFeTWRbYWRXob5T
	UilFFZV7f+UuWUygYe1Ey4RB1mWGHUwI5ZwTQBC1OSB53A9Ch2Dgg02alxgVBkxWQ4x
	s/KYRhWnJMDP4jY+zXptIPJG6PJZWGCa6suf0Cm4=
Content-Type: multipart/mixed; boundary="===============8982761193129750113=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-snowballstemmer: upgrading to 3.0.1 SUCCEEDED
Message-ID: <01010196d3ee0f5f-c017dd88-5dec-4555-b337-87f4a3cb833d-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216617

--===============8982761193129750113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-snowballstemmer* to *3.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-snowballstemmer-upgrade-2.2.0-3.0.1.patch
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
From 198aa23d17ec54fddd01a3684224e9f06740bfd1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 08:16:41 +0000
Subject: [PATCH] python3-snowballstemmer: upgrade 2.2.0 -> 3.0.1

---
 ...nowballstemmer_2.2.0.bb => python3-snowballstemmer_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-snowballstemmer_2.2.0.bb => python3-snowballstemmer_3.0.1.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb b/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb
rename to meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb
index ff120a3fc4..846ab2b9aa 100644
--- a/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb
+++ b/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/snowballstem/snowball"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=19139aaf3c8c8fa1ca6edd59c072fb9f"
 
-SRC_URI[sha256sum] = "09b16deb8547d3412ad7b590689584cd0fe25ec8db3be37788be3810cbf19cb1"
+SRC_URI[sha256sum] = "6d5eeeec8e9f84d4d56b847692bacf79bc2c8e90c7f80ca4444ff8b6f2e52895"
 
 PYPI_PACKAGE = "snowballstemmer"
 
-- 
2.47.1


--===============8982761193129750113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-snowballstemmer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/snowballstemmer/snowballstemmer-2.2.0.tar.gz;downloadfilename=snowballstemmer-2.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/snowballstemmer/snowballstemmer-3.0.1.tar.gz;downloadfilename=snowballstemmer-3.0.1.tar.gz"
packages/core2-64-poky-linux/python3-snowballstemmer: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dbg: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dbg: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dev: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dev: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-doc: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-doc: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-locale: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-locale: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-src: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-src: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-staticdev: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-staticdev: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer: PKGSIZE changed from 1792437 to 1910895 (+7%)
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer: FILELIST: directory renamed /usr/lib/python3.13/site-packages/snowballstemmer-2.2.0.dist-info -> /usr/lib/python3.13/site-packages/snowballstemmer-3.0.1.dist-info, directory renamed /usr/lib/python3.13/site-packages/snowballstemmer-2.2.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/snowballstemmer-3.0.1.dist-info/licenses, added "/usr/lib/python3.13/site-packages/snowballstemmer/estonian_stemmer.py /usr/lib/python3.13/site-packages/snowballstemmer/esperanto_stemmer.py /usr/lib/python3.13/site-packages/snowballstemmer/dutch_porter_stemmer.py /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/esperanto_stemmer.cpython-313.pyc /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/dutch_porter_stemmer.cpython-313.pyc /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/estonian_stemmer.cpython-313.pyc"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer: PV changed from "2.2.0" to "3.0.1"
Changes to packages/core2-64-poky-linux/python3-snowballstemmer (sysroot):
  /usr/lib/python3.13/site-packages/snowballstemmer-2.2.0.dist-info moved to /usr/lib/python3.13/site-packages/snowballstemmer-3.0.1.dist-info
  /usr/lib/python3.13/site-packages/snowballstemmer/dutch_porter_stemmer.py was added
  /usr/lib/python3.13/site-packages/snowballstemmer/esperanto_stemmer.py was added
  /usr/lib/python3.13/site-packages/snowballstemmer/estonian_stemmer.py was added
  /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/dutch_porter_stemmer.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/esperanto_stemmer.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/estonian_stemmer.cpython-313.pyc was added

--===============8982761193129750113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer: FILELIST: directory renamed /usr/lib/python3.13/site-packages/snowballstemmer-2.2.0.dist-info -> /usr/lib/python3.13/site-packages/snowballstemmer-3.0.1.dist-info, directory renamed /usr/lib/python3.13/site-packages/snowballstemmer-2.2.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/snowballstemmer-3.0.1.dist-info/licenses, added "/usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/dutch_porter_stemmer.cpython-313.pyc /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/esperanto_stemmer.cpython-313.pyc /usr/lib/python3.13/site-packages/snowballstemmer/estonian_stemmer.py /usr/lib/python3.13/site-packages/snowballstemmer/esperanto_stemmer.py /usr/lib/python3.13/site-packages/snowballstemmer/dutch_porter_stemmer.py /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/estonian_stemmer.cpython-313.pyc"
Changes to packages/core2-64-poky-linux/python3-snowballstemmer (sysroot):
  /usr/lib/python3.13/site-packages/snowballstemmer-2.2.0.dist-info moved to /usr/lib/python3.13/site-packages/snowballstemmer-3.0.1.dist-info
  /usr/lib/python3.13/site-packages/snowballstemmer/dutch_porter_stemmer.py was added
  /usr/lib/python3.13/site-packages/snowballstemmer/esperanto_stemmer.py was added
  /usr/lib/python3.13/site-packages/snowballstemmer/estonian_stemmer.py was added
  /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/dutch_porter_stemmer.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/esperanto_stemmer.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/estonian_stemmer.cpython-313.pyc was added

--===============8982761193129750113==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-snowballstemmer-upgrade-2.2.0-3.0.1.patch"

RnJvbSAxOThhYTIzZDE3ZWM1NGZkZGQwMWEzNjg0MjI0ZTlmMDY3NDBiZmQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDg6MTY6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNub3diYWxsc3RlbW1lcjogdXBncmFkZSAyLjIuMCAtPiAzLjAuMQoKLS0tCiAuLi5u
b3diYWxsc3RlbW1lcl8yLjIuMC5iYiA9PiBweXRob24zLXNub3diYWxsc3RlbW1lcl8zLjAuMS5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNub3diYWxsc3Rl
bW1lcl8yLjIuMC5iYiA9PiBweXRob24zLXNub3diYWxsc3RlbW1lcl8zLjAuMS5iYn0gKDc3JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc25vd2Jh
bGxzdGVtbWVyXzIuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNub3diYWxsc3RlbW1lcl8zLjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDc3JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc25vd2JhbGxzdGVtbWVyXzIu
Mi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc25v
d2JhbGxzdGVtbWVyXzMuMC4xLmJiCmluZGV4IGZmMTIwYTNmYzQuLjg0NmFiMmI5YWEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zbm93YmFsbHN0ZW1t
ZXJfMi4yLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNu
b3diYWxsc3RlbW1lcl8zLjAuMS5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6
Ly9naXRodWIuY29tL3Nub3diYWxsc3RlbS9zbm93YmFsbCIKIExJQ0VOU0UgPSAiQlNELTMtQ2xh
dXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MTkxMzlhYWYzYzhj
OGZhMWNhNmVkZDU5YzA3MmZiOWYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwOWIxNmRlYjg1
NDdkMzQxMmFkN2I1OTA2ODk1ODRjZDBmZTI1ZWM4ZGIzYmUzNzc4OGJlMzgxMGNiZjE5Y2IxIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjZkNWVlZWVjOGU5Zjg0ZDRkNTZiODQ3NjkyYmFjZjc5YmMy
YzhlOTBjN2Y4MGNhNDQ0NGZmOGI2ZjJlNTI4OTUiCiAKIFBZUElfUEFDS0FHRSA9ICJzbm93YmFs
bHN0ZW1tZXIiCiAKLS0gCjIuNDcuMQoK

--===============8982761193129750113==--

