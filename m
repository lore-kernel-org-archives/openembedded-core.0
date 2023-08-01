Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4CDC3DA42
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.17710.1690907330073103473
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=I119BItA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NVAjxEb8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010189b1ee42aa-29a690f5-ba4f-4973-8e8a-ec821c1c38e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aOzOPhUq4HZ1JQ2+H58ukHv4AI59V4/ucbCf2FdbuLc=;
	b=I119BItAPffO4Kg8ZkvcwydxWr49kEmTs/oMkgaX79FdLY2XP2mUnbZehuM2Oazu
	JTnqPYDg+9jOSslFCUYXR+K68js/nuRPhpzakGWUtnaL79rK6jz0gnTz/gJ5FEIQcIC
	x2Q5eLzRxCebxf/6isdVQ2chWdQaPkyXIn5g9IeQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aOzOPhUq4HZ1JQ2+H58ukHv4AI59V4/ucbCf2FdbuLc=;
	b=NVAjxEb8wUerywC+23zDMH3XxONhGYjkwN/nyM61XP0jauorMJeeb0rAk5otv0WO
	z73cXagjUXnxj1YWK4V5ErRmTh8ToiEEDi0DHD37WKddyViiJmN8+sF10b1lXHuuBT0
	Hs9lOZPs04kNBpY+M6K2IQgVsSECxh9lYHXQTxuc=
Content-Type: multipart/mixed; boundary="===============7728699762152093902=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.16.2 SUCCEEDED
Message-ID: <01010189b1ee42aa-29a690f5-ba4f-4973-8e8a-ec821c1c38e1-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185276

--===============7728699762152093902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.16.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.16.1-4.16.2.patch
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
From b9f404c59332e292afd5ffe4015849c474b49010 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Aug 2023 09:13:37 +0000
Subject: [PATCH] dnf: upgrade 4.16.1 -> 4.16.2

---
 .../dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch      | 7 ++++---
 meta/recipes-devtools/dnf/{dnf_4.16.1.bb => dnf_4.16.2.bb} | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.16.1.bb => dnf_4.16.2.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index 21b50dee01..0638dab104 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 5e07c16a506b19cbb107d5e99fca41d679b23b9a Mon Sep 17 00:00:00 2001
+From c9d1e07d62139bdeb0b6ce28c4fa2c4116a1f666 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
@@ -10,15 +10,16 @@ already existing, and base-files creating it as a symlink).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  dnf/logging.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/logging.py b/dnf/logging.py
-index bd660470..a9d808b1 100644
+index ef0b25f3..94610af6 100644
 --- a/dnf/logging.py
 +++ b/dnf/logging.py
-@@ -94,7 +94,7 @@ class MultiprocessRotatingFileHandler(logging.handlers.RotatingFileHandler):
+@@ -118,7 +118,7 @@ class MultiprocessRotatingFileHandler(logging.handlers.RotatingFileHandler):
      def __init__(self, filename, mode='a', maxBytes=0, backupCount=0, encoding=None, delay=False):
          super(MultiprocessRotatingFileHandler, self).__init__(
              filename, mode, maxBytes, backupCount, encoding, delay)
diff --git a/meta/recipes-devtools/dnf/dnf_4.16.1.bb b/meta/recipes-devtools/dnf/dnf_4.16.2.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.16.1.bb
rename to meta/recipes-devtools/dnf/dnf_4.16.2.bb
index 9134411fa9..ba3f9b6e08 100644
--- a/meta/recipes-devtools/dnf/dnf_4.16.1.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.16.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "94b7cc7956580405b219329541d6b40db6499cf1"
+SRCREV = "cb1b3615632058f4a1ca79a38734b8624eca8a32"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============7728699762152093902==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.16.1-4.16.2.patch"

