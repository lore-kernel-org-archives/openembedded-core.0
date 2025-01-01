Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A91E7719A
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:25 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.11331.1735723940740053248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=S2KHkc89;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=MOfTd/PW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010194213578e9-aeef617c-1cbb-4998-8630-70e27d10ae20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723940;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Fvi83Vw+LJKIKKNm8FcOZ33xD4rnqKj0hF0lV7pOPjI=;
	b=S2KHkc89DkZdtiVlTTapPpM6YI0XdZyq7jK9V6sv3ODIxZSJuPB8Mg5Lac/U3OZy
	3uznL1k85f+rIXhYiXHO07ZMkfJwh/etXjcLg6fNg2UqBAC4awmObmlkWKzZh9aHLOH
	teAHBzi8j/5YBbaN+LqGIeqYpXmhFmW7WdVJNkaA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723940;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Fvi83Vw+LJKIKKNm8FcOZ33xD4rnqKj0hF0lV7pOPjI=;
	b=MOfTd/PWE4JL9ObLOBxqoDQNo01mwX+ijDJ6NpJ7AkKg3Ys0cgw3iPmtID78FOq4
	dTvbEIiyIO4KEH9ge1IRoCWPidtWTl6zB0Kd5lcIFOEwcIjfW8ncz0rOWUz8zsxCt+p
	G49XPNabj9HKl7MkyoN3XQbvcswxIsTwe/k1G/LQ=
Content-Type: multipart/mixed; boundary="===============3407018448564615770=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] base-passwd: upgrading to 3.6.6 SUCCEEDED
Message-ID: <01010194213578e9-aeef617c-1cbb-4998-8630-70e27d10ae20-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209200

--===============3407018448564615770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *base-passwd* to *3.6.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-base-passwd-upgrade-3.6.5-3.6.6.patch
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
From 784b5e5c9d01c17d6bca7b345ca7b37ecac5450d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 06:39:41 +0000
Subject: [PATCH] base-passwd: upgrade 3.6.5 -> 3.6.6

