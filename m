Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC96C3065E
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:25 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.18365.1718475798471897618
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aFDFwQ2R;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=a8SqrzDb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101901d23b47d-a14bb802-a8f5-43fd-8de4-c9131641210f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475797;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=nw5VUjxiY8+FQf1FG3B8XNmEzKKJ7rT5ZHfrZQ0cU7g=;
	b=aFDFwQ2R9OUcjOx2f5fgMRdojcLW5GkPCEVkttJyKI8ox3lDKBVeu39w22bLIxwV
	9kPs1SEsm0Xkq0EmK9sD9r1fDXidc0g5aYR5DBEiPAQ2ADmQx/GKvT586dJaEdIeO/u
	jyUAO1l/amwlipBdqPj+VFqqLytdQUZlREjGzWx0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475797;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=nw5VUjxiY8+FQf1FG3B8XNmEzKKJ7rT5ZHfrZQ0cU7g=;
	b=a8SqrzDbK6FlIUVfyOAiApYuuNEGlGUACg8JG7sop/2Sou8mJAtd9Ov79TbCulbh
	IgWcncERPdigeJic+HyUZpA8b+ArtTiIlL8stMZhpNGTrmNpflRVjry0MOQ70T9y3Xu
	QOdgK5KgZ3yXc6w48F+ieKBsKGHn5xdM3xwa6YGQ=
Content-Type: multipart/mixed; boundary="===============8936812679159542560=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dhcpcd: upgrading to 10.0.8 SUCCEEDED
Message-ID: <010101901d23b47d-a14bb802-a8f5-43fd-8de4-c9131641210f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200672

--===============8936812679159542560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dhcpcd* to *10.0.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.0.6-10.0.8.patch
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
From 2c02896d82b028cd8a1aa90c9be0848f268f216a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 05:15:46 +0000
Subject: [PATCH] dhcpcd: upgrade 10.0.6 -> 10.0.8

---
 .../dhcpcd/{dhcpcd_10.0.6.bb => dhcpcd_10.0.8.bb}            | 2 +-
 ...0-resolv.conf-improve-the-sitation-of-working-with-.patch | 5 +----
 ...01-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch | 3 +--
 .../0001-remove-INCLUDEDIR-to-prevent-build-issues.patch     | 5 ++---
 4 files changed, 5 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.6.bb => dhcpcd_10.0.8.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb
index fd193b2cff..43de279cfd 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
+SRCREV = "a15ba1987c264eaa06c2655ddd0891aa5ac48c09"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 8d1ed6671a..548f1a73ba 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From 02acc4d875ee81e6fd19ef66d69c9f55b4b4a7e7 Mon Sep 17 00:00:00 2001
+From d470d99c23a4072ab3cdce9e51e6964f3c993e72 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
@@ -77,6 +77,3 @@ index 7c29e276..becc019f 100644
  		"$resolvconf" -d "$ifname" -f
  	else
  		if [ -e "$resolv_conf_dir/$ifname" ]; then
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index 461d04bd1d..f68e59db81 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From 5d5ba8a2b8010db6bee68bd712f829cb737c9ac1 Mon Sep 17 00:00:00 2001
+From 686eedbb579bbc6223d294e9afbf3c9220d68a85 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
@@ -24,7 +24,6 @@ versions.
 
 Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
-
 ---
  src/dhcpcd.8.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
index c54942be4b..5a99eb69b3 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From ec9fc4e6086e1dbe0ac2f94a8a088a571596a581 Mon Sep 17 00:00:00 2001
+From 7ff37fc3d18a510cb73b6d6580817f0873574663 Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -6,13 +6,12 @@ Subject: [PATCH] remove INCLUDEDIR to prevent build issues
 Upstream-Status: Pending
 
 Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
-
 ---
  configure | 5 -----
  1 file changed, 5 deletions(-)
 
 diff --git a/configure b/configure
-index 5237b0e2..7220718b 100755
+index 0a28a0cf..a81c73c1 100755
 --- a/configure
 +++ b/configure
 @@ -26,7 +26,6 @@ BUILD=
-- 
2.44.0


--===============8936812679159542560==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.0.6-10.0.8.patch"

