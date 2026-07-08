Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED27C4450B
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 05:42:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2331.1783489332796989345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 22:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Lb6J3gh5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GxhPWb3A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f403f8289-19d26c8e-6ab0-4012-b2ef-89b5c73bd22c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783489332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/hltw/fomoXjlofFDAPd6Ip6V+G6B4bp+JABJYDT84k=;
	b=Lb6J3gh50bLnD3RCi3nSylrGI1+hUIkbvAImzWqjs0z2lD+MRqQP/FhqZtZkB3OE
	/T3JrmSv5cQYG1n2IfHM4Kv9trcABYp9Fe6DfRwwFp9JdozlT0OybKrrF8f4b6QWXLK
	gxhbYkaFegzT7+XKhWQdC+CpaiS15uUGO5rVI8hA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783489332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/hltw/fomoXjlofFDAPd6Ip6V+G6B4bp+JABJYDT84k=;
	b=GxhPWb3Ae71m/I+stxtGvmPtwBXjH5wv0V1ahRUEP4iKFwBKotZ+aYQTvSbKsyS9
	4CzOTPUxBto0JSXSYJgqnpoWGisg1WCoaPXZaIWbe61l5KnI0TAR0Fkz+Djl7lfKkoX
	4hbYkcLkJA0F7Ugk63Hl2hPINJFP/oQ48VaKREh8=
Content-Type: multipart/mixed; boundary="===============3476374310833609313=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.31.0 SUCCEEDED
Message-ID: <0101019f403f8289-19d26c8e-6ab0-4012-b2ef-89b5c73bd22c-000000@us-west-2.amazonses.com>
Date: Wed, 8 Jul 2026 05:42:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.08-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240429

--===============3476374310833609313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hatchling* to *1.31.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.30.1-1.31.0.patch
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
From bafbb9927ddad24f693549a55b923b0e25d8ec23 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 8 Jul 2026 05:15:42 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.30.1 -> 1.31.0

---
 ...{python3-hatchling_1.30.1.bb => python3-hatchling_1.31.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.30.1.bb => python3-hatchling_1.31.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb b/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hatchling_1.30.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.31.0.bb
index 23067e3e58..3acaa83638 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb
@@ -7,6 +7,6 @@ inherit pypi python_hatchling
 
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 
-SRC_URI[sha256sum] = "eee4fd45357f72ebb3d7a42e5d72cfb5e29ed426d79e8836288926c4258d5f2e"
+SRC_URI[sha256sum] = "6b48ad4068a482ed7239b3a8215bc55b47aad3345d58dfc94e553c5d2d46211b"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============3476374310833609313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hatchling-1.30.1.dist-info -> /usr/lib/python3.14/site-packages/hatchling-1.31.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/hatchling-1.30.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/hatchling-1.31.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.14/site-packages/hatchling-1.30.1.dist-info moved to /usr/lib/python3.14/site-packages/hatchling-1.31.0.dist-info

--===============3476374310833609313==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.30.1-1.31.0.patch"

RnJvbSBiYWZiYjk5MjdkZGFkMjRmNjkzNTQ5YTU1YjkyM2IwZTI1ZDhlYzIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgOCBKdWwgMjAyNiAwNToxNTo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2hsaW5nOiB1cGdyYWRlIDEuMzAuMSAtPiAxLjMxLjAKCi0tLQogLi4ue3B5dGhv
bjMtaGF0Y2hsaW5nXzEuMzAuMS5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjMxLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oYXRjaGxpbmdfMS4zMC4x
LmJiID0+IHB5dGhvbjMtaGF0Y2hsaW5nXzEuMzEuMC5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzAuMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4zMS4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4zMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzEuMC5iYgppbmRleCAyMzA2N2Uz
ZTU4Li4zYWNhYTgzNjM4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzEuMC5iYgpAQCAtNyw2ICs3LDYgQEAgaW5oZXJp
dCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAogREVQRU5EUyArPSAicHl0aG9uMy1wbHVnZ3ktbmF0
aXZlIHB5dGhvbjMtcGF0aHNwZWMtbmF0aXZlIHB5dGhvbjMtcGFja2FnaW5nLW5hdGl2ZSBweXRo
b24zLWVkaXRhYmxlcy1uYXRpdmUgcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVycy1uYXRpdmUiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlZWU0ZmQ0NTM1N2Y3MmViYjNkN2E0MmU1ZDcyY2ZiNWUy
OWVkNDI2ZDc5ZTg4MzYyODg5MjZjNDI1OGQ1ZjJlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZi
NDhhZDQwNjhhNDgyZWQ3MjM5YjNhODIxNWJjNTViNDdhYWQzMzQ1ZDU4ZGZjOTRlNTUzYzVkMmQ0
NjIxMWIiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLS0gCjIuNDcuMQoK

--===============3476374310833609313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.30.1.tar.gz;downloadfilename=hatchling-1.30.1.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.31.0.tar.gz;downloadfilename=hatchling-1.31.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-hatchling: PV changed from "1.30.1" to "1.31.0"
packages/x86-64-v3-poky-linux/python3-hatchling: PKGV changed from 1.30.1 [default] to 1.31.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.30.1" to "1.31.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.30.1 [default] to 1.31.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.30.1" to "1.31.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.30.1 [default] to 1.31.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.30.1" to "1.31.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.30.1 [default] to 1.31.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.30.1" to "1.31.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.30.1 [default] to 1.31.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.30.1" to "1.31.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.30.1 [default] to 1.31.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.30.1" to "1.31.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.30.1 [default] to 1.31.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.30.1" to "1.31.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hatchling-1.30.1.dist-info -> /usr/lib/python3.14/site-packages/hatchling-1.31.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/hatchling-1.30.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/hatchling-1.31.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.30.1 [default] to 1.31.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 712964 to 714734 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.14/site-packages/hatchling-1.30.1.dist-info moved to /usr/lib/python3.14/site-packages/hatchling-1.31.0.dist-info

--===============3476374310833609313==--

