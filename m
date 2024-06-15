Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6217EC3DA41
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:28 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.18617.1718475800083956066
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NkjZL9aa;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DF+rztTS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101901d23bbc0-2242e9cb-6537-4967-ae10-3213c481c758-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lFvTMcj+q6LWsJRLa9OBh8ZTSFMd3Cm7Djd211DkDH8=;
	b=NkjZL9aauEMFiMoHVZScM+woE7Jdie0QMH8GAgFyS4hCqWcdswtAtfrvCV5xRSHv
	cpSlXUy0d55EZU/tQBQtDRCTdzYAdniuFFsOT6kka3CATDj3zkqe51rotC83M7i2BsB
	/iXIL4nxEfYYuJHfHlvnwnPWiNGXBB+7AgmRzvns=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lFvTMcj+q6LWsJRLa9OBh8ZTSFMd3Cm7Djd211DkDH8=;
	b=DF+rztTS6xuCNcibnf/LS92D9YwaaWCibg1GyB2jhdeS8OrIN8n4LoYeHZmtIJHe
	09M2guYC58eAZDrdltY7aPEgR+iqgLThF2+wyQnJm+86cvFh3J1rnv/1+Nas1WSRjEj
	P4qj8ay22NI8rYlcgAYwuWQHXKK8drPY9MLLaUx4=
Content-Type: multipart/mixed; boundary="===============3611717578214104047=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 46.1 SUCCEEDED
Message-ID: <010101901d23bbc0-2242e9cb-6537-4967-ae10-3213c481c758-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200725

--===============3611717578214104047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *46.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-46.0-46.1.patch
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
From 9f3929b9c5463f3881bb17c6c2a3b18ac43a6e29 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 13:45:55 +0000
Subject: [PATCH] epiphany: upgrade 46.0 -> 46.1

