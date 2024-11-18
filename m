Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0334BD591C2
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:49 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4790.1731964607557674668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DM5Xlw8d;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=IdsRTJ3r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010193412299bc-5585cc61-e413-473e-be6e-dad899373cac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964607;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cci9xKyyQeKDZLGb19osVdn75/NHNnbn0zZfhSMSJxs=;
	b=DM5Xlw8dVnFHfG06Me4Ixo8blj1n4x5fSTuzh40GScWh7zA1w2o4mlkTpdKgOqLy
	Shm7ktugcQhE3VFr71Gvkhptj3We4Sj37jEEaL4ngvP0L2k6VmK51HMwof1p9wQKbJf
	LYb4DyE0tnDQqp78/kORfsMeGJL9Yy1pXcSMhxYQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964607;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cci9xKyyQeKDZLGb19osVdn75/NHNnbn0zZfhSMSJxs=;
	b=IdsRTJ3rvQSa6d1w0TG2wH2ku91EbwoxKf8hluan3zmGmSXRLHeTOwCHfJ/rqIt7
	rHKcNau1s4omZDvAbb5lng3gQ41IF6R1Mx8T9fvqyzDG5mSdqBmO/xGcdbhMMZIDL3u
	lZo+5cLXAugFjxOlyKEl0eYnPq3mWcUqQap2VRAg=
Content-Type: multipart/mixed; boundary="===============5846138680819815101=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dropbear: upgrading to 2024.86 SUCCEEDED
Message-ID: <01010193412299bc-5585cc61-e413-473e-be6e-dad899373cac-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207249

--===============5846138680819815101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dropbear* to *2024.86* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dropbear-upgrade-2024.85-2024.86.patch
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
From 76bb2c80736d84312fc8f2b247cec14f62aaee3a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 05:03:22 +0000
Subject: [PATCH] dropbear: upgrade 2024.85 -> 2024.86

---
 .../dropbear/0001-urandom-xauth-changes-to-options.h.patch      | 2 +-
 .../dropbear/dropbear/0005-dropbear-enable-pam.patch            | 2 +-
 .../dropbear/dropbear/0006-dropbear-configuration-file.patch    | 2 +-
 .../dropbear/dropbear/dropbear-disable-weak-ciphers.patch       | 2 +-
 .../dropbear/{dropbear_2024.85.bb => dropbear_2024.86.bb}       | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear_2024.85.bb => dropbear_2024.86.bb} (98%)

diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
index 9c1dd3f606..a6f9cf4233 100644
--- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
@@ -1,4 +1,4 @@
-From cdc6a4a57a86d8116a92a5d905993e65cf723556 Mon Sep 17 00:00:00 2001
+From 46c7ce987fc9522b233aea41bef3a392868afe17 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard@openedhand.com>
 Date: Wed, 31 Aug 2005 10:45:47 +0000
 Subject: [PATCH] urandom-xauth-changes-to-options.h
diff --git a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
index 6743f506e9..fab5b09328 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -1,4 +1,4 @@
-From 253ca01f0fc50dbaeb2ff8bcece0c34256eba94f Mon Sep 17 00:00:00 2001
+From 89e9de03a884689f7f02c2f275fa983512c83008 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Wed, 2 Dec 2015 11:36:02 +0200
 Subject: [PATCH] Enable pam
diff --git a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
index 44861088cc..fa0f6b8f5c 100644
--- a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -1,4 +1,4 @@
-From 16b147f97f0938cddb55ec1c90bc919c13f26fc0 Mon Sep 17 00:00:00 2001
+From 84c93a0e1b84588a2e064b8e4f1de902680aac0f Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Thu, 6 Sep 2018 15:54:00 +0800
 Subject: [PATCH] dropbear configuration file
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
index a20781d31d..39e85d863e 100644
--- a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
@@ -1,4 +1,4 @@
-From c8a0c8e87b772576f3a431c3b4cacaf5aa001dcc Mon Sep 17 00:00:00 2001
+From 8f0a5904dc24c6e95c1dbee73502aa83f33e8c87 Mon Sep 17 00:00:00 2001
 From: Joseph Reynolds <joseph.reynolds1@ibm.com>
 Date: Thu, 20 Jun 2019 16:29:15 -0500
 Subject: [PATCH] dropbear: new feature: disable-weak-ciphers