---
 .../base-passwd/base-passwd/0001-Add-a-shutdown-group.patch     | 2 +-
 .../base-passwd/0001-base-passwd-Add-the-sgx-group.patch        | 2 +-
 .../0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch | 2 +-
 ...003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch | 2 +-
 .../0004-Add-an-input-group-for-the-dev-input-devices.patch     | 2 +-
 .../base-passwd/base-passwd/0005-Add-kvm-group.patch            | 2 +-
 .../base-passwd/base-passwd/0007-Add-wheel-group.patch          | 2 +-
 .../base-passwd/{base-passwd_3.6.5.bb => base-passwd_3.6.6.bb}  | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.5.bb => base-passwd_3.6.6.bb} (98%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
index 60e755fd9a..1cdf993f53 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
@@ -1,4 +1,4 @@
-From 03150b2575c5ec1ba30726d30d47303627e6fc60 Mon Sep 17 00:00:00 2001
+From 6bbd3d01d123b042167aa6dea30b5e8d9d4de4dc Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Add a shutdown group
diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
index 41dfc27178..54b96c877b 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
@@ -1,4 +1,4 @@
-From 6ad8995014cc30c932a8b4dae066c56ae33a107f Mon Sep 17 00:00:00 2001
+From dbd66c0ab1fd134ecba2eb1c040445e20d92f79a Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alexk@zuma.ai>
 Date: Fri, 28 Jul 2023 10:28:57 +0100
 Subject: [PATCH] base-passwd: Add the sgx group
diff --git a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
index 61b3ed38d7..47712c4f0f 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
@@ -1,4 +1,4 @@
-From 54bb95b9c4532f9cbe634dd43798ce37c93d6f50 Mon Sep 17 00:00:00 2001
+From e2e6880587d4ada13e815bf132f21b42a979a607 Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Use /bin/sh instead of /bin/bash for the root user
diff --git a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
index 6b13d4c967..9396d13460 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
@@ -1,4 +1,4 @@
-From 03406451d66a9d561d6e32a181248e5a0bd58d58 Mon Sep 17 00:00:00 2001
+From 022cf6956c647cc193fce2b0ccdf1308d3e208cd Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Fri, 29 Apr 2022 13:32:28 +0000
 Subject: [PATCH] Remove "*" for root since we do not have an /etc/shadow
diff --git a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
index 85739d5b47..85f40a9829 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
@@ -1,4 +1,4 @@
-From 662da5251f3f9634c583eeccc8242a05393d37be Mon Sep 17 00:00:00 2001
+From ef6d3257ca8308feeff40272a18e87ca7e2dc81b Mon Sep 17 00:00:00 2001
 From: Darren Hart <dvhart@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:28 +0000
 Subject: [PATCH] Add an input group for the /dev/input/* devices
diff --git a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
index 65a9ef53a3..7264c29c82 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
@@ -1,4 +1,4 @@
-From c6e5c31cd276f69a4db479188efb3ab3e0f35dd8 Mon Sep 17 00:00:00 2001
+From 6c81c51ee49427175cc8bcb09b236677be4c0815 Mon Sep 17 00:00:00 2001
 From: Jacob Kroon <jacob.kroon@gmail.com>
 Date: Wed, 30 Jan 2019 04:53:48 +0000
 Subject: [PATCH] Add kvm group
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
index a4d2dd875b..d3b1b12246 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
@@ -1,4 +1,4 @@
-From fc9790b768971d5b9e9b6d215bc29885a646c335 Mon Sep 17 00:00:00 2001
+From 00b7725977043c628129560dd8ca798c0ecb8791 Mon Sep 17 00:00:00 2001
 From: Louis Rannou <lrannou@baylibre.com>
 Date: Thu, 15 Jun 2023 13:43:55 +0200
 Subject: [PATCH] base-passwd: add the wheel group
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb
similarity index 98%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.5.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.6.bb
index 47c15e5541..cc5c905503 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "bd30ab67b1f8029d3e70d3419e5033fb4595ab91c91307c3b7c00978e8d111b2"
+SRC_URI[sha256sum] = "cfcb17a5cfb5d7ce53f062b2a30c74ac7f9425af81010d3591aeffc60f269263"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.44.1


--===============3407018448564615770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/base-passwd/base-passwd-dbg: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-dbg: PV changed from "3.6.5" to "3.6.6"
packages/core2-64-poky-linux/base-passwd/base-passwd-dev: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-dev: PV changed from "3.6.5" to "3.6.6"
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PKGSIZE changed from 19940 to 19982 (+0%)
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PV changed from "3.6.5" to "3.6.6"
packages/core2-64-poky-linux/base-passwd/base-passwd-locale: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-locale: PV changed from "3.6.5" to "3.6.6"
packages/core2-64-poky-linux/base-passwd/base-passwd-src: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-src: PV changed from "3.6.5" to "3.6.6"
packages/core2-64-poky-linux/base-passwd/base-passwd-staticdev: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-staticdev: PV changed from "3.6.5" to "3.6.6"
packages/core2-64-poky-linux/base-passwd/base-passwd-update: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-update: PV changed from "3.6.5" to "3.6.6"
packages/core2-64-poky-linux/base-passwd/base-passwd: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd: PV changed from "3.6.5" to "3.6.6"
packages/core2-64-poky-linux/base-passwd: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/core2-64-poky-linux/base-passwd: PV changed from "3.6.5" to "3.6.6"
packages/core2-64-poky-linux/base-passwd: SRC_URI changed from "https://launchpad.net/debian/+archive/primary/+files/base-passwd_3.6.5.tar.xz file://0001-Add-a-shutdown-group.patch file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch file://0004-Add-an-input-group-for-the-dev-input-devices.patch file://0005-Add-kvm-group.patch file://0007-Add-wheel-group.patch file://0001-base-passwd-Add-the-sgx-group.patch" to "https://launchpad.net/debian/+archive/primary/+files/base-passwd_3.6.6.tar.xz file://0001-Add-a-shutdown-group.patch file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch file://0004-Add-an-input-group-for-the-dev-input-devices.patch file://0005-Add-kvm-group.patch file://0007-Add-wheel-group.patch file://0001-base-passwd-Add-the-sgx-group.patch"

--===============3407018448564615770==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-base-passwd-upgrade-3.6.5-3.6.6.patch"

RnJvbSA3ODRiNWU1YzlkMDFjMTdkNmJjYTdiMzQ1Y2E3YjM3ZWNhYzU0NTBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwNjozOTo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
c2UtcGFzc3dkOiB1cGdyYWRlIDMuNi41IC0+IDMuNi42CgotLS0KIC4uLi9iYXNlLXBhc3N3ZC9i
YXNlLXBhc3N3ZC8wMDAxLUFkZC1hLXNodXRkb3duLWdyb3VwLnBhdGNoICAgICB8IDIgKy0KIC4u
Li9iYXNlLXBhc3N3ZC8wMDAxLWJhc2UtcGFzc3dkLUFkZC10aGUtc2d4LWdyb3VwLnBhdGNoICAg
ICAgICB8IDIgKy0KIC4uLi8wMDAyLVVzZS1iaW4tc2gtaW5zdGVhZC1vZi1iaW4tYmFzaC1mb3It
dGhlLXJvb3QtdXNlci5wYXRjaCB8IDIgKy0KIC4uLjAwMy1SZW1vdmUtZm9yLXJvb3Qtc2luY2Ut
d2UtZG8tbm90LWhhdmUtYW4tZXRjLXNoYWRvdy5wYXRjaCB8IDIgKy0KIC4uLi8wMDA0LUFkZC1h
bi1pbnB1dC1ncm91cC1mb3ItdGhlLWRldi1pbnB1dC1kZXZpY2VzLnBhdGNoICAgICB8IDIgKy0K
IC4uLi9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDA1LUFkZC1rdm0tZ3JvdXAucGF0Y2ggICAg
ICAgICAgICB8IDIgKy0KIC4uLi9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDA3LUFkZC13aGVl
bC1ncm91cC5wYXRjaCAgICAgICAgICB8IDIgKy0KIC4uLi9iYXNlLXBhc3N3ZC97YmFzZS1wYXNz
d2RfMy42LjUuYmIgPT4gYmFzZS1wYXNzd2RfMy42LjYuYmJ9ICB8IDIgKy0KIDggZmlsZXMgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1jb3JlL2Jhc2UtcGFzc3dkL3tiYXNlLXBhc3N3ZF8zLjYuNS5iYiA9PiBiYXNlLXBhc3N3ZF8z
LjYuNi5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3
ZC9iYXNlLXBhc3N3ZC8wMDAxLUFkZC1hLXNodXRkb3duLWdyb3VwLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwMS1BZGQtYS1zaHV0ZG93bi1ncm91
cC5wYXRjaAppbmRleCA2MGU3NTVmZDlhLi4xY2RmOTkzZjUzIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDAxLUFkZC1hLXNodXRkb3duLWdy
b3VwLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dk
LzAwMDEtQWRkLWEtc2h1dGRvd24tZ3JvdXAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDAz
MTUwYjI1NzVjNWVjMWJhMzA3MjZkMzBkNDczMDM2MjdlNmZjNjAgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDZiYmQzZDAxZDEyM2IwNDIxNjdhYTZkZWEzMGI1ZThkOWQ0ZGU0ZGMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBTYXVsIFdvbGQgPHNnd0BsaW51eC5pbnRlbC5j
b20+CiBEYXRlOiBGcmksIDI5IEFwciAyMDIyIDEzOjMyOjI3ICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIEFkZCBhIHNodXRkb3duIGdyb3VwCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9i
YXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDAxLWJhc2UtcGFzc3dkLUFkZC10aGUtc2d4LWdyb3Vw
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwMS1i
YXNlLXBhc3N3ZC1BZGQtdGhlLXNneC1ncm91cC5wYXRjaAppbmRleCA0MWRmYzI3MTc4Li41NGI5
NmM4NzdiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBh
c3N3ZC8wMDAxLWJhc2UtcGFzc3dkLUFkZC10aGUtc2d4LWdyb3VwLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDEtYmFzZS1wYXNzd2QtQWRk
LXRoZS1zZ3gtZ3JvdXAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDZhZDg5OTUwMTRjYzMw
YzkzMmE4YjRkYWUwNjZjNTZhZTMzYTEwN2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGRiZDY2YzBhYjFmZDEzNGVjYmEyZWIxYzA0MDQ0NWUyMGQ5MmY3OWEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4IEtpZXJuYW4gPGFsZXhrQHp1bWEuYWk+CiBEYXRlOiBGcmks
IDI4IEp1bCAyMDIzIDEwOjI4OjU3ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJhc2UtcGFzc3dk
OiBBZGQgdGhlIHNneCBncm91cApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1w
YXNzd2QvYmFzZS1wYXNzd2QvMDAwMi1Vc2UtYmluLXNoLWluc3RlYWQtb2YtYmluLWJhc2gtZm9y
LXRoZS1yb290LXVzZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNl
LXBhc3N3ZC8wMDAyLVVzZS1iaW4tc2gtaW5zdGVhZC1vZi1iaW4tYmFzaC1mb3ItdGhlLXJvb3Qt
dXNlci5wYXRjaAppbmRleCA2MWIzZWQzOGQ3Li40NzcxMmM0ZjBmIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDAyLVVzZS1iaW4tc2gtaW5z
dGVhZC1vZi1iaW4tYmFzaC1mb3ItdGhlLXJvb3QtdXNlci5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDAyLVVzZS1iaW4tc2gtaW5zdGVhZC1v
Zi1iaW4tYmFzaC1mb3ItdGhlLXJvb3QtdXNlci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
NTRiYjk1YjljNDUzMmY5Y2JlNjM0ZGQ0Mzc5OGNlMzdjOTNkNmY1MCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZTJlNjg4MDU4N2Q0YWRhMTNlODE1YmYxMzJmMjFiNDJhOTc5YTYwNyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFNjb3R0IEdhcm1hbiA8c2NvdHQuYS5nYXJt
YW5AaW50ZWwuY29tPgogRGF0ZTogRnJpLCAyOSBBcHIgMjAyMiAxMzozMjoyNyArMDAwMAogU3Vi
amVjdDogW1BBVENIXSBVc2UgL2Jpbi9zaCBpbnN0ZWFkIG9mIC9iaW4vYmFzaCBmb3IgdGhlIHJv
b3QgdXNlcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1w
YXNzd2QvMDAwMy1SZW1vdmUtZm9yLXJvb3Qtc2luY2Utd2UtZG8tbm90LWhhdmUtYW4tZXRjLXNo
YWRvdy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAw
MDMtUmVtb3ZlLWZvci1yb290LXNpbmNlLXdlLWRvLW5vdC1oYXZlLWFuLWV0Yy1zaGFkb3cucGF0
Y2gKaW5kZXggNmIxM2Q0Yzk2Ny4uOTM5NmQxMzQ2MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwMy1SZW1vdmUtZm9yLXJvb3Qtc2luY2Ut
d2UtZG8tbm90LWhhdmUtYW4tZXRjLXNoYWRvdy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDAzLVJlbW92ZS1mb3Itcm9vdC1zaW5jZS13ZS1k
by1ub3QtaGF2ZS1hbi1ldGMtc2hhZG93LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMzQw
NjQ1MWQ2NmE5ZDU2MWQ2ZTMyYTE4MTI0OGU1YTBiZDU4ZDU4IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAwMjJjZjY5NTZjNjQ3Y2MxOTNmY2UyYjBjY2RmMTMwOGQzZTIwOGNkIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogU2NvdHQgR2FybWFuIDxzY290dC5hLmdhcm1hbkBp
bnRlbC5jb20+CiBEYXRlOiBGcmksIDI5IEFwciAyMDIyIDEzOjMyOjI4ICswMDAwCiBTdWJqZWN0
OiBbUEFUQ0hdIFJlbW92ZSAiKiIgZm9yIHJvb3Qgc2luY2Ugd2UgZG8gbm90IGhhdmUgYW4gL2V0
Yy9zaGFkb3cKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2Ut
cGFzc3dkLzAwMDQtQWRkLWFuLWlucHV0LWdyb3VwLWZvci10aGUtZGV2LWlucHV0LWRldmljZXMu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDA0LUFk
ZC1hbi1pbnB1dC1ncm91cC1mb3ItdGhlLWRldi1pbnB1dC1kZXZpY2VzLnBhdGNoCmluZGV4IDg1
NzM5ZDViNDcuLjg1ZjQwYTk4MjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2Ut
cGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDQtQWRkLWFuLWlucHV0LWdyb3VwLWZvci10aGUtZGV2LWlu
cHV0LWRldmljZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFz
ZS1wYXNzd2QvMDAwNC1BZGQtYW4taW5wdXQtZ3JvdXAtZm9yLXRoZS1kZXYtaW5wdXQtZGV2aWNl
cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjYyZGE1MjUxZjNmOTYzNGM1ODNlZWNjYzgy
NDJhMDUzOTNkMzdiZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZWY2ZDMyNTdjYTgz
MDhmZWVmZjQwMjcyYTE4ZTg3Y2E3ZTJkYzgxYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IERhcnJlbiBIYXJ0IDxkdmhhcnRAbGludXguaW50ZWwuY29tPgogRGF0ZTogRnJpLCAyOSBB
cHIgMjAyMiAxMzozMjoyOCArMDAwMAogU3ViamVjdDogW1BBVENIXSBBZGQgYW4gaW5wdXQgZ3Jv
dXAgZm9yIHRoZSAvZGV2L2lucHV0LyogZGV2aWNlcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwNS1BZGQta3ZtLWdyb3VwLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwNS1BZGQta3ZtLWdy
b3VwLnBhdGNoCmluZGV4IDY1YTllZjUzYTMuLjcyNjRjMjljODIgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDUtQWRkLWt2bS1ncm91cC5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZC8wMDA1
LUFkZC1rdm0tZ3JvdXAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM2ZTVjMzFjZDI3NmY2
OWE0ZGI0NzkxODhlZmIzYWIzZTBmMzVkZDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDZjODFjNTFlZTQ5NDI3MTc1Y2M4YmNiMDliMjM2Njc3YmU0YzA4MTUgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBKYWNvYiBLcm9vbiA8amFjb2Iua3Jvb25AZ21haWwuY29tPgogRGF0
ZTogV2VkLCAzMCBKYW4gMjAxOSAwNDo1Mzo0OCArMDAwMAogU3ViamVjdDogW1BBVENIXSBBZGQg
a3ZtIGdyb3VwCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNl
LXBhc3N3ZC8wMDA3LUFkZC13aGVlbC1ncm91cC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2Jh
c2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDctQWRkLXdoZWVsLWdyb3VwLnBhdGNoCmluZGV4IGE0
ZDJkZDg3NWIuLmQzYjFiMTIyNDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2Ut
cGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDctQWRkLXdoZWVsLWdyb3VwLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDctQWRkLXdoZWVsLWdyb3Vw
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmYzk3OTBiNzY4OTcxZDViOWU5YjZkMjE1YmMy
OTg4NWE2NDZjMzM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMGI3NzI1OTc3MDQz
YzYyODEyOTU2MGRkOGNhNzk4YzBlY2I4NzkxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogTG91aXMgUmFubm91IDxscmFubm91QGJheWxpYnJlLmNvbT4KIERhdGU6IFRodSwgMTUgSnVu
IDIwMjMgMTM6NDM6NTUgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gYmFzZS1wYXNzd2Q6IGFkZCB0
aGUgd2hlZWwgZ3JvdXAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dk
L2Jhc2UtcGFzc3dkXzMuNi41LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFz
ZS1wYXNzd2RfMy42LjYuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1wYXNzd2RfMy42LjUuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkXzMuNi42LmJiCmluZGV4IDQ3
YzE1ZTU1NDEuLmNjNWM5MDU1MDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2Ut
cGFzc3dkL2Jhc2UtcGFzc3dkXzMuNi41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2Ut
cGFzc3dkL2Jhc2UtcGFzc3dkXzMuNi42LmJiCkBAIC0xNSw3ICsxNSw3IEBAIFNSQ19VUkkgPSAi
aHR0cHM6Ly9sYXVuY2hwYWQubmV0L2RlYmlhbi8rYXJjaGl2ZS9wcmltYXJ5LytmaWxlcy8ke0JQ
Tn1fJHtQVn0udGFyCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWJhc2UtcGFzc3dkLUFkZC10aGUt
c2d4LWdyb3VwLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YmQzMGFiNjdiMWY4MDI5ZDNlNzBkMzQxOWU1MDMzZmI0NTk1YWI5MWM5MTMwN2MzYjdjMDA5Nzhl
OGQxMTFiMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjZmNiMTdhNWNmYjVkN2NlNTNmMDYyYjJh
MzBjNzRhYzdmOTQyNWFmODEwMTBkMzU5MWFlZmZjNjBmMjY5MjYzIgogCiAjIHRoZSBwYWNrYWdl
IGlzIHRha2VuIGZyb20gbGF1bmNocGFkOyB0aGF0IHNvdXJjZSBpcyBzdGF0aWMgYW5kIGdvZXMg
c3RhbGUKICMgc28gd2UgY2hlY2sgdGhlIGxhdGVzdCB1cHN0cmVhbSBmcm9tIGEgZGlyZWN0b3J5
IHRoYXQgZG9lcyBnZXQgdXBkYXRlZAotLSAKMi40NC4xCgo=

--===============3407018448564615770==--

