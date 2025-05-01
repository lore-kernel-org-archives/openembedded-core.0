Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6CEC3ABC2
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:33 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1773.1746113609216164425
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KzYqHAtA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=W/SUYUML;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101968c7b4bd4-733521d1-bd45-433b-baea-81b1fa68f9fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kspVQTdU7z3Uuvm7Wy/900tXx4nHCCcNPDm/TtLhqfM=;
	b=KzYqHAtAlvPFk1u8vuDox4z0fo1XmwXq+nfbTycVh+3zwftJrSt1ppitvkut7vIY
	NonDb7al2tD2v9LqliQs8YYUuztiUwmjRcTv/wJMGGeaz5yC4uJG4iZLy2D5bJMZ/oo
	ka2l+hBj1O4ReJ4ijCs/jhhWJnCZnFCtDqNsHSiM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kspVQTdU7z3Uuvm7Wy/900tXx4nHCCcNPDm/TtLhqfM=;
	b=W/SUYUMLbekTZ8yFmyWnNUJtcDVdqUuhw9kYTp/0IaBlIMnfm7Ii+NeAxzXStar0
	plJXiYeeLkXqBCchM0VJpF1NqUTJMgZhsv8lMbXeEQSgqRlNHSqdvtipqpLFieAePnY
	dY1pYeG189qRSTgYPWPGyS+Tb360G7a2P2Jmg6os=
Content-Type: multipart/mixed; boundary="===============4877397923437401364=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] resolvconf: upgrading to 1.93 SUCCEEDED
Message-ID: <010101968c7b4bd4-733521d1-bd45-433b-baea-81b1fa68f9fd-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215792

--===============4877397923437401364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *resolvconf* to *1.93* has Succeeded.

Next steps:
    - apply the patch: git am 0001-resolvconf-upgrade-1.92-1.93.patch
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
From 44d63f62a5520c9bab5e0ceb7eae53e37354bbd7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 07:46:48 +0000
Subject: [PATCH] resolvconf: upgrade 1.92 -> 1.93

---
 .../0001-avoid-using-m-option-for-readlink.patch           | 7 ++-----
 .../resolvconf/{resolvconf_1.92.bb => resolvconf_1.93.bb}  | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.92.bb => resolvconf_1.93.bb} (98%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch b/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
index ab32f26754..13c4ad5a32 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
+++ b/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
@@ -1,4 +1,4 @@
-From 6bf2bb136a0b3961339369bc08e58b661fba0edb Mon Sep 17 00:00:00 2001
+From cb153a538f1cfffeac94a929fa643df26bb08380 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Nov 2022 17:26:30 +0800
 Subject: [PATCH] avoid using -m option for readlink
@@ -20,7 +20,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/etc/resolvconf/update.d/libc b/etc/resolvconf/update.d/libc
-index 1c4f6bc..f75d22c 100755
+index e500167..0b84c35 100755
 --- a/etc/resolvconf/update.d/libc
 +++ b/etc/resolvconf/update.d/libc
 @@ -57,7 +57,7 @@ fi
@@ -32,6 +32,3 @@ index 1c4f6bc..f75d22c 100755
  }
  
  if ! resolv_conf_is_symlinked_to_dynamic_file ; then
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
similarity index 98%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
index c3ce5bc22e..93e5a944d1 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=un
            file://0001-avoid-using-m-option-for-readlink.patch \
            "
 
-SRCREV = "86047276c80705c51859a19f0c472102e0822f34"
+SRCREV = "ab766fa31f7939f6d879123236b4275320b7ff64"
 
 S = "${WORKDIR}/git"
 
-- 
2.47.1


--===============4877397923437401364==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-resolvconf-upgrade-1.92-1.93.patch"

