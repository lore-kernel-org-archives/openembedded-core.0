Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172EDC48BEF
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:16 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.2124.1706810407980020566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ecap/WFj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JI8L8xPZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d65d3fa05-8ad72d5b-a988-4b27-896a-ac038edd0c44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=snqEmZd9PjS2LWEAfzEzWSodzEEqDaF5pI6G+hFaZLk=;
	b=ecap/WFjCEi+mt7YWTeyhYq3KzwIxsXRKo4xFY4U4F1181YUbbFNkdM8XOT5B2M4
	gK22gif3pdb5hg3h0h1XIyFkqpkBlXPc7WrKrB6b+4SgGkbZU46N59XMS70P1XPCYpj
	FZxAjttmnNa7s8rjed5Y2dUi92EKknppsoiSgrzA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=snqEmZd9PjS2LWEAfzEzWSodzEEqDaF5pI6G+hFaZLk=;
	b=JI8L8xPZyJo6n+ewyD7gYr9RXUc1CoWcUR5l6AynF88T14dpj+PP48Jj4NU7hdzP
	B7mStLmIP8bx5dy6KdVnasCgW7B1YKnWG6Y0DfGtiiItoz6KuPVpwkVIKat9mwYN18J
	O/tleUZWdW1edOzkgzvTNfhf7fJpa/3dVMGrPul4=
Content-Type: multipart/mixed; boundary="===============0563723336745590962=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-utils: upgrading to 1.2.11 SUCCEEDED
Message-ID: <0101018d65d3fa05-8ad72d5b-a988-4b27-896a-ac038edd0c44-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194697

--===============0563723336745590962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-utils* to *1.2.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-utils-upgrade-1.2.10-1.2.11.patch
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
From ea75d2b3986c5b97fc48367ec62f528bbaa725f5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 14:23:25 +0000
Subject: [PATCH] alsa-utils: upgrade 1.2.10 -> 1.2.11

---
 .../0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch  | 8 +++-----
 .../alsa-utils/0001-topology.c-include-locale.h.patch     | 8 +++-----
 .../alsa/{alsa-utils_1.2.10.bb => alsa-utils_1.2.11.bb}   | 2 +-
 3 files changed, 7 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.10.bb => alsa-utils_1.2.11.bb} (98%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch
index 0ebf98b41e..cbb7ef617e 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch
@@ -1,4 +1,4 @@
-From 35a3382f3818d29b60f4c888e338189a4d93d0e5 Mon Sep 17 00:00:00 2001
+From 6954da56164cc02df72ebb0ac5d4b54aef290541 Mon Sep 17 00:00:00 2001
 From: Michael Opdenacker <michael.opdenacker@bootlin.com>
 Date: Tue, 19 Sep 2023 11:47:50 +0200
 Subject: [PATCH] nhlt/nhlt-dmic-info.c: include sys/types.h
@@ -10,12 +10,13 @@ https://github.com/alsa-project/alsa-utils/issues/238
 
 Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/0925ad7f09b2dc77015784f9ac2f5e34dd0dd5c3]
 Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
+
 ---
  nhlt/nhlt-dmic-info.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/nhlt/nhlt-dmic-info.c b/nhlt/nhlt-dmic-info.c
-index 3f6c64d..331555a 100644
+index 7726c3c..c130396 100644
 --- a/nhlt/nhlt-dmic-info.c
 +++ b/nhlt/nhlt-dmic-info.c
 @@ -33,6 +33,7 @@
@@ -26,6 +27,3 @@ index 3f6c64d..331555a 100644
  #include <arpa/inet.h>
  
  int debug = 0;
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch
index e1c7470356..32d5eab4c0 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch
@@ -1,4 +1,4 @@
-From d8a8a9affd5726827ef3995652248595b4a8c87e Mon Sep 17 00:00:00 2001
+From a6f11606c3c53001b2b30ad951931ac694bcb721 Mon Sep 17 00:00:00 2001
 From: Michael Opdenacker <michael.opdenacker@bootlin.com>
 Date: Tue, 19 Sep 2023 11:27:46 +0200
 Subject: [PATCH] topology.c: include locale.h
