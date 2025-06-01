Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7E7C7EE30
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:45 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.27766.1748786123737888376
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PMTUTo0M;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EL7nz6CG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101972bc6cafa-5ac41227-e0c9-4535-b6d4-cff35290607f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WbpXaVWVsE2xqMYpvw+sGtMnNAq82tjkdsFtv6qaQFk=;
	b=PMTUTo0MJZNUmaV/cbU6w3AfxMtuEt70KTQfPIS4t7Y3zJu7VLuHw6BkYv9RIjZT
	7QRtxfzdODc4byKBhthtscoeI9O97gRcJAMJCH+pc0qGoDAW5SGynx7OMfgqxoIm4Sr
	q86xGma9UxW3TvuJuH/Y8wyHIT+muOCtLW3++9N8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WbpXaVWVsE2xqMYpvw+sGtMnNAq82tjkdsFtv6qaQFk=;
	b=EL7nz6CG5Q4RhhzV5ZVSyQLI1odwqWklZLs0NiQPxzXahD7IE5nwifydxIJMV7jD
	xAr0U8UiV7Q0JEvV2iTPf0RZzjjDAzLVYRCmaG8ChSm9cR2WDVavUR6CXKgIiyTzZ/L
	uQmcPg9H2Pm+Y4hGw1w/H4VLE0FRNUxW0zmdtjWc=
Content-Type: multipart/mixed; boundary="===============8821563181890588909=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-snowballstemmer: upgrading to 3.0.1 SUCCEEDED
Message-ID: <010101972bc6cafa-5ac41227-e0c9-4535-b6d4-cff35290607f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217610

--===============8821563181890588909==
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
From 6db50cbc3c2469f287b9c1820de5d88a3e4c4fd5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 09:59:46 +0000
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


--===============8821563181890588909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-snowballstemmer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/snowballstemmer/snowballstemmer-2.2.0.tar.gz;downloadfilename=snowballstemmer-2.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/snowballstemmer/snowballstemmer-3.0.1.tar.gz;downloadfilename=snowballstemmer-3.0.1.tar.gz"
packages/core2-64-poky-linux/python3-snowballstemmer: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dbg: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dbg: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dev: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-dev: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-doc: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-doc: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-locale: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-locale: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-src: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-src: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-staticdev: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer-staticdev: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer: PV changed from "2.2.0" to "3.0.1"
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer: PKGSIZE changed from 1792437 to 1910895 (+7%)
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer: PKGV changed from 2.2.0 [default] to 3.0.1 [default]
packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer: FILELIST: directory renamed /usr/lib/python3.13/site-packages/snowballstemmer-2.2.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/snowballstemmer-3.0.1.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/snowballstemmer-2.2.0.dist-info -> /usr/lib/python3.13/site-packages/snowballstemmer-3.0.1.dist-info, added "/usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/esperanto_stemmer.cpython-313.pyc /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/estonian_stemmer.cpython-313.pyc /usr/lib/python3.13/site-packages/snowballstemmer/esperanto_stemmer.py /usr/lib/python3.13/site-packages/snowballstemmer/dutch_porter_stemmer.py /usr/lib/python3.13/site-packages/snowballstemmer/estonian_stemmer.py /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/dutch_porter_stemmer.cpython-313.pyc"
Changes to packages/core2-64-poky-linux/python3-snowballstemmer (sysroot):
  /usr/lib/python3.13/site-packages/snowballstemmer-2.2.0.dist-info moved to /usr/lib/python3.13/site-packages/snowballstemmer-3.0.1.dist-info
  /usr/lib/python3.13/site-packages/snowballstemmer/dutch_porter_stemmer.py was added
  /usr/lib/python3.13/site-packages/snowballstemmer/esperanto_stemmer.py was added
  /usr/lib/python3.13/site-packages/snowballstemmer/estonian_stemmer.py was added
  /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/dutch_porter_stemmer.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/esperanto_stemmer.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/estonian_stemmer.cpython-313.pyc was added