diff --git a/meta/recipes-core/dropbear/dropbear_2024.85.bb b/meta/recipes-core/dropbear/dropbear_2024.86.bb
similarity index 98%
rename from meta/recipes-core/dropbear/dropbear_2024.85.bb
rename to meta/recipes-core/dropbear/dropbear_2024.86.bb
index 54001414d0..e3f4d17896 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.85.bb
+++ b/meta/recipes-core/dropbear/dropbear_2024.86.bb
@@ -23,7 +23,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
            "
 
-SRC_URI[sha256sum] = "86b036c433a69d89ce51ebae335d65c47738ccf90d13e5eb0fea832e556da502"
+SRC_URI[sha256sum] = "e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
-- 
2.44.1


--===============5846138680819815101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dropbear/dropbear-dbg: PKGV changed from 2024.85 [default] to 2024.86 [default]
packages/core2-64-poky-linux/dropbear/dropbear-dbg: PV changed from "2024.85" to "2024.86"
packages/core2-64-poky-linux/dropbear/dropbear-dbg: PKGSIZE changed from 1429032 to 1428984 (-0%)
packages/core2-64-poky-linux/dropbear/dropbear-dev: PKGV changed from 2024.85 [default] to 2024.86 [default]
packages/core2-64-poky-linux/dropbear/dropbear-dev: PV changed from "2024.85" to "2024.86"
packages/core2-64-poky-linux/dropbear/dropbear-doc: PKGV changed from 2024.85 [default] to 2024.86 [default]
packages/core2-64-poky-linux/dropbear/dropbear-doc: PV changed from "2024.85" to "2024.86"
packages/core2-64-poky-linux/dropbear/dropbear-locale: PKGV changed from 2024.85 [default] to 2024.86 [default]
packages/core2-64-poky-linux/dropbear/dropbear-locale: PV changed from "2024.85" to "2024.86"
packages/core2-64-poky-linux/dropbear/dropbear-src: PKGV changed from 2024.85 [default] to 2024.86 [default]
packages/core2-64-poky-linux/dropbear/dropbear-src: PV changed from "2024.85" to "2024.86"
packages/core2-64-poky-linux/dropbear/dropbear-src: PKGSIZE changed from 1411745 to 1411818 (+0%)
packages/core2-64-poky-linux/dropbear/dropbear-staticdev: PKGV changed from 2024.85 [default] to 2024.86 [default]
packages/core2-64-poky-linux/dropbear/dropbear-staticdev: PV changed from "2024.85" to "2024.86"
packages/core2-64-poky-linux/dropbear/dropbear: PKGV changed from 2024.85 [default] to 2024.86 [default]
packages/core2-64-poky-linux/dropbear/dropbear: PV changed from "2024.85" to "2024.86"
packages/core2-64-poky-linux/dropbear: PKGV changed from 2024.85 [default] to 2024.86 [default]
packages/core2-64-poky-linux/dropbear: SRC_URI changed from "http://matt.ucc.asn.au/dropbear/releases/dropbear-2024.85.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear file://dropbear-disable-weak-ciphers.patch" to "http://matt.ucc.asn.au/dropbear/releases/dropbear-2024.86.tar.bz2 file://0001-urandom-xauth-changes-to-options.h.patch file://init file://dropbearkey.service file://dropbear@.service file://dropbear.socket file://dropbear.default file://0005-dropbear-enable-pam.patch file://0006-dropbear-configuration-file.patch file://dropbear file://dropbear-disable-weak-ciphers.patch"
packages/core2-64-poky-linux/dropbear: PV changed from "2024.85" to "2024.86"

--===============5846138680819815101==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dropbear-upgrade-2024.85-2024.86.patch"

