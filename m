Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FCECAC5A2
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:47 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.30934.1757937285474475671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HwoioG1c;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pETUsIcI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101994d3a36fe-cc9ec0b7-8b50-4a50-aa2b-08aa540e0ff8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VKEs+wOfyhLYVxTo77bYl5W9kbN54tZwCSG13kL/H+w=;
	b=HwoioG1choXcGjzc7doz7hTKqwgC4rEuhg1gzWxVHUvAV0mlvrwSqeM4/hBDF3Ix
	FHNbrHtFUUj/N5dYoPrGAArheizEwwpuDCLyumGopMdbsdlW4mP49Fn7rjfZB5OhXBs
	5QfLtCRqs2PcEvyPm8g8yLg6vCfEc0lG6wUWy1Gg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VKEs+wOfyhLYVxTo77bYl5W9kbN54tZwCSG13kL/H+w=;
	b=pETUsIcIzso8s0fEuq2PEwollYxOzMz7lCTGO7xFHJhrgBe6n4QQuTr2EyQJn+WJ
	V+NPfsuL5deLjHPgFM4GCh/aTuow0lOJFd+8P6nxR1MVatpyIJ2Qw2KM61kO0eF0hyt
	7FRgOLf8hiWBap3DuplzvUZGrr2DNgAOi2MLOhtc=
Content-Type: multipart/mixed; boundary="===============4195452653052806707=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cups: upgrading to 2.4.14 SUCCEEDED
Message-ID: <010101994d3a36fe-cc9ec0b7-8b50-4a50-aa2b-08aa540e0ff8-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223438

--===============4195452653052806707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cups* to *2.4.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cups-upgrade-2.4.12-2.4.14.patch
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
From 7b2ca77d3fc948ec4c0ae412454b4e07d55c5ca0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 08:46:30 +0000
Subject: [PATCH] cups: upgrade 2.4.12 -> 2.4.14

---
 .../recipes-extended/cups/cups/0001-use-echo-only-in-init.patch | 2 +-
 .../cups/cups/0002-don-t-try-to-run-generated-binaries.patch    | 2 +-
 .../cups/0004-cups-fix-multilib-install-file-conflicts.patch    | 2 +-
 meta/recipes-extended/cups/cups/libexecdir.patch                | 2 +-
 meta/recipes-extended/cups/{cups_2.4.12.bb => cups_2.4.14.bb}   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.12.bb => cups_2.4.14.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index c0cb7df581..5c0bd2e14a 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,4 +1,4 @@
-From c5f943b1ac6e1c86ae64686e29e178fedf933e96 Mon Sep 17 00:00:00 2001
+From 854a921bb935b94f4cf81f39e386ce58579f4b7c Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
 Subject: [PATCH] use echo only in init
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index cf2f1a6747..99b08d2486 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,4 +1,4 @@
-From da9a313ae5a2d1da683dd58572df0d7a660eb922 Mon Sep 17 00:00:00 2001
+From f09045ca716bc984af1df042e0e05f099ab9626a Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
 Subject: [PATCH] don't try to run generated binaries
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index 31338822e6..ddaf5e5a7b 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,4 +1,4 @@
-From 880bad2c6b08afd2e2e303bc3ceea559edbe76d2 Mon Sep 17 00:00:00 2001
+From 713b500c442b6e4696cdba280ac4460038566e04 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
 Subject: [PATCH] cups: fix multilib install file conflicts
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 493c7970ea..69c2c14091 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From 4ae7ad87aa022f5128be222dffbf0c50ec6e846e Mon Sep 17 00:00:00 2001
+From ee346e8e47964ae3768ef7aed8f8eef0cd66c05f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 13 Jul 2021 12:56:30 +0100
 Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
diff --git a/meta/recipes-extended/cups/cups_2.4.12.bb b/meta/recipes-extended/cups/cups_2.4.14.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.12.bb
rename to meta/recipes-extended/cups/cups_2.4.14.bb
index ac73c2780f..5d5a1dc97f 100644
--- a/meta/recipes-extended/cups/cups_2.4.12.bb
+++ b/meta/recipes-extended/cups/cups_2.4.14.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "b1dde191a4ae2760c47220c82ca6155a28c382701e6c1a0159d1054990231d59"
+SRC_URI[sha256sum] = "660288020dd6f79caf799811c4c1a3207a48689899ac2093959d70a3bdcb7699"
-- 
2.47.1


