Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16498.1792647343986253129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 22:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Qo+5JHRu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vztChNWu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1621bab9a-0eec2f1f-4e49-4a2a-8570-ae6ef2f66e49-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792647343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9lO6RjlBMj5glv6YQzAOXb62H/5+AviB0GKObyhNVUQ=;
	b=Qo+5JHRuzjIiuAXflqv18BLdB0hD9YG2UxNeUH1hqScq7Pe2WoAtvjhwJetWFk8w
	4ZRaxm1JvdLJzrI/qhfFmBlxH5GzvLjvztMrzTm/bv0WEe332F8XD4XSyoN2p4djFFe
	mJJOxuS5gqYnw/y4lgzVPLp5z6BoSYsDYxKP1gBY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792647343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9lO6RjlBMj5glv6YQzAOXb62H/5+AviB0GKObyhNVUQ=;
	b=vztChNWuI5Zb/gpzQjIx+mi0O0oRcz6FBFZqLIiY2KuNq4iVfJaushSTn6XKrYAh
	DrE69VMvFIh/CurI6PZphOIr7c2R4AqUOqwNRdh1pPeDFFu26mO/V8qe20Ux4DppMy+
	g6s58+eTgxT3xelJ8idGdQQpaCJgivGHMJ+Niqhg=
Content-Type: multipart/mixed; boundary="===============3493686029325738263=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libconfig: upgrading to 1.8.3 SUCCEEDED
Message-ID: <010101a1621bab9a-0eec2f1f-4e49-4a2a-8570-ae6ef2f66e49-000000@us-west-2.amazonses.com>
Date: Thu, 22 Oct 2026 05:35:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.22-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 05:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248414

--===============3493686029325738263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libconfig* to *1.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libconfig-upgrade-1.8.2-1.8.3.patch
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
From 73b4d0fba966864a6fc4b17ad573448e071c7a40 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 22 Oct 2026 05:26:02 +0000
Subject: [PATCH] libconfig: upgrade 1.8.2 -> 1.8.3

