Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20FDD5CCB0
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:38 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17188.1765872139220084245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WRUQp3Qh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dt1b8svb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262ebdf9-be8d9cbc-6522-4e22-a042-a6f0b2061ce3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872156;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rsKbyCAeHsD5+vJ0Ywynal4SnUSSU+U4hCsDe/CwfqE=;
	b=WRUQp3Qh5Vsc91WHWXScyACcbbxU8EAS4cPW4oilm3AjPJfWH5QOe1Ig4eASDxPC
	x98z1w88DwCOemACxlyv/V2YASlF/hnMHpTn0BAzF2MH1rs8GQ5Yzymrmmc+QTXNcQv
	+obz29rpkrcEQ1qeacZzrJ4sinSC0sxDXPEYGam0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872156;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rsKbyCAeHsD5+vJ0Ywynal4SnUSSU+U4hCsDe/CwfqE=;
	b=dt1b8svb9lklHzlMHMhux8/8Hf5bGlRs/FbOYmj5TotOKJC8WY0M+wNFfzqQZ6tr
	37hNDLUwGcYFWHebdIxPhy8GgMC97UcNdxFpkrZhKi9gqUtzyP9Cw3Y08Ke0eGAAALZ
	A7w1d/Odd98EXaNY1xc0AE7cHElpu37fuyKBWuj8=
Content-Type: multipart/mixed; boundary="===============7270266832367701035=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] epiphany: upgrading to 49.2 FAILED
Message-ID: <0101019b262ebdf9-be8d9cbc-6522-4e22-a042-a6f0b2061ce3-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227857

--===============7270266832367701035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *49.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-48.5-49.2.patch
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
From a74e88de2a4ffb4a19c8717edf9b478264d38f40 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 03:41:56 +0000
Subject: [PATCH] epiphany: upgrade 48.5 -> 49.2

