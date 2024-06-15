Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549A2C3DA61
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:30 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.18379.1718475799528306579
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Sl0ZRFu9;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fEw3J8dj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101901d23b98a-6c442d87-ec4b-43ca-9455-7629ea4c999c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475799;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=u2Tc+c13lxn1Vt9PsosloYGxwt+QwyAPNYUIIlDR9+Y=;
	b=Sl0ZRFu98V20BRcxpeDLZWVzamE1kSxMk003AyH8YDZP8xoHwDkHacLbdU/W7lb5
	JYfEKeqgENzBTYKZET4MHytfjgslfPTxnlKZFS+KhUhQf3ttvpFoptm+UF6A1jvzVds
	4mDo5Cz2HCg4MdzUGkuHs9x70b7VpsU87RKlcAF0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475799;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=u2Tc+c13lxn1Vt9PsosloYGxwt+QwyAPNYUIIlDR9+Y=;
	b=fEw3J8dj173HnsbmG1hbl/yiRJXgx0cQ5rVUxT8ySF4VY+Tg9dWGE2hQyL7yykZk
	rtfzCC+5/cRJqvrscPRuYhTtXT0oS+Ucxgkv3qhfOq2wenXSeAaPeEB/FwwkMDBxFav
	7+KVsmA8478ea24xNj748GHESrWTWVDpAoKki52s=
Content-Type: multipart/mixed; boundary="===============4693597259062085034=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-testtools: upgrading to 2.7.2 SUCCEEDED
Message-ID: <010101901d23b98a-6c442d87-ec4b-43ca-9455-7629ea4c999c-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200697

--===============4693597259062085034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-testtools* to *2.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-testtools-upgrade-2.7.1-2.7.2.patch
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
From e5fb8d95153455b325d4ca94c3bcfdcc94bb3762 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 09:53:27 +0000
Subject: [PATCH] python3-testtools: upgrade 2.7.1 -> 2.7.2

---
 .../{python3-testtools_2.7.1.bb => python3-testtools_2.7.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.7.1.bb => python3-testtools_2.7.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.7.1.bb b/meta/recipes-devtools/python/python3-testtools_2.7.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-testtools_2.7.1.bb
rename to meta/recipes-devtools/python/python3-testtools_2.7.2.bb
index cc7e055632..b0ca4afd38 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.7.1.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.7.2.bb
@@ -8,7 +8,7 @@ DEPENDS += "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "df6de96010e29ee21f637a147eabf30d50b25e3841dd1d68f93ee89ce77e366c"
+SRC_URI[sha256sum] = "5be5bbc1f0fa0f8b60aca6ceec07845d41d0c475cf445bfadb4d2c45ec397ea3"
 
 RDEPENDS:${PN} += "\
     python3-doctest \
-- 
2.44.0


--===============4693597259062085034==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-testtools-upgrade-2.7.1-2.7.2.patch"

RnJvbSBlNWZiOGQ5NTE1MzQ1NWIzMjVkNGNhOTRjM2JjZmRjYzk0YmIzNzYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMDk6NTM6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRlc3R0b29sczogdXBncmFkZSAyLjcuMSAtPiAyLjcuMgoKLS0tCiAuLi4ve3B5dGhv
bjMtdGVzdHRvb2xzXzIuNy4xLmJiID0+IHB5dGhvbjMtdGVzdHRvb2xzXzIuNy4yLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXRlc3R0b29sc18yLjcuMS5i
YiA9PiBweXRob24zLXRlc3R0b29sc18yLjcuMi5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuNy4xLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRlc3R0b29sc18yLjcuMi5iYgpzaW1p
bGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdGVzdHRvb2xzXzIuNy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuNy4yLmJiCmluZGV4IGNjN2UwNTU2MzIuLmIw
Y2E0YWZkMzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My10ZXN0dG9vbHNfMi43LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXRlc3R0b29sc18yLjcuMi5iYgpAQCAtOCw3ICs4LDcgQEAgREVQRU5EUyArPSAicHl0
aG9uMy1oYXRjaC12Y3MtbmF0aXZlIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGY2ZGU5NjAxMGUyOWVlMjFmNjM3YTE0N2VhYmYzMGQ1
MGIyNWUzODQxZGQxZDY4ZjkzZWU4OWNlNzdlMzY2YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1
YmU1YmJjMWYwZmEwZjhiNjBhY2E2Y2VlYzA3ODQ1ZDQxZDBjNDc1Y2Y0NDViZmFkYjRkMmM0NWVj
Mzk3ZWEzIgogCiBSREVQRU5EUzoke1BOfSArPSAiXAogICAgIHB5dGhvbjMtZG9jdGVzdCBcCi0t
IAoyLjQ0LjAKCg==

--===============4693597259062085034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/testtools-2.7.1.dist-info -> /usr/lib/python3.12/site-packages/testtools-2.7.2.dist-info, removed "/usr/lib/python3.12/site-packages/testtools-2.7.1.dist-info/licenses/LICENSE /usr/lib/python3.12/site-packages/testtools-2.7.1.dist-info/licenses/AUTHORS", added "/usr/lib/python3.12/site-packages/testtools-2.7.2.dist-info/licenses/LICENSE"
Changes to packages/core2-64-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.12/site-packages/testtools-2.7.1.dist-info moved to /usr/lib/python3.12/site-packages/testtools-2.7.2.dist-info
  /usr/lib/python3.12/site-packages/testtools-2.7.1.dist-info/licenses/AUTHORS was removed

--===============4693597259062085034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-testtools: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/python3-testtools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.7.1.tar.gz;downloadfilename=testtools-2.7.1.tar.gz" to "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.7.2.tar.gz;downloadfilename=testtools-2.7.2.tar.gz"
packages/core2-64-poky-linux/python3-testtools: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/python3-testtools/python3-testtools-dbg: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/python3-testtools/python3-testtools-dbg: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/python3-testtools/python3-testtools-dev: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/python3-testtools/python3-testtools-dev: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/python3-testtools/python3-testtools-doc: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/python3-testtools/python3-testtools-doc: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/python3-testtools/python3-testtools-locale: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/python3-testtools/python3-testtools-locale: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/python3-testtools/python3-testtools-src: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/python3-testtools/python3-testtools-src: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/python3-testtools/python3-testtools-staticdev: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/python3-testtools/python3-testtools-staticdev: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/python3-testtools/python3-testtools: PV changed from "2.7.1" to "2.7.2"
packages/core2-64-poky-linux/python3-testtools/python3-testtools: PKGV changed from 2.7.1 [default] to 2.7.2 [default]
packages/core2-64-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/testtools-2.7.1.dist-info -> /usr/lib/python3.12/site-packages/testtools-2.7.2.dist-info, removed "/usr/lib/python3.12/site-packages/testtools-2.7.1.dist-info/licenses/AUTHORS /usr/lib/python3.12/site-packages/testtools-2.7.1.dist-info/licenses/LICENSE", added "/usr/lib/python3.12/site-packages/testtools-2.7.2.dist-info/licenses/LICENSE"
packages/core2-64-poky-linux/python3-testtools/python3-testtools: PKGSIZE changed from 1797099 to 1814400 (+1%)
Changes to packages/core2-64-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.12/site-packages/testtools-2.7.1.dist-info moved to /usr/lib/python3.12/site-packages/testtools-2.7.2.dist-info
  /usr/lib/python3.12/site-packages/testtools-2.7.1.dist-info/licenses/AUTHORS was removed

--===============4693597259062085034==--

