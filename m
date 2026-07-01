Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63562C44507
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 06:34:31 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39122.1782887652168572971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 23:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=pZvVuI9B;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=19d6w6Mu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f1c62a101-71536bf0-4b50-4a95-b137-0486cf70ab16-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782887653;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7T1W1YhX2HHFeVbKI7MbeqFY4reCbXGROXi38Wk+ge4=;
	b=pZvVuI9B35CffoDCt/m5xotzwXE5x5IkHcpgWHEj5P759yXKO/XcvZBtX9BlVlHJ
	l48f1x8F60JQntFhm5/p4D6pWNuxU4669Z043Tv9vDTjTE3TlUXpZAhyMQBRwVYuV9f
	5FcD2pvG07yODkFqgedG12Ji2KgtuCj+ugywofkM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782887653;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7T1W1YhX2HHFeVbKI7MbeqFY4reCbXGROXi38Wk+ge4=;
	b=19d6w6Mu+tG+AfWgcs08iVphK3Ut1UoGxKUbOLsbdRi0Yig1qE2p5QnXioaDc0yd
	5IkGHQwZ0zOnh41MiJwjVAaVr/wT4XbiIEoyCWIdLBMqKI7CbQWiqa4qoV0Xx/ShsTJ
	DDtj7a1Lev1ZWUqbKAcUgIMXthV06bVAcqr3bm0g=
Content-Type: multipart/mixed; boundary="===============5043594754454325707=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 323 SUCCEEDED
Message-ID: <0101019f1c62a101-71536bf0-4b50-4a95-b137-0486cf70ab16-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jul 2026 06:34:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 06:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239939

--===============5043594754454325707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *323* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-319-323.patch
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
From fe90392355c17392296073f1519ae27c62ff0afb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jul 2026 06:26:50 +0000
Subject: [PATCH] diffoscope: upgrade 319 -> 323

---
 .../diffoscope/{diffoscope_319.bb => diffoscope_323.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_319.bb => diffoscope_323.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_319.bb b/meta/recipes-support/diffoscope/diffoscope_323.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_319.bb
rename to meta/recipes-support/diffoscope/diffoscope_323.bb
index 258dab9027..dcc144775d 100644
--- a/meta/recipes-support/diffoscope/diffoscope_319.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_323.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "990d8ac71a5e7045c8ad6c66353f6a0dcbf5537ab323295e31bd795b043aa916"
+SRC_URI[sha256sum] = "28a1bff945de1d160efff07200f1d79e7890320913e1871f114bb697a52dbfcd"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============5043594754454325707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 319 [default] to 323 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "319" to "323"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 319 [default] to 323 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "319" to "323"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 319 [default] to 323 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "319" to "323"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 319 [default] to 323 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "319" to "323"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 319 [default] to 323 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "319" to "323"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 319 [default] to 323 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "319" to "323"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 319 [default] to 323 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1411758 to 1412475 (+0%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-319.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-323.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-319.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-323.dist-info/licenses
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "319" to "323"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 319 [default] to 323 [default]
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-319.tar.gz;downloadfilename=diffoscope-319.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-323.tar.gz;downloadfilename=diffoscope-323.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "319" to "323"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-319.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-323.dist-info

--===============5043594754454325707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-319.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-323.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-319.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-323.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-319.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-323.dist-info

--===============5043594754454325707==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-319-323.patch"

RnJvbSBmZTkwMzkyMzU1YzE3MzkyMjk2MDczZjE1MTlhZTI3YzYyZmYwYWZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKdWwgMjAyNiAwNjoyNjo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMzE5IC0+IDMyMwoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8zMTkuYmIgPT4gZGlmZm9zY29wZV8zMjMuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzMxOS5iYiA9PiBkaWZmb3Njb3BlXzMy
My5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMzE5LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzMyMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMzE5LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMzIzLmJiCmluZGV4IDI1OGRhYjkw
MjcuLmRjYzE0NDc3NWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMTkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMyMy5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HO21kNT1kMzIyMzliY2I2NzM0NjNhYjg3NGU4MGQ0N2ZhZTUwNCIKIAog
aW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5OTBkOGFj
NzFhNWU3MDQ1YzhhZDZjNjYzNTNmNmEwZGNiZjU1MzdhYjMyMzI5NWUzMWJkNzk1YjA0M2FhOTE2
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI4YTFiZmY5NDVkZTFkMTYwZWZmZjA3MjAwZjFkNzll
Nzg5MDMyMDkxM2UxODcxZjExNGJiNjk3YTUyZGJmY2QiCiAKIFJERVBFTkRTOiR7UE59ICs9ICJc
CiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDcuMQoK

--===============5043594754454325707==--

