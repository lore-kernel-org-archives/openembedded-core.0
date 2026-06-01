Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F7CCD6E6A
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:39 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1566.1780328135645243064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Fz1fQUdX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OUgdXeKz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019e83d3836a-1edc03fa-ed71-4276-a051-3726a39678d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jbTx+22ZXhCqURRvvd84AdBeY95qHkRSPGvmaWHPtV0=;
	b=Fz1fQUdXZxLJJ8mUyKdiaTGns0UobO+hPe/pqXEtLozJaTPzRIZy/qEGVkPqXoeQ
	ercox9QiAj0z+1O3PnoCmcv0auSm5FpwR41QJMYMgrhUc4tf0vSu0B2ONSjq4Z3Mi1V
	73Bi4iTL+RDdteGIb85YWHAg/AsCO/WeeVnBlDP0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jbTx+22ZXhCqURRvvd84AdBeY95qHkRSPGvmaWHPtV0=;
	b=OUgdXeKzU7vWpo0CdQnPBWgAwZ3UBkm9RIseLapRdJlNkIV+G7ClQJNWW+iOt6FC
	MmP2wXuEgG4FMzEK3Y5t3K6Vxg0aKicoVQPjuVJt9WBNuVoXPIPOsJ2upIiFtzR9THt
	BRaKbZtSFauewV4ScpRklAsHNWWbyykE7Ymp8+Ng=
Content-Type: multipart/mixed; boundary="===============4956378942407095668=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.30.0 SUCCEEDED
Message-ID: <0101019e83d3836a-1edc03fa-ed71-4276-a051-3726a39678d4-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237877

--===============4956378942407095668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hatchling* to *1.30.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.29.0-1.30.0.patch
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
From a5f95def139083537fc47a146cda971b3c5fae40 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 08:27:08 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.29.0 -> 1.30.0

---
 ...{python3-hatchling_1.29.0.bb => python3-hatchling_1.30.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.29.0.bb => python3-hatchling_1.30.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.29.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.30.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hatchling_1.29.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.30.0.bb
index 080a954f7f..e6490c0fde 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.29.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.30.0.bb
@@ -7,6 +7,6 @@ inherit pypi python_hatchling
 
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 
-SRC_URI[sha256sum] = "793c31816d952cee405b83488ce001c719f325d9cda69f1fc4cd750527640ea6"
+SRC_URI[sha256sum] = "0a3573460dfdef605f061e000e94e910c64c5230093c391bf4c7f5cdcad0d519"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============4956378942407095668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hatchling-1.30.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info -> /usr/lib/python3.14/site-packages/hatchling-1.30.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info moved to /usr/lib/python3.14/site-packages/hatchling-1.30.0.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info moved to /usr/lib/python3.14/site-packages/hatchling-1.30.0.dist-info

--===============4956378942407095668==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.29.0-1.30.0.patch"

RnJvbSBhNWY5NWRlZjEzOTA4MzUzN2ZjNDdhMTQ2Y2RhOTcxYjNjNWZhZTQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwODoyNzowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2hsaW5nOiB1cGdyYWRlIDEuMjkuMCAtPiAxLjMwLjAKCi0tLQogLi4ue3B5dGhv
bjMtaGF0Y2hsaW5nXzEuMjkuMC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjMwLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oYXRjaGxpbmdfMS4yOS4w
LmJiID0+IHB5dGhvbjMtaGF0Y2hsaW5nXzEuMzAuMC5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjkuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4zMC4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4yOS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzAuMC5iYgppbmRleCAwODBhOTU0
ZjdmLi5lNjQ5MGMwZmRlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjkuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzAuMC5iYgpAQCAtNyw2ICs3LDYgQEAgaW5oZXJp
dCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAogREVQRU5EUyArPSAicHl0aG9uMy1wbHVnZ3ktbmF0
aXZlIHB5dGhvbjMtcGF0aHNwZWMtbmF0aXZlIHB5dGhvbjMtcGFja2FnaW5nLW5hdGl2ZSBweXRo
b24zLWVkaXRhYmxlcy1uYXRpdmUgcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVycy1uYXRpdmUiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3OTNjMzE4MTZkOTUyY2VlNDA1YjgzNDg4Y2UwMDFjNzE5
ZjMyNWQ5Y2RhNjlmMWZjNGNkNzUwNTI3NjQwZWE2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBh
MzU3MzQ2MGRmZGVmNjA1ZjA2MWUwMDBlOTRlOTEwYzY0YzUyMzAwOTNjMzkxYmY0YzdmNWNkY2Fk
MGQ1MTkiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLS0gCjIuNDcuMQoK

--===============4956378942407095668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hatchling: PV changed from "1.29.0" to "1.30.0"
packages/x86-64-v3-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.29.0.tar.gz;downloadfilename=hatchling-1.29.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.30.0.tar.gz;downloadfilename=hatchling-1.30.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-hatchling: PKGV changed from 1.29.0 [default] to 1.30.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.29.0" to "1.30.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.29.0 [default] to 1.30.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.29.0" to "1.30.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.29.0 [default] to 1.30.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.29.0" to "1.30.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.29.0 [default] to 1.30.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.29.0" to "1.30.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.29.0 [default] to 1.30.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.29.0" to "1.30.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.29.0 [default] to 1.30.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.29.0" to "1.30.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.29.0 [default] to 1.30.0 [default]
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 691490 to 712959 (+3%)
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.29.0" to "1.30.0"
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/hatchling-1.30.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info -> /usr/lib/python3.14/site-packages/hatchling-1.30.0.dist-info
packages/x86-64-v3-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.29.0 [default] to 1.30.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info moved to /usr/lib/python3.14/site-packages/hatchling-1.30.0.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.14/site-packages/hatchling-1.29.0.dist-info moved to /usr/lib/python3.14/site-packages/hatchling-1.30.0.dist-info

--===============4956378942407095668==--

