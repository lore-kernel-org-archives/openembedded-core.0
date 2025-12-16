Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A29AD5E120
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17405.1765872153735338759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tPRpv78A;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fZ3AUu+p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019b262eb2b5-828af150-aa2f-4646-93e0-f42477405316-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qKPpUC0bF2+rfAcR/mYRRNO/tqAPg7mkmzrxs0PCwSU=;
	b=tPRpv78AGt/yVufCCSZpaivOF/MS7RA/g4kwizEOQzkh+j90GIWD66jQWAwbkOKm
	FpA8LKNco/ATK81otef9we0EiVeZE625N98XEUjgDT8BfBEspl2nb2VYSlaZ73/r4tY
	zGM0jkv/7YqNKo5M5yl6HaAyzhnQKUXgEptwQFwU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qKPpUC0bF2+rfAcR/mYRRNO/tqAPg7mkmzrxs0PCwSU=;
	b=fZ3AUu+pbYD94A0Q+luGqcvuuqyCzuDd2/8DkdkCadvyJVxkmDyesUBjzreVPMft
	uKucrHp7ZKCpYqs6kpfIVN/+5DCMxRJ2is951mYF3Q1JNPY+qWIxOnE2OR9sIyjrX4u
	HzUysLb90id30s46ViJAr/DVwK05PFoJsiFrUZjw=
Content-Type: multipart/mixed; boundary="===============6934213929480686624=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpica: upgrading to 20251212 SUCCEEDED
Message-ID: <0101019b262eb2b5-828af150-aa2f-4646-93e0-f42477405316-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227843

--===============6934213929480686624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *acpica* to *20251212* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acpica-upgrade-20250807-20251212.patch
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
From b947a17f16c45e0dfee9136762b0b486dab4b462 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 02:31:11 +0000
Subject: [PATCH] acpica: upgrade 20250807 -> 20251212

---
 .../acpica/{acpica_20250807.bb => acpica_20251212.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20250807.bb => acpica_20251212.bb} (96%)

diff --git a/meta/recipes-extended/acpica/acpica_20250807.bb b/meta/recipes-extended/acpica/acpica_20251212.bb
similarity index 96%
rename from meta/recipes-extended/acpica/acpica_20250807.bb
rename to meta/recipes-extended/acpica/acpica_20251212.bb
index f6ee3285a1..812a62547b 100644
--- a/meta/recipes-extended/acpica/acpica_20250807.bb
+++ b/meta/recipes-extended/acpica/acpica_20251212.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master;tag=${PV}"
-SRCREV = "aa98db3bd149fc1f8d2a3017cb05b6b1982c3296"
+SRCREV = "446be438238e9d339eed5182b807ac5f82df56c9"
 
 inherit update-alternatives
 
-- 
2.47.1


--===============6934213929480686624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/acpica/acpica-dbg: PKGSIZE changed from 10788896 to 10799128 (+0%)
packages/x86-64-v3-poky-linux/acpica/acpica-dbg: PV changed from "20250807" to "20251212"
packages/x86-64-v3-poky-linux/acpica/acpica-dbg: PKGV changed from 20250807 [default] to 20251212 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-dev: PV changed from "20250807" to "20251212"
packages/x86-64-v3-poky-linux/acpica/acpica-dev: PKGV changed from 20250807 [default] to 20251212 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-doc: PV changed from "20250807" to "20251212"
packages/x86-64-v3-poky-linux/acpica/acpica-doc: PKGV changed from 20250807 [default] to 20251212 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-locale: PV changed from "20250807" to "20251212"
packages/x86-64-v3-poky-linux/acpica/acpica-locale: PKGV changed from 20250807 [default] to 20251212 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-src: PKGSIZE changed from 10553641 to 10585354 (+0%)
packages/x86-64-v3-poky-linux/acpica/acpica-src: PV changed from "20250807" to "20251212"
packages/x86-64-v3-poky-linux/acpica/acpica-src: PKGV changed from 20250807 [default] to 20251212 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-src: FILELIST: directory renamed /usr/src/debug/acpica/20250807/source/tools/acpibin -> /usr/src/debug/acpica/20251212/source/tools/acpibin, directory renamed /usr/src/debug/acpica/20250807/source/tools/acpidump -> /usr/src/debug/acpica/20251212/source/tools/acpidump, directory renamed /usr/src/debug/acpica/20250807/source/components/parser -> /usr/src/debug/acpica/20251212/source/components/parser, directory renamed /usr/src/debug/acpica/20250807/source/compiler -> /usr/src/debug/acpica/20251212/source/compiler, directory renamed /usr/src/debug/acpica/20250807/source/components/disassembler -> /usr/src/debug/acpica/20251212/source/components/disassembler, directory renamed /usr/src/debug/acpica/20250807/source/common -> /usr/src/debug/acpica/20251212/source/common, directory renamed /usr/src/debug/acpica/20250807/source/components/resources -> /usr/src/debug/acpica/20251212/source/components/resources, directory renamed /usr/src/debug/acpi
 ca/20250807/source/components/utilities -> /usr/src/debug/acpica/20251212/source/components/utilities, directory renamed /usr/src/debug/acpica/20250807/source/components/tables -> /usr/src/debug/acpica/20251212/source/components/tables, directory renamed /usr/src/debug/acpica/20250807/source/os_specific/service_layers -> /usr/src/debug/acpica/20251212/source/os_specific/service_layers, directory renamed /usr/src/debug/acpica/20250807/source/components/events -> /usr/src/debug/acpica/20251212/source/components/events, directory renamed /usr/src/debug/acpica/20250807/source/components/executer -> /usr/src/debug/acpica/20251212/source/components/executer, directory renamed /usr/src/debug/acpica/20250807/source/tools/acpihelp -> /usr/src/debug/acpica/20251212/source/tools/acpihelp, directory renamed /usr/src/debug/acpica/20250807/source/include -> /usr/src/debug/acpica/20251212/source/include, directory renamed /usr/src/debug/acpica/20250807/generate/unix/iasl/obj -> /usr/src/debug/acpi
 ca/20251212/generate/unix/iasl/obj, directory renamed /usr/src/debug/acpica/20250807/source/components/dispatcher -> /usr/src/debug/acpica/20251212/source/components/dispatcher, directory renamed /usr/src/debug/acpica/20250807/source/tools/acpiexec -> /usr/src/debug/acpica/20251212/source/tools/acpiexec, directory renamed /usr/src/debug/acpica/20250807/source/tools/acpixtract -> /usr/src/debug/acpica/20251212/source/tools/acpixtract, directory renamed /usr/src/debug/acpica/20250807/source/components/hardware -> /usr/src/debug/acpica/20251212/source/components/hardware, directory renamed /usr/src/debug/acpica/20250807/source/components/namespace -> /usr/src/debug/acpica/20251212/source/components/namespace, directory renamed /usr/src/debug/acpica/20250807/source/tools/examples -> /usr/src/debug/acpica/20251212/source/tools/examples, directory renamed /usr/src/debug/acpica/20250807/source/tools/acpisrc -> /usr/src/debug/acpica/20251212/source/tools/acpisrc, directory renamed /usr/src/
 debug/acpica/20250807/source/components/debugger -> /usr/src/debug/acpica/20251212/source/components/debugger