---
 .../epiphany/{epiphany_48.5.bb => epiphany_49.2.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_48.5.bb => epiphany_49.2.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.5.bb b/meta/recipes-gnome/epiphany/epiphany_49.2.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_48.5.bb
rename to meta/recipes-gnome/epiphany/epiphany_49.2.bb
index 6a1abdc553..acd1aa3f08 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.5.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_49.2.bb
@@ -31,7 +31,7 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "0f66552ad6593c7952a3ddee5bf515656c8c434871076d9f1a91a7af9346b1b4"
+SRC_URI[archive.sha256sum] = "b3ba3d68213e87f81f1733e85500c37b82b5938f9009e4fe89994963d5fb2b8e"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 6c00ab9b40..36d83becf2 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 91045ece41faefbeac14b60d7b19b0c652e586fb Mon Sep 17 00:00:00 2001
+From 5dacdfbd037fd67609f0325dbe88c874c7723c93 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index 54a3305aaf..19ced08d62 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 46084da03b5f20423a2946d988c68e9ea9339c9c Mon Sep 17 00:00:00 2001
+From 8b3011af1d8a767924d63b9df9d73e09cb8f2a6c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index df0340c..8ec6c79 100644
+index ba09333..49a2aa8 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 8ebcdc9991..58207c585c 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From ca504370b9aa893ceac21141d8f24e28a474b674 Mon Sep 17 00:00:00 2001
+From 1ef0652cb890aa0ebf0cff1626e5cf59ca3fa26b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.47.1


--===============7270266832367701035==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-48.5-49.2.patch"

RnJvbSBhNzRlODhkZTJhNGZmYjRhMTljODcxN2VkZjliNDc4MjY0ZDM4ZjQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDM6NDE6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0OC41IC0+IDQ5LjIKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80OC41LmJiID0+IGVwaXBoYW55XzQ5LjIuYmJ9ICAgICAgICAgICB8IDIgKy0KIC4uLi9maWxl
cy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggfCAy
ICstCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gg
ICAgICAgICAgIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWln
cmF0b3IucGF0Y2ggICAgICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2VwaXBo
YW55L3tlcGlwaGFueV80OC41LmJiID0+IGVwaXBoYW55XzQ5LjIuYmJ9ICg5NCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ4LjUuYmIgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDkuMi5iYgpzaW1pbGFyaXR5IGluZGV4
IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDgu
NS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ5LjIu
YmIKaW5kZXggNmExYWJkYzU1My4uYWNkMWFhM2YwOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ4LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21l
L2VwaXBoYW55L2VwaXBoYW55XzQ5LjIuYmIKQEAgLTMxLDcgKzMxLDcgQEAgU1JDX1VSSSArPSAi
XAogICAgICAgICAgICBmaWxlOi8vbWlncmF0b3IucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8v
ZGlzdHJpYnV0b3IucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2
c3VtXSA9ICIwZjY2NTUyYWQ2NTkzYzc5NTJhM2RkZWU1YmY1MTU2NTZjOGM0MzQ4NzEwNzZkOWYx
YTkxYTdhZjkzNDZiMWI0IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYjNiYTNkNjgy
MTNlODdmODFmMTczM2U4NTUwMGMzN2I4MmI1OTM4ZjkwMDllNGZlODk5OTQ5NjNkNWZiMmI4ZSIK
IAogIyBEZXZlbG9wZXIgbW9kZSBlbmFibGVzIGRlYnVnZ2luZwogUEFDS0FHRUNPTkZJR1tkZXZl
bG9wZXItbW9kZV0gPSAiLURkZXZlbG9wZXJfbW9kZT10cnVlLC1EZGV2ZWxvcGVyX21vZGU9ZmFs
c2UiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1o
ZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRo
ZS11c2Utb2YteWVscC5wYXRjaAppbmRleCA2YzAwYWI5YjQwLi4zNmQ4M2JlY2YyIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1
aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9t
ZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9m
LXllbHAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDkxMDQ1ZWNlNDFmYWVmYmVhYzE0YjYw
ZDdiMTliMGM2NTJlNTg2ZmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDVkYWNkZmJk
MDM3ZmQ2NzYwOWYwMzI1ZGJlODhjODc0Yzc3MjNjOTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6
IFdlZCwgMzEgSmFuIDIwMTggMTU6NTA6MzggKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gaGVscC9t
ZXNvbi5idWlsZDogZGlzYWJsZSB0aGUgdXNlIG9mIHllbHAKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCBiL21ldGEvcmVjaXBl
cy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaAppbmRleCA1NGEzMzA1YWFm
Li4xOWNlZDA4ZDYyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmls
ZXMvZGlzdHJpYnV0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2Zp
bGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NjA4NGRhMDNiNWYy
MDQyM2EyOTQ2ZDk4OGM2OGU5ZWE5MzM5YzljIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA4YjMwMTFhZjFkOGE3Njc5MjRkNjNiOWRmOWQ3M2UwOWNiOGYyYTZjIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91
bmRhdGlvbi5vcmc+CiBEYXRlOiBGcmksIDI2IEZlYiAyMDIxIDEwOjE3OjUyICswMDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIERvbid0IGVuY29kZSB0aGUgZGlzdHJvIGZyb20gL2V0Yy9vcy1yZWxlYXNl
IGludG8gdGhlCkBAIC0xMSw3ICsxMSw3IEBAIFJQIDIwMjEvMi8yNgogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWls
ZAotaW5kZXggZGYwMzQwYy4uOGVjNmM3OSAxMDA2NDQKK2luZGV4IGJhMDkzMzMuLjQ5YTJhYTgg
MTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC0xNSw2ICsx
NSw3IEBAIGlmIHIucmV0dXJuY29kZSgpID09IDAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
bm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9l
cGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaAppbmRleCA4ZWJjZGM5OTkxLi41ODIwN2M1ODVj
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3Iu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjYTUwNDM3MGI5YWE4OTNjZWFjMjExNDFkOGYyNGUy
OGE0NzRiNjc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxZWYwNjUyY2I4OTBhYTBl
YmYwY2ZmMTYyNmU1Y2Y1OWNhM2ZhMjZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
UmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRl
OiBUaHUsIDI1IEZlYiAyMDIxIDE0OjUyOjMyICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGVwaXBo
YW55OiBGaXggcmVwcm9kdWNpYmlsaXR5IGlzc3VlCi0tIAoyLjQ3LjEKCg==

--===============7270266832367701035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-54c5d2e2a7f828e0d699fd2fcde6c1a651d34372"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:54c5d2e2a7f828e0d699fd2fcde6c1a651d34372"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 400 Local 388 Mirrors 0 Missed 12 Current 1396 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1779 of 1796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_recipe_qa_setscene)
NOTE: recipe epiphany-49.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe epiphany-49.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4374 of 4921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_fetch)
NOTE: Running task 4617 of 4921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_write_config)
NOTE: recipe epiphany-49.2-r0: task do_fetch: Started
NOTE: recipe epiphany-49.2-r0: task do_fetch: Succeeded
NOTE: Running task 4798 of 4921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_unpack)
NOTE: Running task 4799 of 4921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-49.2-r0: task do_write_config: Started
NOTE: recipe epiphany-49.2-r0: task do_unpack: Started
NOTE: recipe epiphany-49.2-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-49.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-49.2-r0: task do_unpack: Succeeded
NOTE: Running task 4905 of 4921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_patch)
NOTE: Running task 4906 of 4921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-49.2-r0: task do_patch: Started
NOTE: recipe epiphany-49.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-49.2-r0: task do_patch: Succeeded
NOTE: Running task 4907 of 4921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 4908 of 4921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_populate_lic)
NOTE: recipe epiphany-49.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-49.2-r0: task do_populate_lic: Started
NOTE: recipe epiphany-49.2-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_populate_lic unihash changed to 74914a526f84b0428a31b6f999e30fd9a9a7f272bc23f528d73520af81bba88f
NOTE: recipe epiphany-49.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_deploy_source_date_epoch unihash changed to 1fa55205fe96370413a3eadfd5caa432b1d803804b078751047365c2f8fb1cec
NOTE: Setscene tasks completed
NOTE: recipe epiphany-49.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe epiphany-49.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4909 of 4921 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_configure)
NOTE: Setscene tasks completed
NOTE: recipe epiphany-49.2-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.0.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_populate_sysroot', '/srv/pokybuild/
 yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_49.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/buil
 d/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-c
 ore/gettext/gettext_0.26.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/b
 uild/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'libclc', 'llvm-tblgen-native', 'llvm', 'cmake-native', 'desktop-file-utils', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'libstd-rs', 'vala', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gcr', 'gdk-pixbuf', 'gobject-introspection', 'gsettings-desktop-schemas', 'gtk+3', 'gtk4', 'hicolor-icon-theme', 'json-glib', 'libadwaita', 'libdazzle', 'libgudev', 'libhandy', 'libnotify', 'libportal', 'librsvg', 'libsecret', 'libxmlb', 'cairo', 'libdrm', '
 fontconfig', 'freetype', 'graphene', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'libglu', 'mesa', 'pango', 'spirv-headers', 'spirv-llvm-translator', 'spirv-tools', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxcomposite', 'libxcursor', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxi', 'libxinerama', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxt', 'libxtst', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'tiff', 'libvorbis', 'sbc', 'libwebp', 'libwpe', 'webkitgtk', 'wpebackend-fdo', 'appstream', 'aspell', 'at-spi2-core', 'acl', 'attr', 'bash-completion', 'curl', 'enchant2', 'fribidi', 'gdbm', 'gmp', 'gnut
 ls', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libical', 'libmicrohttpd', 'libpcre2', 'libpsl', 'libseccomp', 'libsoup', 'libunistring', 'libusb1', 'libxslt', 'libyaml', 'nettle', 'nghttp2', 'p11-kit', 'shared-mime-info', 'sqlite3', 'openssl-native', 'coreutils-native', 'dbus-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'llvm-native', 'desktop-file-utils-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'patchelf-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-docutils-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'cargo-c-native', 'cargo-native'
 , 'rust-native', 'vala-native', 'bzip2-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'gdk-pixbuf-native', 'gobject-introspection-native', 'gtk+3-native', 'librsvg-native', 'cairo-native', 'fontconfig-native', 'freetype-native', 'harfbuzz-native', 'libjpeg-turbo-native', 'pango-native', 'libpthread-stubs-native', 'libx11-native', 'libxau-native', 'libxcb-native', 'libxcomposite-native', 'libxcursor-native', 'libxdamage-native', 'libxdmcp-native', 'libxext-native', 'libxfixes-native', 'libxft-native', 'libxi-native', 'libxrandr-native', 'libxrender-native', 'libxtst-native', 'pixman-native', 'xtrans-native', 'xcb-proto-native', 'xorgproto-native', 'util-macros-native', 'libpng-native', 'at-spi2-core-native', 'attr-native', 'ca-certificates-native', 'curl-native', 'fribidi-native', 'gdbm-native', 'gmp-native', 'icu-native', 'libbsd-native', 'libcap-ng-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'libssh2-native', 'mpfr-native', '
 re2c-native', 'shared-mime-info-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false...
