Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5432C25B78
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.835.1686887484029925669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Vaxf/H8K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188c254485f-e3d4aa79-a0a4-4548-9bd2-55f343a9fb0a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=K2fz4IbiPQDgMZON/eodFisDc+Y21yxZlz5kj0ippYM=;
	b=Vaxf/H8KA46lj/c2TEpRDZ1aThSh64FXAvgz0IySqZQytLA5JhlmEfYLktFfNhV5
	kRbb2F4FSKAcYsCZ/LCwgOlpwb+RNw8gfHAmfhrKgoRNp7Vp3CKPqkFDwjG71iApOgH
	5yrA/sUHT++An1QjKB/6KQiU/byO6yUnTl9EGwyo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=K2fz4IbiPQDgMZON/eodFisDc+Y21yxZlz5kj0ippYM=;
	b=pjkcmtU4hxQpO73/bQ/j64btmex4aVDv4KpN59u1XHSyol/Rbp+oO8FS22euEl5+
	Sfhx9z+ZI+mqCd0trdj4xZq3VPWVcSpzE8OhALEzJVMXKJDUOKDogtGEBdN9K5wGvAa
	jBdOn84zh17y4gVJqk7JMYEnbVW25WwAo2EYVRR8=
Content-Type: multipart/mixed; boundary="===============8391525223673475402=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gawk: upgrading to 5.2.2 SUCCEEDED
Message-ID: <01010188c254485f-e3d4aa79-a0a4-4548-9bd2-55f343a9fb0a-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182931

--===============8391525223673475402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gawk* to *5.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gawk-upgrade-5.2.1-5.2.2.patch
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
From 219be1dfcf1d0e26ec2cedf786dd20d9056eadb3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 15:48:11 +0000
Subject: [PATCH] gawk: upgrade 5.2.1 -> 5.2.2