RnJvbSAyYzAyODk2ZDgyYjAyOGNkOGExYWE5MGM5YmUwODQ4ZjI2OGYyMTZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMDU6MTU6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aGNwY2Q6IHVwZ3JhZGUgMTAuMC42IC0+IDEwLjAuOAoKLS0tCiAuLi4vZGhjcGNkL3tkaGNwY2Rf
MTAuMC42LmJiID0+IGRoY3BjZF8xMC4wLjguYmJ9ICAgICAgICAgICAgfCAyICstCiAuLi4wLXJl
c29sdi5jb25mLWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtpbmctd2l0aC0ucGF0Y2ggfCA1
ICstLS0tCiAuLi4wMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVs
dGlsaWIucGF0Y2ggfCAzICstLQogLi4uLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8tcHJldmVu
dC1idWlsZC1pc3N1ZXMucGF0Y2ggICAgIHwgNSArKy0tLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvZGhjcGNkL3tkaGNwY2RfMTAuMC42LmJiID0+IGRoY3BjZF8xMC4wLjguYmJ9ICg5NyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEw
LjAuNi5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8xMC4wLjgu
YmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9kaGNwY2QvZGhjcGNkXzEwLjAuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjAuOC5iYgppbmRleCBmZDE5M2IyY2ZmLi40M2RlMjc5
Y2ZkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2Rf
MTAuMC42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8x
MC4wLjguYmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL05l
dHdvcmtDb25maWd1cmF0aW9uL2RoY3BjZDtwcm90b2NvbD1odHRwczticmFuY2g9bWEKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4tZW5hYmxl
LW11bHRpbGliLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiMWM4YWU1OTgzNmZh
ODdiNGM2M2M1OTgwODdmMDQ2MGVjMjBlZDg2MiIKK1NSQ1JFViA9ICJhMTViYTE5ODdjMjY0ZWFh
MDZjMjY1NWRkZDA4OTFhYTVhYzQ4YzA5IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogaW5oZXJp
dCBwa2djb25maWcgYXV0b3Rvb2xzLWJyb2tlbnNlcCBzeXN0ZW1kIHVzZXJhZGQKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtMjAtcmVzb2x2
LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtMjAtcmVzb2x2LmNvbmYtaW1w
cm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaAppbmRleCA4ZDFlZDY2NzFh
Li41NDhmMWE3M2JhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3Bj
ZC9maWxlcy8wMDAxLTIwLXJlc29sdi5jb25mLWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtp
bmctd2l0aC0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmls
ZXMvMDAwMS0yMC1yZXNvbHYuY29uZi1pbXByb3ZlLXRoZS1zaXRhdGlvbi1vZi13b3JraW5nLXdp
dGgtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMmFjYzRkODc1ZWU4MWU2ZmQxOWVmNjZk
NjljOWY1NWI0YjRhN2U3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkNDcwZDk5YzIz
YTQwNzJhYjNjZGNlOWU1MWU2OTY0ZjNjOTkzZTcyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCA5IE5vdiAy
MDIyIDE2OjMzOjE4ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIDIwLXJlc29sdi5jb25mOiBpbXBy
b3ZlIHRoZSBzaXRhdGlvbiBvZiB3b3JraW5nIHdpdGggc3lzdGVtZApAQCAtNzcsNiArNzcsMyBA
QCBpbmRleCA3YzI5ZTI3Ni4uYmVjYzAxOWYgMTAwNjQ0CiAgCQkiJHJlc29sdmNvbmYiIC1kICIk
aWZuYW1lIiAtZgogIAllbHNlCiAgCQlpZiBbIC1lICIkcmVzb2x2X2NvbmZfZGlyLyRpZm5hbWUi
IF07IHRoZW4KLS0tIAotMi4xNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4t
ZW5hYmxlLW11bHRpbGliLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2Qv
ZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGls
aWIucGF0Y2gKaW5kZXggNDYxZDA0YmQxZC4uZjY4ZTU5ZGI4MSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxp
Y3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGlsaWIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3It
d2hlbi1lbmFibGUtbXVsdGlsaWIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVkNWJhOGEy
YjgwMTBkYjZiZWU2OGJkNzEyZjgyOWNiNzM3YzlhYzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDY4NmVlZGJiNTc5YmJjNjIyM2QyOTRlOWFmYmYzYzkyMjBkNjhhODUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+
CiBEYXRlOiBGcmksIDEwIE1hciAyMDIzIDAzOjQ4OjQ2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGRoY3BjZC44OiBGaXggY29uZmxpY3QgZXJyb3Igd2hlbiBlbmFibGUgbXVsdGlsaWIuCkBAIC0y
NCw3ICsyNCw2IEBAIHZlcnNpb25zLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUg
W29lIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0
c3UuY29tPgotCiAtLS0KICBzcmMvZGhjcGNkLjguaW4gfCAyICstCiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLXJlbW92ZS1JTkNMVURFRElSLXRvLXByZXZl
bnQtYnVpbGQtaXNzdWVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2Qv
ZmlsZXMvMDAwMS1yZW1vdmUtSU5DTFVERURJUi10by1wcmV2ZW50LWJ1aWxkLWlzc3Vlcy5wYXRj
aAppbmRleCBjNTQ5NDJiZTRiLi41YTk5ZWI2OWIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLXJlbW92ZS1JTkNMVURFRElSLXRvLXByZXZl
bnQtYnVpbGQtaXNzdWVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhj
cGNkL2ZpbGVzLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8tcHJldmVudC1idWlsZC1pc3N1ZXMu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGVjOWZjNGU2MDg2ZTFkYmUwYWMyZjk0YThhMDg4
YTU3MTU5NmE1ODEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdmZjM3ZmMzZDE4YTUx
MGNiNzNiNmQ2NTgwODE3ZjA4NzM1NzQ2NjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBTdGVmYW5vIENhcHBhIDxzdGVmYW5vLmNhcHBhLmtzODlAZ21haWwuY29tPgogRGF0ZTogU3Vu
LCAxMyBKYW4gMjAxOSAwMTo1MDo1MiArMDEwMAogU3ViamVjdDogW1BBVENIXSByZW1vdmUgSU5D
TFVERURJUiB0byBwcmV2ZW50IGJ1aWxkIGlzc3VlcwpAQCAtNiwxMyArNiwxMiBAQCBTdWJqZWN0
OiBbUEFUQ0hdIHJlbW92ZSBJTkNMVURFRElSIHRvIHByZXZlbnQgYnVpbGQgaXNzdWVzCiBVcHN0
cmVhbS1TdGF0dXM6IFBlbmRpbmcKIAogU2lnbmVkLW9mZi1ieTogU3RlZmFubyBDYXBwYSA8c3Rl
ZmFuby5jYXBwYS5rczg5QGdtYWlsLmNvbT4KLQogLS0tCiAgY29uZmlndXJlIHwgNSAtLS0tLQog
IDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJl
IGIvY29uZmlndXJlCi1pbmRleCA1MjM3YjBlMi4uNzIyMDcxOGIgMTAwNzU1CitpbmRleCAwYTI4
YTBjZi4uYTgxYzczYzEgMTAwNzU1CiAtLS0gYS9jb25maWd1cmUKICsrKyBiL2NvbmZpZ3VyZQog
QEAgLTI2LDcgKzI2LDYgQEAgQlVJTEQ9Ci0tIAoyLjQ0LjAKCg==

--===============8936812679159542560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1198864 to 1210776 (+1%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.0.6" to "10.0.8"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.0.6" to "10.0.8"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGSIZE changed from 64738 to 65145 (+1%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.0.6" to "10.0.8"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.0.6" to "10.0.8"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1095251 to 1105980 (+1%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.0.6" to "10.0.8"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.0.6" to "10.0.8"
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGSIZE changed from 424332 to 428440 (+1%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PV changed from "10.0.6" to "10.0.8"
packages/core2-64-poky-linux/dhcpcd: PKGV changed from 10.0.6 [default] to 10.0.8 [default]
packages/core2-64-poky-linux/dhcpcd: PV changed from "10.0.6" to "10.0.8"

--===============8936812679159542560==--