--===============4195452653052806707==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cups-upgrade-2.4.12-2.4.14.patch"

RnJvbSA3YjJjYTc3ZDNmYzk0OGVjNGMwYWU0MTI0NTRiNGUwN2Q1NWM1Y2EwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDg6NDY6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
dXBzOiB1cGdyYWRlIDIuNC4xMiAtPiAyLjQuMTQKCi0tLQogLi4uL3JlY2lwZXMtZXh0ZW5kZWQv
Y3Vwcy9jdXBzLzAwMDEtdXNlLWVjaG8tb25seS1pbi1pbml0LnBhdGNoIHwgMiArLQogLi4uL2N1
cHMvY3Vwcy8wMDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJhdGVkLWJpbmFyaWVzLnBhdGNoICAg
IHwgMiArLQogLi4uL2N1cHMvMDAwNC1jdXBzLWZpeC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29u
ZmxpY3RzLnBhdGNoICAgIHwgMiArLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9s
aWJleGVjZGlyLnBhdGNoICAgICAgICAgICAgICAgIHwgMiArLQogbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2N1cHMve2N1cHNfMi40LjEyLmJiID0+IGN1cHNfMi40LjE0LmJifSAgIHwgMiArLQogNSBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMve2N1cHNfMi40LjEyLmJiID0+IGN1cHNfMi40LjE0LmJi
fSAoNTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAw
MS11c2UtZWNoby1vbmx5LWluLWluaXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vw
cy9jdXBzLzAwMDEtdXNlLWVjaG8tb25seS1pbi1pbml0LnBhdGNoCmluZGV4IGMwY2I3ZGY1ODEu
LjVjMGJkMmUxNGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMv
MDAwMS11c2UtZWNoby1vbmx5LWluLWluaXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2N1cHMvY3Vwcy8wMDAxLXVzZS1lY2hvLW9ubHktaW4taW5pdC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gYzVmOTQzYjFhYzZlMWM4NmFlNjQ2ODZlMjllMTc4ZmVkZjkzM2U5NiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODU0YTkyMWJiOTM1Yjk0ZjRjZjgxZjM5ZTM4NmNl
NTg1NzlmNGI3YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFNhdWwgV29sZCA8c2d3
QGxpbnV4LmludGVsLmNvbT4KIERhdGU6IFRodSwgMTMgRGVjIDIwMTIgMTk6MDM6NTIgLTA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gdXNlIGVjaG8gb25seSBpbiBpbml0CmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDItZG9uLXQtdHJ5LXRvLXJ1bi1nZW5lcmF0
ZWQtYmluYXJpZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDIt
ZG9uLXQtdHJ5LXRvLXJ1bi1nZW5lcmF0ZWQtYmluYXJpZXMucGF0Y2gKaW5kZXggY2YyZjFhNjc0
Ny4uOTliMDhkMjQ4NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vw
cy8wMDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJhdGVkLWJpbmFyaWVzLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMi1kb24tdC10cnktdG8tcnVuLWdlbmVy
YXRlZC1iaW5hcmllcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGE5YTMxM2FlNWEyZDFk
YTY4M2RkNTg1NzJkZjBkN2E2NjBlYjkyMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ZjA5MDQ1Y2E3MTZiYzk4NGFmMWRmMDQyZTBlMDVmMDk5YWI5NjI2YSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEtvZW4gS29vaSA8a29lbkBkb21pbmlvbi50aHJ1aGVyZS5uZXQ+CiBE
YXRlOiBTdW4sIDMwIEphbiAyMDExIDE2OjM3OjI3ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRv
bid0IHRyeSB0byBydW4gZ2VuZXJhdGVkIGJpbmFyaWVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDQtY3Vwcy1maXgtbXVsdGlsaWItaW5zdGFsbC1maWxl
LWNvbmZsaWN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwNC1j
dXBzLWZpeC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNoCmluZGV4IDMxMzM4
ODIyZTYuLmRkYWY1ZTVhN2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBz
L2N1cHMvMDAwNC1jdXBzLWZpeC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwNC1jdXBzLWZpeC1tdWx0
aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4
ODBiYWQyYzZiMDhhZmQyZTJlMzAzYmMzY2VlYTU1OWVkYmU3NmQyIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA3MTNiNTAwYzQ0MmI2ZTQ2OTZjZGJhMjgwYWM0NDYwMDM4NTY2ZTA0IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBXZWQsIDMgT2N0IDIwMTggMDA6Mjc6MTEgKzA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gY3VwczogZml4IG11bHRpbGliIGluc3RhbGwgZmlsZSBjb25mbGljdHMKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvbGliZXhlY2Rpci5wYXRjaCBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvbGliZXhlY2Rpci5wYXRjaAppbmRleCA0OTNj
Nzk3MGVhLi42OWMyYzE0MDkxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vw
cy9jdXBzL2xpYmV4ZWNkaXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMv
Y3Vwcy9saWJleGVjZGlyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0YWU3YWQ4N2FhMDIy
ZjUxMjhiZTIyMmRmZmJmMGM1MGVjNmU4NDZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBlZTM0NmU4ZTQ3OTY0YWUzNzY4ZWY3YWVkOGY4ZWVmMGNkNjZjMDVmIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRl
OiBUdWUsIDEzIEp1bCAyMDIxIDEyOjU2OjMwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIFVzZSAk
bGliZXhlY2RpciBpbnN0ZWFkIG9mIGhhcmRjb2RpbmcgJHByZWZpeC9saWIgYXMgdGhpcwpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuMTIuYmIgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC4xNC5iYgpzaW1pbGFyaXR5IGluZGV4IDUx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC4xMi5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuMTQuYmIKaW5kZXgg
YWM3M2MyNzgwZi4uNWQ1YTFkYzk3ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2N1cHMvY3Vwc18yLjQuMTIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vw
c18yLjQuMTQuYmIKQEAgLTIsNCArMiw0IEBAIHJlcXVpcmUgY3Vwcy5pbmMKIAogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNj
NmJkNTciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiMWRkZTE5MWE0YWUyNzYwYzQ3MjIwYzgy
Y2E2MTU1YTI4YzM4MjcwMWU2YzFhMDE1OWQxMDU0OTkwMjMxZDU5IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjY2MDI4ODAyMGRkNmY3OWNhZjc5OTgxMWM0YzFhMzIwN2E0ODY4OTg5OWFjMjA5Mzk1
OWQ3MGEzYmRjYjc2OTkiCi0tIAoyLjQ3LjEKCg==