packages/x86-64-v3-poky-linux/acpica/acpica-staticdev: PV changed from "20250807" to "20251212"
packages/x86-64-v3-poky-linux/acpica/acpica-staticdev: PKGV changed from 20250807 [default] to 20251212 [default]
packages/x86-64-v3-poky-linux/acpica/acpica: PKGSIZE changed from 2682016 to 2688408 (+0%)
packages/x86-64-v3-poky-linux/acpica/acpica: PV changed from "20250807" to "20251212"
packages/x86-64-v3-poky-linux/acpica/acpica: PKGV changed from 20250807 [default] to 20251212 [default]
packages/x86-64-v3-poky-linux/acpica: PV changed from "20250807" to "20251212"
packages/x86-64-v3-poky-linux/acpica: PKGV changed from 20250807 [default] to 20251212 [default]
packages/x86-64-v3-poky-linux/acpica: SRC_URI changed from "git://github.com/acpica/acpica;protocol=https;branch=master;tag=20250807" to "git://github.com/acpica/acpica;protocol=https;branch=master;tag=20251212"

--===============6934213929480686624==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-acpica-upgrade-20250807-20251212.patch"

RnJvbSBiOTQ3YTE3ZjE2YzQ1ZTBkZmVlOTEzNjc2MmIwYjQ4NmRhYjRiNDYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDI6MzE6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
Y3BpY2E6IHVwZ3JhZGUgMjAyNTA4MDcgLT4gMjAyNTEyMTIKCi0tLQogLi4uL2FjcGljYS97YWNw
aWNhXzIwMjUwODA3LmJiID0+IGFjcGljYV8yMDI1MTIxMi5iYn0gICAgICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2FjcGljYS97YWNwaWNhXzIwMjUwODA3LmJiID0+IGFjcGljYV8y
MDI1MTIxMi5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYWNw
aWNhL2FjcGljYV8yMDI1MDgwNy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9hY3BpY2EvYWNw
aWNhXzIwMjUxMjEyLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9hY3BpY2EvYWNwaWNhXzIwMjUwODA3LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvYWNwaWNhL2FjcGljYV8yMDI1MTIxMi5iYgppbmRleCBmNmVlMzI4NWEx
Li44MTJhNjI1NDdiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYWNwaWNhL2Fj
cGljYV8yMDI1MDgwNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYWNwaWNhL2FjcGlj
YV8yMDI1MTIxMi5iYgpAQCAtMTcsNyArMTcsNyBAQCBDT01QQVRJQkxFX0hPU1QgPSAiKGkuODZ8
eDg2XzY0fGFybXxhYXJjaDY0KS4qLWxpbnV4IgogREVQRU5EUyA9ICJtNC1uYXRpdmUgZmxleC1u
YXRpdmUgYmlzb24tbmF0aXZlIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vYWNwaWNh
L2FjcGljYTtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3RhZz0ke1BWfSIKLVNSQ1JFViA9
ICJhYTk4ZGIzYmQxNDlmYzFmOGQyYTMwMTdjYjA1YjZiMTk4MmMzMjk2IgorU1JDUkVWID0gIjQ0
NmJlNDM4MjM4ZTlkMzM5ZWVkNTE4MmI4MDdhYzVmODJkZjU2YzkiCiAKIGluaGVyaXQgdXBkYXRl
LWFsdGVybmF0aXZlcwogCi0tIAoyLjQ3LjEKCg==

--===============6934213929480686624==--

