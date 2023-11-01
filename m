Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164C5C07545
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.8670.1698848705780761750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=d0rVm3QX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WG8gUdjn;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b8b460a96-bed76293-86aa-46c1-a318-ffe5b5b4e902-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KvBB+6cQs5MxheLG1D6BvEQaWq6oM1+2hvU2DXi6zmE=;
	b=d0rVm3QXrkEaFllR1I/5IgJoBHJJvILZMniWrfFHonqE7JgQTr+DBvdg+rqq8Q+I
	TUFfyIUF4d5y4bnI1FTTuVx0fbuiu1OWP4WJAeSyjr6oU2Rnm3UoH4fL+erVDm6m+1G
	LZijUZgXmI15iLi5boju2oypdj2AtC08JY7UL04c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KvBB+6cQs5MxheLG1D6BvEQaWq6oM1+2hvU2DXi6zmE=;
	b=WG8gUdjnn4BeU7LCIZo7gvUp2x2Oo8DAUlRoibVkszNGqKTRvbWB/nI3kmyJlPM4
	zPRRUHDlCbEA4aNSa/qfbOuRCEFItRUcD9EaKA8cGRYwPa3HYHymgCKrUc2Vyz5/IGG
	0PMZo1hZZGVmK8DnbEQ4b/P3E+uk5Q2ESnp3H+i8=
Content-Type: multipart/mixed; boundary="===============8869729356593517124=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gsettings-desktop-schemas: upgrading to 45.0 SUCCEEDED
Message-ID: <0101018b8b460a96-bed76293-86aa-46c1-a318-ffe5b5b4e902-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190003

--===============8869729356593517124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gsettings-desktop-schemas* to *45.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gsettings-desktop-schemas-upgrade-44.0-45.0.patch
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
From 0a00c299ea1bca4bbe6b5e62909ee2c43f33b51e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 12:09:32 +0000
Subject: [PATCH] gsettings-desktop-schemas: upgrade 44.0 -> 45.0

