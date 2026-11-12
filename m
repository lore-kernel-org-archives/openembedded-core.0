Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7276.1794460829852544986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 21:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KxHAUn6b;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=K4lcFRGK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1ce3343fb-abfb0fb0-2e89-4fd7-8bb8-4902539031c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794460828;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=XIsSKy99KxPLgcpZDRcCNsYua/sPQAhUBeiPEAD8DgE=;
	b=KxHAUn6blOovokNty785DyRfsHedIBBexCI1OcrqmabKw7nHMj5bGzTqOr95ErE9
	YI50Kqeo85lSDZwF16l/U1L9WggrnMDeDotI2cjLeq3fdcTtSzT3IKcojgv15Uibr2L
	EgeHH4k3RP1N0fRpX9hdQmmZcEep7KziWSIERpIc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794460828;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=XIsSKy99KxPLgcpZDRcCNsYua/sPQAhUBeiPEAD8DgE=;
	b=K4lcFRGKBVLu0Kouh7Y3URCbOiDMsISvh1GHkkXsaPSyz10ggbNqLzFcMaWZvIhL
	KlAtEHSnQRAUC5Kmn9TkrpjtoZ3GxaNU/JLd1DJMHEmMqO+zRAUROoRYo/yiNCq+hTs
	XCejRoBo8AFZ+JB7Bi8DgA0sq0ThGrKj47M2rntU=
Content-Type: multipart/mixed; boundary="===============7283047719961909234=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mobile-broadband-provider-info: upgrading to 20261111 SUCCEEDED
Message-ID: <010101a1ce3343fb-abfb0fb0-2e89-4fd7-8bb8-4902539031c9-000000@us-west-2.amazonses.com>
Date: Thu, 12 Nov 2026 05:20:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.12-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 05:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250067

--===============7283047719961909234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mobile-broadband-provider-info* to *20261111* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mobile-broadband-provider-info-upgrade-20251101-2026.patch
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
From e850b289332501de2a6a6f102b113a40e118c9e6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 12 Nov 2026 05:07:45 +0000
Subject: [PATCH] mobile-broadband-provider-info: upgrade 20251101 -> 20261111

20251111
--------
---
 ...o_20251101.bb => mobile-broadband-provider-info_20261111.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/mobile-broadband-provider-info/{mobile-broadband-provider-info_20251101.bb => mobile-broadband-provider-info_20261111.bb} (91%)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20261111.bb
similarity index 91%
rename from meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
rename to meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20261111.bb
index a4e93a97f9..2e2b81f967 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20261111.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main;tag=${PV}"
-SRCREV = "18cb97517d9c831e1d2ec057e62d04fd3665e10f"
+SRCREV = "31d5240cc4712f615813aa2bb550244079a61f13"
 
 inherit meson
 
-- 
2.47.1


--===============7283047719961909234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mobile-broadband-provider-info: PKGV changed from 20251101 [default] to 20261111 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info: SRC_URI changed from "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main;tag=20251101" to "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main;tag=20261111"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info: PV changed from "20251101" to "20261111"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dbg: PKGV changed from 20251101 [default] to 20261111 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dbg: PV changed from "20251101" to "20261111"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dev: PKGV changed from 20251101 [default] to 20261111 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dev: PV changed from "20251101" to "20261111"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-doc: PKGV changed from 20251101 [default] to 20261111 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-doc: PV changed from "20251101" to "20261111"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-locale: PKGV changed from 20251101 [default] to 20261111 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-locale: PV changed from "20251101" to "20261111"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-src: PKGV changed from 20251101 [default] to 20261111 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-src: PV changed from "20251101" to "20261111"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-staticdev: PKGV changed from 20251101 [default] to 20261111 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-staticdev: PV changed from "20251101" to "20261111"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGSIZE changed from 521336 to 534225 (+2%)
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGV changed from 20251101 [default] to 20261111 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PV changed from "20251101" to "20261111"

--===============7283047719961909234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mobile-broadband-provider-info-changelog.txt"

20251111
--------

--===============7283047719961909234==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mobile-broadband-provider-info-upgrade-20251101-2026.patch"

RnJvbSBlODUwYjI4OTMzMjUwMWRlMmE2YTZmMTAyYjExM2E0MGUxMThjOWU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTIgTm92IDIwMjYgMDU6MDc6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
b2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm86IHVwZ3JhZGUgMjAyNTExMDEgLT4gMjAyNjEx
MTEKCjIwMjUxMTExCi0tLS0tLS0tCi0tLQogLi4ub18yMDI1MTEwMS5iYiA9PiBtb2JpbGUtYnJv
YWRiYW5kLXByb3ZpZGVyLWluZm9fMjAyNjExMTEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm8ve21vYmlsZS1icm9hZGJhbmQt
cHJvdmlkZXItaW5mb18yMDI1MTEwMS5iYiA9PiBtb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWlu
Zm9fMjAyNjExMTEuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm8vbW9iaWxlLWJyb2FkYmFuZC1wcm92
aWRlci1pbmZvXzIwMjUxMTAxLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2JpbGUt
YnJvYWRiYW5kLXByb3ZpZGVyLWluZm8vbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvXzIw
MjYxMTExLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvL21vYmlsZS1icm9hZGJh
bmQtcHJvdmlkZXItaW5mb18yMDI1MTEwMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm8vbW9iaWxlLWJyb2FkYmFuZC1w
cm92aWRlci1pbmZvXzIwMjYxMTExLmJiCmluZGV4IGE0ZTkzYTk3ZjkuLjJlMmI4MWY5NjcgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9iaWxlLWJyb2FkYmFuZC1wcm92
aWRlci1pbmZvL21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mb18yMDI1MTEwMS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5m
by9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm9fMjAyNjExMTEuYmIKQEAgLTgsNyArOCw3
IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTg3OTY0NTc5YjJhOGVj
ZTRiYzY3NDRkMmRjOWE4YjA0IgogUEUgPSAiMSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIu
Z25vbWUub3JnL0dOT01FL21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mby5naXQ7cHJvdG9j
b2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPSR7UFZ9IgotU1JDUkVWID0gIjE4Y2I5NzUxN2Q5Yzgz
MWUxZDJlYzA1N2U2MmQwNGZkMzY2NWUxMGYiCitTUkNSRVYgPSAiMzFkNTI0MGNjNDcxMmY2MTU4
MTNhYTJiYjU1MDI0NDA3OWE2MWYxMyIKIAogaW5oZXJpdCBtZXNvbgogCi0tIAoyLjQ3LjEKCg==

--===============7283047719961909234==--