| The Meson build system
| Version: 1.10.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/sources/epiphany-49.2
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/build
| Build type: cross build
| Project name: epiphany
| Project version: 49.2
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot (gcc 15.2.0 "x86_64-poky-linux-gcc (GCC) 15.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot ld.bfd 2.45.1.20251126
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency iso-codes found: YES 4.18.0
| Run-time dependency cairo found: YES 1.18.4
| Run-time dependency gck-2 found: YES 4.4.0.1
| Run-time dependency gcr-4 found: YES 4.4.0.1
| Run-time dependency gdk-pixbuf-2.0 found: YES 2.42.12
| Run-time dependency gio-2.0 found: YES 2.86.1
| Run-time dependency gio-unix-2.0 found: YES 2.86.1
| Run-time dependency glib-2.0 found: YES 2.86.1
| Dependency granite-7 skipped: feature granite disabled
| Run-time dependency gsettings-desktop-schemas found: YES 49.1
| Run-time dependency gstreamer-1.0 found: YES 1.26.7
| Run-time dependency gtk4 found: YES 4.20.2
| Run-time dependency gtk4-unix-print found: YES 4.20.2
| Run-time dependency hogweed found: YES 3.10.2
| Dependency iso-codes found: YES 4.18.0 (cached)
| Run-time dependency json-glib-1.0 found: YES 1.10.8
| Run-time dependency libarchive found: YES 3.8.3
| Run-time dependency libadwaita-1 found: YES 1.8.1
| Run-time dependency libsecret-1 found: YES 0.21.7
| Run-time dependency libsoup-3.0 found: YES 3.6.5
| Run-time dependency libxml-2.0 found: YES 2.15.1
| Run-time dependency nettle found: YES 3.10.2
| Run-time dependency libportal-gtk4 found: YES 0.9.1
| Run-time dependency sqlite3 found: YES 3.51.1
| Run-time dependency webkitgtk-6.0 found: YES 2.50.0
| Run-time dependency webkitgtk-web-process-extension-6.0 found: YES 2.50.0
| Configuring config.h.in using configuration
| Library gmp found: YES
| Library m found: YES
| Compiler for C supports arguments -Werror=declaration-after-statement: YES
| Compiler for C supports arguments -Werror=implicit-function-declaration: YES
| Compiler for C supports arguments -Wno-cast-function-type: YES
| Compiler for C supports arguments -Wno-missing-field-initializers: YES
| Compiler for C supports arguments -Wno-unused-parameter: YES
| Configuring org.gnome.Epiphany.desktop.in using configuration
| Program msgfmt found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/msgfmt)
| Configuring org.gnome.Epiphany.metainfo.xml.in using configuration
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program glib-compile-schemas found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-compile-schemas)
| Configuring org.gnome.Epiphany.SearchProvider.service using configuration
| Configuring org.gnome.Epiphany.WebAppProvider.service using configuration
| Configuring org.gnome.Epiphany.SearchProvider.ini using configuration
| Configuring default-bookmarks.rdf using configuration
| Program rst2man found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/rst2man)
| Program desktop-file-validate found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/desktop-file-validate)
| Program appstreamcli found: NO
| Program msginit found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/msginit)
| Program msgmerge found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/msgmerge)
| Program xgettext found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/xgettext)
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/pkg-config-native) 0.29.2
| Build-time dependency gio-2.0 found: YES 2.86.1
| Program glib-compile-resources found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-compile-resources)
| Dependency gio-2.0 found: YES 2.86.1 (cached)
| Program glib-compile-resources found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-compile-resources)
| Build-time dependency glib-2.0 found: YES 2.86.1
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.86.1 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency gio-2.0 found: YES 2.86.1 (cached)
| Program glib-compile-resources found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-compile-resources)
| Dependency glib-2.0 found: YES 2.86.1 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.86.1 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.86.1 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.86.1 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program blueprint-compiler found: NO
| 
| ../sources/epiphany-49.2/src/meson.build:119:12: ERROR: Program 'blueprint-compiler' not found or not executable
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.86.1 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.86.1 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.86.1 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program blueprint-compiler found: NO
| 
| ../sources/epiphany-49.2/src/meson.build:119:12: ERROR: Program 'blueprint-compiler' not found or not executable
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/run.do_configure.2023944:172 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/run.do_configure.2023944, line 172
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/run.do_configure.2023944, line 161
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/run.do_configure.2023944, line 148
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/run.do_configure.2023944, line 185
NOTE: recipe epiphany-49.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4909 tasks of which 4900 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216034138.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216034138.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/log.do_configure.2023944
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-49.2-r0 do_configure: meson setup failed
ERROR: epiphany-49.2-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/run.do_configure.2023944' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/log.do_configure.2023944
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_configure) failed with exit code '1'

--===============7270266832367701035==--

