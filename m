Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA169C54EE6
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:39 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20324.1708018344476467899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TZ87Z0Bs;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nMPxw2vh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018dadd3a13f-eae783e7-a0ef-42ee-9dc7-305b22f8d2fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0RZZnHlAnaM6Z1uDRVC3WCeGbhAWZ/xVhXW6jl6uDWE=;
	b=TZ87Z0BsDHiT4JRc8G/rRPkdlMh3BKdFzKfGrRGR29Tm7KS/hhqg1wLQx/chlNM+
	qv9iCceOyVbtrB9tKWMipj9CcgaA/gRnfS4Y/86DuIikOgaLE0l1HVbb1xEn6BxS63N
	MhdAz4uGSaFYHn7g2hefue9spVOd4xY37GhY2aH4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0RZZnHlAnaM6Z1uDRVC3WCeGbhAWZ/xVhXW6jl6uDWE=;
	b=nMPxw2vhHfC7XREHlClbtGZqfPo0b+jacuAy3cU2JbdvQqo9ePHe80FKDcuH7qF+
	X1QIVbYMcO3EYeA0tnnQZPGEFPwKIG0tEqpSz9WfWzvtMLmMn7nXrnWz5NDmVdmC8cs
	YQzD0Gvwmv8UD247/HXO0YBT5UpHiQFbfUCeOnCw=
Content-Type: multipart/mixed; boundary="===============8867931617966041618=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.3.2 SUCCEEDED
Message-ID: <0101018dadd3a13f-eae783e7-a0ef-42ee-9dc7-305b22f8d2fc-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195575

--===============8867931617966041618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *1.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.3.1-1.3.2.patch
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
From 940103ec9fff34b8dcd010e5005eb637b7b7b276 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 07:46:31 +0000
Subject: [PATCH] meson: upgrade 1.3.1 -> 1.3.2

---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch       | 2 +-
 ...1-python-module-do-not-manipulate-the-environment-when.patch | 2 +-
 .../meson/0002-Support-building-allarch-recipes-again.patch     | 2 +-
 meta/recipes-devtools/meson/{meson_1.3.1.bb => meson_1.3.2.bb}  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.3.1.bb => meson_1.3.2.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 8ea7c35950..24b2831f33 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From b77cbe67df5fa0998946503f207c256ee740bb5f Mon Sep 17 00:00:00 2001
+From 5ff1b47c36984eb8ee90b790306fb59705353782 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index 2e0a4b1bbe..0116217605 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From e85683698aa3556bf14fc6d35f2c067f16af520b Mon Sep 17 00:00:00 2001
+From 3c29e08bf8bde06a350148ac88637b2f3cdaf86d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index a8396f30bb..665d46d4f0 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 6fb8db54929b40e1fd7ac949ef44f0d37df0bae9 Mon Sep 17 00:00:00 2001
+From eb04c466340465b4b86f29fef2cdc7b813e8bafa Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_1.3.1.bb b/meta/recipes-devtools/meson/meson_1.3.2.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.3.1.bb
rename to meta/recipes-devtools/meson/meson_1.3.2.bb
index 3a4bb14f09..98b600996c 100644
--- a/meta/recipes-devtools/meson/meson_1.3.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.3.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "6020568bdede1643d4fb41e28215be38eff5d52da28ac7d125457c59e0032ad7"
+SRC_URI[sha256sum] = "492eb450c8b073024276f916f5adbb3c4bb7e90e9e6ec124efda064f3d9b5baa"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.42.0


--===============8867931617966041618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/meson: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.3.1/meson-1.3.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.3.2/meson-1.3.2.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-64-poky-linux/meson: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/meson/meson-dbg: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/meson/meson-dbg: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/meson/meson-dev: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/meson/meson-dev: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/meson/meson-doc: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/meson/meson-doc: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/meson/meson-locale: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/meson/meson-locale: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/meson/meson-src: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/meson/meson-src: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/meson/meson-staticdev: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/meson/meson-staticdev: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/meson/meson: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/meson/meson: PV changed from "1.3.1" to "1.3.2"
packages/core2-64-poky-linux/meson/meson: PKGSIZE changed from 7993826 to 8000797 (+0%)
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.12/site-packages/meson-1.3.1.dist-info moved to /usr/lib/python3.12/site-packages/meson-1.3.2.dist-info

--===============8867931617966041618==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.3.1-1.3.2.patch"