@@ -10,12 +10,13 @@ https://github.com/alsa-project/alsa-utils/issues/239
 
 Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/8c229270f6bae83b705a03714c46067a7aa57b02]
 Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
+
 ---
  topology/topology.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/topology/topology.c b/topology/topology.c
-index 1840ffe..5d03a8b 100644
+index 9752f88..470b7fb 100644
 --- a/topology/topology.c
 +++ b/topology/topology.c
 @@ -32,6 +32,7 @@
@@ -26,6 +27,3 @@ index 1840ffe..5d03a8b 100644
  
  #include <alsa/asoundlib.h>
  #include <alsa/topology.h>
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb
similarity index 98%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb
index 4e5ed8dfa0..7f920ab740 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.11.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2
            file://0001-topology.c-include-locale.h.patch \
            file://0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch \
            "
-SRC_URI[sha256sum] = "104b62ec7f02a7ce16ca779f4815616df1cc21933503783a9107b5944f83063a"
+SRC_URI[sha256sum] = "9ac6ca3a883f151e568dcf979b8d2e5cbecc51b819bb0e6bb8a2e9b34cc428a7"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.42.0


--===============0563723336745590962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-eu: PKGSIZE changed from 33988 to 27242 (-20%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-fr: PKGSIZE changed from 34051 to 27137 (-20%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ka: PKGSIZE changed from 67405 to 57505 (-15%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ko: PKGSIZE changed from 33516 to 27097 (-19%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-sk: PKGSIZE changed from 35146 to 28240 (-20%)

--===============0563723336745590962==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-utils-upgrade-1.2.10-1.2.11.patch"

RnJvbSBlYTc1ZDJiMzk4NmM1Yjk3ZmM0ODM2N2VjNjJmNTI4YmJhYTcyNWY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNDoyMzoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFs
c2EtdXRpbHM6IHVwZ3JhZGUgMS4yLjEwIC0+IDEuMi4xMQoKLS0tCiAuLi4vMDAwMS1uaGx0LW5o
bHQtZG1pYy1pbmZvLmMtaW5jbHVkZS1zeXMtdHlwZXMuaC5wYXRjaCAgfCA4ICsrKy0tLS0tCiAu
Li4vYWxzYS11dGlscy8wMDAxLXRvcG9sb2d5LmMtaW5jbHVkZS1sb2NhbGUuaC5wYXRjaCAgICAg
fCA4ICsrKy0tLS0tCiAuLi4vYWxzYS97YWxzYS11dGlsc18xLjIuMTAuYmIgPT4gYWxzYS11dGls
c18xLjIuMTEuYmJ9ICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS97YWxz
YS11dGlsc18xLjIuMTAuYmIgPT4gYWxzYS11dGlsc18xLjIuMTEuYmJ9ICg5OCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzLzAwMDEtbmhsdC1u
aGx0LWRtaWMtaW5mby5jLWluY2x1ZGUtc3lzLXR5cGVzLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHMvMDAwMS1uaGx0LW5obHQtZG1pYy1pbmZvLmMtaW5j
bHVkZS1zeXMtdHlwZXMuaC5wYXRjaAppbmRleCAwZWJmOThiNDFlLi5jYmI3ZWY2MTdlIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHMvMDAwMS1uaGx0
LW5obHQtZG1pYy1pbmZvLmMtaW5jbHVkZS1zeXMtdHlwZXMuaC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHMvMDAwMS1uaGx0LW5obHQtZG1pYy1pbmZv
LmMtaW5jbHVkZS1zeXMtdHlwZXMuaC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzVhMzM4
MmYzODE4ZDI5YjYwZjRjODg4ZTMzODE4OWE0ZDkzZDBlNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNjk1NGRhNTYxNjRjYzAyZGY3MmViYjBhYzVkNGI1NGFlZjI5MDU0MSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRl
bmFja2VyQGJvb3RsaW4uY29tPgogRGF0ZTogVHVlLCAxOSBTZXAgMjAyMyAxMTo0Nzo1MCArMDIw
MAogU3ViamVjdDogW1BBVENIXSBuaGx0L25obHQtZG1pYy1pbmZvLmM6IGluY2x1ZGUgc3lzL3R5
cGVzLmgKQEAgLTEwLDEyICsxMCwxMyBAQCBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0
L2Fsc2EtdXRpbHMvaXNzdWVzLzIzOAogCiBVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRw
czovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMvY29tbWl0LzA5MjVhZDdmMDli
MmRjNzcwMTU3ODRmOWFjMmY1ZTM0ZGQwZGQ1YzNdCiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIE9w
ZGVuYWNrZXIgPG1pY2hhZWwub3BkZW5hY2tlckBib290bGluLmNvbT4KKwogLS0tCiAgbmhsdC9u
aGx0LWRtaWMtaW5mby5jIHwgMSArCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAK
IGRpZmYgLS1naXQgYS9uaGx0L25obHQtZG1pYy1pbmZvLmMgYi9uaGx0L25obHQtZG1pYy1pbmZv
LmMKLWluZGV4IDNmNmM2NGQuLjMzMTU1NWEgMTAwNjQ0CitpbmRleCA3NzI2YzNjLi5jMTMwMzk2
IDEwMDY0NAogLS0tIGEvbmhsdC9uaGx0LWRtaWMtaW5mby5jCiArKysgYi9uaGx0L25obHQtZG1p
Yy1pbmZvLmMKIEBAIC0zMyw2ICszMyw3IEBACkBAIC0yNiw2ICsyNywzIEBAIGluZGV4IDNmNmM2
NGQuLjMzMTU1NWEgMTAwNjQ0CiAgI2luY2x1ZGUgPGFycGEvaW5ldC5oPgogIAogIGludCBkZWJ1
ZyA9IDA7Ci0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9hbHNhL2Fsc2EtdXRpbHMvMDAwMS10b3BvbG9neS5jLWluY2x1ZGUtbG9jYWxlLmgucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHMvMDAwMS10b3BvbG9neS5j
LWluY2x1ZGUtbG9jYWxlLmgucGF0Y2gKaW5kZXggZTFjNzQ3MDM1Ni4uMzJkNWVhYjRjMCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzLzAwMDEtdG9w
b2xvZ3kuYy1pbmNsdWRlLWxvY2FsZS5oLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2Fsc2EvYWxzYS11dGlscy8wMDAxLXRvcG9sb2d5LmMtaW5jbHVkZS1sb2NhbGUuaC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDhhOGE5YWZmZDU3MjY4MjdlZjM5OTU2NTIyNDg1OTVi
NGE4Yzg3ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTZmMTE2MDZjM2M1MzAwMWIy
YjMwYWQ5NTE5MzFhYzY5NGJjYjcyMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1p
Y2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQGJvb3RsaW4uY29tPgogRGF0ZTog
VHVlLCAxOSBTZXAgMjAyMyAxMToyNzo0NiArMDIwMAogU3ViamVjdDogW1BBVENIXSB0b3BvbG9n
eS5jOiBpbmNsdWRlIGxvY2FsZS5oCkBAIC0xMCwxMiArMTAsMTMgQEAgaHR0cHM6Ly9naXRodWIu
Y29tL2Fsc2EtcHJvamVjdC9hbHNhLXV0aWxzL2lzc3Vlcy8yMzkKIAogVXBzdHJlYW0tU3RhdHVz
OiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXV0aWxzL2Nv
bW1pdC84YzIyOTI3MGY2YmFlODNiNzA1YTAzNzE0YzQ2MDY3YTdhYTU3YjAyXQogU2lnbmVkLW9m
Zi1ieTogTWljaGFlbCBPcGRlbmFja2VyIDxtaWNoYWVsLm9wZGVuYWNrZXJAYm9vdGxpbi5jb20+
CisKIC0tLQogIHRvcG9sb2d5L3RvcG9sb2d5LmMgfCAxICsKICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL3RvcG9sb2d5L3RvcG9sb2d5LmMgYi90b3BvbG9n
eS90b3BvbG9neS5jCi1pbmRleCAxODQwZmZlLi41ZDAzYThiIDEwMDY0NAoraW5kZXggOTc1MmY4
OC4uNDcwYjdmYiAxMDA2NDQKIC0tLSBhL3RvcG9sb2d5L3RvcG9sb2d5LmMKICsrKyBiL3RvcG9s
b2d5L3RvcG9sb2d5LmMKIEBAIC0zMiw2ICszMiw3IEBACkBAIC0yNiw2ICsyNywzIEBAIGluZGV4
IDE4NDBmZmUuLjVkMDNhOGIgMTAwNjQ0CiAgCiAgI2luY2x1ZGUgPGFsc2EvYXNvdW5kbGliLmg+
CiAgI2luY2x1ZGUgPGFsc2EvdG9wb2xvZ3kuaD4KLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlsc18xLjIuMTAuYmIgYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjExLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11
dGlsc18xLjIuMTAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxz
YS11dGlsc18xLjIuMTEuYmIKaW5kZXggNGU1ZWQ4ZGZhMC4uN2Y5MjBhYjc0MCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4xMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjExLmJiCkBAIC0y
OCw3ICsyOCw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cuYWxzYS1wcm9qZWN0Lm9yZy9maWxl
cy9wdWIvdXRpbHMvYWxzYS11dGlscy0ke1BWfS50YXIuYnoyCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLXRvcG9sb2d5LmMtaW5jbHVkZS1sb2NhbGUuaC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLW5obHQtbmhsdC1kbWljLWluZm8uYy1pbmNsdWRlLXN5cy10eXBlcy5oLnBhdGNoIFwK
ICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEwNGI2MmVjN2YwMmE3Y2UxNmNh
Nzc5ZjQ4MTU2MTZkZjFjYzIxOTMzNTAzNzgzYTkxMDdiNTk0NGY4MzA2M2EiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiOWFjNmNhM2E4ODNmMTUxZTU2OGRjZjk3OWI4ZDJlNWNiZWNjNTFiODE5YmIw
ZTZiYjhhMmU5YjM0Y2M0MjhhNyIKIAogIyBPbiBidWlsZCBtYWNoaW5lcyB3aXRoIHB5dGhvbi1k
b2N1dGlscyAobm90IHB5dGhvbjMtZG9jdXRpbHMgISEpIGluc3RhbGxlZAogIyByc3QybWFuIChu
b3QgcnN0Mm1hbi5weSkgaXMgZGV0ZWN0ZWQgYW5kIGNvbXBpbGUgZmFpbHMgd2l0aAotLSAKMi40
Mi4wCgo=

--===============0563723336745590962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/alsa-utils/alsa-utils-aconnect: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aconnect: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsactl: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsactl: PKGSIZE changed from 155063 to 155039 (-0%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsactl: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsaloop: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsaloop: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsamixer: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsamixer: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsatplg: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsatplg: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsaucm: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-alsaucm: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-amixer: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-amixer: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aplay: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aplay: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aseqdump: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aseqdump: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aseqnet: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-aseqnet: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-dbg: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-dbg: PKGSIZE changed from 2067120 to 2075256 (+0%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-dbg: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-dev: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-dev: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-doc: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-doc: PKGSIZE changed from 99933 to 100549 (+1%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-doc: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-iecset: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-iecset: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-de: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-de: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-eu: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-eu: PKGSIZE changed from 33988 to 27242 (-20%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-eu: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-fr: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-fr: PKGSIZE changed from 34051 to 27137 (-20%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-fr: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ja: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ja: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ka: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ka: PKGSIZE changed from 67405 to 57505 (-15%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ka: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ko: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ko: PKGSIZE changed from 33516 to 27097 (-19%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ko: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ru: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-ru: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-sk: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-sk: PKGSIZE changed from 35146 to 28240 (-20%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-locale-sk: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-midi: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-midi: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-nhltdmicinfo: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-nhltdmicinfo: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-scripts: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-scripts: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-speakertest: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-speakertest: PKGSIZE changed from 1259824 to 1268024 (+1%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-speakertest: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-src: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-src: FILELIST: directory renamed /usr/src/debug/alsa-utils/1.2.10/axfer -> /usr/src/debug/alsa-utils/1.2.11/axfer, directory renamed /usr/src/debug/alsa-utils/1.2.10/seq/aseqdump -> /usr/src/debug/alsa-utils/1.2.11/seq/aseqdump, directory renamed /usr/src/debug/alsa-utils/1.2.10/topology/nhlt/intel/dmic -> /usr/src/debug/alsa-utils/1.2.11/topology/nhlt/intel/dmic, directory renamed /usr/src/debug/alsa-utils/1.2.10/topology/nhlt/intel -> /usr/src/debug/alsa-utils/1.2.11/topology/nhlt/intel, directory renamed /usr/src/debug/alsa-utils/1.2.10/alsactl -> /usr/src/debug/alsa-utils/1.2.11/alsactl, directory renamed /usr/src/debug/alsa-utils/1.2.10/nhlt -> /usr/src/debug/alsa-utils/1.2.11/nhlt, directory renamed /usr/src/debug/alsa-utils/1.2.10/seq/aconnect -> /usr/src/debug/alsa-utils/1.2.11/seq/aconnect, directory renamed /usr/src/debug/alsa-utils/1.2.10/aplay -> /usr/src/debug/alsa-utils/1.2.11/aplay, directory renamed /usr/src/debug/als
 a-utils/1.2.10/amidi -> /usr/src/debug/alsa-utils/1.2.11/amidi, directory renamed /usr/src/debug/alsa-utils/1.2.10/topology/nhlt -> /usr/src/debug/alsa-utils/1.2.11/topology/nhlt, directory renamed /usr/src/debug/alsa-utils/1.2.10/alsamixer -> /usr/src/debug/alsa-utils/1.2.11/alsamixer, directory renamed /usr/src/debug/alsa-utils/1.2.10/amixer -> /usr/src/debug/alsa-utils/1.2.11/amixer, directory renamed /usr/src/debug/alsa-utils/1.2.10/seq/aseqnet -> /usr/src/debug/alsa-utils/1.2.11/seq/aseqnet, directory renamed /usr/src/debug/alsa-utils/1.2.10/iecset -> /usr/src/debug/alsa-utils/1.2.11/iecset, directory renamed /usr/src/debug/alsa-utils/1.2.10/topology -> /usr/src/debug/alsa-utils/1.2.11/topology, directory renamed /usr/src/debug/alsa-utils/1.2.10/topology/nhlt/intel/ssp -> /usr/src/debug/alsa-utils/1.2.11/topology/nhlt/intel/ssp, directory renamed /usr/src/debug/alsa-utils/1.2.10/seq/aplaymidi -> /usr/src/debug/alsa-utils/1.2.11/seq/aplaymidi, directory renamed /usr/src/debug/al
 sa-utils/1.2.10/alsaloop -> /usr/src/debug/alsa-utils/1.2.11/alsaloop, directory renamed /usr/src/debug/alsa-utils/1.2.10/alsaucm -> /usr/src/debug/alsa-utils/1.2.11/alsaucm, removed "/usr/src/debug/alsa-utils/1.2.10/speaker-test/speaker-test.c /usr/src/debug/alsa-utils/1.2.10/speaker-test/pink.h /usr/src/debug/alsa-utils/1.2.10/speaker-test/pink.c", added "/usr/src/debug/alsa-utils/1.2.11/speaker-test/speaker-test.c /usr/src/debug/alsa-utils/1.2.11/speaker-test/st2095.h /usr/src/debug/alsa-utils/1.2.11/speaker-test/st2095.c /usr/src/debug/alsa-utils/1.2.11/speaker-test/pink.c /usr/src/debug/alsa-utils/1.2.11/speaker-test/pink.h"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-src: PKGSIZE changed from 1334189 to 1348749 (+1%)
packages/core2-64-poky-linux/alsa-utils/alsa-utils-src: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils-staticdev: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils-staticdev: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils/alsa-utils: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils/alsa-utils: PV changed from "1.2.10" to "1.2.11"
packages/core2-64-poky-linux/alsa-utils: PKGV changed from 1.2.10 [default] to 1.2.11 [default]
packages/core2-64-poky-linux/alsa-utils: SRC_URI changed from "https://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.10.tar.bz2 file://0001-topology.c-include-locale.h.patch file://0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch" to "https://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.11.tar.bz2 file://0001-topology.c-include-locale.h.patch file://0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch"
packages/core2-64-poky-linux/alsa-utils: PV changed from "1.2.10" to "1.2.11"

--===============0563723336745590962==--

