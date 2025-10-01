Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC3ECCD187
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:35 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.18095.1759325549074673367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eqXWeR1u;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RlnZFyWE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101999ff96f43-8f3efdfb-e383-4961-b785-7824ba45ebe1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325548;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OrYtRCcUw36had/ScvxP4wRyT5Nlhj6qZzxLo4ze1ik=;
	b=eqXWeR1uJCikcZVEbCJf2dk+gSLB5EDND3JBjkO7EtmiXVPBxb8ly70pqolEXzgT
	2L6KJeC1R9kT9RxsL39bys7MX52Is9CmoWz3J0QVZB//YJlqR9Y+B0eO+F4k+8zHOZG
	Ra4sts5slSWxjWKU95yDE3oCEUj6c1U1kPZgdG5U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325548;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OrYtRCcUw36had/ScvxP4wRyT5Nlhj6qZzxLo4ze1ik=;
	b=RlnZFyWEmZp9amOJlxUcSBnY+2slLzrr6xvEVuFJMQ10/UY6RR28xJw1HrBLjnuT
	74Bwc94AZ3sX6VCApssCXwA7TpFzPKCD6HfO2s7Te6GuCJnqYpZ/4ciwHDzJmDpD2EC
	O3zrkCimKa2/di5Uj8QIiQHdWLrPzLT0C2+CJPkI=
Content-Type: multipart/mixed; boundary="===============7987764670102080994=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] epiphany: upgrading to 49.0 FAILED
Message-ID: <010101999ff96f43-8f3efdfb-e383-4961-b785-7824ba45ebe1-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224267

--===============7987764670102080994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *49.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-48.5-49.0.patch
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
From fa2e377c3ecbbb8956451930f512127b8961f9b2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 11:09:44 +0000
Subject: [PATCH] epiphany: upgrade 48.5 -> 49.0

