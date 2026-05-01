Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA092CD484E
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:58 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15627.1777645547084213696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=k+ZN94OL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ol1g1SKi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019de3ee89c1-ea326bd8-6e77-45a0-95f6-68fcbd53a540-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5zO98FEE6+exVQabj9nT3B0nllScgdYHX9uzFauw02c=;
	b=k+ZN94OLvlJnls6lxTl/hCzjVVxBi4sN55IfNufDQTzLGAPFcDycDP5znEGuZ+6J
	NOZQ++TTrcJ9E7BgCEnicmzZDEvZiRGe9N2jIhbuKn5j5wxOxJh9pnx5XMrV6qMp5kG
	XYAKQ7pcY3J7hvbiVhlge0pQhld8Ap/PwZQMsl3A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5zO98FEE6+exVQabj9nT3B0nllScgdYHX9uzFauw02c=;
	b=Ol1g1SKi0Z7yyRSa2TunETxoskorSmExhrsE3FeFcZ/lQ9sfVUzmu/u3MAoi19mD
	N0wO264gz0ZSzC0ScN73fLa3KCNjbrW5Y5a2PiNPtaXIwzQcgeSkWoqdG+jzF6XVetL
	Is8tT7kFJmVuAs5xhlHTskYGZhMpN3ACxmoxOoJI=
Content-Type: multipart/mixed; boundary="===============6724877548812716063=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.60.3 SUCCEEDED
Message-ID: <0101019de3ee89c1-ea326bd8-6e77-45a0-95f6-68fcbd53a540-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236291

--===============6724877548812716063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *at-spi2-core* to *2.60.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-at-spi2-core-upgrade-2.60.0-2.60.3.patch
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
From fe670b7cf99b7b5f7b14c4ea6f3edaa199074469 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 13:13:40 +0000
Subject: [PATCH] at-spi2-core: upgrade 2.60.0 -> 2.60.3