RnJvbSA3NmJiMmM4MDczNmQ4NDMxMmZjOGYyYjI0N2NlYzE0ZjYyYWFlZTNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMDU6MDM6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
cm9wYmVhcjogdXBncmFkZSAyMDI0Ljg1IC0+IDIwMjQuODYKCi0tLQogLi4uL2Ryb3BiZWFyLzAw
MDEtdXJhbmRvbS14YXV0aC1jaGFuZ2VzLXRvLW9wdGlvbnMuaC5wYXRjaCAgICAgIHwgMiArLQog
Li4uL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJlYXItZW5hYmxlLXBhbS5wYXRjaCAgICAg
ICAgICAgIHwgMiArLQogLi4uL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDYtZHJvcGJlYXItY29uZmln
dXJhdGlvbi1maWxlLnBhdGNoICAgIHwgMiArLQogLi4uL2Ryb3BiZWFyL2Ryb3BiZWFyL2Ryb3Bi
ZWFyLWRpc2FibGUtd2Vhay1jaXBoZXJzLnBhdGNoICAgICAgIHwgMiArLQogLi4uL2Ryb3BiZWFy
L3tkcm9wYmVhcl8yMDI0Ljg1LmJiID0+IGRyb3BiZWFyXzIwMjQuODYuYmJ9ICAgICAgIHwgMiAr
LQogNSBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIve2Ryb3BiZWFyXzIwMjQuODUuYmIgPT4gZHJv
cGJlYXJfMjAyNC44Ni5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9k
cm9wYmVhci9kcm9wYmVhci8wMDAxLXVyYW5kb20teGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDAxLXVyYW5kb20t
eGF1dGgtY2hhbmdlcy10by1vcHRpb25zLmgucGF0Y2gKaW5kZXggOWMxZGQzZjYwNi4uYTZmOWNm
NDIzMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAw
MS11cmFuZG9tLXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5oLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDEtdXJhbmRvbS14YXV0aC1jaGFuZ2VzLXRv
LW9wdGlvbnMuaC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gY2RjNmE0YTU3YTg2ZDgxMTZh
OTJhNWQ5MDU5OTNlNjVjZjcyMzU1NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDZj
N2NlOTg3ZmM5NTIyYjIzM2FlYTQxYmVmM2EzOTI4NjhhZmUxNyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkQG9wZW5lZGhhbmQuY29tPgogRGF0
ZTogV2VkLCAzMSBBdWcgMjAwNSAxMDo0NTo0NyArMDAwMAogU3ViamVjdDogW1BBVENIXSB1cmFu
ZG9tLXhhdXRoLWNoYW5nZXMtdG8tb3B0aW9ucy5oCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA1LWRyb3BiZWFyLWVuYWJsZS1wYW0ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA1LWRyb3BiZWFyLWVuYWJsZS1w
YW0ucGF0Y2gKaW5kZXggNjc0M2Y1MDZlOS4uZmFiNWIwOTMyOCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvMDAwNS1kcm9wYmVhci1lbmFibGUtcGFtLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDUtZHJvcGJl
YXItZW5hYmxlLXBhbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjUzY2EwMWYwZmM1MGRi
YWViMmZmOGJjZWNlMGMzNDI1NmViYTk0ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ODllOWRlMDNhODg0Njg5ZjdmMDJjMmYyNzVmYTk4MzUxMmM4MzAwOCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5jb20+
CiBEYXRlOiBXZWQsIDIgRGVjIDIwMTUgMTE6MzY6MDIgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0g
RW5hYmxlIHBhbQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJl
YXIvMDAwNi1kcm9wYmVhci1jb25maWd1cmF0aW9uLWZpbGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5w
YXRjaAppbmRleCA0NDg2MTA4OGNjLi5mYTBmNmI4ZjVjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmls
ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci8wMDA2LWRy
b3BiZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTZi
MTQ3Zjk3ZjA5MzhjZGRiNTVlYzFjOTBiYzkxOWMxM2YyNmZjMCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gODRjOTNhMGUxYjg0NTg4YTJlMDY0YjhlNGYxZGU5MDI2ODBhYWMwZiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdsaSBZdSA8TWluZ2xpLll1QHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBUaHUsIDYgU2VwIDIwMTggMTU6NTQ6MDAgKzA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gZHJvcGJlYXIgY29uZmlndXJhdGlvbiBmaWxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci9kcm9wYmVhci1kaXNhYmxlLXdlYWstY2lwaGVycy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyL2Ryb3BiZWFyLWRpc2Fi
bGUtd2Vhay1jaXBoZXJzLnBhdGNoCmluZGV4IGEyMDc4MWQzMWQuLjM5ZTg1ZDg2M2UgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyL2Ryb3BiZWFyLWRpc2Fi
bGUtd2Vhay1jaXBoZXJzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ry
b3BiZWFyL2Ryb3BiZWFyLWRpc2FibGUtd2Vhay1jaXBoZXJzLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBjOGEwYzhlODdiNzcyNTc2ZjNhNDMxYzNiNGNhY2FmNWFhMDAxZGNjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4ZjBhNTkwNGRjMjRjNmU5NWMxZGJlZTczNTAyYWE4M2Yz
M2U4Yzg3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9zZXBoIFJleW5vbGRzIDxq
b3NlcGgucmV5bm9sZHMxQGlibS5jb20+CiBEYXRlOiBUaHUsIDIwIEp1biAyMDE5IDE2OjI5OjE1
IC0wNTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRyb3BiZWFyOiBuZXcgZmVhdHVyZTogZGlzYWJsZS13
ZWFrLWNpcGhlcnMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3Bi
ZWFyXzIwMjQuODUuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI0
Ljg2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3Jl
L2Ryb3BiZWFyL2Ryb3BiZWFyXzIwMjQuODUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3Jl
L2Ryb3BiZWFyL2Ryb3BiZWFyXzIwMjQuODYuYmIKaW5kZXggNTQwMDE0MTRkMC4uZTNmNGQxNzg5
NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXJfMjAyNC44
NS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhcl8yMDI0Ljg2LmJi
CkBAIC0yMyw3ICsyMyw3IEBAIFNSQ19VUkkgPSAiaHR0cDovL21hdHQudWNjLmFzbi5hdS9kcm9w
YmVhci9yZWxlYXNlcy9kcm9wYmVhci0ke1BWfS50YXIuYnoyIFwKICAgICAgICAgICAgJHtAYmIu
dXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAnZGlzYWJsZS13ZWFrLWNpcGhlcnMnLCAn
ZmlsZTovL2Ryb3BiZWFyLWRpc2FibGUtd2Vhay1jaXBoZXJzLnBhdGNoJywgJycsIGQpfSBcCiAg
ICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg2YjAzNmM0MzNhNjlkODljZTUx
ZWJhZTMzNWQ2NWM0NzczOGNjZjkwZDEzZTVlYjBmZWE4MzJlNTU2ZGE1MDIiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiZTc4OTM2ZGZmYzM5NWYyZTBkYjA5OTMyMWQ2YmU2NTkxOTA5NjZiOTk3MTJi
NTVjNTMwZGQwYTE4MjJlMGE1ZSIKIAogUEFNX1NSQ19VUkkgPSAiZmlsZTovLzAwMDUtZHJvcGJl
YXItZW5hYmxlLXBhbS5wYXRjaCBcCiAgICAgICAgICAgICAgICBmaWxlOi8vMDAwNi1kcm9wYmVh
ci1jb25maWd1cmF0aW9uLWZpbGUucGF0Y2ggXAotLSAKMi40NC4xCgo=

