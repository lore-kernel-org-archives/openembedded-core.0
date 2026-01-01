Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93308EEB588
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:10 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102974.1767267476398781884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zPk+sH3m;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IZhMgwng;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b7959b4c1-a682fa0e-5129-41e5-813a-b9e298883239-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267480;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QKCe0uRuJYCvqXP1ulcGpZ5scmxMVDmMme9IwfaKq9I=;
	b=zPk+sH3mvvkLtvwwlNKzEEmCwy0cjsOV9oJ+RXZtajtcov5VPl1JeU+Q4DMsgucU
	+m3V4G+HueK/+Hb13T9PIuID8bV1687V4eKwdpx8dcRofKSLRTt67evg8A+ijcVhRsX
	/EZD3YFdUJXtHxXX0vKamm/nQFeG0YNJcJU1TkPc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267480;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QKCe0uRuJYCvqXP1ulcGpZ5scmxMVDmMme9IwfaKq9I=;
	b=IZhMgwngFmnjHzUUQdlVI3bcGxtVCNiiCYHGEPXu1x85k2XOdJJbKqLLWxPhdexN
	I97wWWqNmBaxP6dVlMzufRv2H0NF9ULW8g+t2A5OgtH09twXN417CKR5ShL1jT5mV91
	6D77Hi6LjH0hej+ii7KL6VS6uwgbTXW4Ll471B0U=
Content-Type: multipart/mixed; boundary="===============0148959358263540159=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-ucm-conf: upgrading to 1.2.15.1 SUCCEEDED
Message-ID: <0101019b7959b4c1-a682fa0e-5129-41e5-813a-b9e298883239-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:38:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228799

--===============0148959358263540159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-ucm-conf* to *1.2.15.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-ucm-conf-upgrade-1.2.15-1.2.15.1.patch
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
From de6f1c9279c6864ce9aead8cc8aa5cbdebb84a4b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 10:46:41 +0000
Subject: [PATCH] alsa-ucm-conf: upgrade 1.2.15 -> 1.2.15.1

---
 .../alsa/{alsa-ucm-conf_1.2.15.bb => alsa-ucm-conf_1.2.15.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.15.bb => alsa-ucm-conf_1.2.15.1.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.1.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.1.bb
index 1eaec98e3b..961a1444e3 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.1.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "5510cb0947a3bb877b5ce218e3ecedd78bfa6643e372346c87d93d4844a45ffa"
+SRC_URI[sha256sum] = "246c5d59d217b6f7f47a11fd10f1b766d25abcb0d9c996af3079bb9c9ac5a1b0"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.47.1


--===============0148959358263540159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PV changed from "1.2.15" to "1.2.15.1"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: added "/usr/share/alsa/ucm2/codecs/cs42l45/init.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PV changed from "1.2.15" to "1.2.15.1"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 640615 to 641707 (+0%)
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
packages/all-poky-linux/alsa-ucm-conf: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.15.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.15.1.tar.bz2"
packages/all-poky-linux/alsa-ucm-conf: PV changed from "1.2.15" to "1.2.15.1"
packages/all-poky-linux/alsa-ucm-conf: PKGV changed from 1.2.15 [default] to 1.2.15.1 [default]
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/codecs/cs42l45 was added
  /usr/share/alsa/ucm2/codecs/cs42l45/init.conf was added

--===============0148959358263540159==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-ucm-conf-upgrade-1.2.15-1.2.15.1.patch"

RnJvbSBkZTZmMWM5Mjc5YzY4NjRjZTlhZWFkOGNjOGFhNWNiZGViYjg0YTRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAxMDo0Njo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFs
c2EtdWNtLWNvbmY6IHVwZ3JhZGUgMS4yLjE1IC0+IDEuMi4xNS4xCgotLS0KIC4uLi9hbHNhL3th
bHNhLXVjbS1jb25mXzEuMi4xNS5iYiA9PiBhbHNhLXVjbS1jb25mXzEuMi4xNS4xLmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2Eve2Fsc2EtdWNtLWNvbmZfMS4yLjE1LmJiID0+
IGFsc2EtdWNtLWNvbmZfMS4yLjE1LjEuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1jb25mXzEuMi4xNS5iYiBiL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11Y20tY29uZl8xLjIuMTUuMS5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdWNt
LWNvbmZfMS4yLjE1LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fs
c2EtdWNtLWNvbmZfMS4yLjE1LjEuYmIKaW5kZXggMWVhZWM5OGUzYi4uOTYxYTE0NDRlMyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1jb25mXzEuMi4x
NS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdWNtLWNvbmZfMS4y
LjE1LjEuYmIKQEAgLTgsNyArOCw3IEBAIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MjBkNzRkNzRkYjk3NDE2OTc5MDMzNzJh
ZDAwMWQzYjQiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cuYWxzYS1wcm9qZWN0Lm9yZy9maWxl
cy9wdWIvbGliLyR7QlB9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTUxMGNiMDk0
N2EzYmI4NzdiNWNlMjE4ZTNlY2VkZDc4YmZhNjY0M2UzNzIzNDZjODdkOTNkNDg0NGE0NWZmYSIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyNDZjNWQ1OWQyMTdiNmY3ZjQ3YTExZmQxMGYxYjc2NmQy
NWFiY2IwZDljOTk2YWYzMDc5YmI5YzlhYzVhMWIwIgogIyBTb21ldGhpbmcgd2VudCB3cm9uZyBh
dCB1cHN0cmVhbSB0YXJiYWxsaW5nCiAKIGluaGVyaXQgYWxsYXJjaAotLSAKMi40Ny4xCgo=

--===============0148959358263540159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: added "/usr/share/alsa/ucm2/codecs/cs42l45/init.conf"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/codecs/cs42l45 was added
  /usr/share/alsa/ucm2/codecs/cs42l45/init.conf was added

--===============0148959358263540159==--

