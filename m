Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D2FC982E0
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 05:43:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7447.1789796593657798755
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 22:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oCZDb3X2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oQQRVqWg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a0b830abd5-169326f8-c763-415d-8eb5-eef56effe9f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789796592;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FGI9lJlFipwQUyeeTXe0WCGgxdlMNpe34hBMJCxmEKY=;
	b=oCZDb3X2lNbFqSfNCVnNLz4M00g2/QmnV4OIl/h0tw9axIxVQVqobZdQypjATsth
	fIq9sFD3duLwfP8fRDnN7MdD/sI3/hTFa4+A88/A2ahRclBLsBvkydcb3oQ+0ZQCtuJ
	SEaCpu0Hu2EqKpPtOZVt23baG8Xyz4ghEieIByg8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789796592;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FGI9lJlFipwQUyeeTXe0WCGgxdlMNpe34hBMJCxmEKY=;
	b=oQQRVqWgD+3pdxNuS+YeprH7/t2MwJkKg0CJG9upY5A5istM2RJCLmerXWNwt2AI
	XncrWUkFzt2SqxXlweOVgOgfdn5JpvRK0xYA+8o5ttxnL4cSfRo+WqBHFbGuB3Xaq9I
	WXP6zr1NsxeQCt9nNXizJHfq28rzSEXDVpAsafxQ=
Content-Type: multipart/mixed; boundary="===============8875160782704282800=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2026.9 SUCCEEDED
Message-ID: <010101a0b830abd5-169326f8-c763-415d-8eb5-eef56effe9f0-000000@us-west-2.amazonses.com>
Date: Sat, 19 Sep 2026 05:43:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.19-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 05:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246228

--===============8875160782704282800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtschema* to *2026.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2026.6-2026.9.patch
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
From aaf0c6a44e034bf4609041d4236900846639774f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 19 Sep 2026 05:15:38 +0000
Subject: [PATCH] python3-dtschema: upgrade 2026.6 -> 2026.9

---
 .../{python3-dtschema_2026.6.bb => python3-dtschema_2026.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2026.6.bb => python3-dtschema_2026.9.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2026.6.bb b/meta/recipes-devtools/python/python3-dtschema_2026.9.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-dtschema_2026.6.bb
rename to meta/recipes-devtools/python/python3-dtschema_2026.9.bb
index bb9ced182c..1ab2d4ce3d 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2026.6.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2026.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=457495c8fa03540db4a576bf7869e811"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "05188e3727393334b99abb74ae220ccb8158eec67d6bec793326253f9e76d57a"
+SRC_URI[sha256sum] = "d50aa00414f09b7aadc776afabe623915b8f94e59d6eddef80920d6505cba671"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.47.1


--===============8875160782704282800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.14/site-packages/dtschema-2026.6.dist-info/licenses -> /usr/lib/python3.14/site-packages/dtschema-2026.9.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/dtschema-2026.6.dist-info -> /usr/lib/python3.14/site-packages/dtschema-2026.9.dist-info, added "/usr/lib/python3.14/site-packages/dtschema/schemas/mbox/mbox-controller.yaml /usr/lib/python3.14/site-packages/dtschema/schemas/power/power-controller.yaml"
Changes to packages/x86-64-v3-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.14/site-packages/dtschema-2026.6.dist-info moved to /usr/lib/python3.14/site-packages/dtschema-2026.9.dist-info
  /usr/lib/python3.14/site-packages/dtschema/schemas/mbox/mbox-controller.yaml was added
  /usr/lib/python3.14/site-packages/dtschema/schemas/power was added
  /usr/lib/python3.14/site-packages/dtschema/schemas/power/power-controller.yaml was added

--===============8875160782704282800==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2026.6-2026.9.patch"

RnJvbSBhYWYwYzZhNDRlMDM0YmY0NjA5MDQxZDQyMzY5MDA4NDY2Mzk3NzRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTkgU2VwIDIwMjYgMDU6MTU6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjYuNiAtPiAyMDI2LjkKCi0tLQogLi4uL3tweXRo
b24zLWR0c2NoZW1hXzIwMjYuNi5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjYuOS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kdHNjaGVtYV8yMDI2LjYu
YmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDI2LjkuYmJ9ICg4NCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjYuNi5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDI2LjkuYmIKc2lt
aWxhcml0eSBpbmRleCA4NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWR0c2NoZW1hXzIwMjYuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjYuOS5iYgppbmRleCBiYjljZWQxODJjLi4x
YWIyZDRjZTNkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZHRzY2hlbWFfMjAyNi42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1kdHNjaGVtYV8yMDI2LjkuYmIKQEAgLTUsNyArNSw3IEBAIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT00NTc0OTVjOGZhMDM1NDBkYjRhNTc2YmY3ODY5
ZTgxMSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjA1MTg4ZTM3MjczOTMzMzRiOTlhYmI3NGFlMjIwY2NiODE1OGVl
YzY3ZDZiZWM3OTMzMjYyNTNmOWU3NmQ1N2EiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDUwYWEw
MDQxNGYwOWI3YWFkYzc3NmFmYWJlNjIzOTE1YjhmOTRlNTlkNmVkZGVmODA5MjBkNjUwNWNiYTY3
MSIKIAogREVQRU5EUyArPSAicHl0aG9uMy1zZXR1cHRvb2xzLXNjbS1uYXRpdmUiCiBSREVQRU5E
Uzoke1BOfSArPSAiXAotLSAKMi40Ny4xCgo=

--===============8875160782704282800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-dtschema: PV changed from "2026.6" to "2026.9"
packages/x86-64-v3-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2026.6.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2026.9.tar.gz"
packages/x86-64-v3-poky-linux/python3-dtschema: PKGV changed from 2026.6 [default] to 2026.9 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2026.6" to "2026.9"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2026.6 [default] to 2026.9 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2026.6" to "2026.9"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2026.6 [default] to 2026.9 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2026.6" to "2026.9"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2026.6 [default] to 2026.9 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2026.6" to "2026.9"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2026.6 [default] to 2026.9 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2026.6" to "2026.9"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2026.6 [default] to 2026.9 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2026.6" to "2026.9"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2026.6 [default] to 2026.9 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2026.6" to "2026.9"
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2026.6 [default] to 2026.9 [default]
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 412637 to 444714 (+8%)
packages/x86-64-v3-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.14/site-packages/dtschema-2026.6.dist-info/licenses -> /usr/lib/python3.14/site-packages/dtschema-2026.9.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/dtschema-2026.6.dist-info -> /usr/lib/python3.14/site-packages/dtschema-2026.9.dist-info, added "/usr/lib/python3.14/site-packages/dtschema/schemas/mbox/mbox-controller.yaml /usr/lib/python3.14/site-packages/dtschema/schemas/power/power-controller.yaml"
Changes to packages/x86-64-v3-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.14/site-packages/dtschema-2026.6.dist-info moved to /usr/lib/python3.14/site-packages/dtschema-2026.9.dist-info
  /usr/lib/python3.14/site-packages/dtschema/schemas/mbox/mbox-controller.yaml was added
  /usr/lib/python3.14/site-packages/dtschema/schemas/power was added
  /usr/lib/python3.14/site-packages/dtschema/schemas/power/power-controller.yaml was added

--===============8875160782704282800==--