--===============4195452653052806707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cups/cups-dbg: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-dbg: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-dbg: PKGSIZE changed from 8794000 to 8804184 (+0%)
packages/x86-64-v3-poky-linux/cups/cups-dev: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-dev: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-doc: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-doc: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-doc: PKGSIZE changed from 226805 to 226870 (+0%)
packages/x86-64-v3-poky-linux/cups/cups-lib: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-lib: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-lib: PKGSIZE changed from 657416 to 661512 (+1%)
packages/x86-64-v3-poky-linux/cups/cups-libimage: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-libimage: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-ca: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-locale-ca: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-cs: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-locale-cs: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-da: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-locale-da: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-de: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-locale-de: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-en: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-locale-en: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-es: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-locale-es: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-fr: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-locale-fr: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-it: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-locale-it: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-ja: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-locale-ja: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-pt-br: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-locale-pt-br: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-ru: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-locale-ru: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-locale-zh-cn: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-locale-zh-cn: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-src: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-src: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-src: PKGSIZE changed from 5980501 to 5979619 (-0%)
packages/x86-64-v3-poky-linux/cups/cups-staticdev: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-staticdev: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-webif: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups-webif: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups/cups-webif: PKGSIZE changed from 1567018 to 1567103 (+0%)
packages/x86-64-v3-poky-linux/cups/cups: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups/cups: PKGV changed from 2.4.12 [default] to 2.4.14 [default]
packages/x86-64-v3-poky-linux/cups: SRC_URI changed from "https://github.com/OpenPrinting/cups/releases/download/v2.4.12/cups-2.4.12-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf" to "https://github.com/OpenPrinting/cups/releases/download/v2.4.14/cups-2.4.14-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf"
packages/x86-64-v3-poky-linux/cups: PV changed from "2.4.12" to "2.4.14"
packages/x86-64-v3-poky-linux/cups: PKGV changed from 2.4.12 [default] to 2.4.14 [default]

--===============4195452653052806707==--