---
 .../atk/{at-spi2-core_2.60.0.bb => at-spi2-core_2.60.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.60.0.bb => at-spi2-core_2.60.3.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.60.0.bb b/meta/recipes-support/atk/at-spi2-core_2.60.3.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.60.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.60.3.bb
index 8e3314222c..4ebd0d0bf0 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.60.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.60.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "80e50c1a97d8fd660a3fadb02ca35876df881c266d3d6108fc5b4c113614cb99"
+SRC_URI[archive.sha256sum] = "21056bc04e43e8ed34fdafd916a0ddcc29ec03a4ce6cf5aacac1ddf6ef185ef7"
 
 DEPENDS = " \
 	dbus \
-- 
2.47.1


--===============6724877548812716063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: FILELIST: removed "/usr/lib/libatk-1.0.so.0.26009.1", added "/usr/lib/libatk-1.0.so.0.26012.1"
packages/x86-64-v3-poky-linux/at-spi2-core: PACKAGES: added "at-spi2-core-locale-lo"
Changes to packages/x86-64-v3-poky-linux/at-spi2-core (sysroot):
  /usr/lib/libatk-1.0.so.0 changed symlink target from libatk-1.0.so.0.26009.1 to libatk-1.0.so.0.26012.1
  /usr/lib/libatk-1.0.so.0.26009.1 moved to /usr/lib/libatk-1.0.so.0.26012.1

--===============6724877548812716063==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-at-spi2-core-upgrade-2.60.0-2.60.3.patch"

RnJvbSBmZTY3MGI3Y2Y5OWI3YjVmN2IxNGM0ZWE2ZjNlZGFhMTk5MDc0NDY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMzoxMzo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGF0
LXNwaTItY29yZTogdXBncmFkZSAyLjYwLjAgLT4gMi42MC4zCgotLS0KIC4uLi9hdGsve2F0LXNw
aTItY29yZV8yLjYwLjAuYmIgPT4gYXQtc3BpMi1jb3JlXzIuNjAuMy5iYn0gICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay97YXQtc3BpMi1jb3JlXzIuNjAuMC5iYiA9PiBhdC1zcGky
LWNvcmVfMi42MC4zLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2F0ay9hdC1zcGkyLWNvcmVfMi42MC4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0
LXNwaTItY29yZV8yLjYwLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0LXNwaTItY29yZV8yLjYwLjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1zcGkyLWNvcmVfMi42MC4zLmJiCmluZGV4IDhlMzMx
NDIyMmMuLjRlYmQwZDBiZjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9h
dC1zcGkyLWNvcmVfMi42MC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1z
cGkyLWNvcmVfMi42MC4zLmJiCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIAogQ1ZF
X1BST0RVQ1QgKz0gImF0LXNwaTItYXRrIgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9
ICI4MGU1MGMxYTk3ZDhmZDY2MGEzZmFkYjAyY2EzNTg3NmRmODgxYzI2NmQzZDYxMDhmYzViNGMx
MTM2MTRjYjk5IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMjEwNTZiYzA0ZTQzZThl
ZDM0ZmRhZmQ5MTZhMGRkY2MyOWVjMDNhNGNlNmNmNWFhY2FjMWRkZjZlZjE4NWVmNyIKIAogREVQ
RU5EUyA9ICIgXAogCWRidXMgXAotLSAKMi40Ny4xCgo=

--===============6724877548812716063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: FILELIST: removed "/usr/lib/.debug/libatk-1.0.so.0.26009.1", added "/usr/lib/.debug/libatk-1.0.so.0.26012.1"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: PKGSIZE changed from 2423200 to 2430400 (+0%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dbg: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dev: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-dev: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-doc: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-doc: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ab: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ab: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-af: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-af: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-am: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-am: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-an: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-an: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ar: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ar: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-as: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-as: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ast: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ast: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-az: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-az: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be+latin: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be+latin: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-be: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bg: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bg: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn-in: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn-in: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bn: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bs: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-bs: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca+valencia: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca+valencia: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ca: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ckb: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ckb: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cs: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cs: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cy: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-cy: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-da: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-da: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-de: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-de: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-dz: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-dz: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-el: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-el: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en+shaw: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en+shaw: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-ca: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-ca: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-gb: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-en-gb: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eo: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eo: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-es: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-es: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-et: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-et: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eu: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-eu: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fa: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fa: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fi: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fi: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fr: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fr: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fur: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-fur: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ga: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ga: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gd: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gd: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gl: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gl: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gu: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-gu: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-he: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-he: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hi: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hi: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hr: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hr: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hu: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hu: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hy: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-hy: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-id: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-id: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-is: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-is: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-it: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-it: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ja: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ja: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ka: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ka: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kab: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kab: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kk: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kk: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-km: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-km: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kn: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-kn: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ko: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ko: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ku: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ku: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-li: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-li: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lt: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lt: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lv: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-lv: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mai: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mai: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mk: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mk: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ml: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ml: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mn: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mn: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mr: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-mr: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ms: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ms: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nb: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nb: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ne: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ne: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nl: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nl: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nn: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-nn: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-oc: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-oc: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-or: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-or: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pa: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pa: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pl: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pl: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ps: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ps: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt-br: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt-br: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-pt: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ro: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ro: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ru: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ru: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-rw: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-rw: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-si: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-si: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sk: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sk: PKGSIZE changed from 10547 to 11210 (+6%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sk: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sl: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sl: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sq: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sq: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+ije: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+ije: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+latin: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr+latin: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sr: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sv: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-sv: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ta: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ta: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-te: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-te: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tg: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tg: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-th: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-th: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tk: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tk: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tr: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tr: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tt: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-tt: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ug: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-ug: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uk: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uk: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz+cyrillic: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz+cyrillic: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-uz: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-vi: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-vi: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-wa: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-wa: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-xh: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-xh: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-yi: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-yi: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-cn: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-cn: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-hk: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-hk: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-tw: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zh-tw: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zu: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-locale-zu: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: FILELIST: directory renamed /usr/src/debug/at-spi2-core/2.60.0/atk -> /usr/src/debug/at-spi2-core/2.60.3/atk, directory renamed /usr/src/debug/at-spi2-core/2.60.0/atspi -> /usr/src/debug/at-spi2-core/2.60.3/atspi, directory renamed /usr/src/debug/at-spi2-core/2.60.0/xml -> /usr/src/debug/at-spi2-core/2.60.3/xml, directory renamed /usr/src/debug/at-spi2-core/2.60.0/atk-adaptor/adaptors -> /usr/src/debug/at-spi2-core/2.60.3/atk-adaptor/adaptors, directory renamed /usr/src/debug/at-spi2-core/2.60.0/atk-adaptor -> /usr/src/debug/at-spi2-core/2.60.3/atk-adaptor, directory renamed /usr/src/debug/at-spi2-core/2.60.0/dbind -> /usr/src/debug/at-spi2-core/2.60.3/dbind, directory renamed /usr/src/debug/at-spi2-core/2.60.0/bus -> /usr/src/debug/at-spi2-core/2.60.3/bus, directory renamed /usr/src/debug/at-spi2-core/2.60.0/registryd -> /usr/src/debug/at-spi2-core/2.60.3/registryd, directory renamed /usr/src/debug/at-spi2-core/2.60.0/atk-
 adaptor/gtk-2.0 -> /usr/src/debug/at-spi2-core/2.60.3/atk-adaptor/gtk-2.0, directory renamed /usr/src/debug/at-spi2-core/2.60.0/droute -> /usr/src/debug/at-spi2-core/2.60.3/droute
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: PKGSIZE changed from 2120090 to 2127894 (+0%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-src: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-staticdev: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core-staticdev: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: FILELIST: removed "/usr/lib/libatk-1.0.so.0.26009.1", added "/usr/lib/libatk-1.0.so.0.26012.1"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: PKGSIZE changed from 982609 to 982634 (+0%)
packages/x86-64-v3-poky-linux/at-spi2-core/at-spi2-core: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core: PV changed from "2.60.0" to "2.60.3"
packages/x86-64-v3-poky-linux/at-spi2-core: PKGV changed from 2.60.0 [default] to 2.60.3 [default]
packages/x86-64-v3-poky-linux/at-spi2-core: SRC_URI changed from "https://download.gnome.org/sources//at-spi2-core/2.60/at-spi2-core-2.60.0.tar.xz;name=archive" to "https://download.gnome.org/sources//at-spi2-core/2.60/at-spi2-core-2.60.3.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/at-spi2-core: PACKAGES: added "at-spi2-core-locale-lo"
Changes to packages/x86-64-v3-poky-linux/at-spi2-core (sysroot):
  /usr/lib/libatk-1.0.so.0 changed symlink target from libatk-1.0.so.0.26009.1 to libatk-1.0.so.0.26012.1
  /usr/lib/libatk-1.0.so.0.26009.1 moved to /usr/lib/libatk-1.0.so.0.26012.1

--===============6724877548812716063==--

