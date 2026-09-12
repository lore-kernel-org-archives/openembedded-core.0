Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB05C88E5E
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 06:46:09 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1969.1789195560464376977
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 23:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=F2HPitck;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=r+jEC5Xk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a0945da34c-3ca5666d-b850-48fb-b627-1762eeb7419e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789195559;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=12duxkatGTzTMU7s5zdmfWuIE0ZD/wjqHEuEpBKUNJw=;
	b=F2HPitckaVa9MzGq3II9YRgRkxJBK/AorjuBpKG7O3yLA2SThFObRWRMwZZCdunt
	0m4EPwUTIaUvHZ2LhFYMizeKq31/xrNE1PSy/lDxoHl68ypxDl7kpMaapBxpWY3qphR
	LQLbnshRx3b+iUB9hoQUlspHyV8730H4MWyaH/Mk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789195559;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=12duxkatGTzTMU7s5zdmfWuIE0ZD/wjqHEuEpBKUNJw=;
	b=r+jEC5Xk9TuoJHKir4wYFn1rLUf5aX5TpIm4LcV0ZyvI1Uslp1eBj/UJSg+Aaa+3
	cjoWKeP6sLlmxyt609YMI/ZmkBECCVByi/4fKqi2NilDewfjsGsQO3m7AsQafcMq9Ni
	SHERKucNT3vugU0Deib4ERjbTI9p67edLjg6vsCw=
Content-Type: multipart/mixed; boundary="===============5553669808884486487=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2026.4 SUCCEEDED
Message-ID: <010101a0945da34c-3ca5666d-b850-48fb-b627-1762eeb7419e-000000@us-west-2.amazonses.com>
Date: Sat, 12 Sep 2026 06:45:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.12-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 06:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245688

--===============5553669808884486487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shaderc* to *2026.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2026.3-2026.4.patch
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
From cb00a33fa6078fda9706bb7ca96a19dc03f32fb5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 12 Sep 2026 06:28:13 +0000
Subject: [PATCH] shaderc: upgrade 2026.3 -> 2026.4

Source: CHANGES

v2026.4 2026-09-11
 - Use Glslang 16.6.0, SPIRV-Tools v2026.4.rc2
 - Incorporate fixes for SPV_KHR_abort abortEXT(...)
 - glslc:
     option -fshader-stage now accepts all shader
     stage names as allowed in #pragma shader_stage(<stage>)>
     This includes ray tracing, task, and mesh shader
     stages.
 - Fixes an assert