RnJvbSA5NDAxMDNlYzlmZmYzNGI4ZGNkMDEwZTUwMDVlYjYzN2I3YjdiMjc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDc6NDY6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNvbjogdXBncmFkZSAxLjMuMSAtPiAxLjMuMgoKLS0tCiAuLi4vbWVzb24vbWVzb24vMDAwMS1N
YWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2ggICAgICAgfCAyICstCiAuLi4xLXB5
dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2gg
fCAyICstCiAuLi4vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1h
Z2Fpbi5wYXRjaCAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24ve21lc29u
XzEuMy4xLmJiID0+IG1lc29uXzEuMy4yLmJifSAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbWVzb24ve21lc29uXzEuMy4xLmJiID0+IG1lc29uXzEuMy4yLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZh
bWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9t
ZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaAppbmRleCA4ZWE3
YzM1OTUwLi4yNGIyODMxZjMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVz
b24vbWVzb24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdh
cm5pbmdzLWZhdGFsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiNzdjYmU2N2RmNWZhMDk5
ODk0NjUwM2YyMDdjMjU2ZWU3NDBiYjVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1
ZmYxYjQ3YzM2OTg0ZWI4ZWU5MGI3OTAzMDZmYjU5NzA1MzUzNzgyIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6
IFR1ZSwgMyBKdWwgMjAxOCAxMzo1OTowOSArMDEwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIENQ
VSBmYW1pbHkgd2FybmluZ3MgZmF0YWwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tZXNvbi9tZXNvbi8wMDAxLXB5dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVu
dmlyb25tZW50LXdoZW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24v
MDAwMS1weXRob24tbW9kdWxlLWRvLW5vdC1tYW5pcHVsYXRlLXRoZS1lbnZpcm9ubWVudC13aGVu
LnBhdGNoCmluZGV4IDJlMGE0YjFiYmUuLjAxMTYyMTc2MDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLXB5dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlw
dWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21lc29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1bGF0ZS10aGUt
ZW52aXJvbm1lbnQtd2hlbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTg1NjgzNjk4YWEz
NTU2YmYxNGZjNmQzNWYyYzA2N2YxNmFmNTIwYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gM2MyOWUwOGJmOGJkZTA2YTM1MDE0OGFjODg2MzdiMmYzY2RhZjg2ZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwu
Y29tPgogRGF0ZTogTW9uLCAxOSBOb3YgMjAxOCAxNDoyNDoyNiArMDEwMAogU3ViamVjdDogW1BB
VENIXSBweXRob24gbW9kdWxlOiBkbyBub3QgbWFuaXB1bGF0ZSB0aGUgZW52aXJvbm1lbnQgd2hl
biBjYWxsaW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24v
MDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJj
aC1yZWNpcGVzLWFnYWluLnBhdGNoCmluZGV4IGE4Mzk2ZjMwYmIuLjY2NWQ0NmQ0ZjAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVp
bGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFn
YWluLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ZmI4ZGI1NDkyOWI0MGUxZmQ3YWM5NDll
ZjQ0ZjBkMzdkZjBiYWU5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlYjA0YzQ2NjM0
MDQ2NWI0Yjg2ZjI5ZmVmMmNkYzdiODEzZThiYWZhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwa2pAYXhpcy5jb20+CiBEYXRlOiBUaHUsIDI2IEp1
bCAyMDE4IDE2OjMyOjQ5ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFN1cHBvcnQgYnVpbGRpbmcg
YWxsYXJjaCByZWNpcGVzIGFnYWluCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bWVzb24vbWVzb25fMS4zLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25f
MS4zLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uXzEuMy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbWVzb24vbWVzb25fMS4zLjIuYmIKaW5kZXggM2E0YmIxNGYwOS4uOThiNjAwOTk2YyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuMy4xLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjMuMi5iYgpAQCAtMTUsNyArMTUs
NyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9tZXNvbi0k
e1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2Fy
bmluZ3MtZmF0YWwucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1TdXBwb3J0LWJ1aWxk
aW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI2MDIwNTY4YmRlZGUxNjQzZDRmYjQxZTI4MjE1YmUzOGVmZjVkNTJkYTI4
YWM3ZDEyNTQ1N2M1OWUwMDMyYWQ3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ5MmViNDUwYzhi
MDczMDI0Mjc2ZjkxNmY1YWRiYjNjNGJiN2U5MGU5ZTZlYzEyNGVmZGEwNjRmM2Q5YjViYWEiCiAK
IGluaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBnaXRodWItcmVsZWFzZXMKIAot
LSAKMi40Mi4wCgo=

--===============8867931617966041618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.12/site-packages/meson-1.3.1.dist-info moved to /usr/lib/python3.12/site-packages/meson-1.3.2.dist-info

--===============8867931617966041618==--