RnJvbSBiOWY0MDRjNTkzMzJlMjkyYWZkNWZmZTQwMTU4NDljNDc0YjQ5MDEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAwOToxMzozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRu
ZjogdXBncmFkZSA0LjE2LjEgLT4gNC4xNi4yCgotLS0KIC4uLi9kbmYvZG5mLzAwMDEtZG5mLXdy
aXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoICAgICAgfCA3ICsrKystLS0KIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9kbmYve2RuZl80LjE2LjEuYmIgPT4gZG5mXzQuMTYuMi5iYn0gfCAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL3tkbmZfNC4xNi4xLmJiID0+IGRuZl80LjE2LjIu
YmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAw
MS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaApp
bmRleCAyMWI1MGRlZTAxLi4wNjM4ZGFiMTA0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9n
LWxvY2stdG8tcm9vdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNWUwN2MxNmE1MDZiMTlj
YmIxMDdkNWU5OWZjYTQxZDY3OWIyM2I5YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
YzlkMWUwN2Q2MjEzOWJkZWIwYjZjZTI4YzRmYTJjNDExNmExZjY2NiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PgogRGF0ZTogVHVlLCAyOCBBcHIgMjAyMCAxNTo1NTowMCArMDIwMAogU3ViamVjdDogW1BBVENI
XSBkbmY6IHdyaXRlIHRoZSBsb2cgbG9jayB0byByb290CkBAIC0xMCwxNSArMTAsMTYgQEAgYWxy
ZWFkeSBleGlzdGluZywgYW5kIGJhc2UtZmlsZXMgY3JlYXRpbmcgaXQgYXMgYSBzeW1saW5rKS4K
IAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmljXQogU2ln
bmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CisK
IC0tLQogIGRuZi9sb2dnaW5nLnB5IHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZG5mL2xvZ2dpbmcucHkgYi9kbmYv
bG9nZ2luZy5weQotaW5kZXggYmQ2NjA0NzAuLmE5ZDgwOGIxIDEwMDY0NAoraW5kZXggZWYwYjI1
ZjMuLjk0NjEwYWY2IDEwMDY0NAogLS0tIGEvZG5mL2xvZ2dpbmcucHkKICsrKyBiL2RuZi9sb2dn
aW5nLnB5Ci1AQCAtOTQsNyArOTQsNyBAQCBjbGFzcyBNdWx0aXByb2Nlc3NSb3RhdGluZ0ZpbGVI
YW5kbGVyKGxvZ2dpbmcuaGFuZGxlcnMuUm90YXRpbmdGaWxlSGFuZGxlcik6CitAQCAtMTE4LDcg
KzExOCw3IEBAIGNsYXNzIE11bHRpcHJvY2Vzc1JvdGF0aW5nRmlsZUhhbmRsZXIobG9nZ2luZy5o
YW5kbGVycy5Sb3RhdGluZ0ZpbGVIYW5kbGVyKToKICAgICAgZGVmIF9faW5pdF9fKHNlbGYsIGZp
bGVuYW1lLCBtb2RlPSdhJywgbWF4Qnl0ZXM9MCwgYmFja3VwQ291bnQ9MCwgZW5jb2Rpbmc9Tm9u
ZSwgZGVsYXk9RmFsc2UpOgogICAgICAgICAgc3VwZXIoTXVsdGlwcm9jZXNzUm90YXRpbmdGaWxl
SGFuZGxlciwgc2VsZikuX19pbml0X18oCiAgICAgICAgICAgICAgZmlsZW5hbWUsIG1vZGUsIG1h
eEJ5dGVzLCBiYWNrdXBDb3VudCwgZW5jb2RpbmcsIGRlbGF5KQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xNi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2RuZi9kbmZfNC4xNi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTYuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RuZi9kbmZfNC4xNi4yLmJiCmluZGV4IDkxMzQ0MTFmYTkuLmJhM2Y5YjZlMDgg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTYuMS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjE2LjIuYmIKQEAgLTE5LDcgKzE5LDcg
QEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2Ru
Zi5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2MKIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZl
ID0gImZpbGU6Ly8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCIKIAot
U1JDUkVWID0gIjk0YjdjYzc5NTY1ODA0MDViMjE5MzI5NTQxZDZiNDBkYjY0OTljZjEiCitTUkNS
RVYgPSAiY2IxYjM2MTU2MzIwNThmNGExY2E3OWEzODczNGI4NjI0ZWNhOGEzMiIKIFVQU1RSRUFN
X0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAogUyA9ICIke1dP
UktESVJ9L2dpdCIKLS0gCjIuMzkuMgoK

--===============7728699762152093902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-bash-completion: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-dbg: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-dbg: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-dev: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-dev: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-doc: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-doc: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-da: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-de: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-el: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-es: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-he: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-id: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-it: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-or: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-si: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-th: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-src: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-src: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-staticdev: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-test-dep: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf-test-main: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf-test-main: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf/dnf: PKGSIZE changed from 955034 to 955331 (+0%)
packages/core2-32-poky-linux/dnf/dnf: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf/dnf: PV changed from "4.16.1" to "4.16.2"
packages/core2-32-poky-linux/dnf: PKGV changed from 4.16.1 [default] to 4.16.2 [default]
packages/core2-32-poky-linux/dnf: PV changed from "4.16.1" to "4.16.2"

--===============7728699762152093902==--

