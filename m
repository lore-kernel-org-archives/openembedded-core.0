Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8733C27C43
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1117.1714579216799934952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Vbua4ndf;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lGBNQbYf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f34e296f9-e485d7b2-08bd-4d2a-a1a5-ec23ac3462f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=f8w2KnF+4l0QknYeJOXKK9Z3HUUJ3WEvw9g56hEX9Eo=;
	b=Vbua4ndfz4Age7up0SmEyBCXPFY1xHvyqh/6F3Nhc7T9ixAZiO5dnFvfQWYR65OP
	3lZ5dNkw9x9K1RIqhGVWHwH0DBChjYuddpZfVGScpBi8sh1mUPHrLBjHtN13ezyfttJ
	2BP6k6nFcsxi4oWc3H7zTlQLm1M16EgcpkjXGHDw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=f8w2KnF+4l0QknYeJOXKK9Z3HUUJ3WEvw9g56hEX9Eo=;
	b=lGBNQbYfgNH85QqWH3IjGQrc9FSxgFQ3WdNHE+J2liT7pHPZxVsI/2FgYGU6HoSG
	1h4WsOjiFwTj57CEvrUMNqTMtvl/yvGTqVwYRx4gvqD2aT+bmyC5YX3Iwbd7GVRFjoQ
	246iUKuqzcwgtks4UHMqKvqqR6/eMyKzXOAjTO0E=
Content-Type: multipart/mixed; boundary="===============3020485966141757207=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xserver-xorg: upgrading to 21.1.13 SUCCEEDED
Message-ID: <0101018f34e296f9-e485d7b2-08bd-4d2a-a1a5-ec23ac3462f9-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198864

--===============3020485966141757207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xserver-xorg* to *21.1.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xserver-xorg-upgrade-21.1.11-21.1.13.patch
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
From 457bf8050b01d158ad3d42ea3b0bc5e8331ba990 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 13:09:29 +0000
Subject: [PATCH] xserver-xorg: upgrade 21.1.11 -> 21.1.13

---
 .../0001-Avoid-duplicate-definitions-of-IOPortBase.patch | 3 +--
 ...ciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 9 +++------
 .../{xserver-xorg_21.1.11.bb => xserver-xorg_21.1.13.bb} | 2 +-
 3 files changed, 5 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.11.bb => xserver-xorg_21.1.13.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
index 11d5546537..7d51c9ecb8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
@@ -1,4 +1,4 @@
-From ce3b8a230a3805c9b557c1f106795675bd034860 Mon Sep 17 00:00:00 2001
+From 52f87fb34c97235f9d092ae2540c96bd2beafeba Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 17 Aug 2020 10:50:51 -0700
 Subject: [PATCH] Avoid duplicate definitions of IOPortBase