---
 meta/recipes-extended/gawk/{gawk_5.2.1.bb => gawk_5.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/gawk/{gawk_5.2.1.bb => gawk_5.2.2.bb} (97%)

diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-extended/gawk/gawk_5.2.2.bb
similarity index 97%
rename from meta/recipes-extended/gawk/gawk_5.2.1.bb
rename to meta/recipes-extended/gawk/gawk_5.2.2.bb
index 768c8eb364..3c18b6911a 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.2.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "529e7c8c6acf21ff3a6183f4d763c632810908989c24675c77995d51ac37b79c"
+SRC_URI[sha256sum] = "945aef7ccff101f20b22a10802bc005e994ab2b8ea3e724cc1a197c62f41f650"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.39.2


--===============8391525223673475402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gawk/gawk-dbg: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-dbg: PKGSIZE changed from 2139924 to 2146120 (+0%)
packages/core2-32-poky-linux/gawk/gawk-dbg: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-dev: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-dev: PKGSIZE changed from 41697 to 42070 (+1%)
packages/core2-32-poky-linux/gawk/gawk-dev: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-doc: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-doc: PKGSIZE changed from 2206542 to 2338623 (+6%)
packages/core2-32-poky-linux/gawk/gawk-doc: FILELIST: added "/usr/share/info/gawk_process-flow.png /usr/share/info/gawk_general-program.png /usr/share/info/gawk_api-figure1.png /usr/share/info/gawk_api-figure3.png /usr/share/info/gawk_api-figure2.png /usr/share/info/gawk_array-elements.png /usr/share/info/gawk_statist.jpg"
packages/core2-32-poky-linux/gawk/gawk-doc: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-gawkbug: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-gawkbug: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-bg: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-bg: PKGSIZE changed from 123327 to 124398 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-bg: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-ca: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-ca: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-da: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-da: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-de: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-de: PKGSIZE changed from 95421 to 96121 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-de: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-es: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-es: PKGSIZE changed from 93871 to 94596 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-es: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-fi: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-fi: PKGSIZE changed from 56749 to 56651 (-0%)
packages/core2-32-poky-linux/gawk/gawk-locale-fi: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-fr: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-fr: PKGSIZE changed from 95624 to 96365 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-fr: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-id: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-id: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-it: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-it: PKGSIZE changed from 91483 to 92033 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-it: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-ja: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-ja: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-ko: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-ko: PKGSIZE changed from 98866 to 99705 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-ko: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-ms: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-ms: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-nl: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-nl: PKGSIZE changed from 69017 to 68931 (-0%)
packages/core2-32-poky-linux/gawk/gawk-locale-nl: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-pl: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-pl: PKGSIZE changed from 93249 to 93988 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-pl: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-pt-br: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-pt-br: PKGSIZE changed from 86832 to 86740 (-0%)
packages/core2-32-poky-linux/gawk/gawk-locale-pt-br: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-pt: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-pt: PKGSIZE changed from 85587 to 85495 (-0%)
packages/core2-32-poky-linux/gawk/gawk-locale-pt: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-ro: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-ro: PKGSIZE changed from 96499 to 97245 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-ro: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-sr: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-sr: PKGSIZE changed from 115676 to 115587 (-0%)
packages/core2-32-poky-linux/gawk/gawk-locale-sr: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-sv: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-sv: PKGSIZE changed from 91208 to 91921 (+1%)
packages/core2-32-poky-linux/gawk/gawk-locale-sv: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-vi: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-vi: PKGSIZE changed from 64292 to 64194 (-0%)
packages/core2-32-poky-linux/gawk/gawk-locale-vi: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-locale-zh-cn: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-locale-zh-cn: PKGSIZE changed from 82377 to 86163 (+5%)
packages/core2-32-poky-linux/gawk/gawk-locale-zh-cn: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-ptest: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-ptest: PKGSIZE changed from 1378823 to 1381664 (+0%)
packages/core2-32-poky-linux/gawk/gawk-ptest: FILELIST: added "/usr/lib/gawk/ptest/test/asortsymtab.awk /usr/lib/gawk/ptest/test/elemnew2.awk /usr/lib/gawk/ptest/test/elemnew1.awk /usr/lib/gawk/ptest/test/fieldassign.ok /usr/lib/gawk/ptest/test/fieldassign.in /usr/lib/gawk/ptest/test/elemnew1.ok /usr/lib/gawk/ptest/test/elemnew3.ok /usr/lib/gawk/ptest/test/elemnew3.awk /usr/lib/gawk/ptest/test/elemnew2.ok /usr/lib/gawk/ptest/test/fieldassign.awk /usr/lib/gawk/ptest/test/asortsymtab.ok"
packages/core2-32-poky-linux/gawk/gawk-ptest: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-src: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-src: PKGSIZE changed from 2328480 to 2336061 (+0%)
packages/core2-32-poky-linux/gawk/gawk-src: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk-staticdev: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk-staticdev: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk/gawk: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk/gawk: PKGSIZE changed from 1002389 to 1002400 (+0%)
packages/core2-32-poky-linux/gawk/gawk: FILELIST: removed "/usr/bin/gawk-5.2.1", added "/usr/bin/gawk-5.2.2"
packages/core2-32-poky-linux/gawk/gawk: PV changed from "5.2.1" to "5.2.2"
packages/core2-32-poky-linux/gawk: PKGV changed from 5.2.1 [default] to 5.2.2 [default]
packages/core2-32-poky-linux/gawk: SRC_URI changed from "https://ftp.gnu.org/gnu/gawk/gawk-5.2.1.tar.gz file://run-ptest" to "https://ftp.gnu.org/gnu/gawk/gawk-5.2.2.tar.gz file://run-ptest"
packages/core2-32-poky-linux/gawk: PV changed from "5.2.1" to "5.2.2"

--===============8391525223673475402==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gawk-upgrade-5.2.1-5.2.2.patch"

RnJvbSAyMTliZTFkZmNmMWQwZTI2ZWMyY2VkZjc4NmRkMjBkOTA1NmVhZGIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTU6NDg6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
YXdrOiB1cGdyYWRlIDUuMi4xIC0+IDUuMi4yCgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9n
YXdrL3tnYXdrXzUuMi4xLmJiID0+IGdhd2tfNS4yLjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2dhd2sve2dhd2tfNS4yLjEuYmIgPT4gZ2F3a181LjIuMi5iYn0gKDk3JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuMi4xLmJiIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2dhd2svZ2F3a181LjIuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuMi4xLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuMi4yLmJiCmluZGV4IDc2OGM4
ZWIzNjQuLjNjMThiNjkxMWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdr
L2dhd2tfNS4yLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dhd2svZ2F3a181LjIu
Mi5iYgpAQCAtMTksNyArMTksNyBAQCBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vZ2F3ay9nYXdr
LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAg
ICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1MjllN2M4YzZhY2YyMWZmM2E2MTgzZjRkNzYz
YzYzMjgxMDkwODk4OWMyNDY3NWM3Nzk5NWQ1MWFjMzdiNzljIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjk0NWFlZjdjY2ZmMTAxZjIwYjIyYTEwODAyYmMwMDVlOTk0YWIyYjhlYTNlNzI0Y2MxYTE5
N2M2MmY0MWY2NTAiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQgdGV4aW5mbyB1cGRhdGUt
YWx0ZXJuYXRpdmVzCiAKLS0gCjIuMzkuMgoK

--===============8391525223673475402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gawk/gawk-doc: FILELIST: added "/usr/share/info/gawk_api-figure3.png /usr/share/info/gawk_api-figure1.png /usr/share/info/gawk_api-figure2.png /usr/share/info/gawk_statist.jpg /usr/share/info/gawk_general-program.png /usr/share/info/gawk_process-flow.png /usr/share/info/gawk_array-elements.png"
packages/core2-32-poky-linux/gawk/gawk-ptest: FILELIST: added "/usr/lib/gawk/ptest/test/fieldassign.ok /usr/lib/gawk/ptest/test/asortsymtab.ok /usr/lib/gawk/ptest/test/elemnew2.ok /usr/lib/gawk/ptest/test/elemnew1.ok /usr/lib/gawk/ptest/test/elemnew3.awk /usr/lib/gawk/ptest/test/fieldassign.in /usr/lib/gawk/ptest/test/elemnew2.awk /usr/lib/gawk/ptest/test/asortsymtab.awk /usr/lib/gawk/ptest/test/elemnew1.awk /usr/lib/gawk/ptest/test/fieldassign.awk /usr/lib/gawk/ptest/test/elemnew3.ok"
packages/core2-32-poky-linux/gawk/gawk: FILELIST: removed "/usr/bin/gawk-5.2.1", added "/usr/bin/gawk-5.2.2"

--===============8391525223673475402==--