---
 ...esktop-schemas_44.0.bb => gsettings-desktop-schemas_45.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_44.0.bb => gsettings-desktop-schemas_45.0.bb} (85%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb
similarity index 85%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb
index 8e30d5e524..a46f47944c 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb
@@ -13,4 +13,4 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "eb2de45cad905994849e642a623adeb75d41b21b0626d40d2a07b8ea281fec0e"
+SRC_URI[archive.sha256sum] = "365c8d04daf79b38c8b3dc9626349a024f9e4befdd31fede74b42f7a9fbe0ae2"
-- 
2.39.2


--===============8869729356593517124==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gsettings-desktop-schemas-upgrade-44.0-45.0.patch"

RnJvbSAwYTAwYzI5OWVhMWJjYTRiYmU2YjVlNjI5MDllZTJjNDNmMzNiNTFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMjowOTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
ZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXM6IHVwZ3JhZGUgNDQuMCAtPiA0NS4wCgotLS0KIC4uLmVz
a3RvcC1zY2hlbWFzXzQ0LjAuYmIgPT4gZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hc180NS4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzL3tnc2V0
dGluZ3MtZGVza3RvcC1zY2hlbWFzXzQ0LjAuYmIgPT4gZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1h
c180NS4wLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9nc2V0dGlu
Z3MtZGVza3RvcC1zY2hlbWFzL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXNfNDQuMC5iYiBiL21l
dGEvcmVjaXBlcy1nbm9tZS9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzL2dzZXR0aW5ncy1kZXNr
dG9wLXNjaGVtYXNfNDUuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVza3Rv
cC1zY2hlbWFzXzQ0LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9nc2V0dGluZ3Mt
ZGVza3RvcC1zY2hlbWFzL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXNfNDUuMC5iYgppbmRleCA4
ZTMwZDVlNTI0Li5hNDZmNDc5NDRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3Nl
dHRpbmdzLWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzXzQ0LjAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXMvZ3NldHRp
bmdzLWRlc2t0b3Atc2NoZW1hc180NS4wLmJiCkBAIC0xMyw0ICsxMyw0IEBAIEdOT01FQkFTRUJV
SUxEQ0xBU1MgPSAibWVzb24iCiAKIGluaGVyaXQgZ25vbWViYXNlIGdzZXR0aW5ncyBnb2JqZWN0
LWludHJvc3BlY3Rpb24gZ2V0dGV4dAogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJl
YjJkZTQ1Y2FkOTA1OTk0ODQ5ZTY0MmE2MjNhZGViNzVkNDFiMjFiMDYyNmQ0MGQyYTA3YjhlYTI4
MWZlYzBlIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMzY1YzhkMDRkYWY3OWIzOGM4
YjNkYzk2MjYzNDlhMDI0ZjllNGJlZmRkMzFmZWRlNzRiNDJmN2E5ZmJlMGFlMiIKLS0gCjIuMzku
MgoK

--===============8869729356593517124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dbg: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dbg: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-doc: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-doc: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PKGSIZE changed from 5482 to 7828 (+43%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-as: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-as: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PKGSIZE changed from 150974 to 150976 (+0%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bs: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bs: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca+valencia: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca+valencia: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PKGSIZE changed from 113885 to 113269 (-1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PKGSIZE changed from 108967 to 108193 (-1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-el: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-el: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PKGSIZE changed from 105311 to 106809 (+1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eo: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eo: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PKGSIZE changed from 115852 to 115175 (-1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PKGSIZE changed from 113330 to 112963 (-0%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fi: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fi: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PKGSIZE changed from 122848 to 122830 (-0%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PKGSIZE changed from 114383 to 114417 (+0%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PKGSIZE changed from 114247 to 113720 (-0%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gu: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gu: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PKGSIZE changed from 106724 to 106074 (-1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hi: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hi: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PKGSIZE changed from 117667 to 116937 (-1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PKGSIZE changed from 109100 to 108391 (-1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-is: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-is: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ja: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ja: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGSIZE changed from 10204 to 31891 (+213%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PKGSIZE changed from 109739 to 109101 (-1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lv: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lv: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ml: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ml: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ms: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ms: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nb: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nb: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-or: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-or: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pa: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pa: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PKGSIZE changed from 116315 to 115730 (-1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PKGSIZE changed from 113724 to 113039 (-1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PKGSIZE changed from 111656 to 115151 (+3%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PKGSIZE changed from 151416 to 150672 (-0%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PKGSIZE changed from 108053 to 107502 (-1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr+latin: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr+latin: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PKGSIZE changed from 111701 to 110995 (-1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tg: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tg: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PKGSIZE changed from 115933 to 115312 (-1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PKGSIZE changed from 151787 to 151014 (-1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-vi: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-vi: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PKGSIZE changed from 100029 to 99469 (-1%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-hk: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-hk: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-tw: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-tw: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-src: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-src: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-staticdev: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-staticdev: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PKGSIZE changed from 150439 to 149729 (-0%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas: SRC_URI changed from "https://download.gnome.org/sources//gsettings-desktop-schemas/44/gsettings-desktop-schemas-44.0.tar.xz;name=archive" to "https://download.gnome.org/sources//gsettings-desktop-schemas/45/gsettings-desktop-schemas-45.0.tar.xz;name=archive"
packages/core2-64-poky-linux/gsettings-desktop-schemas: PV changed from "44.0" to "45.0"
packages/core2-64-poky-linux/gsettings-desktop-schemas: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-64-poky-linux/gsettings-desktop-schemas: PACKAGES: added "gsettings-desktop-schemas-locale-be gsettings-desktop-schemas-locale-fa"

--===============8869729356593517124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PKGSIZE changed from 5482 to 7828 (+43%)
packages/core2-64-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGSIZE changed from 10204 to 31891 (+213%)
packages/core2-64-poky-linux/gsettings-desktop-schemas: PACKAGES: added "gsettings-desktop-schemas-locale-be gsettings-desktop-schemas-locale-fa"

--===============8869729356593517124==--

