Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BAA10FCAFA
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:08 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14650.1775054158907424648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=F9c38NaN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KOAp27Rk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d4979200e-107a50e9-66a1-40fb-b617-436d42527d07-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2jEOlMVJeNzZIqofmB5do4THMN4GafZU8m7PwP7ZZ38=;
	b=F9c38NaN+hUoJbouU31qISRSkwEXB+apiphFse40vtUTfrurZHTRwqGn8h5uW5dj
	ef8GRqSbAgHkjDxXTHVZAaCZPzJQxqZtcFyuR+4PD3giq6ukc8ojP7doSqSXJ8fldRe
	sgHrBrdlvui8Lqyb4JtdMeAIGbgnXRtDpr670bXU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2jEOlMVJeNzZIqofmB5do4THMN4GafZU8m7PwP7ZZ38=;
	b=KOAp27RkOPonQErIbCpA9k4R7im20w5fDeFpiLPPO7VfPs5X9wXI+6oNo2DA3y6c
	M1mRUNZA+hyZPfbQJzErsKd8WzieNxDav6F+NupayIZ4OxkaRlV7vFh+wC+3ROuEIDH
	iPkUmfJygLq0/ZjKQOOY5XfGguUPdzbvdo8PqZ8A=
Content-Type: multipart/mixed; boundary="===============3115928621628458855=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lzip: upgrading to 1.26 SUCCEEDED
Message-ID: <0101019d4979200e-107a50e9-66a1-40fb-b617-436d42527d07-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234401

--===============3115928621628458855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lzip* to *1.26* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lzip-upgrade-1.25-1.26.patch
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
From 393e2110de25c241c364680b77f95a65267b5e50 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 11:20:26 +0000
Subject: [PATCH] lzip: upgrade 1.25 -> 1.26

---
 meta/recipes-extended/lzip/{lzip_1.25.bb => lzip_1.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lzip/{lzip_1.25.bb => lzip_1.26.bb} (93%)

diff --git a/meta/recipes-extended/lzip/lzip_1.25.bb b/meta/recipes-extended/lzip/lzip_1.26.bb
similarity index 93%
rename from meta/recipes-extended/lzip/lzip_1.25.bb
rename to meta/recipes-extended/lzip/lzip_1.26.bb
index 590e35cb75..c087d2ee2e 100644
--- a/meta/recipes-extended/lzip/lzip_1.25.bb
+++ b/meta/recipes-extended/lzip/lzip_1.26.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cca7f74ec83b7a9ce7ccd195aad471bd \
                     "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[sha256sum] = "09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668d0f346e3d3f0a56f"
+SRC_URI[sha256sum] = "641cf30961525cbe3b340cc883436c8854e9f5032f459f444de4782b621e6572"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.47.1


--===============3115928621628458855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/lzip: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip: SRC_URI changed from "https://download.savannah.gnu.org/releases/lzip/lzip-1.25.tar.gz" to "https://download.savannah.gnu.org/releases/lzip/lzip-1.26.tar.gz"
packages/x86-64-v3-poky-linux/lzip: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip/lzip-dbg: PKGSIZE changed from 1057960 to 1062624 (+0%)
packages/x86-64-v3-poky-linux/lzip/lzip-dbg: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip/lzip-dbg: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip/lzip-dev: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip/lzip-dev: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip/lzip-doc: PKGSIZE changed from 74842 to 79052 (+6%)
packages/x86-64-v3-poky-linux/lzip/lzip-doc: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip/lzip-doc: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip/lzip-locale: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip/lzip-locale: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip/lzip-src: PKGSIZE changed from 153625 to 157671 (+3%)
packages/x86-64-v3-poky-linux/lzip/lzip-src: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip/lzip-src: FILELIST: directory renamed /usr/src/debug/lzip/1.25 -> /usr/src/debug/lzip/1.26
packages/x86-64-v3-poky-linux/lzip/lzip-src: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip/lzip-staticdev: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip/lzip-staticdev: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip/lzip: PKGSIZE changed from 134088 to 134112 (+0%)
packages/x86-64-v3-poky-linux/lzip/lzip: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip/lzip: PV changed from "1.25" to "1.26"

--===============3115928621628458855==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-lzip-upgrade-1.25-1.26.patch"

RnJvbSAzOTNlMjExMGRlMjVjMjQxYzM2NDY4MGI3N2Y5NWE2NTI2N2I1ZTUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMToyMDoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx6
aXA6IHVwZ3JhZGUgMS4yNSAtPiAxLjI2CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9semlw
L3tsemlwXzEuMjUuYmIgPT4gbHppcF8xLjI2LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9semlwL3tsemlwXzEuMjUuYmIgPT4gbHppcF8xLjI2LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9semlwL2x6aXBfMS4yNS5iYiBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9semlwL2x6aXBfMS4yNi5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHppcC9semlwXzEuMjUuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9semlwL2x6aXBfMS4yNi5iYgppbmRleCA1OTBlMzVjYjc1Li5jMDg3
ZDJlZTJlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHppcC9semlwXzEuMjUu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x6aXAvbHppcF8xLjI2LmJiCkBAIC04LDcg
KzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jY2E3Zjc0ZWM4
M2I3YTljZTdjY2QxOTVhYWQ0NzFiZCBcCiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VS
SSA9ICIke1NBVkFOTkFIX0dOVV9NSVJST1J9L2x6aXAvbHppcC0ke1BWfS50YXIuZ3oiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMDk0MThhNmQ4ZmI4M2Y1MTEzZjViZDg1NmUwOTcwM2RmNWQzN2Jh
ZTAzMDhjNjY4ZDBmMzQ2ZTNkM2YwYTU2ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2NDFjZjMw
OTYxNTI1Y2JlM2IzNDBjYzg4MzQzNmM4ODU0ZTlmNTAzMmY0NTlmNDQ0ZGU0NzgyYjYyMWU2NTcy
IgogCiBCID0gIiR7V09SS0RJUn0vYnVpbGQiCiBkb19jb25maWd1cmVbY2xlYW5kaXJzXSA9ICIk
e0J9IgotLSAKMi40Ny4xCgo=

--===============3115928621628458855==--