--===============8821563181890588909==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-snowballstemmer-upgrade-2.2.0-3.0.1.patch"

RnJvbSA2ZGI1MGNiYzNjMjQ2OWYyODdiOWMxODIwZGU1ZDg4YTNlNGM0ZmQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwOTo1OTo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc25vd2JhbGxzdGVtbWVyOiB1cGdyYWRlIDIuMi4wIC0+IDMuMC4xCgotLS0KIC4uLm5v
d2JhbGxzdGVtbWVyXzIuMi4wLmJiID0+IHB5dGhvbjMtc25vd2JhbGxzdGVtbWVyXzMuMC4xLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc25vd2JhbGxzdGVt
bWVyXzIuMi4wLmJiID0+IHB5dGhvbjMtc25vd2JhbGxzdGVtbWVyXzMuMC4xLmJifSAoNzclKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zbm93YmFs
bHN0ZW1tZXJfMi4yLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c25vd2JhbGxzdGVtbWVyXzMuMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggNzclCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zbm93YmFsbHN0ZW1tZXJfMi4y
LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zbm93
YmFsbHN0ZW1tZXJfMy4wLjEuYmIKaW5kZXggZmYxMjBhM2ZjNC4uODQ2YWIyYjlhYSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNub3diYWxsc3RlbW1l
cl8yLjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc25v
d2JhbGxzdGVtbWVyXzMuMC4xLmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczov
L2dpdGh1Yi5jb20vc25vd2JhbGxzdGVtL3Nub3diYWxsIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1
c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0xOTEzOWFhZjNjOGM4
ZmExY2E2ZWRkNTljMDcyZmI5ZiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA5YjE2ZGViODU0
N2QzNDEyYWQ3YjU5MDY4OTU4NGNkMGZlMjVlYzhkYjNiZTM3Nzg4YmUzODEwY2JmMTljYjEiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNmQ1ZWVlZWM4ZTlmODRkNGQ1NmI4NDc2OTJiYWNmNzliYzJj
OGU5MGM3ZjgwY2E0NDQ0ZmY4YjZmMmU1Mjg5NSIKIAogUFlQSV9QQUNLQUdFID0gInNub3diYWxs
c3RlbW1lciIKIAotLSAKMi40Ny4xCgo=

--===============8821563181890588909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-snowballstemmer/python3-snowballstemmer: FILELIST: directory renamed /usr/lib/python3.13/site-packages/snowballstemmer-2.2.0.dist-info -> /usr/lib/python3.13/site-packages/snowballstemmer-3.0.1.dist-info, directory renamed /usr/lib/python3.13/site-packages/snowballstemmer-2.2.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/snowballstemmer-3.0.1.dist-info/licenses, added "/usr/lib/python3.13/site-packages/snowballstemmer/estonian_stemmer.py /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/dutch_porter_stemmer.cpython-313.pyc /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/estonian_stemmer.cpython-313.pyc /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/esperanto_stemmer.cpython-313.pyc /usr/lib/python3.13/site-packages/snowballstemmer/dutch_porter_stemmer.py /usr/lib/python3.13/site-packages/snowballstemmer/esperanto_stemmer.py"
Changes to packages/core2-64-poky-linux/python3-snowballstemmer (sysroot):
  /usr/lib/python3.13/site-packages/snowballstemmer-2.2.0.dist-info moved to /usr/lib/python3.13/site-packages/snowballstemmer-3.0.1.dist-info
  /usr/lib/python3.13/site-packages/snowballstemmer/dutch_porter_stemmer.py was added
  /usr/lib/python3.13/site-packages/snowballstemmer/esperanto_stemmer.py was added
  /usr/lib/python3.13/site-packages/snowballstemmer/estonian_stemmer.py was added
  /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/dutch_porter_stemmer.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/esperanto_stemmer.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/snowballstemmer/__pycache__/estonian_stemmer.cpython-313.pyc was added

--===============8821563181890588909==--