----- version 1.8.3 ------
---
 .../libconfig/{libconfig_1.8.2.bb => libconfig_1.8.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libconfig/{libconfig_1.8.2.bb => libconfig_1.8.3.bb} (95%)

diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb b/meta/recipes-extended/libconfig/libconfig_1.8.3.bb
similarity index 95%
rename from meta/recipes-extended/libconfig/libconfig_1.8.2.bb
rename to meta/recipes-extended/libconfig/libconfig_1.8.3.bb
index c3582828f7..e6086dee1f 100644
--- a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
+++ b/meta/recipes-extended/libconfig/libconfig_1.8.3.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master;tag=v${PV} \
     file://run-ptest \
 "
-SRCREV = "a42cb47c1526a4f2ed025fcbb2289863375bc898"
+SRCREV = "a211339ea575bb1253e3e24eee47089249f6bda1"
 
 # needed when we modify grammar.y with patches
 DEPENDS += "bison-native flex-native"
-- 
2.47.1


--===============3493686029325738263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libconfig: SRC_URI changed from "git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master;tag=v1.8.2 file://run-ptest" to "git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master;tag=v1.8.3 file://run-ptest"
packages/x86-64-v3-poky-linux/libconfig: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libconfig: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libconfig/libconfig++: FILELIST: removed "/usr/lib/libconfig++.so.15.0.0", added "/usr/lib/libconfig++.so.15.0.1"
packages/x86-64-v3-poky-linux/libconfig/libconfig++: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libconfig/libconfig++: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libconfig/libconfig++: PKGSIZE changed from 116837 to 120933 (+4%)
packages/x86-64-v3-poky-linux/libconfig/libconfig-dbg: FILELIST: removed "/usr/lib/.debug/libconfig.so.15.0.0 /usr/lib/.debug/libconfig++.so.15.0.0", added "/usr/lib/.debug/libconfig.so.15.0.1 /usr/lib/.debug/libconfig++.so.15.0.1"
packages/x86-64-v3-poky-linux/libconfig/libconfig-dbg: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libconfig/libconfig-dbg: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libconfig/libconfig-dbg: PKGSIZE changed from 641776 to 673664 (+5%)
packages/x86-64-v3-poky-linux/libconfig/libconfig-dev: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libconfig/libconfig-dev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libconfig/libconfig-doc: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libconfig/libconfig-doc: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libconfig/libconfig-locale: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libconfig/libconfig-locale: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libconfig/libconfig-ptest: FILELIST: added "/usr/lib/libconfig/ptest/tests/testdata/int64-suffix.txt /usr/lib/libconfig/ptest/tests/testdata/int64-suffix.cfg"
packages/x86-64-v3-poky-linux/libconfig/libconfig-ptest: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libconfig/libconfig-ptest: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libconfig/libconfig-ptest: PKGSIZE changed from 40772 to 53235 (+31%)
packages/x86-64-v3-poky-linux/libconfig/libconfig-src: FILELIST: directory renamed /usr/src/debug/libconfig/1.8.2/lib -> /usr/src/debug/libconfig/1.8.3/lib, directory renamed /usr/src/debug/libconfig/1.8.2/tinytest -> /usr/src/debug/libconfig/1.8.3/tinytest, directory renamed /usr/src/debug/libconfig/1.8.2/tests -> /usr/src/debug/libconfig/1.8.3/tests
packages/x86-64-v3-poky-linux/libconfig/libconfig-src: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libconfig/libconfig-src: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libconfig/libconfig-src: PKGSIZE changed from 388300 to 403774 (+4%)
packages/x86-64-v3-poky-linux/libconfig/libconfig-staticdev: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libconfig/libconfig-staticdev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libconfig/libconfig: FILELIST: removed "/usr/lib/libconfig.so.15.0.0", added "/usr/lib/libconfig.so.15.0.1"
packages/x86-64-v3-poky-linux/libconfig/libconfig: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libconfig/libconfig: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
Changes to packages/x86-64-v3-poky-linux/libconfig (sysroot):
  /usr/lib/libconfig++.so.15 changed symlink target from libconfig++.so.15.0.0 to libconfig++.so.15.0.1
  /usr/lib/libconfig.so.15 changed symlink target from libconfig.so.15.0.0 to libconfig.so.15.0.1
  /usr/lib/libconfig++.so changed symlink target from libconfig++.so.15.0.0 to libconfig++.so.15.0.1
  /usr/lib/libconfig.so changed symlink target from libconfig.so.15.0.0 to libconfig.so.15.0.1
  /usr/lib/libconfig++.so.15.0.0 moved to /usr/lib/libconfig++.so.15.0.1
  /usr/lib/libconfig.so.15.0.0 moved to /usr/lib/libconfig.so.15.0.1

--===============3493686029325738263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libconfig/libconfig++: FILELIST: removed "/usr/lib/libconfig++.so.15.0.0", added "/usr/lib/libconfig++.so.15.0.1"
packages/x86-64-v3-poky-linux/libconfig/libconfig-ptest: PKGSIZE changed from 40772 to 53235 (+31%)
packages/x86-64-v3-poky-linux/libconfig/libconfig-ptest: FILELIST: added "/usr/lib/libconfig/ptest/tests/testdata/int64-suffix.txt /usr/lib/libconfig/ptest/tests/testdata/int64-suffix.cfg"
packages/x86-64-v3-poky-linux/libconfig/libconfig: FILELIST: removed "/usr/lib/libconfig.so.15.0.0", added "/usr/lib/libconfig.so.15.0.1"
Changes to packages/x86-64-v3-poky-linux/libconfig (sysroot):
  /usr/lib/libconfig++.so.15 changed symlink target from libconfig++.so.15.0.0 to libconfig++.so.15.0.1
  /usr/lib/libconfig.so.15 changed symlink target from libconfig.so.15.0.0 to libconfig.so.15.0.1
  /usr/lib/libconfig++.so changed symlink target from libconfig++.so.15.0.0 to libconfig++.so.15.0.1
  /usr/lib/libconfig.so changed symlink target from libconfig.so.15.0.0 to libconfig.so.15.0.1
  /usr/lib/libconfig++.so.15.0.0 moved to /usr/lib/libconfig++.so.15.0.1
  /usr/lib/libconfig.so.15.0.0 moved to /usr/lib/libconfig.so.15.0.1

--===============3493686029325738263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libconfig-changelog.txt"

----- version 1.8.3 ------

--===============3493686029325738263==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libconfig-upgrade-1.8.2-1.8.3.patch"

RnJvbSA3M2I0ZDBmYmE5NjY4NjRhNmZjNGIxN2FkNTczNDQ4ZTA3MWM3YTQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjIgT2N0IDIwMjYgMDU6MjY6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjb25maWc6IHVwZ3JhZGUgMS44LjIgLT4gMS44LjMKCi0tLS0tIHZlcnNpb24gMS44LjMgLS0t
LS0tCi0tLQogLi4uL2xpYmNvbmZpZy97bGliY29uZmlnXzEuOC4yLmJiID0+IGxpYmNvbmZpZ18x
LjguMy5iYn0gICAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmNvbmZpZy97bGli
Y29uZmlnXzEuOC4yLmJiID0+IGxpYmNvbmZpZ18xLjguMy5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliY29uZmlnL2xpYmNvbmZpZ18xLjguMi5iYiBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWJjb25maWcvbGliY29uZmlnXzEuOC4zLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJjb25maWcv
bGliY29uZmlnXzEuOC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliY29u
ZmlnL2xpYmNvbmZpZ18xLjguMy5iYgppbmRleCBjMzU4MjgyOGY3Li5lNjA4NmRlZTFmIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliY29uZmlnL2xpYmNvbmZpZ18xLjguMi5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliY29uZmlnL2xpYmNvbmZpZ18xLjguMy5i
YgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJID0gIiBcCiAgICAgZ2l0Oi8vZ2l0aHViLmNvbS9o
eXBlcnJlYWxtL2xpYmNvbmZpZy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0YWc9
diR7UFZ9IFwKICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICIKLVNSQ1JFViA9ICJhNDJjYjQ3YzE1
MjZhNGYyZWQwMjVmY2JiMjI4OTg2MzM3NWJjODk4IgorU1JDUkVWID0gImEyMTEzMzllYTU3NWJi
MTI1M2UzZTI0ZWVlNDcwODkyNDlmNmJkYTEiCiAKICMgbmVlZGVkIHdoZW4gd2UgbW9kaWZ5IGdy
YW1tYXIueSB3aXRoIHBhdGNoZXMKIERFUEVORFMgKz0gImJpc29uLW5hdGl2ZSBmbGV4LW5hdGl2
ZSIKLS0gCjIuNDcuMQoK

--===============3493686029325738263==--