---
 .../0001-cmake-disable-building-external-dependencies.patch     | 2 +-
 .../shaderc/{shaderc_2026.3.bb => shaderc_2026.4.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2026.3.bb => shaderc_2026.4.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index bc324b5c0d..57fff1340e 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From b2d321b9c493a6e36203c50ad20adb655485c951 Mon Sep 17 00:00:00 2001
+From c7ebd558e5d62af7723ba804df4f0887ce7a83fd Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
diff --git a/meta/recipes-graphics/shaderc/shaderc_2026.3.bb b/meta/recipes-graphics/shaderc/shaderc_2026.4.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2026.3.bb
rename to meta/recipes-graphics/shaderc/shaderc_2026.4.bb
index d2a62a4cd4..5ff3a63086 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2026.3.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2026.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "82757e4f72af8518fb679604d352623450cb761f"
+SRCREV = "d393a813c9b67c709d37b329203d72beb69d719e"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            "
-- 
2.47.1


--===============5553669808884486487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="shaderc-changelog.txt"

Changelog for shaderc: 2026.3 -> 2026.4
Source: CHANGES

v2026.4 2026-09-11
 - Use Glslang 16.6.0, SPIRV-Tools v2026.4.rc2
 - Incorporate fixes for SPV_KHR_abort abortEXT(...)
 - glslc:
     option -fshader-stage now accepts all shader
     stage names as allowed in #pragma shader_stage(<stage>)>
     This includes ray tracing, task, and mesh shader
     stages.
 - Fixes an assert

--===============5553669808884486487==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2026.3-2026.4.patch"

RnJvbSBjYjAwYTMzZmE2MDc4ZmRhOTcwNmJiN2NhOTZhMTlkYzAzZjMyZmI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTIgU2VwIDIwMjYgMDY6Mjg6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkZXJjOiB1cGdyYWRlIDIwMjYuMyAtPiAyMDI2LjQKClNvdXJjZTogQ0hBTkdFUwoKdjIwMjYu
NCAyMDI2LTA5LTExCiAtIFVzZSBHbHNsYW5nIDE2LjYuMCwgU1BJUlYtVG9vbHMgdjIwMjYuNC5y
YzIKIC0gSW5jb3Jwb3JhdGUgZml4ZXMgZm9yIFNQVl9LSFJfYWJvcnQgYWJvcnRFWFQoLi4uKQog
LSBnbHNsYzoKICAgICBvcHRpb24gLWZzaGFkZXItc3RhZ2Ugbm93IGFjY2VwdHMgYWxsIHNoYWRl
cgogICAgIHN0YWdlIG5hbWVzIGFzIGFsbG93ZWQgaW4gI3ByYWdtYSBzaGFkZXJfc3RhZ2UoPHN0
YWdlPik+CiAgICAgVGhpcyBpbmNsdWRlcyByYXkgdHJhY2luZywgdGFzaywgYW5kIG1lc2ggc2hh
ZGVyCiAgICAgc3RhZ2VzLgogLSBGaXhlcyBhbiBhc3NlcnQKLS0tCiAuLi4vMDAwMS1jbWFrZS1k
aXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCAgICAgfCAyICstCiAu
Li4vc2hhZGVyYy97c2hhZGVyY18yMDI2LjMuYmIgPT4gc2hhZGVyY18yMDI2LjQuYmJ9ICAgICAg
ICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy97c2hhZGVyY18yMDI2
LjMuYmIgPT4gc2hhZGVyY18yMDI2LjQuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4
dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJj
L2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMu
cGF0Y2gKaW5kZXggYmMzMjRiNWMwZC4uNTdmZmYxMzQwZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4
dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hh
ZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5j
aWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiMmQzMjFiOWM0OTNhNmUzNjIwM2M1MGFk
MjBhZGI2NTU0ODVjOTUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjN2ViZDU1OGU1
ZDYyYWY3NzIzYmE4MDRkZjRmMDg4N2NlN2E4M2ZkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBTYXQs
IDEzIEZlYiAyMDIxIDAwOjQ1OjU2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNtYWtlOiBkaXNh
YmxlIGJ1aWxkaW5nIGV4dGVybmFsIGRlcGVuZGVuY2llcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI2LjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjYuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjYuMy5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI2LjQuYmIK
aW5kZXggZDJhNjJhNGNkNC4uNWZmM2E2MzA4NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI2LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3NoYWRlcmMvc2hhZGVyY18yMDI2LjQuYmIKQEAgLTYsNyArNiw3IEBAIEhPTUVQQUdFID0g
Imh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUvc2hhZGVyYyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIu
MCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRj
OTQ3OWJkODk4Njk2OGY0MzI3IgogCi1TUkNSRVYgPSAiODI3NTdlNGY3MmFmODUxOGZiNjc5NjA0
ZDM1MjYyMzQ1MGNiNzYxZiIKK1NSQ1JFViA9ICJkMzkzYTgxM2M5YjY3YzcwOWQzN2IzMjkyMDNk
NzJiZWI2OWQ3MTllIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2dvb2dsZS9zaGFkZXJj
LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9diR7UFZ9IFwKICAgICAgICAgICAg
ZmlsZTovLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMu
cGF0Y2ggXAogICAgICAgICAgICAiCi0tIAoyLjQ3LjEKCg==

--===============5553669808884486487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/shaderc: SRC_URI changed from "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2026.3 file://0001-cmake-disable-building-external-dependencies.patch" to "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2026.4 file://0001-cmake-disable-building-external-dependencies.patch"
packages/x86-64-v3-poky-linux/shaderc: PKGV changed from 2026.3 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/shaderc: PV changed from "2026.3" to "2026.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2026.3 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PKGSIZE changed from 5169728 to 5169864 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PV changed from "2026.3" to "2026.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PKGV changed from 2026.3 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PV changed from "2026.3" to "2026.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-doc: PKGV changed from 2026.3 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-doc: PV changed from "2026.3" to "2026.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-locale: PKGV changed from 2026.3 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-locale: PV changed from "2026.3" to "2026.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PKGV changed from 2026.3 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: FILELIST: directory renamed /usr/src/debug/shaderc/2026.3/glslc/src -> /usr/src/debug/shaderc/2026.4/glslc/src, directory renamed /usr/src/debug/shaderc/2026.3/libshaderc_util/src -> /usr/src/debug/shaderc/2026.4/libshaderc_util/src, directory renamed /usr/src/debug/shaderc/2026.3/libshaderc/src -> /usr/src/debug/shaderc/2026.4/libshaderc/src, directory renamed /usr/src/debug/shaderc/2026.3/libshaderc_util/include/libshaderc_util -> /usr/src/debug/shaderc/2026.4/libshaderc_util/include/libshaderc_util, directory renamed /usr/src/debug/shaderc/2026.3/libshaderc/include/shaderc -> /usr/src/debug/shaderc/2026.4/libshaderc/include/shaderc
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PKGSIZE changed from 328635 to 329114 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PV changed from "2026.3" to "2026.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2026.3 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3810066 to 3810098 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PV changed from "2026.3" to "2026.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc: PKGV changed from 2026.3 [default] to 2026.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc: PV changed from "2026.3" to "2026.4"

--===============5553669808884486487==--