@@ -10,7 +10,6 @@ compiler.h:528: multiple definition of `IOPortBase';
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  hw/xfree86/os-support/linux/lnx_video.c | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index d05eec5bb9..6255029cc4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From d77cdc5e1eee26821ab98c947abea53fb7b18fe5 Mon Sep 17 00:00:00 2001
+From 7c357dd0ac189a14b7f81da988cf6cfd6054cbdc Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
@@ -20,10 +20,10 @@ Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
  1 file changed, 17 insertions(+), 1 deletion(-)
 
 diff --git a/hw/xfree86/common/xf86pciBus.c b/hw/xfree86/common/xf86pciBus.c
-index e61ae0cd4..d70c99197 100644
+index aeeed8b..db705bf 100644
 --- a/hw/xfree86/common/xf86pciBus.c
 +++ b/hw/xfree86/common/xf86pciBus.c
-@@ -1173,7 +1173,23 @@ xf86VideoPtrToDriverList(struct pci_device *dev,
+@@ -1174,7 +1174,23 @@ xf86VideoPtrToDriverList(struct pci_device *dev, XF86MatchedDrivers *md)
  		case 0x0bef:
  			/* Use fbdev/vesa driver on Oaktrail, Medfield, CDV */
  			break;
@@ -48,6 +48,3 @@ index e61ae0cd4..d70c99197 100644
  			driverList[0] = "intel";
  			break;
          }
--- 
-2.14.3
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
index 6506d775ca..1f18c22fa8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "1d3dadbd57fb86b16a018e9f5f957aeeadf744f56c0553f55737628d06d326ef"
+SRC_URI[sha256sum] = "b45a02d5943f72236a360d3cc97e75134aa4f63039ff88c04686b508a3dc740c"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.44.0


--===============3020485966141757207==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-21.1.11-21.1.13.patch"

RnJvbSA0NTdiZjgwNTBiMDFkMTU4YWQzZDQyZWEzYjBiYzVlODMzMWJhOTkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxMzowOToyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhz
ZXJ2ZXIteG9yZzogdXBncmFkZSAyMS4xLjExIC0+IDIxLjEuMTMKCi0tLQogLi4uLzAwMDEtQXZv
aWQtZHVwbGljYXRlLWRlZmluaXRpb25zLW9mLUlPUG9ydEJhc2UucGF0Y2ggfCAzICstLQogLi4u
Y2lCdXMuYy11c2UtSW50ZWwtZGR4LW9ubHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2ggfCA5
ICsrKy0tLS0tLQogLi4uL3t4c2VydmVyLXhvcmdfMjEuMS4xMS5iYiA9PiB4c2VydmVyLXhvcmdf
MjEuMS4xMy5iYn0gfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOSBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3t4
c2VydmVyLXhvcmdfMjEuMS4xMS5iYiA9PiB4c2VydmVyLXhvcmdfMjEuMS4xMy5iYn0gKDkyJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIt
eG9yZy8wMDAxLUF2b2lkLWR1cGxpY2F0ZS1kZWZpbml0aW9ucy1vZi1JT1BvcnRCYXNlLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAwMS1B
dm9pZC1kdXBsaWNhdGUtZGVmaW5pdGlvbnMtb2YtSU9Qb3J0QmFzZS5wYXRjaAppbmRleCAxMWQ1
NTQ2NTM3Li43ZDUxYzllY2I4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLUF2b2lkLWR1cGxpY2F0ZS1kZWZpbml0aW9ucy1v
Zi1JT1BvcnRCYXNlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2
ZXIveHNlcnZlci14b3JnLzAwMDEtQXZvaWQtZHVwbGljYXRlLWRlZmluaXRpb25zLW9mLUlPUG9y
dEJhc2UucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGNlM2I4YTIzMGEzODA1YzliNTU3YzFm
MTA2Nzk1Njc1YmQwMzQ4NjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDUyZjg3ZmIz
NGM5NzIzNWY5ZDA5MmFlMjU0MGM5NmJkMmJlYWZlYmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogTW9uLCAxNyBBdWcg
MjAyMCAxMDo1MDo1MSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBBdm9pZCBkdXBsaWNhdGUgZGVm
aW5pdGlvbnMgb2YgSU9Qb3J0QmFzZQpAQCAtMTAsNyArMTAsNiBAQCBjb21waWxlci5oOjUyODog
bXVsdGlwbGUgZGVmaW5pdGlvbiBvZiBgSU9Qb3J0QmFzZSc7CiAKIFVwc3RyZWFtLVN0YXR1czog
UGVuZGluZwogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLQog
LS0tCiAgaHcveGZyZWU4Ni9vcy1zdXBwb3J0L2xpbnV4L2xueF92aWRlby5jIHwgMSArCiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhmODZwY2lCdXMuYy11c2UtSW50
ZWwtZGR4LW9ubHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhmODZwY2lCdXMuYy11c2UtSW50
ZWwtZGR4LW9ubHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2gKaW5kZXggZDA1ZWVjNWJiOS4u
NjI1NTAyOWNjNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZl
ci94c2VydmVyLXhvcmcvMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1w
cmUtZ2VuNC1oYXJkd2FyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhz
ZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgtb25seS1m
b3ItcHJlLWdlbjQtaGFyZHdhci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDc3Y2RjNWUx
ZWVlMjY4MjFhYjk4Yzk0N2FiZWE1M2ZiN2IxOGZlNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gN2MzNTdkZDBhYzE4OWExNGI3ZjgxZGE5ODhjZjZjZmQ2MDU0Y2JkYyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IENhbGlmb3JuaWEgU3VsbGl2YW4gPGNhbGlmb3JuaWEubC5z
dWxsaXZhbkBpbnRlbC5jb20+CiBEYXRlOiBGcmksIDE2IE1hciAyMDE4IDE3OjIzOjExIC0wNzAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHhmODZwY2lCdXMuYzogdXNlIEludGVsIGRkeCBvbmx5IGZvciBw
cmUtZ2VuNCBoYXJkd2FyZQpAQCAtMjAsMTAgKzIwLDEwIEBAIFNpZ25lZC1vZmYtYnk6IENhbGlm
b3JuaWEgU3VsbGl2YW4gPGNhbGlmb3JuaWEubC5zdWxsaXZhbkBpbnRlbC5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBh
L2h3L3hmcmVlODYvY29tbW9uL3hmODZwY2lCdXMuYyBiL2h3L3hmcmVlODYvY29tbW9uL3hmODZw
Y2lCdXMuYwotaW5kZXggZTYxYWUwY2Q0Li5kNzBjOTkxOTcgMTAwNjQ0CitpbmRleCBhZWVlZDhi
Li5kYjcwNWJmIDEwMDY0NAogLS0tIGEvaHcveGZyZWU4Ni9jb21tb24veGY4NnBjaUJ1cy5jCiAr
KysgYi9ody94ZnJlZTg2L2NvbW1vbi94Zjg2cGNpQnVzLmMKLUBAIC0xMTczLDcgKzExNzMsMjMg
QEAgeGY4NlZpZGVvUHRyVG9Ecml2ZXJMaXN0KHN0cnVjdCBwY2lfZGV2aWNlICpkZXYsCitAQCAt
MTE3NCw3ICsxMTc0LDIzIEBAIHhmODZWaWRlb1B0clRvRHJpdmVyTGlzdChzdHJ1Y3QgcGNpX2Rl
dmljZSAqZGV2LCBYRjg2TWF0Y2hlZERyaXZlcnMgKm1kKQogIAkJY2FzZSAweDBiZWY6CiAgCQkJ
LyogVXNlIGZiZGV2L3Zlc2EgZHJpdmVyIG9uIE9ha3RyYWlsLCBNZWRmaWVsZCwgQ0RWICovCiAg
CQkJYnJlYWs7CkBAIC00OCw2ICs0OCwzIEBAIGluZGV4IGU2MWFlMGNkNC4uZDcwYzk5MTk3IDEw
MDY0NAogIAkJCWRyaXZlckxpc3RbMF0gPSAiaW50ZWwiOwogIAkJCWJyZWFrOwogICAgICAgICAg
fQotLS0gCi0yLjE0LjMKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
eHNlcnZlci94c2VydmVyLXhvcmdfMjEuMS4xMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMTMuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhv
cmdfMjEuMS4xMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZl
ci94c2VydmVyLXhvcmdfMjEuMS4xMy5iYgppbmRleCA2NTA2ZDc3NWNhLi4xZjE4YzIyZmE4IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9y
Z18yMS4xLjExLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNl
cnZlci14b3JnXzIxLjEuMTMuYmIKQEAgLTMsNyArMyw3IEBAIHJlcXVpcmUgeHNlcnZlci14b3Jn
LmluYwogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgt
b25seS1mb3ItcHJlLWdlbjQtaGFyZHdhci5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAx
LUF2b2lkLWR1cGxpY2F0ZS1kZWZpbml0aW9ucy1vZi1JT1BvcnRCYXNlLnBhdGNoIFwKICAgICAg
ICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFkM2RhZGJkNTdmYjg2YjE2YTAxOGU5ZjVm
OTU3YWVlYWRmNzQ0ZjU2YzA1NTNmNTU3Mzc2MjhkMDZkMzI2ZWYiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYjQ1YTAyZDU5NDNmNzIyMzZhMzYwZDNjYzk3ZTc1MTM0YWE0ZjYzMDM5ZmY4OGMwNDY4
NmI1MDhhM2RjNzQwYyIKIAogIyBUaGVzZSBleHRlbnNpb25zIGFyZSBub3cgaW50ZWdyYXRlZCBp
bnRvIHRoZSBzZXJ2ZXIsIHNvIGRlY2xhcmUgdGhlIG1pZ3JhdGlvbgogIyBwYXRoIGZvciBpbi1w
bGFjZSB1cGdyYWRlcy4KLS0gCjIuNDQuMAoK

--===============3020485966141757207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-21.1.11.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-21.1.13.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch"
packages/core2-64-poky-linux/xserver-xorg: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 17225960 to 17227080 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PKGSIZE changed from 1154395 to 1154495 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PKGSIZE changed from 132193 to 132633 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PKGSIZE changed from 11846167 to 11847850 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xwayland: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xwayland: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PKGSIZE changed from 2724477 to 2724509 (+0%)

--===============3020485966141757207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1877 targets, 46 skipped, 0 masked, 0 errors.
Removing 85 recipes from the core2-64 sysroot...done.
Removing 85 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-de4d07528e260f2f00dd7bb0f98a5940f4894a9c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:de4d07528e260f2f00dd7bb0f98a5940f4894a9c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 616 Local 595 Mirrors 0 Missed 21 Current 303 (96% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 313 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 314 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 315 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 317 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 318 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 323 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 324 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 326 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 327 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 330 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 332 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 333 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_create_spdx_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_deb_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 334 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 336 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 337 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 338 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 339 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 340 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 347 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 348 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 353 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 355 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 358 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 362 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_create_spdx_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 364 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 365 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 373 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 374 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 376 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe libinput-1.25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 387 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.25.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 388 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 390 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 392 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata_setscene)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 395 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 396 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 397 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_packagedata_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 411 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 416 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 422 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_packagedata_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 424 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 427 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 428 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 430 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 431 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 432 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 434 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 436 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 440 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 442 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 447 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 463 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_create_spdx_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 465 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 469 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 470 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_package_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 479 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 480 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 482 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 615 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 616 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 617 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 639 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 643 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 646 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 647 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_package_setscene: Started
NOTE: Running task 1052 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_recipe_qa)
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 653 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running task 1067 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_write_config)
NOTE: Running task 1073 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_fetch)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 657 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_fetch: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_recipe_qa: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1143 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_write_config: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 660 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_write_config: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1154 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_patch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 662 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 671 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 681 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 684 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.35.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.35-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 709 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 717 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 726 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1543 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_fetch)
NOTE: Running setscene task 728 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 729 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 735 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_fetch: Started
NOTE: Running setscene task 736 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 744 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_fetch: Succeeded
NOTE: Running task 1566 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_unpack)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 746 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_unpack: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1619 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_patch)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxcb/1.16.1/temp/log.do_packagedata_setscene.1621441
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 782 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_package_setscene)
NOTE: recipe libxcb-1.16.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_package_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 785 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_patch: Succeeded
NOTE: Running setscene task 786 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1630 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 812 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1631 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_populate_lic)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 820 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 824 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 825 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 827 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 829 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 833 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_populate_lic: Started
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 837 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 838 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 844 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 846 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 849 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 850 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 851 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 853 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_populate_lic unihash changed to 91ddd8fa337d3c82d3644ca4795e5e82f2d23e984082a6d43ad6d338767740b4
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 856 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 862 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 867 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 868 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 875 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 877 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 880 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 884 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 886 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 887 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 889 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 890 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 891 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 894 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 898 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 899 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 901 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 908 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 909 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 914 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 919 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2070 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_packagedata)
NOTE: Running task 2303 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.16.1-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2424 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_configure: Started
NOTE: recipe libxcb-1.16.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2482 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_collect_spdx_deps)
NOTE: Running task 2493 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_package_write_ipk)
NOTE: Running task 2494 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_package_write_deb)
NOTE: Running task 2495 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_package_write_rpm)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_package_write_deb: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_package_write_ipk: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_configure: Succeeded
NOTE: Running task 2496 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_compile: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_compile: Succeeded
NOTE: Running task 2497 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_install: Succeeded
NOTE: Running task 2498 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_package)
NOTE: Running task 2499 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2500 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2501 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package: Succeeded
NOTE: Running task 2502 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_packagedata: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2503 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_create_spdx)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_create_spdx: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 2504 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2505 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2506 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2507 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_package)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2508 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_packagedata unihash changed to 111f91ae3aa57c37ceded8f7bd21eaf483e4a54437c9d00aa94b646a8783aa70
NOTE: Setscene tasks completed
NOTE: Running task 2509 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_create_spdx)
NOTE: Running task 2510 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_package_write_ipk)
NOTE: Running task 2511 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_package_write_deb)
NOTE: Running task 2512 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 2513 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_package_write_ipk)
NOTE: Running task 2514 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_package_write_deb)
NOTE: Running task 2515 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_package_write_rpm)
NOTE: Running task 2516 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_create_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package_write_ipk: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package_write_deb: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_write_ipk: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_qa: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_write_deb: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2517 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_create_runtime_spdx)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_create_runtime_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_write_deb: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 2518 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_build)
NOTE: Tasks Summary: Attempted 2518 tasks of which 2478 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 32 ERROR messages, returning a non-zero exit code.
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-src went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-dbg went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-staticdev went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-dev went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-doc went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-locale went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-composite went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-damage went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-dbe went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-dpms went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-dri2 went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-dri3 went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-glx went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-present went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-randr went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-record went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-render went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-res went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-screensaver went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-shape went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-shm went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-sync went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xf86dri went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xfixes went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xinerama went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xinput went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xkb went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xtest went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xv went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xvmc went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3020485966141757207==--