---
 .../epiphany/{epiphany_48.5.bb => epiphany_49.0.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_48.5.bb => epiphany_49.0.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.5.bb b/meta/recipes-gnome/epiphany/epiphany_49.0.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_48.5.bb
rename to meta/recipes-gnome/epiphany/epiphany_49.0.bb
index 8129cd79f8..4bb6592425 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.5.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_49.0.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "0f66552ad6593c7952a3ddee5bf515656c8c434871076d9f1a91a7af9346b1b4"
+SRC_URI[archive.sha256sum] = "271ec735b9836b97449e32793d354a8afb6b9f8d2d3d75821885d5e155707929"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 6c00ab9b40..d9ca68d18e 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 91045ece41faefbeac14b60d7b19b0c652e586fb Mon Sep 17 00:00:00 2001
+From caf6f1ce0b2a57e848140845247078cb39bc076a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index 54a3305aaf..a2d08cbbef 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 46084da03b5f20423a2946d988c68e9ea9339c9c Mon Sep 17 00:00:00 2001
+From ff032f5454a33431be237eb57d4c061637933363 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index df0340c..8ec6c79 100644
+index 3d98fef..a1b99f6 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 8ebcdc9991..d476be538a 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From ca504370b9aa893ceac21141d8f24e28a474b674 Mon Sep 17 00:00:00 2001
+From 3d647099b4cd8a8f6afec9c79364f2eabbde7f41 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.47.1


--===============7987764670102080994==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-48.5-49.0.patch"

RnJvbSBmYTJlMzc3YzNlY2JiYjg5NTY0NTE5MzBmNTEyMTI3Yjg5NjFmOWIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAxMTowOTo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
aXBoYW55OiB1cGdyYWRlIDQ4LjUgLT4gNDkuMAoKLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBoYW55
XzQ4LjUuYmIgPT4gZXBpcGhhbnlfNDkuMC5iYn0gICAgICAgICAgIHwgMiArLQogLi4uL2ZpbGVz
LzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCB8IDIg
Ky0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCAg
ICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdy
YXRvci5wYXRjaCAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkve2VwaXBoYW55XzQ4LjUuYmIgPT4gZXBpcGhhbnlfNDkuMC5iYn0gKDk0JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDguNS5iYiBiL21ldGEv
cmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80OS4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80OC41
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDkuMC5i
YgppbmRleCA4MTI5Y2Q3OWY4Li40YmI2NTkyNDI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDguNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUv
ZXBpcGhhbnkvZXBpcGhhbnlfNDkuMC5iYgpAQCAtMzEsNyArMzEsNyBAQCBTUkNfVVJJID0gIiR7
R05PTUVfTUlSUk9SfS8ke0dOT01FQk59LyR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0i
LCAxKX0vJHtHTgogICAgICAgICAgICBmaWxlOi8vbWlncmF0b3IucGF0Y2ggXAogICAgICAgICAg
ICBmaWxlOi8vZGlzdHJpYnV0b3IucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW2FyY2hp
dmUuc2hhMjU2c3VtXSA9ICIwZjY2NTUyYWQ2NTkzYzc5NTJhM2RkZWU1YmY1MTU2NTZjOGM0MzQ4
NzEwNzZkOWYxYTkxYTdhZjkzNDZiMWI0IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAi
MjcxZWM3MzViOTgzNmI5NzQ0OWUzMjc5M2QzNTRhOGFmYjZiOWY4ZDJkM2Q3NTgyMTg4NWQ1ZTE1
NTcwNzkyOSIKIAogIyBEZXZlbG9wZXIgbW9kZSBlbmFibGVzIGRlYnVnZ2luZwogUEFDS0FHRUNP
TkZJR1tkZXZlbG9wZXItbW9kZV0gPSAiLURkZXZlbG9wZXJfbW9kZT10cnVlLC1EZGV2ZWxvcGVy
X21vZGU9ZmFsc2UiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmls
ZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1k
aXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaAppbmRleCA2YzAwYWI5YjQwLi5kOWNhNjhkMThl
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxw
LW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10
aGUtdXNlLW9mLXllbHAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDkxMDQ1ZWNlNDFmYWVm
YmVhYzE0YjYwZDdiMTliMGM2NTJlNTg2ZmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGNhZjZmMWNlMGIyYTU3ZTg0ODE0MDg0NTI0NzA3OGNiMzliYzA3NmEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KIERhdGU6IFdlZCwgMzEgSmFuIDIwMTggMTU6NTA6MzggKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gaGVscC9tZXNvbi5idWlsZDogZGlzYWJsZSB0aGUgdXNlIG9mIHllbHAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCBiL21l
dGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaAppbmRleCA1
NGEzMzA1YWFmLi5hMmQwOGNiYmVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBp
cGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NjA4
NGRhMDNiNWYyMDQyM2EyOTQ2ZDk4OGM2OGU5ZWE5MzM5YzljIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBmZjAzMmY1NDU0YTMzNDMxYmUyMzdlYjU3ZDRjMDYxNjM3OTMzMzYzIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBGcmksIDI2IEZlYiAyMDIxIDEwOjE3OjUyICsw
MDAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvbid0IGVuY29kZSB0aGUgZGlzdHJvIGZyb20gL2V0Yy9v
cy1yZWxlYXNlIGludG8gdGhlCkBAIC0xMSw3ICsxMSw3IEBAIFJQIDIwMjEvMi8yNgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9t
ZXNvbi5idWlsZAotaW5kZXggZGYwMzQwYy4uOGVjNmM3OSAxMDA2NDQKK2luZGV4IDNkOThmZWYu
LmExYjk5ZjYgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBA
IC0xNSw2ICsxNSw3IEBAIGlmIHIucmV0dXJuY29kZSgpID09IDAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaCBiL21ldGEvcmVjaXBl
cy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaAppbmRleCA4ZWJjZGM5OTkxLi5k
NDc2YmU1MzhhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMv
bWlncmF0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21p
Z3JhdG9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjYTUwNDM3MGI5YWE4OTNjZWFjMjEx
NDFkOGYyNGUyOGE0NzRiNjc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzZDY0NzA5
OWI0Y2Q4YThmNmFmZWM5Yzc5MzY0ZjJlYWJiZGU3ZjQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc+CiBEYXRlOiBUaHUsIDI1IEZlYiAyMDIxIDE0OjUyOjMyICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGVwaXBoYW55OiBGaXggcmVwcm9kdWNpYmlsaXR5IGlzc3VlCi0tIAoyLjQ3LjEKCg==

--===============7987764670102080994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1939 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1939 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-03432f7d0f1df8aad488dc4da71cfba98fec7fc9"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:03432f7d0f1df8aad488dc4da71cfba98fec7fc9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 630 Local 618 Mirrors 0 Missed 12 Current 1168 (98% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1744 of 1798 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_49.0.bb:do_recipe_qa_setscene)
NOTE: recipe epiphany-49.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe epiphany-49.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4377 of 4924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_49.0.bb:do_fetch)
NOTE: Running task 4620 of 4924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_49.0.bb:do_write_config)
NOTE: recipe epiphany-49.0-r0: task do_fetch: Started
NOTE: recipe epiphany-49.0-r0: task do_write_config: Started
NOTE: recipe epiphany-49.0-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-49.0-r0: task do_fetch: Succeeded
NOTE: Running task 4906 of 4924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_49.0.bb:do_unpack)
NOTE: Running task 4907 of 4924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_49.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-49.0-r0: task do_unpack: Started
NOTE: recipe epiphany-49.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-49.0-r0: task do_unpack: Succeeded
NOTE: Running task 4908 of 4924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_49.0.bb:do_patch)
NOTE: Running task 4909 of 4924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_49.0.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-49.0-r0: task do_patch: Started
NOTE: recipe epiphany-49.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-49.0-r0: task do_patch: Succeeded
NOTE: Running task 4910 of 4924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_49.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4911 of 4924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_49.0.bb:do_populate_lic)
NOTE: recipe epiphany-49.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-49.0-r0: task do_populate_lic: Started
NOTE: recipe epiphany-49.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_49.0.bb:do_deploy_source_date_epoch unihash changed to cd388ade9f68a630e68c005192518a9c6dbfdb7bf05b28fc9bf0d3657db060cd
NOTE: recipe epiphany-49.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_49.0.bb:do_populate_lic unihash changed to c9817f0c640b6350eb92738f198fecf879270dfb8896b3b402d0ccba205a4ea6
NOTE: Setscene tasks completed
NOTE: recipe epiphany-49.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe epiphany-49.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4912 of 4924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_49.0.bb:do_configure)
NOTE: Setscene tasks completed
NOTE: recipe epiphany-49.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_10.0.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:d
 o_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webk
 it/webkitgtk_2.48.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.26.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.9.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_populate_sysro
 ot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'binutils', 'clang', 'libclc', 'cmake-native', 'desktop-file-utils', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'libstd-rs', 'vala', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gcr', 'gdk-pixbuf', 'gobject-introspection', 'gsettings-desktop-schemas', 'gtk+3', 'gtk4', 'hicolor-icon-theme', 'json-glib', 'libadwaita', 'libdazzle', 'libgudev', 'libhandy', 'libnotify', 'libportal', 'librsvg', 'libsecret', 'libxmlb', 'cairo', 'libdrm', 'fontconfi
 g', 'freetype', 'graphene', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'libglu', 'mesa', 'pango', 'spirv-headers', 'spirv-llvm-translator', 'spirv-tools', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxcomposite', 'libxcursor', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxi', 'libxinerama', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxt', 'libxtst', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'tiff', 'libvorbis', 'sbc', 'libwebp', 'libwpe', 'webkitgtk', 'wpebackend-fdo', 'appstream', 'aspell', 'at-spi2-core', 'acl', 'attr', 'bash-completion', 'curl', 'enchant2', 'fribidi', 'gdbm', 'gmp', 'gnutls', 'lib
 tasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libical', 'libmicrohttpd', 'libpcre2', 'libpsl', 'libseccomp', 'libsoup', 'libunistring', 'libusb1', 'libxslt', 'libyaml', 'nettle', 'nghttp2', 'p11-kit', 'shared-mime-info', 'sqlite3', 'openssl-native', 'coreutils-native', 'dbus-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'desktop-file-utils-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'patchelf-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-docutils-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'cargo-c-native', 'cargo-native', 'rust-llvm-native', 'r
 ust-native', 'vala-native', 'bzip2-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'gdk-pixbuf-native', 'gobject-introspection-native', 'gtk+3-native', 'librsvg-native', 'cairo-native', 'fontconfig-native', 'freetype-native', 'harfbuzz-native', 'libjpeg-turbo-native', 'pango-native', 'libpthread-stubs-native', 'libx11-native', 'libxau-native', 'libxcb-native', 'libxcomposite-native', 'libxcursor-native', 'libxdamage-native', 'libxdmcp-native', 'libxext-native', 'libxfixes-native', 'libxft-native', 'libxi-native', 'libxrandr-native', 'libxrender-native', 'libxtst-native', 'pixman-native', 'xtrans-native', 'xcb-proto-native', 'xorgproto-native', 'util-macros-native', 'libpng-native', 'at-spi2-core-native', 'attr-native', 'ca-certificates-native', 'curl-native', 'fribidi-native', 'gdbm-native', 'gmp-native', 'icu-native', 'libbsd-native', 'libcap-ng-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'libssh2-native', 'mpfr-native', 're2c
 -native', 'shared-mime-info-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false...