--===============5846138680819815101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1881 targets, 52 skipped, 0 masked, 0 errors.
Removing 13 recipes from the core2-64 sysroot...done.
Removing 22 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b1f63d1c1c9861f2a509f53e5b86602f9932c390"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 238 Local 223 Mirrors 0 Missed 15 Current 196 (93% match, 96% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 205 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_populate_lic_setscene)
NOTE: Running setscene task 209 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 210 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 214 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 216 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 221 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 222 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 224 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dropbear-2024.86-r0: task do_populate_lic_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dropbear-2024.86-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 769 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_recipe_qa)
NOTE: Running setscene task 289 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 293 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 295 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 296 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe dropbear-2024.86-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 299 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 310 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 318 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 319 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe dropbear-2024.86-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 323 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running task 811 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dropbear-2024.86-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/base-passwd/3.6.4/temp/log.do_packagedata_setscene.1711100
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 332 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_setscene)
NOTE: recipe dropbear-2024.86-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 843 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe dropbear-2024.86-r0: task do_unpack: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 348 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 357 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dropbear-2024.86-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 932 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 371 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package_setscene)
NOTE: recipe dropbear-2024.86-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_package_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 374 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 377 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_package_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dropbear-2024.86-r0: task do_patch: Succeeded
NOTE: Running task 938 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dropbear-2024.86-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dropbear-2024.86-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_deploy_source_date_epoch unihash changed to 2931ba515aa78d258ab60b97ac76f3428beb2b7505d32b9d5b482f38d3e1cba5
NOTE: recipe libpam-1.6.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 378 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 381 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 383 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 396 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 397 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 403 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 404 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 409 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 423 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 425 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 426 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1180 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1216 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata)
NOTE: Running task 1232 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_collect_spdx_deps)
NOTE: recipe dropbear-2024.86-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata: Started
NOTE: recipe dropbear-2024.86-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1235 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package_write_ipk)
NOTE: Running task 1236 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package_write_deb)
NOTE: recipe dropbear-2024.86-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dropbear-2024.86-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1237 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package_write_rpm)
NOTE: Running task 1238 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_configure)
NOTE: Running task 1239 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package_qa)
NOTE: recipe libpam-1.6.1-r0: task do_package_write_ipk: Started
NOTE: recipe libpam-1.6.1-r0: task do_package_write_deb: Started
NOTE: recipe libpam-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe libpam-1.6.1-r0: task do_package_qa: Started
NOTE: recipe dropbear-2024.86-r0: task do_configure: Started
NOTE: recipe libpam-1.6.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_package_qa: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe dropbear-2024.86-r0: task do_configure: Succeeded
NOTE: Running task 1240 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_compile)
NOTE: recipe dropbear-2024.86-r0: task do_compile: Started
NOTE: recipe libpam-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dropbear-2024.86-r0: task do_compile: Succeeded
NOTE: Running task 1241 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_install)
NOTE: recipe dropbear-2024.86-r0: task do_install: Started
NOTE: recipe dropbear-2024.86-r0: task do_install: Succeeded
NOTE: Running task 1242 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_package)
NOTE: Running task 1243 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_populate_sysroot)
NOTE: recipe dropbear-2024.86-r0: task do_populate_sysroot: Started
NOTE: recipe dropbear-2024.86-r0: task do_package: Started
NOTE: recipe dropbear-2024.86-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dropbear-2024.86-r0: task do_package: Succeeded
NOTE: Running task 1244 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_packagedata)
NOTE: recipe dropbear-2024.86-r0: task do_packagedata: Started
NOTE: recipe dropbear-2024.86-r0: task do_packagedata: Succeeded
NOTE: Running task 1245 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_create_spdx)
NOTE: Running task 1246 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_package_write_ipk)
NOTE: Running task 1247 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_package_write_deb)
NOTE: Running task 1248 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_package_write_rpm)
NOTE: Running task 1249 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_package_qa)
NOTE: recipe dropbear-2024.86-r0: task do_create_spdx: Started
NOTE: recipe dropbear-2024.86-r0: task do_package_write_ipk: Started
NOTE: recipe dropbear-2024.86-r0: task do_package_write_deb: Started
NOTE: recipe dropbear-2024.86-r0: task do_package_write_rpm: Started
NOTE: recipe dropbear-2024.86-r0: task do_package_qa: Started
NOTE: recipe dropbear-2024.86-r0: task do_create_spdx: Succeeded
NOTE: Running task 1250 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_create_package_spdx)
NOTE: recipe dropbear-2024.86-r0: task do_create_package_spdx: Started
NOTE: recipe dropbear-2024.86-r0: task do_package_write_ipk: Succeeded
NOTE: recipe dropbear-2024.86-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_package_qa unihash changed to 3df5554086057322a860d7b3becad405fd6e421618bd5fbfda9c49ddb2f49b35
NOTE: recipe dropbear-2024.86-r0: task do_create_package_spdx: Succeeded
NOTE: recipe dropbear-2024.86-r0: task do_package_write_deb: Succeeded
NOTE: recipe dropbear-2024.86-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1251 of 1251 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dropbear/dropbear_2024.86.bb:do_build)
NOTE: Tasks Summary: Attempted 1251 tasks of which 1226 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: base-passwd-3.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-src went backwards which would break package feeds (from 0:3.6.5-r0 to 0:3.6.4-r0) [version-going-backwards]
ERROR: base-passwd-3.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-dbg went backwards which would break package feeds (from 0:3.6.5-r0 to 0:3.6.4-r0) [version-going-backwards]
ERROR: base-passwd-3.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-update went backwards which would break package feeds (from 0:3.6.5-r0 to 0:3.6.4-r0) [version-going-backwards]
ERROR: base-passwd-3.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-staticdev went backwards which would break package feeds (from 0:3.6.5-r0 to 0:3.6.4-r0) [version-going-backwards]
ERROR: base-passwd-3.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-dev went backwards which would break package feeds (from 0:3.6.5-r0 to 0:3.6.4-r0) [version-going-backwards]
ERROR: base-passwd-3.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-doc went backwards which would break package feeds (from 0:3.6.5-r0 to 0:3.6.4-r0) [version-going-backwards]
ERROR: base-passwd-3.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-locale went backwards which would break package feeds (from 0:3.6.5-r0 to 0:3.6.4-r0) [version-going-backwards]
ERROR: base-passwd-3.6.4-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd went backwards which would break package feeds (from 0:3.6.5-r0 to 0:3.6.4-r0) [version-going-backwards]
ERROR: base-passwd-3.6.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5846138680819815101==--

