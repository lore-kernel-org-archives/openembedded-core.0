Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E933E77198
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:35 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11348.1735723954479910533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UgaD/dj3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QhGwCAqf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101942135a339-cc551111-b1bc-4057-99ef-b959e61c2217-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723951;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KET6kLQ9IG/P8q2qW7b2cSc32qtTGt3ie9T/pcnmq/c=;
	b=UgaD/dj3r/x3mXf/qFC63iS5aNFkHluscxgP8jbjoh0ta78nFRHW/ZsWqctLye84
	YEWWiW/KP9nqdiNkGOv45Z22ACGkQvDSCl+ekYfNU4SjHRjIxInoUMKMIROwQZiX/0u
	6l8hbHt7/aqZnp5CX+BulBzNaOMJ5v6b2peY24W8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723951;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KET6kLQ9IG/P8q2qW7b2cSc32qtTGt3ie9T/pcnmq/c=;
	b=QhGwCAqfkz3cYtpoNMDNCHBxMIiwRG07eVZKp4l/w/WQPtv13fcsbE3stCwlYxLy
	RG2Gk2EPUzIjknVkidml+EtvyDJaOzsRyeOY9sX+sIgWZQGKsr2K6BxlULz+uqX1ot0
	pmTi8uNCE4eudWQWz1UnTnDbGh7eTmRBOYb5awSI=
Content-Type: multipart/mixed; boundary="===============4269442424248040828=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cracklib: upgrading to 2.10.3 SUCCEEDED
Message-ID: <010101942135a339-cc551111-b1bc-4057-99ef-b959e61c2217-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209237

--===============4269442424248040828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cracklib* to *2.10.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cracklib-upgrade-2.10.2-2.10.3.patch
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
From 47b6f174c459c8ae3fc6d8f238895ec54c9e5970 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 08:00:11 +0000
Subject: [PATCH] cracklib: upgrade 2.10.2 -> 2.10.3

---
 .../cracklib/{cracklib_2.10.2.bb => cracklib_2.10.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cracklib/{cracklib_2.10.2.bb => cracklib_2.10.3.bb} (93%)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.10.2.bb b/meta/recipes-extended/cracklib/cracklib_2.10.3.bb
similarity index 93%
rename from meta/recipes-extended/cracklib/cracklib_2.10.2.bb
rename to meta/recipes-extended/cracklib/cracklib_2.10.3.bb
index 2c913da152..c3396521ff 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.10.2.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.10.3.bb
@@ -12,7 +12,7 @@ EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=main \
            "
 
-SRCREV = "e5211fc1d2b435884a2bb77001e107489285296d"
+SRCREV = "e73d5db1789d198b5f9ec44b68b9c775c3e6c042"
 S = "${WORKDIR}/git/src"
 
 inherit autotools gettext
-- 
2.44.1


--===============4269442424248040828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cracklib/cracklib-dbg: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-dbg: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-dev: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-dev: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-doc: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-doc: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-as: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-as: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-be: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-be: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-bn-in: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-bn-in: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-ca: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-ca: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-cs: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-cs: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-da: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-da: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-de: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-de: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-el: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-el: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-es: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-es: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-es: PKGSIZE changed from 1854 to 1904 (+3%)
packages/core2-64-poky-linux/cracklib/cracklib-locale-eu: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-eu: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-fi: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-fi: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-fr: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-fr: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-gu: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-gu: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-he: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-he: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-hi: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-hi: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-hu: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-hu: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-id: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-id: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-it: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-it: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-ja: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-ja: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-kk: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-kk: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-kn: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-kn: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-ko: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-ko: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-lt: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-lt: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-ml: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-ml: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-mr: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-mr: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-nb: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-nb: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-nl: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-nl: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-or: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-or: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-pa: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-pa: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-pl: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-pl: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-pt-br: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-pt-br: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-pt: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-pt: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-ru: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-ru: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-sk: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-sk: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-sl: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-sl: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-sq: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-sq: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-sv: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-sv: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-ta: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-ta: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-te: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-te: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-tr: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-tr: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-uk: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-uk: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-zh-cn: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-zh-cn: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-locale-zh-tw: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-locale-zh-tw: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-src: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-src: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib-staticdev: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib-staticdev: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib/cracklib: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib/cracklib: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib: PV changed from "2.10.2" to "2.10.3"
packages/core2-64-poky-linux/cracklib: PKGV changed from 2.10.2 [default] to 2.10.3 [default]
packages/core2-64-poky-linux/cracklib: PACKAGES: added "cracklib-locale-si cracklib-locale-ro cracklib-locale-ka cracklib-locale-fur"

--===============4269442424248040828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/cracklib: PACKAGES: added "cracklib-locale-si cracklib-locale-fur cracklib-locale-ka cracklib-locale-ro"

--===============4269442424248040828==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cracklib-upgrade-2.10.2-2.10.3.patch"

RnJvbSA0N2I2ZjE3NGM0NTljOGFlM2ZjNmQ4ZjIzODg5NWVjNTRjOWU1OTcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwODowMDoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNy
YWNrbGliOiB1cGdyYWRlIDIuMTAuMiAtPiAyLjEwLjMKCi0tLQogLi4uL2NyYWNrbGliL3tjcmFj
a2xpYl8yLjEwLjIuYmIgPT4gY3JhY2tsaWJfMi4xMC4zLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2NyYWNrbGliL3tjcmFja2xpYl8yLjEwLjIuYmIgPT4gY3JhY2tsaWJf
Mi4xMC4zLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jcmFj
a2xpYi9jcmFja2xpYl8yLjEwLjIuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3JhY2tsaWIv
Y3JhY2tsaWJfMi4xMC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9jcmFja2xpYi9jcmFja2xpYl8yLjEwLjIuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9jcmFja2xpYi9jcmFja2xpYl8yLjEwLjMuYmIKaW5kZXggMmM5
MTNkYTE1Mi4uYzMzOTY1MjFmZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Ny
YWNrbGliL2NyYWNrbGliXzIuMTAuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Jh
Y2tsaWIvY3JhY2tsaWJfMi4xMC4zLmJiCkBAIC0xMiw3ICsxMiw3IEBAIEVYVFJBX09FQ09ORiA9
ICItLXdpdGhvdXQtcHl0aG9uIC0tbGliZGlyPSR7YmFzZV9saWJkaXJ9IgogU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL2NyYWNrbGliL2NyYWNrbGliO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1t
YWluIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiZTUyMTFmYzFkMmI0MzU4ODRhMmJiNzcw
MDFlMTA3NDg5Mjg1Mjk2ZCIKK1NSQ1JFViA9ICJlNzNkNWRiMTc4OWQxOThiNWY5ZWM0NGI2OGI5
Yzc3NWMzZTZjMDQyIgogUyA9ICIke1dPUktESVJ9L2dpdC9zcmMiCiAKIGluaGVyaXQgYXV0b3Rv
b2xzIGdldHRleHQKLS0gCjIuNDQuMQoK

--===============4269442424248040828==--

