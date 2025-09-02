Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F67CA100F
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.90010.1756850203696102840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=o8am6GPV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=k69Oq3tT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101990c6ea9e4-0ec64c58-454c-4f95-afc3-3b7880b73e1b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850203;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mAAI42l03qxZupSyLptcAvm42BEvQSqsir8u5Rvdb/s=;
	b=o8am6GPV00bGGq/RS4arWHYWWQ2HJo5vs9VadaJI6OfrqVUJbz2iRR7X8x45Br8N
	5gQ7CUTjOtC/WkbblBvS+id9wK7lB38EqXint5Clhwb6CwDO1b0ASrD5SRnJ8RQnfO8
	iGtBW69IWWhQSAcMLFfnWJX5mkHOh/onY2T4a9KQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850203;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mAAI42l03qxZupSyLptcAvm42BEvQSqsir8u5Rvdb/s=;
	b=k69Oq3tTNZJ/nzZMv6FfY3Au9+zw10cdzxHrtEFL8Uul9o9YhKcpaKWFbKIM/Ccw
	k8Ao+Cv/RLJ3i1srtsQKhl6obXZKIdKow60/m+Xi3n1U6sQyVlX5okBPnCY8NuKokrl
	qezPi+3+dn9kU5RqvKUvtr2WUs8hJ35Q1NK8oOhk=
Content-Type: multipart/mixed; boundary="===============3624446552818174972=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpng: upgrading to 1.6.50 SUCCEEDED
Message-ID: <010101990c6ea9e4-0ec64c58-454c-4f95-afc3-3b7880b73e1b-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222822

--===============3624446552818174972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpng* to *1.6.50* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpng-upgrade-1.6.48-1.6.50.patch
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
From 8cf8449bbf752084b1fb56e0ab556f18e7ba0fc0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 21:03:36 +0000
Subject: [PATCH] libpng: upgrade 1.6.48 -> 1.6.50

---
 .../libpng/{libpng_1.6.48.bb => libpng_1.6.50.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.48.bb => libpng_1.6.50.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.48.bb b/meta/recipes-multimedia/libpng/libpng_1.6.50.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.48.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.50.bb
index e603df1edd..aa2dc99f10 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.48.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.50.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "46fd06ff37db1db64c0dc288d78a3f5efd23ad9ac41561193f983e20937ece03"
+SRC_URI[sha256sum] = "4df396518620a7aa3651443e87d1b2862e4e88cad135a8b93423e01706232307"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.47.1


--===============3624446552818174972==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpng-upgrade-1.6.48-1.6.50.patch"

RnJvbSA4Y2Y4NDQ5YmJmNzUyMDg0YjFmYjU2ZTBhYjU1NmYxOGU3YmEwZmMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAyMTowMzozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBuZzogdXBncmFkZSAxLjYuNDggLT4gMS42LjUwCgotLS0KIC4uLi9saWJwbmcve2xpYnBuZ18x
LjYuNDguYmIgPT4gbGlicG5nXzEuNi41MC5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2xpYnBuZy97bGlicG5nXzEuNi40OC5iYiA9PiBsaWJwbmdfMS42LjUw
LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9s
aWJwbmdfMS42LjQ4LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlicG5nL2xpYnBuZ18x
LjYuNTAuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvbGlicG5nL2xpYnBuZ18xLjYuNDguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjUwLmJiCmluZGV4IGU2MDNkZjFlZGQuLmFhMmRj
OTlmMTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdf
MS42LjQ4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42
LjUwLmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9NSVJST1J9
LyR7QlBOfS8ke0JQTn0ke0xJQlZ9LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly9y
dW4tcHRlc3QgXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDZmZDA2ZmYzN2RiMWRiNjRj
MGRjMjg4ZDc4YTNmNWVmZDIzYWQ5YWM0MTU2MTE5M2Y5ODNlMjA5MzdlY2UwMyIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI0ZGYzOTY1MTg2MjBhN2FhMzY1MTQ0M2U4N2QxYjI4NjJlNGU4OGNhZDEz
NWE4YjkzNDIzZTAxNzA2MjMyMzA3IgogCiBNSVJST1JTICs9ICIke1NPVVJDRUZPUkdFX01JUlJP
Un0vcHJvamVjdC8ke0JQTn0vJHtCUE59JHtMSUJWfS8gJHtTT1VSQ0VGT1JHRV9NSVJST1J9L3By
b2plY3QvJHtCUE59LyR7QlBOfSR7TElCVn0vb2xkZXItcmVsZWFzZXMvIgogCi0tIAoyLjQ3LjEK
Cg==

--===============3624446552818174972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpng: SRC_URI changed from "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.48.tar.xz file://run-ptest" to "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.50.tar.xz file://run-ptest"
packages/x86-64-v3-poky-linux/libpng: PKGV changed from 1.6.48 [default] to 1.6.50 [default]
packages/x86-64-v3-poky-linux/libpng: PV changed from "1.6.48" to "1.6.50"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGV changed from 1.6.48 [default] to 1.6.50 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGSIZE changed from 1439560 to 1439448 (-0%)
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PV changed from "1.6.48" to "1.6.50"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: FILELIST: removed "/usr/lib/.debug/libpng16.so.16.48.0", added "/usr/lib/.debug/libpng16.so.16.50.0"
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PKGV changed from 1.6.48 [default] to 1.6.50 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PKGSIZE changed from 179434 to 179522 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PV changed from "1.6.48" to "1.6.50"
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGV changed from 1.6.48 [default] to 1.6.50 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGSIZE changed from 268408 to 268852 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PV changed from "1.6.48" to "1.6.50"
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PKGV changed from 1.6.48 [default] to 1.6.50 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PV changed from "1.6.48" to "1.6.50"
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGV changed from 1.6.48 [default] to 1.6.50 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGSIZE changed from 2431043 to 2444376 (+1%)
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PV changed from "1.6.48" to "1.6.50"
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGV changed from 1.6.48 [default] to 1.6.50 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-src: PV changed from "1.6.48" to "1.6.50"
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PKGV changed from 1.6.48 [default] to 1.6.50 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PV changed from "1.6.48" to "1.6.50"
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PKGV changed from 1.6.48 [default] to 1.6.50 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PV changed from "1.6.48" to "1.6.50"
packages/x86-64-v3-poky-linux/libpng/libpng: PKGV changed from 1.6.48 [default] to 1.6.50 [default]
packages/x86-64-v3-poky-linux/libpng/libpng: PV changed from "1.6.48" to "1.6.50"
packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.48.0", added "/usr/lib/libpng16.so.16.50.0"
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.48.0 to libpng16.so.16.50.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.48.0 to libpng16.so.16.50.0
  /usr/lib/libpng16.so.16.48.0 moved to /usr/lib/libpng16.so.16.50.0

--===============3624446552818174972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.48.0", added "/usr/lib/libpng16.so.16.50.0"
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.48.0 to libpng16.so.16.50.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.48.0 to libpng16.so.16.50.0
  /usr/lib/libpng16.so.16.48.0 moved to /usr/lib/libpng16.so.16.50.0

--===============3624446552818174972==--