| The Meson build system
| Version: 1.9.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.0/sources/epiphany-49.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.0/build
| Build type: cross build
| Project name: epiphany
| Project version: 49.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.0/recipe-sysroot (gcc 15.2.0 "x86_64-poky-linux-gcc (GCC) 15.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.0/recipe-sysroot ld.bfd 2.45.0.20250908
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.0/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency iso-codes found: YES 4.18.0
| Run-time dependency cairo found: YES 1.18.4
| Run-time dependency gck-2 found: YES 4.4.0.1
| Run-time dependency gcr-4 found: YES 4.4.0.1
| Run-time dependency gdk-pixbuf-2.0 found: YES 2.42.12
| Run-time dependency gio-2.0 found: YES 2.86.0
| Run-time dependency gio-unix-2.0 found: YES 2.86.0
| Run-time dependency glib-2.0 found: YES 2.86.0
| Dependency granite-7 skipped: feature granite disabled
| Run-time dependency gsettings-desktop-schemas found: YES 48.0
| Run-time dependency gstreamer-1.0 found: YES 1.26.5
| Run-time dependency gtk4 found: YES 4.18.6
| Run-time dependency gtk4-unix-print found: YES 4.18.6
| Run-time dependency hogweed found: YES 3.10.2
| Dependency iso-codes found: YES 4.18.0 (cached)
| Run-time dependency json-glib-1.0 found: YES 1.10.6
| Run-time dependency libarchive found: YES 3.8.1
| Dependency libadwaita-1 found: NO. Found 1.7.6 but need: '>= 1.8.alpha'
| Found CMake: NO
| Run-time dependency libadwaita-1 found: NO
| 
| ../sources/epiphany-49.0/meson.build:102:17: ERROR: Dependency lookup for libadwaita-1 with method 'pkgconfig' failed: Invalid version, need 'libadwaita-1' ['>= 1.8.alpha'] found '1.7.6'.
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.0/temp/run.do_configure.3317254:171 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.0/temp/run.do_configure.3317254, line 171
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.0/temp/run.do_configure.3317254, line 160
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.0/temp/run.do_configure.3317254, line 149
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.0/temp/run.do_configure.3317254, line 184
NOTE: recipe epiphany-49.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4912 tasks of which 4903 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001110926.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001110926.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_49.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.0/temp/log.do_configure.3317254
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-49.0-r0 do_configure: meson failed
ERROR: epiphany-49.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.0/temp/run.do_configure.3317254' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.0/temp/log.do_configure.3317254
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_49.0.bb:do_configure) failed with exit code '1'

--===============7987764670102080994==--

