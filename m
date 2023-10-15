Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E538CDB49F
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:22 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.102675.1697399115227529176
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WUQg2RS1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VxNDVHU0;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b34df0d4c-a4df0ce9-0412-44b1-9fcf-b7ba948c0b20-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tTLTd4kZVLcJS3LW+mOa10S68ArirQWZC6c1qhiVgCI=;
	b=WUQg2RS1FlthrW9GRLSdwdxCVwjS0JXOEb2wI36IAxCguGoUMvQZEVkz4XYh1UzT
	qrqaaYBT4EHcdfnNd+txYvxXMavdKdOoQ7G/90OY6PLG82xuBemW2fcS81DeDYt9YEE
	YntK81bA79yoNEJCunp2dz4SBZU5P8JAXxwlA6HA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tTLTd4kZVLcJS3LW+mOa10S68ArirQWZC6c1qhiVgCI=;
	b=VxNDVHU0er9oEFDU6nT5VV4YTK6sDWhz7HRmZ4s+g135emzxP+rnsYuxoq36sOEz
	d8A9Xpwb+oAKn3u8FG3wuFMGHJbOFWr/hecy3igD0Cq96nZGkYOZoOBsDAJYry7DIHu
	KhuzsSEZdg3nTACHCsv0QbUsml+HnP3P7n1VoT3A=
Content-Type: multipart/mixed; boundary="===============6852629782076057289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gsettings-desktop-schemas: upgrading to 45.0 SUCCEEDED
Message-ID: <0101018b34df0d4c-a4df0ce9-0412-44b1-9fcf-b7ba948c0b20-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189217

--===============6852629782076057289==
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
From 9dbea847994fd3131ce70c862c392dbd7d2accd3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 15:56:22 +0000
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


--===============6852629782076057289==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gsettings-desktop-schemas-upgrade-44.0-45.0.patch"

RnJvbSA5ZGJlYTg0Nzk5NGZkMzEzMWNlNzBjODYyYzM5MmRiZDdkMmFjY2QzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTU6NTY6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzOiB1cGdyYWRlIDQ0LjAgLT4gNDUuMAoKLS0tCiAuLi5l
c2t0b3Atc2NoZW1hc180NC4wLmJiID0+IGdzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXNfNDUuMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hcy97Z3Nl
dHRpbmdzLWRlc2t0b3Atc2NoZW1hc180NC4wLmJiID0+IGdzZXR0aW5ncy1kZXNrdG9wLXNjaGVt
YXNfNDUuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRp
bmdzLWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzXzQ0LjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVz
a3RvcC1zY2hlbWFzXzQ1LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdub21lL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXMvZ3NldHRpbmdzLWRlc2t0
b3Atc2NoZW1hc180NC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdz
LWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzXzQ1LjAuYmIKaW5kZXgg
OGUzMGQ1ZTUyNC4uYTQ2ZjQ3OTQ0YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2dz
ZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXMvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hc180NC4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzL2dzZXR0
aW5ncy1kZXNrdG9wLXNjaGVtYXNfNDUuMC5iYgpAQCAtMTMsNCArMTMsNCBAQCBHTk9NRUJBU0VC
VUlMRENMQVNTID0gIm1lc29uIgogCiBpbmhlcml0IGdub21lYmFzZSBnc2V0dGluZ3MgZ29iamVj
dC1pbnRyb3NwZWN0aW9uIGdldHRleHQKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAi
ZWIyZGU0NWNhZDkwNTk5NDg0OWU2NDJhNjIzYWRlYjc1ZDQxYjIxYjA2MjZkNDBkMmEwN2I4ZWEy
ODFmZWMwZSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjM2NWM4ZDA0ZGFmNzliMzhj
OGIzZGM5NjI2MzQ5YTAyNGY5ZTRiZWZkZDMxZmVkZTc0YjQyZjdhOWZiZTBhZTIiCi0tIAoyLjM5
LjIKCg==

--===============6852629782076057289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PKGSIZE changed from 5482 to 7828 (+43%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGSIZE changed from 10204 to 31891 (+213%)
packages/core2-32-poky-linux/gsettings-desktop-schemas: PACKAGES: added "gsettings-desktop-schemas-locale-fa gsettings-desktop-schemas-locale-be"

--===============6852629782076057289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dbg: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dbg: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-doc: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-doc: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PKGSIZE changed from 5482 to 7828 (+43%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-as: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-as: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PKGSIZE changed from 150974 to 150976 (+0%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bs: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bs: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca+valencia: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca+valencia: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PKGSIZE changed from 113885 to 113269 (-1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PKGSIZE changed from 108967 to 108193 (-1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-el: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-el: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PKGSIZE changed from 105311 to 106809 (+1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eo: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eo: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PKGSIZE changed from 115852 to 115175 (-1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PKGSIZE changed from 113330 to 112963 (-0%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fi: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fi: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PKGSIZE changed from 122848 to 122830 (-0%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PKGSIZE changed from 114383 to 114417 (+0%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PKGSIZE changed from 114247 to 113720 (-0%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gu: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gu: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PKGSIZE changed from 106724 to 106074 (-1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hi: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hi: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PKGSIZE changed from 117667 to 116937 (-1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PKGSIZE changed from 109100 to 108391 (-1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-is: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-is: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ja: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ja: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGSIZE changed from 10204 to 31891 (+213%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PKGSIZE changed from 109739 to 109101 (-1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lv: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lv: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ml: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ml: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ms: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ms: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nb: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nb: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-or: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-or: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pa: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pa: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PKGSIZE changed from 116315 to 115730 (-1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PKGSIZE changed from 113724 to 113039 (-1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PKGSIZE changed from 111656 to 115151 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PKGSIZE changed from 151416 to 150672 (-0%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PKGSIZE changed from 108053 to 107502 (-1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr+latin: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr+latin: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PKGSIZE changed from 111701 to 110995 (-1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tg: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tg: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PKGSIZE changed from 115933 to 115312 (-1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PKGSIZE changed from 151787 to 151014 (-1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-vi: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-vi: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PKGSIZE changed from 100029 to 99469 (-1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-hk: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-hk: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-tw: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-tw: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-src: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-src: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-staticdev: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-staticdev: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PKGSIZE changed from 150439 to 149729 (-0%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PV changed from "44.0" to "45.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas: PACKAGES: added "gsettings-desktop-schemas-locale-be gsettings-desktop-schemas-locale-fa"
packages/core2-32-poky-linux/gsettings-desktop-schemas: PKGV changed from 44.0 [default] to 45.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas: SRC_URI changed from "https://download.gnome.org/sources//gsettings-desktop-schemas/44/gsettings-desktop-schemas-44.0.tar.xz;name=archive" to "https://download.gnome.org/sources//gsettings-desktop-schemas/45/gsettings-desktop-schemas-45.0.tar.xz;name=archive"
packages/core2-32-poky-linux/gsettings-desktop-schemas: PV changed from "44.0" to "45.0"

--===============6852629782076057289==--