RnJvbSA0NGQ2M2Y2MmE1NTIwYzliYWI1ZTBjZWI3ZWFlNTNlMzczNTRiYmQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwNzo0Njo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
c29sdmNvbmY6IHVwZ3JhZGUgMS45MiAtPiAxLjkzCgotLS0KIC4uLi8wMDAxLWF2b2lkLXVzaW5n
LW0tb3B0aW9uLWZvci1yZWFkbGluay5wYXRjaCAgICAgICAgICAgfCA3ICsrLS0tLS0KIC4uLi9y
ZXNvbHZjb25mL3tyZXNvbHZjb25mXzEuOTIuYmIgPT4gcmVzb2x2Y29uZl8xLjkzLmJifSAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Jlc29sdmNvbmYve3Jlc29sdmNvbmZfMS45
Mi5iYiA9PiByZXNvbHZjb25mXzEuOTMuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9yZXNvbHZjb25mL3Jlc29sdmNvbmYvMDAwMS1hdm9pZC11c2luZy1t
LW9wdGlvbi1mb3ItcmVhZGxpbmsucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Jl
c29sdmNvbmYvcmVzb2x2Y29uZi8wMDAxLWF2b2lkLXVzaW5nLW0tb3B0aW9uLWZvci1yZWFkbGlu
ay5wYXRjaAppbmRleCBhYjMyZjI2NzU0Li4xM2M0YWQ1YTMyIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L3Jlc29sdmNvbmYvcmVzb2x2Y29uZi8wMDAxLWF2b2lkLXVzaW5n
LW0tb3B0aW9uLWZvci1yZWFkbGluay5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L3Jlc29sdmNvbmYvcmVzb2x2Y29uZi8wMDAxLWF2b2lkLXVzaW5nLW0tb3B0aW9uLWZvci1y
ZWFkbGluay5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmJmMmJiMTM2YTBiMzk2MTMzOTM2
OWJjMDhlNThiNjYxZmJhMGVkYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gY2IxNTNh
NTM4ZjFjZmZmZWFjOTRhOTI5ZmE2NDNkZjI2YmIwODM4MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMTcg
Tm92IDIwMjIgMTc6MjY6MzAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXZvaWQgdXNpbmcgLW0g
b3B0aW9uIGZvciByZWFkbGluawpAQCAtMjAsNyArMjAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBDaGVu
IFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9ldGMvcmVzb2x2Y29uZi91cGRhdGUu
ZC9saWJjIGIvZXRjL3Jlc29sdmNvbmYvdXBkYXRlLmQvbGliYwotaW5kZXggMWM0ZjZiYy4uZjc1
ZDIyYyAxMDA3NTUKK2luZGV4IGU1MDAxNjcuLjBiODRjMzUgMTAwNzU1CiAtLS0gYS9ldGMvcmVz
b2x2Y29uZi91cGRhdGUuZC9saWJjCiArKysgYi9ldGMvcmVzb2x2Y29uZi91cGRhdGUuZC9saWJj
CiBAQCAtNTcsNyArNTcsNyBAQCBmaQpAQCAtMzIsNiArMzIsMyBAQCBpbmRleCAxYzRmNmJjLi5m
NzVkMjJjIDEwMDc1NQogIH0KICAKICBpZiAhIHJlc29sdl9jb25mX2lzX3N5bWxpbmtlZF90b19k
eW5hbWljX2ZpbGUgOyB0aGVuCi0tLSAKLTIuMTcuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L3Jlc29sdmNvbmYvcmVzb2x2Y29uZl8xLjkyLmJiIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9yZXNvbHZjb25mL3Jlc29sdmNvbmZfMS45My5iYgpzaW1pbGFyaXR5
IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Jlc29sdmNv
bmYvcmVzb2x2Y29uZl8xLjkyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L3Jlc29sdmNvbmYvcmVzb2x2Y29uZl8xLjkzLmJiCmluZGV4IGMzY2U1YmMyMmUuLjkzZTVhOTQ0
ZDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvcmVzb2x2Y29uZi9yZXNv
bHZjb25mXzEuOTIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9yZXNvbHZjb25m
L3Jlc29sdmNvbmZfMS45My5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gImdpdDovL3Nh
bHNhLmRlYmlhbi5vcmcvZGViaWFuL3Jlc29sdmNvbmYuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5j
aD11bgogICAgICAgICAgICBmaWxlOi8vMDAwMS1hdm9pZC11c2luZy1tLW9wdGlvbi1mb3ItcmVh
ZGxpbmsucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICI4NjA0NzI3NmM4MDcwNWM1
MTg1OWExOWYwYzQ3MjEwMmUwODIyZjM0IgorU1JDUkVWID0gImFiNzY2ZmEzMWY3OTM5ZjZkODc5
MTIzMjM2YjQyNzUzMjBiN2ZmNjQiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDcu
MQoK

--===============4877397923437401364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/resolvconf: PKGV changed from 1.92 [default] to 1.93 [default]
packages/core2-64-poky-linux/resolvconf: PV changed from "1.92" to "1.93"
packages/core2-64-poky-linux/resolvconf/resolvconf-dbg: PKGV changed from 1.92 [default] to 1.93 [default]
packages/core2-64-poky-linux/resolvconf/resolvconf-dbg: PV changed from "1.92" to "1.93"
packages/core2-64-poky-linux/resolvconf/resolvconf-dev: PKGV changed from 1.92 [default] to 1.93 [default]
packages/core2-64-poky-linux/resolvconf/resolvconf-dev: PV changed from "1.92" to "1.93"
packages/core2-64-poky-linux/resolvconf/resolvconf-doc: PKGSIZE changed from 44028 to 44064 (+0%)
packages/core2-64-poky-linux/resolvconf/resolvconf-doc: PKGV changed from 1.92 [default] to 1.93 [default]
packages/core2-64-poky-linux/resolvconf/resolvconf-doc: PV changed from "1.92" to "1.93"
packages/core2-64-poky-linux/resolvconf/resolvconf-locale: PKGV changed from 1.92 [default] to 1.93 [default]
packages/core2-64-poky-linux/resolvconf/resolvconf-locale: PV changed from "1.92" to "1.93"
packages/core2-64-poky-linux/resolvconf/resolvconf-src: PKGV changed from 1.92 [default] to 1.93 [default]
packages/core2-64-poky-linux/resolvconf/resolvconf-src: PV changed from "1.92" to "1.93"
packages/core2-64-poky-linux/resolvconf/resolvconf-staticdev: PKGV changed from 1.92 [default] to 1.93 [default]
packages/core2-64-poky-linux/resolvconf/resolvconf-staticdev: PV changed from "1.92" to "1.93"
packages/core2-64-poky-linux/resolvconf/resolvconf: PKGSIZE changed from 15782 to 15871 (+1%)
packages/core2-64-poky-linux/resolvconf/resolvconf: PKGV changed from 1.92 [default] to 1.93 [default]
packages/core2-64-poky-linux/resolvconf/resolvconf: PV changed from "1.92" to "1.93"

--===============4877397923437401364==--