---
 .../epiphany/{epiphany_46.0.bb => epiphany_46.1.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_46.0.bb => epiphany_46.1.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_46.0.bb b/meta/recipes-gnome/epiphany/epiphany_46.1.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_46.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_46.1.bb
index 9052fe170b..db48ce803a 100644
--- a/meta/recipes-gnome/epiphany/epiphany_46.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_46.1.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "f4348f2cf51c07c0c106d130172d4d23f2cd4068771e1de007b758ca2ade5660"
+SRC_URI[archive.sha256sum] = "260f81469ed64746c2b1143f2f38bedcd96847786567b097d9f72fd3bd9db142"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index e505466764..7b7bbaa5f7 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From bd45c75fe691e275d7a7d7e641ac66b153369a1c Mon Sep 17 00:00:00 2001
+From 9706a4a7487e0f8883ec9b41b443b1249580f72c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index a2800eb62d..f75b7a90dc 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From c297f5b89d7c8e98ac98e1d9a7506df6db6fc025 Mon Sep 17 00:00:00 2001
+From 5fbb195ebf647679eabf941699b49c5a7d343a1f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index e416cc7..ee5f7b1 100644
+index f950256..3fe215d 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 1b4404c8ca..552b536a4b 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From b38a4ceaeec05efb1b822d52c43590e7fd518113 Mon Sep 17 00:00:00 2001
+From e495c70997d343d8e220abda35e4b4ab6d10369a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.44.0


--===============3611717578214104047==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-46.0-46.1.patch"

RnJvbSA5ZjM5MjliOWM1NDYzZjM4ODFiYjE3YzZjMmEzYjE4YWM0M2E2ZTI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTM6NDU6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0Ni4wIC0+IDQ2LjEKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80Ni4wLmJiID0+IGVwaXBoYW55XzQ2LjEuYmJ9ICAgICAgICAgICB8IDIgKy0KIC4uLi9maWxl
cy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggfCAy
ICstCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gg
ICAgICAgICAgIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWln
cmF0b3IucGF0Y2ggICAgICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2VwaXBo
YW55L3tlcGlwaGFueV80Ni4wLmJiID0+IGVwaXBoYW55XzQ2LjEuYmJ9ICg5NCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ2LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDYuMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDYu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ2LjEu
YmIKaW5kZXggOTA1MmZlMTcwYi4uZGI0OGNlODAzYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21l
L2VwaXBoYW55L2VwaXBoYW55XzQ2LjEuYmIKQEAgLTMxLDcgKzMxLDcgQEAgU1JDX1VSSSA9ICIk
e0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8ke0BvZS51dGlscy50cmltX3ZlcnNpb24oIiR7UFZ9
IiwgMSl9LyR7R04KICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVthcmNo
aXZlLnNoYTI1NnN1bV0gPSAiZjQzNDhmMmNmNTFjMDdjMGMxMDZkMTMwMTcyZDRkMjNmMmNkNDA2
ODc3MWUxZGUwMDdiNzU4Y2EyYWRlNTY2MCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0g
IjI2MGY4MTQ2OWVkNjQ3NDZjMmIxMTQzZjJmMzhiZWRjZDk2ODQ3Nzg2NTY3YjA5N2Q5ZjcyZmQz
YmQ5ZGIxNDIiCiAKICMgRGV2ZWxvcGVyIG1vZGUgZW5hYmxlcyBkZWJ1Z2dpbmcKIFBBQ0tBR0VD
T05GSUdbZGV2ZWxvcGVyLW1vZGVdID0gIi1EZGV2ZWxvcGVyX21vZGU9dHJ1ZSwtRGRldmVsb3Bl
cl9tb2RlPWZhbHNlIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2Zp
bGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQt
ZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2gKaW5kZXggZTUwNTQ2Njc2NC4uN2I3YmJhYTVm
NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVs
cC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUt
dGhlLXVzZS1vZi15ZWxwLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiZDQ1Yzc1ZmU2OTFl
Mjc1ZDdhN2Q3ZTY0MWFjNjZiMTUzMzY5YTFjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA5NzA2YTRhNzQ4N2UwZjg4ODNlYzliNDFiNDQzYjEyNDk1ODBmNzJjIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBXZWQsIDMxIEphbiAyMDE4IDE1OjUwOjM4ICswMjAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGhlbHAvbWVzb24uYnVpbGQ6IGRpc2FibGUgdGhlIHVzZSBvZiB5ZWxwCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKaW5kZXgg
YTI4MDBlYjYyZC4uZjc1YjdhOTBkYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9l
cGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzI5
N2Y1Yjg5ZDdjOGU5OGFjOThlMWQ5YTc1MDZkZjZkYjZmYzAyNSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gNWZiYjE5NWViZjY0NzY3OWVhYmY5NDE2OTliNDljNWE3ZDM0M2ExZiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogRnJpLCAyNiBGZWIgMjAyMSAxMDoxNzo1MiAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBEb24ndCBlbmNvZGUgdGhlIGRpc3RybyBmcm9tIC9ldGMv
b3MtcmVsZWFzZSBpbnRvIHRoZQpAQCAtMTEsNyArMTEsNyBAQCBSUCAyMDIxLzIvMjYKICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIv
bWVzb24uYnVpbGQKLWluZGV4IGU0MTZjYzcuLmVlNWY3YjEgMTAwNjQ0CitpbmRleCBmOTUwMjU2
Li4zZmUyMTVkIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBA
QCAtMTUsNiArMTUsNyBAQCBpZiByLnJldHVybmNvZGUoKSA9PSAwCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2gKaW5kZXggMWI0NDA0YzhjYS4u
NTUyYjUzNmE0YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVz
L21pZ3JhdG9yLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9t
aWdyYXRvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjM4YTRjZWFlZWMwNWVmYjFiODIy
ZDUyYzQzNTkwZTdmZDUxODExMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTQ5NWM3
MDk5N2QzNDNkOGUyMjBhYmRhMzVlNGI0YWI2ZDEwMzY5YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPgogRGF0ZTogVGh1LCAyNSBGZWIgMjAyMSAxNDo1MjozMiArMDAwMAogU3ViamVjdDogW1BB
VENIXSBlcGlwaGFueTogRml4IHJlcHJvZHVjaWJpbGl0eSBpc3N1ZQotLSAKMi40NC4wCgo=

--===============3611717578214104047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1882 targets, 46 skipped, 0 masked, 0 errors.
Removing 150 recipes from the core2-64 sysroot...done.
Removing 156 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-e5bf1c1b4fcde4ee62498255a77b3a095e950b09"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e5bf1c1b4fcde4ee62498255a77b3a095e950b09"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1241 Local 1079 Mirrors 0 Missed 162 Current 463 (86% match, 90% complete)
Removing 6 stale sstate objects for arch qemux86_64...done.
Removing 4 stale sstate objects for arch allarch...done.
Removing 7 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 468 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 489 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 501 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 510 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 515 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 520 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 525 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 530 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 535 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcr-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 536 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 537 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 538 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_recipe_qa_setscene)
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 551 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 554 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 555 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 556 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 559 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_create_spdx_setscene)
NOTE: recipe gcr-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 562 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 564 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 565 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 566 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 567 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcr-4.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 574 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 577 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_create_spdx_setscene)
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 580 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 584 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx_setscene)
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 586 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 591 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 592 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 593 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_create_spdx_setscene)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 597 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 605 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 618 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 619 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 625 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 630 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 645 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 646 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 648 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 650 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 652 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 655 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 657 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 664 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 666 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk4-4.14.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 668 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.72-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 671 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 674 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 677 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe orc-0.4.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 683 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 686 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 690 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.14.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 692 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_recipe_qa_setscene)
NOTE: recipe libsecret-0.21.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 694 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.72-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.21.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 697 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk4-4.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 698 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 700 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 703 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 705 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 708 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 710 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk4-4.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 713 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsecret-0.21.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 716 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.72-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 718 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.57.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 719 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 721 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 724 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 725 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 726 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe orc-0.4.38-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 727 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 729 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 730 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 731 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 733 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 735 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_create_spdx_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 738 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 740 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 741 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 744 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 747 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.52.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 748 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 750 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 752 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 759 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.57.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 760 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 761 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 762 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 764 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 769 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 770 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 775 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 776 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 781 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 782 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe webkitgtk-2.44.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 786 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 787 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 788 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe webkitgtk-2.44.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 791 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 792 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 796 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 797 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 799 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 801 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 803 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 805 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 806 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 807 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 809 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 810 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 819 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 820 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 821 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 822 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 825 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 826 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 828 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 829 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 830 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 831 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 833 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 843 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 849 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 850 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 852 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 856 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 859 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 861 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 863 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 866 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 867 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 870 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 871 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 876 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 879 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 884 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 886 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 890 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 891 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 893 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 895 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 896 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 898 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 900 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 902 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 903 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 904 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 905 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 907 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 910 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwpe-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 914 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 921 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 922 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 923 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 926 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 927 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 930 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 933 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 934 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwpe-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 936 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 937 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 938 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 939 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 940 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe appstream-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 942 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwpe-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 943 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 944 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 946 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 947 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 949 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 953 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 954 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 956 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 957 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 959 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 961 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 962 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe appstream-1.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 964 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 965 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 968 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 971 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_create_spdx_setscene)
NOTE: recipe appstream-1.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 972 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 976 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 977 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 978 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.14.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 980 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 981 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 982 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 983 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 985 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe enchant2-2.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 987 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 988 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 991 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 994 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 995 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 996 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 997 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 999 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1000 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1004 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1005 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1006 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1007 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.14.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe enchant2-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1008 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1010 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1012 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1013 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1015 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1016 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1017 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1018 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1020 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1022 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1023 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1025 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1026 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1027 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1029 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1034 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1035 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1038 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1042 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1044 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1047 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1048 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1050 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1051 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1053 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1055 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1059 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1062 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1064 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1065 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1068 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1070 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1072 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1073 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1074 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1076 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1077 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1079 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1080 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1081 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1083 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1084 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1085 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1086 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1087 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1089 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1090 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1092 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1094 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1095 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1097 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1100 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1105 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1106 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1108 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1109 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1110 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1111 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1112 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1114 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1115 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1117 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1118 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1119 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1121 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1123 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1124 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1129 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1131 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1133 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1134 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1138 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1139 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1140 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1141 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1143 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1145 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1147 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1149 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1151 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1152 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1153 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1155 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1157 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1160 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1161 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1163 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1164 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1166 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1168 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1169 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1170 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_create_spdx_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1172 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1173 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1174 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1176 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1177 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nghttp2-1.62.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1179 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1181 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1182 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 1183 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1184 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1186 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1187 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1188 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1189 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1191 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1192 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1199 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1200 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nghttp2-1.62.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1299 of 1704 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1422 of 1704 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1424 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cargo-native-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1426 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1427 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1428 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1429 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1430 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1432 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1434 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1435 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1437 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1440 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1442 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1443 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1445 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1448 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nghttp2-1.62.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1449 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_packagedata_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cargo-native-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1454 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1455 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1456 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1457 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1460 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1462 of 1704 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1465 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1466 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1468 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.12.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1469 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1478 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1479 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1481 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1482 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1483 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe rust-native-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1485 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1488 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1489 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1494 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1500 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1501 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.12.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1502 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1503 of 1704 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1505 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1509 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1510 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1511 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1512 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1513 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1515 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1517 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1518 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1520 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_recipe_qa_setscene)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1521 of 1704 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1522 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-native-2.12.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1523 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-native-2.12.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1526 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1529 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe rust-native-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1532 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 904 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1536 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: Running task 939 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_fetch)
NOTE: Running task 943 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_fetch)
NOTE: Running task 945 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_fetch)
NOTE: Running task 980 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 982 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1080 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_write_config)
NOTE: Running task 1081 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1082 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Started
NOTE: Running task 1085 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_write_config)
NOTE: Running task 1089 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_fetch)
NOTE: recipe harfbuzz-8.5.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1117 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: recipe harfbuzz-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: Running task 1123 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_unpack)
NOTE: Running task 1133 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1136 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_write_config)
NOTE: recipe pango-1.52.2-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Started
NOTE: Running task 1145 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Succeeded
NOTE: Running task 1170 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_fetch: Started
NOTE: recipe pango-1.52.2-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_fetch: Succeeded
NOTE: Running task 1264 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_fetch)
NOTE: Running task 1270 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_unpack)
NOTE: recipe harfbuzz-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1302 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_write_config)
NOTE: recipe pango-1.52.2-r0: task do_write_config: Succeeded
NOTE: Running task 1307 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: Running task 1330 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1375 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: Running task 1439 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_write_config: Started
NOTE: Running task 1483 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_write_config)
NOTE: Running task 1488 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Started
NOTE: Running task 1521 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1530 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1536 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_write_config: Succeeded
NOTE: Running task 1577 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1586 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_fetch)
NOTE: Running task 1606 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_fetch)
NOTE: Running task 1624 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe pango-1.52.2-r0: task do_unpack: Succeeded
NOTE: Running task 1625 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe librsvg-2.57.1-r0: task do_fetch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_fetch: Succeeded
NOTE: Running task 1626 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_unpack)
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1640 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running task 1657 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: Running task 1658 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_fetch)
NOTE: Running task 1659 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Succeeded
NOTE: Running task 1660 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_unpack)
NOTE: Running task 1661 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_patch)
NOTE: Running task 1665 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe pango-1.52.2-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 1666 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe pango-1.52.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: Running task 1669 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_fetch: Succeeded
NOTE: Running task 1674 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: Running task 1675 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 1681 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_fetch)
NOTE: Running task 1684 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_unpack: Succeeded
NOTE: Running task 1685 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1686 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_fetch: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1693 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 1694 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_write_config)
NOTE: Running task 1698 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_fetch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 1707 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: Running task 1708 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: Running task 1713 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_fetch)
NOTE: Running task 1715 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_unpack)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running task 1720 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 1721 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_patch)
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1722 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_write_config)
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: Running task 1731 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_unpack)
NOTE: recipe gtk4-4.14.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.14.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_patch: Started
NOTE: Running task 1733 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_fetch)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: Running task 1744 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_unpack)
NOTE: recipe libxmlb-0.3.19-r0: task do_write_config: Started
NOTE: Running task 1747 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1748 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe librsvg-2.57.1-r0: task do_fetch: Succeeded
NOTE: Running task 1749 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_unpack)
NOTE: recipe gtk+3-3.24.42-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: Running task 1753 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_unpack)
NOTE: recipe libxmlb-0.3.19-r0: task do_write_config: Succeeded
NOTE: Running task 1755 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe libwpe-1.16.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 1756 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libwpe-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1761 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Started
NOTE: Running task 1772 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_write_config)
NOTE: recipe libxmlb-0.3.19-r0: task do_unpack: Succeeded
NOTE: Running task 1773 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_write_config: Started
NOTE: recipe gtk4-4.14.4-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe librsvg-2.57.1-r0: task do_unpack: Started
NOTE: recipe libwpe-1.16.0-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 1778 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1783 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_write_config)
NOTE: Running task 1786 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_fetch)
NOTE: Running task 1787 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_patch: Started
NOTE: Running task 1800 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_write_config: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1810 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_write_config)
NOTE: Running task 1811 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 1815 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_write_config)
NOTE: recipe gtk+3-3.24.42-r0: task do_write_config: Started
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_patch: Started
NOTE: Running task 1844 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_unpack)
NOTE: Running task 1847 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Started
NOTE: Running task 1867 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_fetch)
NOTE: recipe gtk4-4.14.4-r0: task do_write_config: Started
NOTE: Running task 1869 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_fetch)
NOTE: Running task 1871 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_fetch)
NOTE: Running task 1872 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_fetch)
NOTE: recipe libwpe-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1873 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.14.4-r0: task do_write_config: Succeeded
NOTE: Running task 1874 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running task 1875 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_patch)
NOTE: recipe harfbuzz-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1880 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_patch)
NOTE: Running task 1881 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_generate_toolchain_file)
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Started
NOTE: recipe enchant2-2.7.3-r0: task do_fetch: Started
NOTE: recipe appstream-1.0.3-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Started
NOTE: recipe libsecret-0.21.4-r0: task do_fetch: Started
NOTE: recipe enchant2-2.7.3-r0: task do_fetch: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: Running task 1897 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_fetch)
NOTE: Running task 1900 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_fetch)
NOTE: Running task 1913 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_unpack)
NOTE: Running task 1915 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_unpack)
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Started
NOTE: Running task 1917 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_patch: Started
NOTE: Running task 1918 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_patch)
NOTE: recipe harfbuzz-8.5.0-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1919 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_unpack)
NOTE: recipe libwpe-1.16.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1920 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: recipe harfbuzz-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_fetch: Started
NOTE: Running task 1922 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_unpack)
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.7.3-r0: task do_unpack: Started
NOTE: Running task 1923 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Started
NOTE: recipe appstream-1.0.3-r0: task do_unpack: Started
NOTE: recipe libsecret-0.21.4-r0: task do_unpack: Started
NOTE: Running task 1949 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_fetch)
NOTE: Running task 1950 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_fetch)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Succeeded
NOTE: Running task 1952 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Started
NOTE: recipe enchant2-2.7.3-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Succeeded
NOTE: Running task 1953 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_patch)
NOTE: Running task 1954 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_patch)
NOTE: recipe libsecret-0.21.4-r0: task do_unpack: Succeeded
NOTE: Running task 1955 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_patch: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_fetch: Started
NOTE: Running task 1957 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_fetch)
NOTE: recipe gcr-4.3.0-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1958 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_fetch)
NOTE: Running task 1959 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_unpack)
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: Running task 1962 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_patch)
NOTE: Running task 1963 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_patch)
NOTE: Running task 1964 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_write_config)
NOTE: Running task 1966 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_unpack)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1967 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: recipe enchant2-2.7.3-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Started
NOTE: recipe appstream-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1968 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_patch)
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Started
NOTE: recipe libsecret-0.21.4-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Started
NOTE: Running task 1982 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_write_config)
NOTE: recipe gtk+3-3.24.42-r0: task do_unpack: Succeeded
NOTE: Running task 1983 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_patch)
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_unpack: Started
NOTE: recipe enchant2-2.7.3-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.4-r0: task do_patch: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Started
NOTE: Running task 2005 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_unpack)
NOTE: Running task 2006 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_patch: Started
NOTE: Running task 2008 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: Running task 2041 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_write_config)
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Started
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_patch: Started
NOTE: Running task 2042 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_unpack)
NOTE: Running task 2047 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_write_config)
NOTE: recipe libadwaita-1.5.1-r0: task do_unpack: Started
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 2048 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_unpack)
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_unpack: Succeeded
NOTE: Running task 2049 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_patch)
NOTE: recipe appstream-1.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2051 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_write_config)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: Running task 2055 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_write_config)
NOTE: recipe gcr-4.3.0-r0: task do_unpack: Started
NOTE: recipe appstream-1.0.3-r0: task do_write_config: Started
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Started
NOTE: recipe appstream-1.0.3-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_patch: Succeeded
NOTE: Running task 2065 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_recipe_qa)
NOTE: Running task 2073 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_write_config)
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 2089 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: Running task 2109 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_write_config)
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Started
NOTE: Running task 2110 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_write_config)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_patch: Started
NOTE: recipe gcr-4.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_write_config: Succeeded
NOTE: Running task 2111 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_patch)
NOTE: Running task 2113 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: Running task 2114 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_write_config)
NOTE: recipe epiphany-46.1-r0: task do_recipe_qa: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_patch: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_write_config: Started
NOTE: Running task 2116 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_write_config)
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_write_config: Started
NOTE: recipe gcr-4.3.0-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_write_config: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_patch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: Running task 2146 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_write_config)
NOTE: recipe libadwaita-1.5.1-r0: task do_write_config: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_write_config: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_patch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Started
NOTE: recipe epiphany-46.1-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_recipe_qa unihash changed to 725935dd72768ab7d2385e78fcf77b7a2b85d2b70331efc6ee20e4850e847d6b
NOTE: recipe libadwaita-1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe epiphany-46.1-r0: task do_write_config: Started
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Succeeded
NOTE: recipe epiphany-46.1-r0: task do_write_config: Succeeded
NOTE: Running task 2235 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_patch)
NOTE: Running task 2236 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_patch)
NOTE: Running task 2237 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_fetch)
NOTE: recipe libportal-0.7.1-r0: task do_patch: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_patch: Started
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Succeeded
NOTE: recipe epiphany-46.1-r0: task do_fetch: Started
NOTE: Running task 2238 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_patch)
NOTE: recipe gtk4-4.14.4-r0: task do_unpack: Succeeded
NOTE: recipe epiphany-46.1-r0: task do_fetch: Succeeded
NOTE: Running task 2239 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_unpack)
NOTE: Running task 2240 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_patch)
NOTE: recipe libadwaita-1.5.1-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Started
NOTE: recipe libportal-0.7.1-r0: task do_patch: Succeeded
NOTE: recipe epiphany-46.1-r0: task do_unpack: Started
NOTE: recipe gtk4-4.14.4-r0: task do_patch: Started
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.14.4-r0: task do_patch: Succeeded
NOTE: recipe epiphany-46.1-r0: task do_unpack: Succeeded
NOTE: Running task 2245 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1542 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1543 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1544 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1545 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1546 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1547 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_packagedata_setscene)
NOTE: recipe epiphany-46.1-r0: task do_patch: Started
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1548 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1550 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1551 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1554 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1556 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe epiphany-46.1-r0: task do_patch: Succeeded
NOTE: Running task 2248 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2249 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_populate_lic)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe epiphany-46.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-46.1-r0: task do_populate_lic: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1560 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe epiphany-46.1-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-46.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_populate_lic unihash changed to 105a6665f6b1f10b21336e9efa1db098e255e948b10202a5b65b835d4fd48a0a
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_deploy_source_date_epoch unihash changed to c70eb2b46f14daa326fb4bf180ebef0dbeb3d981c09f693e7d59ed99aebdc877
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1562 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1564 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1565 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1566 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1567 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1568 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1569 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1570 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1571 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1572 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1573 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1574 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1575 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1577 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1578 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1580 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1582 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1584 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1585 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1589 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1590 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1591 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1594 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1596 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1597 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1599 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/xz/5.4.6/temp/log.do_packagedata_setscene.152191
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1600 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1602 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1604 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1605 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1607 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1608 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1610 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1612 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1614 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1615 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1617 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1619 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1620 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1622 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1624 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1629 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1631 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1634 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1636 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1638 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1640 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1642 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1643 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1645 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: Running task 2757 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2811 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_patch: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1647 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1648 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1650 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1651 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1652 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1653 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1655 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1658 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1660 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.57.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1662 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1663 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1665 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe webkitgtk-2.44.1-r0: task do_patch: Succeeded
NOTE: Running task 3028 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_patch)
NOTE: Running task 3029 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_generate_toolchain_file)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe librsvg-2.57.1-r0: task do_patch: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1667 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_patch: Succeeded
NOTE: Running task 3047 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_rust_gen_targets)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1669 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1670 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1672 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_rust_gen_targets: Started
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.57.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1674 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1675 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1676 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1678 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1679 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1683 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1684 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1686 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 3054 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1691 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1693 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1694 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c8afda1b9ad17f0a32fe2282140fb9fbfb6a58c64c5c1f9fe1f3c72112aae711
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash ccce9cbdf6642d1558578ebf62c73ee30fc8a946c79c935fbeee7ca9a0dcb7c2 to wss://hashserv.yoctoproject.org/ws ({'taskhash': 'ba94fb39d0f09767a4abfc36e1dce38427c09dd633f66d32361c3877527bcca8', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'ccce9cbdf6642d1558578ebf62c73ee30fc8a946c79c935fbeee7ca9a0dcb7c2'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed ba94fb39d0f09767a4abfc36e1dce38427c09dd633f66d32361c3877527bcca8 -> ccce9cbdf6642d1558578ebf62c73ee30fc8a946c79c935fbeee7ca9a0dcb7c2 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1697 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1699 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1700 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1702 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1704 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3491 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3503 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3511 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3518 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata)
NOTE: Running task 3529 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3572 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3665 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.6-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3853 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3884 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3902 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3939 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3994 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3995 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_configure)
NOTE: Running task 4000 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4033 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 84b5de9da03360a64d4498693efe2cfbc1fd74dd8432b0d807425ead25b5c926
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4048 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Started
NOTE: Running task 4056 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 4058 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4108 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4109 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_configure)
NOTE: recipe libsecret-0.21.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4110 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4111 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_collect_spdx_deps)
NOTE: Running task 4112 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4113 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_configure)
NOTE: recipe harfbuzz-8.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4114 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4115 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4116 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_configure)
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4117 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure)
NOTE: Running task 4118 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_configure)
NOTE: recipe libxmlb-0.3.19-r0: task do_configure: Started
NOTE: Running task 4119 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4120 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_configure)
NOTE: recipe harfbuzz-8.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe enchant2-2.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 4122 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_configure)
NOTE: Running task 4134 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Started
NOTE: Running task 4135 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_configure)
NOTE: recipe enchant2-2.7.3-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4136 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_configure)
NOTE: recipe libsecret-0.21.4-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4137 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_configure: Started
NOTE: Running task 4148 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4149 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Succeeded
NOTE: Running task 4150 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 4151 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 4152 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_configure: Succeeded
NOTE: Running task 4153 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Succeeded
NOTE: Running task 4154 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure_ptest_base)
NOTE: recipe libxmlb-0.3.19-r0: task do_configure_ptest_base: Started
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Succeeded
NOTE: Running task 4155 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_compile)
NOTE: recipe libxmlb-0.3.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4156 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_compile)
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4157 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile)
NOTE: recipe libsecret-0.21.4-r0: task do_configure: Succeeded
NOTE: Running task 4158 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_compile)
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_compile: Started
NOTE: Running task 4159 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_install)
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.4-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 4160 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_configure: Succeeded
NOTE: Running task 4161 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Succeeded
NOTE: Running task 4162 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_configure: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_configure: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_compile: Succeeded
NOTE: Running task 4163 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_compile)
NOTE: Running task 4164 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_compile)
NOTE: Running task 4165 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_package)
NOTE: recipe harfbuzz-8.5.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4166 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 4167 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 4168 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_configure: Succeeded
NOTE: Running task 4169 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_configure_ptest_base)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_install: Succeeded
NOTE: Running task 4195 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package: Started
NOTE: Running task 4196 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 4197 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4198 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 4199 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: Running task 4200 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4201 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_compile: Succeeded
NOTE: Running task 4202 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_compile_ptest_base)
NOTE: recipe libxmlb-0.3.19-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Succeeded
NOTE: Running task 4203 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile_ptest_base)
NOTE: recipe libxmlb-0.3.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4204 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_install)
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_install: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4205 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4206 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 4207 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe json-glib-1.8.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 4208 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_install: Succeeded
NOTE: Running task 4209 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_install_ptest_base)
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Succeeded
NOTE: Running task 4210 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_compile)
NOTE: recipe libxmlb-0.3.19-r0: task do_install_ptest_base: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 89a31abb58b04059382842e7c2dfa95c9cb3ddef23a8aad6807ce1964434f929
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_install_ptest_base: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_install: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4211 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_compile)
NOTE: Running task 4212 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 4213 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 4214 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_populate_sysroot)
NOTE: Running task 4215 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.21.4-r0: task do_compile: Succeeded
NOTE: Running task 4216 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_compile: Succeeded
NOTE: Running task 4217 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_install)
NOTE: recipe libsecret-0.21.4-r0: task do_install: Started
NOTE: Running task 4218 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install_ptest_base)
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata unihash changed to 8d42225cf16ea14c91d12bb7b4a579d9da7ce9c56b4d13e08a70c62dfd9ada0f
NOTE: Setscene tasks completed
NOTE: Running task 4219 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_package)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_install: Started
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_package: Started
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4237 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4239 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_collect_spdx_deps)
NOTE: Running task 4240 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 4241 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe appstream-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.4-r0: task do_install: Succeeded
NOTE: Running task 4242 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4243 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_package)
NOTE: recipe libsecret-0.21.4-r0: task do_populate_sysroot: Started
NOTE: Running task 4244 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_packagedata)
NOTE: Running task 4245 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_populate_sysroot)
NOTE: recipe libsecret-0.21.4-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 4246 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_package)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_package: Started
NOTE: recipe appstream-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4247 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_packagedata: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_packagedata unihash changed to bf88fc637d9aaf793b7993fe7454bab7e89b8e6f1143577de980159353f6b745
NOTE: recipe libsecret-0.21.4-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4248 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_configure)
NOTE: Running task 4257 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_package)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_configure: Started
NOTE: Running task 4258 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.8.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Started
NOTE: Running task 4259 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_package)
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Started
NOTE: recipe libsoup-3.4.4-r0: task do_install: Succeeded
NOTE: Running task 4260 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 4261 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4262 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_package)
NOTE: recipe libsoup-3.4.4-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to 0c96fbcecdb2fa28c70c0d2bc142c4aab0f5187cf17bf72a352db885b7a58d2a
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4263 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure_ptest_base)
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4264 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_compile)
NOTE: Running task 4265 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_packagedata)
NOTE: Running task 4280 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_populate_sysroot)
NOTE: Running task 4283 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4284 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_packagedata unihash changed to 5e3d95224ff1dd8f7e1afe54f43122e3f78ee69885ef9b83ceaa92e8b447b714
NOTE: Setscene tasks completed
NOTE: Running task 4306 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4313 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4333 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4334 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4335 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: Running task 4336 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4337 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: Running task 4338 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 4360 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_collect_spdx_deps)
NOTE: Running task 4373 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe appstream-1.0.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4374 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_compile)
NOTE: recipe libxmlb-0.3.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Succeeded
NOTE: Running task 4382 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_collect_spdx_deps)
NOTE: recipe appstream-1.0.3-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 4383 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_create_spdx)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata unihash changed to e283c57b77fdbcfa35ed13366bdcf4542140757e4c0aa4d35005154f1fb15217
NOTE: recipe libxmlb-0.3.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe enchant2-2.7.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_create_spdx: Started
NOTE: recipe enchant2-2.7.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4384 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: Running task 4385 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_create_spdx)
NOTE: Running task 4387 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_create_spdx: Started
NOTE: recipe libsecret-0.21.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsecret-0.21.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4388 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4389 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: Running task 4396 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 4399 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_ipk)
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_create_spdx: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_ipk: Started
NOTE: Running task 4400 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_deb)
NOTE: Running task 4401 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_deb: Started
NOTE: recipe appstream-1.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to ec62f56a5bb00583a2f0d46a73b365d3ebb32f6fe0734fb0170cff0305c8451c
NOTE: Setscene tasks completed
NOTE: Running task 4402 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe appstream-1.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4403 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_ipk)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_ipk: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_package: Succeeded
NOTE: Running task 4404 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_deb)
NOTE: Running task 4405 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_deb: Started
NOTE: recipe libsecret-0.21.4-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.21.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_packagedata unihash changed to 2d4044a2134f281219704cacfecaf1d27e182e5ebe57ebdf3a2a697f9c3e79da
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4406 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_compile_ptest_base)
NOTE: Running task 4407 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_create_spdx)
NOTE: recipe json-glib-1.8.0-r0: task do_package: Succeeded
NOTE: Running task 4408 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libsecret-0.21.4-r0: task do_create_spdx: Started
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4409 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata unihash changed to 78b79ac3443087ea75e71864e879e6541736eb3a7d72e0e93f1751bd856b272b
NOTE: recipe libsoup-3.4.4-r0: task do_package: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_ipk unihash changed to ea265fa8c4a2f615113304b0f6459e1c16549b26920cf240eef949792016b312
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_deb unihash changed to 4a53d19358037b2351cf557a980b21f23f70d274c6ac0fe5d438d11c540eca3e
NOTE: Setscene tasks completed
NOTE: Running task 4410 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile_ptest_base)
NOTE: Running task 4411 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata)
NOTE: Running task 4412 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_create_spdx)
NOTE: Running task 4413 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_rpm)
NOTE: Running task 4414 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Started
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.8.0-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4415 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install)
NOTE: Running task 4416 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_install: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 4417 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_install_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata unihash changed to eb27cc5f8dc1b568dd2efd352587d89b6fed58461697490f438a8999d0ce9460
NOTE: recipe libsecret-0.21.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_install_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 4418 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4419 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_populate_sysroot)
NOTE: Running task 4420 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_package)
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_package: Succeeded
NOTE: Running task 4421 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Succeeded
NOTE: Running task 4422 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_packagedata unihash changed to 96ed447f6c4159532560ecac41e1ac3456613d4b9082ba3b00d2af800f1e4bf5
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4423 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot)
NOTE: Running task 4424 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package)
NOTE: Running task 4425 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_ipk unihash changed to 5afb1b65935a8194dc0decac1b7fbab77ef05137b5e26546e0314c1c9ea63819
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4426 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 4427 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_install)
NOTE: recipe appstream-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 4428 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_install)
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Started
NOTE: recipe appstream-1.0.3-r0: task do_install: Started
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4429 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_configure)
NOTE: recipe enchant2-2.7.3-r0: task do_configure: Succeeded
NOTE: Running task 4430 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_compile)
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Started
NOTE: recipe enchant2-2.7.3-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 4431 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 4432 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_package)
NOTE: recipe appstream-1.0.3-r0: task do_install: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Started
NOTE: Running task 4433 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Started
NOTE: Running task 4434 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_package)
NOTE: recipe appstream-1.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-1.0.3-r0: task do_package: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Succeeded
NOTE: Running task 4435 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_compile)
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_rpm unihash changed to f0f864a72c2174fb93c46aa5e5433a34858782878094cd62c3869557afe85134
NOTE: recipe enchant2-2.7.3-r0: task do_compile: Succeeded
NOTE: Running task 4436 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_install)
NOTE: recipe enchant2-2.7.3-r0: task do_install: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 4437 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata unihash changed to 56aadb1fefba7703aab17e6e4fa6913b585f80efd46e005ea246eb42570018cc
NOTE: Setscene tasks completed
NOTE: Running task 4438 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_create_spdx)
NOTE: recipe enchant2-2.7.3-r0: task do_install: Succeeded
NOTE: Running task 4439 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_populate_sysroot)
NOTE: Running task 4440 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_package)
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Started
NOTE: recipe enchant2-2.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.7.3-r0: task do_package: Started
NOTE: recipe enchant2-2.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 4441 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_packagedata)
NOTE: recipe appstream-1.0.3-r0: task do_packagedata: Started
NOTE: recipe appstream-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_packagedata unihash changed to 27f562aff5495b1ac1ab65a37c01816f0b40bb6d83b65685244526012978b0fc
NOTE: Setscene tasks completed
NOTE: Running task 4442 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_create_spdx)
NOTE: recipe appstream-1.0.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_package: Succeeded
NOTE: Running task 4443 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.7.3-r0: task do_package: Succeeded
NOTE: Running task 4444 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_packagedata)
NOTE: recipe enchant2-2.7.3-r0: task do_packagedata: Started
NOTE: recipe appstream-1.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_packagedata unihash changed to a787cdd4772458dd3d0f724719f31b27b463012750252cf32648816312629773
NOTE: recipe enchant2-2.7.3-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_packagedata unihash changed to 30f61281fe7adb0069cfbd9e5641499241d777308b64a085417ba011331d1f7e
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_deb unihash changed to 669620fad828bea938fb8bdfcc0606738e4d67cab236f79115f546752f2c5f13
NOTE: Setscene tasks completed
NOTE: Running task 4445 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata)
NOTE: Running task 4446 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_create_spdx)
NOTE: Running task 4447 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_create_spdx: Started
NOTE: recipe enchant2-2.7.3-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Succeeded
NOTE: Running task 4448 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_install)
NOTE: recipe libnotify-0.8.3-r0: task do_install: Started
NOTE: recipe enchant2-2.7.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata unihash changed to 679828fb55a818c8e1a1d980b7dc2a99b8bdf180dc2cb138dc2e27fe4e20131a
NOTE: recipe libnotify-0.8.3-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4449 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx)
NOTE: Running task 4450 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_populate_sysroot)
NOTE: Running task 4451 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_package)
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_package: Started
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 4452 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_collect_spdx_deps)
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnotify-0.8.3-r0: task do_package: Succeeded
NOTE: Running task 4453 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata)
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata unihash changed to ed751fc70fde2edbd646eb84da73be891910049ac55945fe42d3c2440787fb03
NOTE: Setscene tasks completed
NOTE: Running task 4454 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_rpm unihash changed to ea25d3f1b475612c5dad6ee7f280aefde75e4c7155066cc142acad957d1a6e2d
NOTE: recipe harfbuzz-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 4455 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_install)
NOTE: recipe harfbuzz-8.5.0-r0: task do_install: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 4456 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_populate_sysroot)
NOTE: Running task 4457 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_package)
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_package: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4458 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.52.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.52.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4459 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_configure)
NOTE: recipe pango-1.52.2-r0: task do_configure: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 4460 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_packagedata)
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_packagedata unihash changed to b37fe409cb82d2d036d47314190da61ef5525901d73f26c2c78bda8e0efd0992
NOTE: Setscene tasks completed
NOTE: Running task 4461 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.5.0-r0: task do_create_spdx: Started
NOTE: recipe pango-1.52.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4462 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_configure_ptest_base)
NOTE: recipe pango-1.52.2-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.52.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4463 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_compile)
NOTE: recipe pango-1.52.2-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4464 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.52.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.52.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_compile: Succeeded
NOTE: Running task 4465 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_compile_ptest_base)
NOTE: recipe pango-1.52.2-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.52.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4466 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_install)
NOTE: recipe pango-1.52.2-r0: task do_install: Started
NOTE: recipe pango-1.52.2-r0: task do_install: Succeeded
NOTE: Running task 4467 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_install_ptest_base)
NOTE: recipe pango-1.52.2-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.52.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4468 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_populate_sysroot)
NOTE: Running task 4469 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_package)
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.52.2-r0: task do_package: Started
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4470 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.57.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.57.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4471 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.57.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.57.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 4472 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_configure)
NOTE: recipe librsvg-2.57.1-r0: task do_configure: Started
NOTE: recipe pango-1.52.2-r0: task do_package: Succeeded
NOTE: Running task 4473 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_packagedata)
NOTE: recipe pango-1.52.2-r0: task do_packagedata: Started
NOTE: recipe pango-1.52.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_packagedata unihash changed to cb7abccfc23bd40e81555cab8ff436d7c4879b7f129c9445e74dd4849630ab1e
NOTE: Setscene tasks completed
NOTE: Running task 4474 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_create_spdx)
NOTE: recipe pango-1.52.2-r0: task do_create_spdx: Started
NOTE: recipe pango-1.52.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4475 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.57.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.57.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Succeeded
NOTE: Running task 4476 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_install)
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Succeeded
NOTE: Running task 4477 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot)
NOTE: Running task 4478 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_package)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Started
NOTE: recipe librsvg-2.57.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4479 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_compile)
NOTE: recipe librsvg-2.57.1-r0: task do_compile: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4480 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4481 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4482 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4483 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4484 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: Running task 4485 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe libwpe-1.16.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libwpe-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 4486 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_compile)
NOTE: recipe libwpe-1.16.0-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 4487 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_install)
NOTE: recipe libwpe-1.16.0-r0: task do_install: Started
NOTE: recipe libwpe-1.16.0-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 4488 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: Running task 4489 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: Running task 4490 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_populate_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 4491 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 4492 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4493 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4494 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Succeeded
NOTE: Running task 4495 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_packagedata)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 4496 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: Running task 4497 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_create_spdx)
NOTE: Running task 4498 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe libwpe-1.16.0-r0: task do_package: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx: Started
NOTE: recipe libwpe-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 4499 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_packagedata)
NOTE: recipe libwpe-1.16.0-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: Running task 4500 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libwpe-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_packagedata unihash changed to bc0ca43dcdbc0591a5b1cac808e72880afe04f501211c6cc5ad2ed112a59dbbe
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 4501 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata unihash changed to 492d23c5097252bc14cc226ece05ce72dc0b27a6046ac4433547ecf7b015c4f5
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 4502 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 4503 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4504 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4505 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4506 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4507 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4508 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 4509 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: Running task 4510 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: Running task 4511 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.42-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4512 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4513 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libwpe-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4514 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe libwpe-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to 43f95212f41cc8aad3f1492633ad9166176f2a25bd7ace34f6a20b49d19e17c1
NOTE: Setscene tasks completed
NOTE: Running task 4515 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libwpe-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4516 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 4517 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4518 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_collect_spdx_deps)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4519 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_compile)
NOTE: recipe gtk+3-3.24.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_compile: Succeeded
NOTE: Running task 4520 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_install)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_install: Succeeded
NOTE: Running task 4521 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_populate_sysroot)
NOTE: Running task 4522 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_package)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4523 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_compile)
NOTE: recipe gtk+3-3.24.42-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_package: Succeeded
NOTE: Running task 4524 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_packagedata unihash changed to cddde9201287508cf1428e67cbc3d5ed5a3fa72f8126d09f22f6f5dabffe441c
NOTE: Setscene tasks completed
NOTE: Running task 4525 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_create_spdx)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_create_spdx: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_compile: Succeeded
NOTE: Running task 4526 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_install: Succeeded
NOTE: Running task 4527 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_populate_sysroot)
NOTE: Running task 4528 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_package: Succeeded
NOTE: Running task 4529 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_packagedata unihash changed to 30c647b24d1259641c3ece1de46107f0aff0e6219115c19cc4a8c25198a00d94
NOTE: Setscene tasks completed
NOTE: Running task 4530 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_compile: Succeeded
NOTE: Running task 4531 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_install)
NOTE: recipe gtk+3-3.24.42-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_install: Succeeded
NOTE: Running task 4532 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_populate_sysroot)
NOTE: Running task 4533 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_package)
NOTE: recipe gtk+3-3.24.42-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4534 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4535 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4540 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_configure)
NOTE: Running task 4541 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_configure)
NOTE: recipe libhandy-1.8.3-r0: task do_configure: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Started
NOTE: recipe libhandy-1.8.3-r0: task do_configure: Succeeded
NOTE: Running task 4542 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_compile)
NOTE: recipe libhandy-1.8.3-r0: task do_compile: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Succeeded
NOTE: Running task 4543 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_compile)
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_package: Succeeded
NOTE: Running task 4544 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.42-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_packagedata unihash changed to 1c46c373cc746e737554b246424267cfd4fe0886d5b157e1ce279a69073f1430
NOTE: Setscene tasks completed
NOTE: Running task 4545 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.42-r0: task do_create_spdx: Started
NOTE: recipe libhandy-1.8.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4551 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_install)
NOTE: recipe libhandy-1.8.3-r0: task do_install: Started
NOTE: recipe libhandy-1.8.3-r0: task do_install: Succeeded
NOTE: Running task 4552 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_package)
NOTE: Running task 4553 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_populate_sysroot)
NOTE: recipe libhandy-1.8.3-r0: task do_package: Started
NOTE: recipe libhandy-1.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_create_spdx: Succeeded
NOTE: Running task 4554 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_collect_spdx_deps)
NOTE: Running task 4555 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_collect_spdx_deps)
NOTE: recipe libdazzle-3.44.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libhandy-1.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libhandy-1.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4558 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_install)
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Succeeded
NOTE: Running task 4559 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_package)
NOTE: Running task 4560 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot)
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_package: Succeeded
NOTE: Running task 4561 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_packagedata)
NOTE: recipe libhandy-1.8.3-r0: task do_packagedata: Started
NOTE: recipe libhandy-1.8.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_packagedata unihash changed to 14a0f1878e3b076eb1c7e1246feb3b8abc85f73cf51fc1810f430eaffe9dc7b4
NOTE: Setscene tasks completed
NOTE: Running task 4562 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_create_spdx)
NOTE: recipe libhandy-1.8.3-r0: task do_create_spdx: Started
NOTE: recipe libhandy-1.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Succeeded
NOTE: Running task 4563 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata unihash changed to 3f0b3a8eb995b32e55d4f90abe83df16341456ea19c06900b58b746953cf97ec
NOTE: Setscene tasks completed
NOTE: Running task 4564 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_create_spdx)
NOTE: recipe libdazzle-3.44.0-r0: task do_create_spdx: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.57.1-r0: task do_compile: Succeeded
NOTE: Running task 4565 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_install)
NOTE: recipe librsvg-2.57.1-r0: task do_install: Started
NOTE: recipe librsvg-2.57.1-r0: task do_install: Succeeded
NOTE: Running task 4566 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_populate_sysroot)
NOTE: Running task 4567 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_package)
NOTE: recipe librsvg-2.57.1-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.57.1-r0: task do_package: Started
NOTE: recipe librsvg-2.57.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4568 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4569 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_configure: Started
NOTE: recipe librsvg-2.57.1-r0: task do_package: Succeeded
NOTE: Running task 4570 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_packagedata)
NOTE: recipe librsvg-2.57.1-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.57.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_packagedata unihash changed to 93c7af522fec53f052f1aa47f82b6060fe734e5410119f8f0fd49f11fe2fd739
NOTE: Setscene tasks completed
NOTE: Running task 4571 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_create_spdx)
NOTE: recipe librsvg-2.57.1-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.57.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 4572 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4573 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_compile: Succeeded
NOTE: Running task 4574 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_install: Succeeded
NOTE: Running task 4575 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_populate_sysroot)
NOTE: Running task 4576 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4577 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.14.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.14.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4578 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_configure)
NOTE: recipe gtk4-4.14.4-r0: task do_configure: Started
NOTE: recipe gtk4-4.14.4-r0: task do_configure: Succeeded
NOTE: Running task 4579 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_compile)
NOTE: recipe gtk4-4.14.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_package: Succeeded
NOTE: Running task 4580 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_packagedata unihash changed to a4b60e4fba160c62e1ddbe9a294ef50a70a6d6f3f1deb9eec95d0283e8821f6a
NOTE: Setscene tasks completed
NOTE: Running task 4581 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4582 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.14.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.14.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.14.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4583 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_install)
NOTE: recipe gtk4-4.14.4-r0: task do_install: Started
NOTE: recipe gtk4-4.14.4-r0: task do_install: Succeeded
NOTE: Running task 4584 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_populate_sysroot)
NOTE: Running task 4585 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_package)
NOTE: recipe gtk4-4.14.4-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.14.4-r0: task do_package: Started
NOTE: recipe gtk4-4.14.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4586 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4587 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4588 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4589 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libadwaita-1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-4.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libportal-0.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4590 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_configure)
NOTE: recipe libportal-0.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4591 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_configure)
NOTE: recipe libadwaita-1.5.1-r0: task do_configure: Started
NOTE: recipe libportal-0.7.1-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4592 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_configure)
NOTE: recipe gcr-4.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4593 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_configure)
NOTE: recipe webkitgtk-2.44.1-r0: task do_configure: Started
NOTE: recipe gcr-4.3.0-r0: task do_configure: Started
NOTE: recipe libportal-0.7.1-r0: task do_configure: Succeeded
NOTE: Running task 4594 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_compile)
NOTE: recipe libportal-0.7.1-r0: task do_compile: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 4595 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_compile)
NOTE: recipe gcr-4.3.0-r0: task do_configure: Succeeded
NOTE: Running task 4596 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_compile)
NOTE: recipe libadwaita-1.5.1-r0: task do_compile: Started
NOTE: recipe gcr-4.3.0-r0: task do_compile: Started
NOTE: recipe gtk4-4.14.4-r0: task do_package: Succeeded
NOTE: Running task 4597 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_packagedata)
NOTE: recipe gcr-4.3.0-r0: task do_compile: Succeeded
NOTE: Running task 4598 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_install)
NOTE: recipe gtk4-4.14.4-r0: task do_packagedata: Started
NOTE: recipe gcr-4.3.0-r0: task do_install: Started
NOTE: recipe gtk4-4.14.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_packagedata unihash changed to 60676c0a604c6b1ab3712a54762d9a5f20713b03ddadd8bfda823a02c53d1764
NOTE: recipe libportal-0.7.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4599 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_install)
NOTE: Running task 4600 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_create_spdx)
NOTE: recipe libportal-0.7.1-r0: task do_install: Started
NOTE: recipe gtk4-4.14.4-r0: task do_create_spdx: Started
NOTE: recipe gcr-4.3.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4601 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_package)
NOTE: Running task 4602 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_populate_sysroot)
NOTE: recipe gcr-4.3.0-r0: task do_package: Started
NOTE: recipe gcr-4.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libportal-0.7.1-r0: task do_install: Succeeded
NOTE: Running task 4603 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_package)
NOTE: Running task 4604 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_populate_sysroot)
NOTE: recipe libportal-0.7.1-r0: task do_package: Started
NOTE: recipe libportal-0.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-4.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.14.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4605 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_collect_spdx_deps)
NOTE: Running task 4606 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_collect_spdx_deps)
NOTE: Running task 4607 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.5.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4608 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_collect_spdx_deps)
NOTE: recipe gcr-4.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libportal-0.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4609 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_install)
NOTE: recipe libportal-0.7.1-r0: task do_package: Succeeded
NOTE: Running task 4610 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_packagedata)
NOTE: recipe libadwaita-1.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_install: Started
NOTE: recipe libportal-0.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_packagedata unihash changed to 3fa38e3b5d9fceeb4799775cf21b2da81fbeefb2672a8bee1e5907f6ec48e6f9
NOTE: Setscene tasks completed
NOTE: Running task 4611 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_create_spdx)
NOTE: recipe libportal-0.7.1-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_install: Succeeded
NOTE: Running task 4612 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_package)
NOTE: Running task 4613 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_populate_sysroot)
NOTE: recipe libadwaita-1.5.1-r0: task do_package: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe libportal-0.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_package: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4614 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_packagedata)
NOTE: recipe gcr-4.3.0-r0: task do_packagedata: Started
NOTE: recipe gcr-4.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_packagedata unihash changed to d21b843b72a8518b602df831e4dea2df60ae5c5ffdbaa042b4e5c53f787f6c09
NOTE: Setscene tasks completed
NOTE: Running task 4615 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_create_spdx)
NOTE: recipe gcr-4.3.0-r0: task do_create_spdx: Started
NOTE: recipe gcr-4.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_package: Succeeded
NOTE: Running task 4616 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_packagedata)
NOTE: recipe libadwaita-1.5.1-r0: task do_packagedata: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_packagedata unihash changed to 92b7642dddd49167773dcb4cacef456f9d5e52b853466824bbf3e349bbdde9bb
NOTE: Setscene tasks completed
NOTE: Running task 4617 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_create_spdx)
NOTE: recipe libadwaita-1.5.1-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4618 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_compile)
NOTE: recipe webkitgtk-2.44.1-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_compile
Bitbake still alive (no events for 1200s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_compile
NOTE: recipe webkitgtk-2.44.1-r0: task do_compile: Succeeded
NOTE: Running task 4619 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_install)
NOTE: recipe webkitgtk-2.44.1-r0: task do_install: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_install: Succeeded
NOTE: Running task 4620 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_package)
NOTE: Running task 4621 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.44.1-r0: task do_package: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4622 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-46.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-46.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4623 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_configure)
NOTE: recipe epiphany-46.1-r0: task do_configure: Started
NOTE: recipe epiphany-46.1-r0: task do_configure: Succeeded
NOTE: Running task 4624 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_compile)
NOTE: recipe epiphany-46.1-r0: task do_compile: Started
NOTE: recipe epiphany-46.1-r0: task do_compile: Succeeded
NOTE: Running task 4625 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_install)
NOTE: recipe epiphany-46.1-r0: task do_install: Started
NOTE: recipe epiphany-46.1-r0: task do_install: Succeeded
NOTE: Running task 4626 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_populate_sysroot)
NOTE: recipe epiphany-46.1-r0: task do_populate_sysroot: Started
NOTE: recipe epiphany-46.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_package: Succeeded
NOTE: Running task 4627 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_packagedata)
NOTE: recipe webkitgtk-2.44.1-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_packagedata unihash changed to ddaf48fa91cd0ad95b7afc66688b022c2e32d0b67fc88e9dfe7af7ae099600b2
NOTE: Setscene tasks completed
NOTE: Running task 4628 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_package)
NOTE: Running task 4629 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_create_spdx)
NOTE: recipe epiphany-46.1-r0: task do_package: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_create_spdx: Started
NOTE: recipe epiphany-46.1-r0: task do_package: Succeeded
NOTE: Running task 4630 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_packagedata)
NOTE: recipe epiphany-46.1-r0: task do_packagedata: Started
NOTE: recipe epiphany-46.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_packagedata unihash changed to 0f628fca7f9839837d75ec2d4e980c0c806295b78f017d78cc30c157d96c71ef
NOTE: Setscene tasks completed
NOTE: Running task 4631 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_package_write_ipk)
NOTE: Running task 4632 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_package_write_deb)
NOTE: Running task 4633 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_package_write_rpm)
NOTE: Running task 4634 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_package_qa)
NOTE: recipe epiphany-46.1-r0: task do_package_write_ipk: Started
NOTE: recipe epiphany-46.1-r0: task do_package_write_deb: Started
NOTE: recipe epiphany-46.1-r0: task do_package_write_rpm: Started
NOTE: recipe epiphany-46.1-r0: task do_package_qa: Started
NOTE: recipe epiphany-46.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_package_write_ipk unihash changed to 632a90d3880e039f82f83d438186578b33388e41409f2bfcd196158de1b44dd8
NOTE: recipe epiphany-46.1-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_package_qa unihash changed to 71641b35b490aab850611d166476f2ce99321d79d50fbcaaa35113fd496d84dd
NOTE: recipe epiphany-46.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_package_write_deb unihash changed to b6d46b131b22bcc83f38693a2612ce4860eecf4017c770adb9301833b8f2ac9b
NOTE: recipe webkitgtk-2.44.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 4635 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-46.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-46.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_package_write_rpm unihash changed to 9adf54a3ae87d596543ca6a1e2c3db35641f1972a23d621a2b768453da8049a8
NOTE: recipe epiphany-46.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4636 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_create_spdx)
NOTE: recipe epiphany-46.1-r0: task do_create_spdx: Started
NOTE: recipe epiphany-46.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 4637 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_create_runtime_spdx)
NOTE: recipe epiphany-46.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe epiphany-46.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 4638 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.1.bb:do_build)
NOTE: Tasks Summary: Attempted 4638 tasks of which 4131 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 32 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-ptest went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3611717578214104047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGSIZE changed from 68478 to 129737 (+89%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGSIZE changed from 79725 to 98935 (+24%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGSIZE changed from 76679 to 86421 (+13%)
packages/core2-64-poky-linux/epiphany: PACKAGES: added "epiphany-locale-kab"

--===============3611717578214104047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/epiphany/epiphany-dbg: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 5547424 to 5559672 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-dev: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-dev: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-doc: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-doc: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGSIZE changed from 88440 to 88598 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGSIZE changed from 88111 to 88263 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGSIZE changed from 88383 to 89102 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PKGSIZE changed from 122124 to 120333 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGSIZE changed from 81039 to 81183 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGSIZE changed from 104308 to 104481 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGSIZE changed from 88128 to 87060 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGSIZE changed from 90634 to 90795 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGSIZE changed from 68478 to 129737 (+89%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGSIZE changed from 89181 to 89343 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGSIZE changed from 135909 to 136127 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGSIZE changed from 85911 to 86066 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGSIZE changed from 79725 to 98935 (+24%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGSIZE changed from 87371 to 87539 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGSIZE changed from 88540 to 87740 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGSIZE changed from 87939 to 87219 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGSIZE changed from 112297 to 112434 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGSIZE changed from 85030 to 85168 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGSIZE changed from 76679 to 86421 (+13%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGSIZE changed from 112171 to 111273 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGSIZE changed from 84664 to 84805 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGSIZE changed from 85733 to 85729 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGSIZE changed from 109665 to 109813 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGSIZE changed from 79434 to 79576 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-src: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 4443502 to 4446440 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany: PV changed from "46.0" to "46.1"
packages/core2-64-poky-linux/epiphany/epiphany: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany: PKGSIZE changed from 2053420 to 2055209 (+0%)
packages/core2-64-poky-linux/epiphany: PKGV changed from 46.0 [default] to 46.1 [default]
packages/core2-64-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/46/epiphany-46.0.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/46/epiphany-46.1.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/core2-64-poky-linux/epiphany: PACKAGES: added "epiphany-locale-kab"
packages/core2-64-poky-linux/epiphany: PV changed from "46.0" to "46.1"

--===============3611717578214104047==--

