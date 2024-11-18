Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E8BD6004C
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:31 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.4842.1731964651192516168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FjO7G4GJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=AUFklDpc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010193412344da-20235957-0921-41f8-a6bc-cea6951b908c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964650;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rXh9CwqX0sLm4QXK6ZBlJa2FE2v5ip4qhHYYWHEp8Sc=;
	b=FjO7G4GJJQWQQKBUyNp8UDpjrgWtPGI6lG4FWB3A1fONiTRu9d1DUnxgEJWxsATI
	P/GSkZY45b9zINwkLk1SSMLKCwn4R5/KnZ+jfXtaUxKOSIkPyYfvAm0SXt+w89X1v2l
	ShTgaLEVMsZOvhzCqXoVqzHcVPC9Vm3nAwCF7iNg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964650;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rXh9CwqX0sLm4QXK6ZBlJa2FE2v5ip4qhHYYWHEp8Sc=;
	b=AUFklDpcUU4DV5OASbT78gI+6KBLnRYeuIuncU9HCh51uaO99gVIqq3GkJmr3pCp
	qd8nPKb2YxrEhi+n9foSuAjxH5yznFJxat562DScTXtcgxJOXzWkg0dl8AWYU6+7zb/
	fLZKlWbTyyYPB32vcs66A7iSfjo8DRS9N648nUUg=
Content-Type: multipart/mixed; boundary="===============3258551112256757931=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iptables: upgrading to 1.8.11 SUCCEEDED
Message-ID: <01010193412344da-20235957-0921-41f8-a6bc-cea6951b908c-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207310

--===============3258551112256757931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *iptables* to *1.8.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iptables-upgrade-1.8.10-1.8.11.patch
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
From 0988034d06749820b857e304ec79cd485ecae5f2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 09:21:20 +0000
Subject: [PATCH] iptables: upgrade 1.8.10 -> 1.8.11

---
 ...ption-to-enable-disable-libnfnetlink.patch | 53 -------------------
 ...se-Add-missing-braces-around-ternary.patch | 37 -------------
 ...{iptables_1.8.10.bb => iptables_1.8.11.bb} |  4 +-
 3 files changed, 1 insertion(+), 93 deletions(-)
 delete mode 100644 meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
 delete mode 100644 meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch
 rename meta/recipes-extended/iptables/{iptables_1.8.10.bb => iptables_1.8.11.bb} (95%)

diff --git a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
deleted file mode 100644
index 0fe2261511..0000000000
--- a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 653db8b938166db7833135f615b90c38a3f27a30 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Thu, 25 Apr 2024 10:51:02 +0200
-Subject: [PATCH] configure: Add option to enable/disable libnfnetlink
-
-Default behavior (autodetecting) does not change, but specifying
-either option would explicitly disable or enable libnfnetlink support,
-and if the library is not found in the latter case, ./configure will error
-out.
-
-Upstream-Status: Backport [https://git.netfilter.org/iptables/commit/?id=653db8b938166db7833135f615b90c38a3f27a30]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-Signed-off-by: Phil Sutter <phil@nwl.cc>
----
- configure.ac | 13 +++++++++++--
- 1 file changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d99fa3b9..2293702b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -63,6 +63,9 @@ AC_ARG_WITH([pkgconfigdir], AS_HELP_STRING([--with-pkgconfigdir=PATH],
- AC_ARG_ENABLE([nftables],
- 	AS_HELP_STRING([--disable-nftables], [Do not build nftables compat]),
- 	[enable_nftables="$enableval"], [enable_nftables="yes"])
-+AC_ARG_ENABLE([libnfnetlink],
-+    AS_HELP_STRING([--disable-libnfnetlink], [Do not use netfilter netlink library]),
-+    [enable_libnfnetlink="$enableval"], [enable_libnfnetlink="auto"])
- AC_ARG_ENABLE([connlabel],
- 	AS_HELP_STRING([--disable-connlabel],
- 	[Do not build libnetfilter_conntrack]),
-@@ -113,8 +116,14 @@ AM_CONDITIONAL([ENABLE_SYNCONF], [test "$enable_nfsynproxy" = "yes"])
- AM_CONDITIONAL([ENABLE_NFTABLES], [test "$enable_nftables" = "yes"])
- AM_CONDITIONAL([ENABLE_CONNLABEL], [test "$enable_connlabel" = "yes"])
- 
--PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0],
--	[nfnetlink=1], [nfnetlink=0])
-+# If specified explicitly on the command line, error out when library was not found
-+# Otherwise, disable and continue
-+AS_IF([test "x$enable_libnfnetlink" = "xyes"],
-+	[PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0],
-+			   [nfnetlink=1])],
-+      [test "x$enable_libnfnetlink" = "xauto"],
-+	[PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0],
-+			   [nfnetlink=1], [nfnetlink=0])])
- AM_CONDITIONAL([HAVE_LIBNFNETLINK], [test "$nfnetlink" = 1])
- 
- if test "x$enable_bpfc" = "xyes" || test "x$enable_nfsynproxy" = "xyes"; then
--- 
-2.39.2
-
diff --git a/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch b/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch
deleted file mode 100644
index 4cbc8bdaf4..0000000000
--- a/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 2026b08bce7fe87b5964f7912e1eef30f04922c1 Mon Sep 17 00:00:00 2001
-From: Phil Sutter <phil@nwl.cc>
-Date: Fri, 26 Jan 2024 18:43:10 +0100
-Subject: [PATCH] nft: ruleparse: Add missing braces around ternary
-
-The expression evaluated the sum before the ternay, consequently not
-adding target->size if tgsize was zero.
-
-Identified by ASAN for a simple rule using standard target:
-| # ebtables -A INPUT -s de:ad:be:ef:0:00 -j RETURN
-| # ebtables -D INPUT -s de:ad:be:ef:0:00 -j RETURN
-| =================================================================
-| ==18925==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x603000000120 at pc 0x7f627a4c75c5 bp 0x7ffe882b5180 sp 0x7ffe882b4928
-| READ of size 8 at 0x603000000120 thread T0
-| [...]
-
-Upstream-Status: Backport [2026b08bce7fe87b5964f7912e1eef30f04922c1]
-
-Fixes: 2a6eee89083c8 ("nft-ruleparse: Introduce nft_create_target()")
-Signed-off-by: Phil Sutter <phil@nwl.cc>
----
- iptables/nft-ruleparse.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/iptables/nft-ruleparse.c b/iptables/nft-ruleparse.c
-index 0bbdf44faf..3b1cbe4fa1 100644
---- a/iptables/nft-ruleparse.c
-+++ b/iptables/nft-ruleparse.c
-@@ -94,7 +94,7 @@ __nft_create_target(struct nft_xt_ctx *ctx, const char *name, size_t tgsize)
- 	if (!target)
- 		return NULL;
- 
--	size = XT_ALIGN(sizeof(*target->t)) + tgsize ?: target->size;
-+	size = XT_ALIGN(sizeof(*target->t)) + (tgsize ?: target->size);
- 
- 	target->t = xtables_calloc(1, size);
- 	target->t->u.target_size = size;
diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recipes-extended/iptables/iptables_1.8.11.bb
similarity index 95%
rename from meta/recipes-extended/iptables/iptables_1.8.10.bb
rename to meta/recipes-extended/iptables/iptables_1.8.11.bb
index a94e4749ae..686dc5afe5 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.11.bb
@@ -13,10 +13,8 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
            file://iptables.rules \
            file://ip6tables.service \
            file://ip6tables.rules \
-           file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
-           file://0002-nft-ruleparse-Add-missing-braces-around-ternary.patch \
            "
-SRC_URI[sha256sum] = "5cc255c189356e317d070755ce9371eb63a1b783c34498fb8c30264f3cc59c9c"
+SRC_URI[sha256sum] = "d87303d55ef8c92bcad4dd3f978b26d272013642b029425775f5bad1009fe7b2"
 
 SYSTEMD_SERVICE:${PN} = "\
     iptables.service \
-- 
2.44.1


--===============3258551112256757931==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iptables-upgrade-1.8.10-1.8.11.patch"

RnJvbSAwOTg4MDM0ZDA2NzQ5ODIwYjg1N2UzMDRlYzc5Y2Q0ODVlY2FlNWYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDk6MjE6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
cHRhYmxlczogdXBncmFkZSAxLjguMTAgLT4gMS44LjExCgotLS0KIC4uLnB0aW9uLXRvLWVuYWJs
ZS1kaXNhYmxlLWxpYm5mbmV0bGluay5wYXRjaCB8IDUzIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4u
LnNlLUFkZC1taXNzaW5nLWJyYWNlcy1hcm91bmQtdGVybmFyeS5wYXRjaCB8IDM3IC0tLS0tLS0t
LS0tLS0KIC4uLntpcHRhYmxlc18xLjguMTAuYmIgPT4gaXB0YWJsZXNfMS44LjExLmJifSB8ICA0
ICstCiAzIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA5MyBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvaXB0YWJsZXMvaXB0YWJsZXMv
MDAwMS1jb25maWd1cmUtQWRkLW9wdGlvbi10by1lbmFibGUtZGlzYWJsZS1saWJuZm5ldGxpbmsu
cGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvaXB0YWJsZXMv
aXB0YWJsZXMvMDAwMi1uZnQtcnVsZXBhcnNlLUFkZC1taXNzaW5nLWJyYWNlcy1hcm91bmQtdGVy
bmFyeS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9pcHRhYmxlcy97aXB0YWJs
ZXNfMS44LjEwLmJiID0+IGlwdGFibGVzXzEuOC4xMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvaXB0YWJsZXMvaXB0YWJsZXMvMDAwMS1jb25maWd1cmUtQWRk
LW9wdGlvbi10by1lbmFibGUtZGlzYWJsZS1saWJuZm5ldGxpbmsucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvaXB0YWJsZXMvaXB0YWJsZXMvMDAwMS1jb25maWd1cmUtQWRkLW9wdGlvbi10
by1lbmFibGUtZGlzYWJsZS1saWJuZm5ldGxpbmsucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDBmZTIyNjE1MTEuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2lwdGFibGVzL2lwdGFibGVzLzAwMDEtY29uZmlndXJlLUFkZC1vcHRpb24tdG8tZW5hYmxl
LWRpc2FibGUtbGlibmZuZXRsaW5rLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNTMgKzAsMCBA
QAotRnJvbSA2NTNkYjhiOTM4MTY2ZGI3ODMzMTM1ZjYxNWI5MGMzOGEzZjI3YTMwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQotRnJvbTogIk1heGluIEIuIEpvaG4iIDxtYXhpbi5qb2huQGludGVs
LmNvbT4KLURhdGU6IFRodSwgMjUgQXByIDIwMjQgMTA6NTE6MDIgKzAyMDAKLVN1YmplY3Q6IFtQ
QVRDSF0gY29uZmlndXJlOiBBZGQgb3B0aW9uIHRvIGVuYWJsZS9kaXNhYmxlIGxpYm5mbmV0bGlu
awotCi1EZWZhdWx0IGJlaGF2aW9yIChhdXRvZGV0ZWN0aW5nKSBkb2VzIG5vdCBjaGFuZ2UsIGJ1
dCBzcGVjaWZ5aW5nCi1laXRoZXIgb3B0aW9uIHdvdWxkIGV4cGxpY2l0bHkgZGlzYWJsZSBvciBl
bmFibGUgbGlibmZuZXRsaW5rIHN1cHBvcnQsCi1hbmQgaWYgdGhlIGxpYnJhcnkgaXMgbm90IGZv
dW5kIGluIHRoZSBsYXR0ZXIgY2FzZSwgLi9jb25maWd1cmUgd2lsbCBlcnJvcgotb3V0LgotCi1V
cHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdC5uZXRmaWx0ZXIub3JnL2lwdGFi
bGVzL2NvbW1pdC8/aWQ9NjUzZGI4YjkzODE2NmRiNzgzMzEzNWY2MTViOTBjMzhhM2YyN2EzMF0K
LVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1TaWduZWQtb2Zm
LWJ5OiBNYXhpbiBCLiBKb2huIDxtYXhpbi5qb2huQGludGVsLmNvbT4KLVNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci1TaWduZWQtb2ZmLWJ5OiBQ
aGlsIFN1dHRlciA8cGhpbEBud2wuY2M+Ci0tLS0KLSBjb25maWd1cmUuYWMgfCAxMyArKysrKysr
KysrKy0tCi0gMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Ci0KLWRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGQ5OWZh
M2I5Li4yMjkzNzAyYiAxMDA2NDQKLS0tLSBhL2NvbmZpZ3VyZS5hYwotKysrIGIvY29uZmlndXJl
LmFjCi1AQCAtNjMsNiArNjMsOSBAQCBBQ19BUkdfV0lUSChbcGtnY29uZmlnZGlyXSwgQVNfSEVM
UF9TVFJJTkcoWy0td2l0aC1wa2djb25maWdkaXI9UEFUSF0sCi0gQUNfQVJHX0VOQUJMRShbbmZ0
YWJsZXNdLAotIAlBU19IRUxQX1NUUklORyhbLS1kaXNhYmxlLW5mdGFibGVzXSwgW0RvIG5vdCBi
dWlsZCBuZnRhYmxlcyBjb21wYXRdKSwKLSAJW2VuYWJsZV9uZnRhYmxlcz0iJGVuYWJsZXZhbCJd
LCBbZW5hYmxlX25mdGFibGVzPSJ5ZXMiXSkKLStBQ19BUkdfRU5BQkxFKFtsaWJuZm5ldGxpbmtd
LAotKyAgICBBU19IRUxQX1NUUklORyhbLS1kaXNhYmxlLWxpYm5mbmV0bGlua10sIFtEbyBub3Qg
dXNlIG5ldGZpbHRlciBuZXRsaW5rIGxpYnJhcnldKSwKLSsgICAgW2VuYWJsZV9saWJuZm5ldGxp
bms9IiRlbmFibGV2YWwiXSwgW2VuYWJsZV9saWJuZm5ldGxpbms9ImF1dG8iXSkKLSBBQ19BUkdf
RU5BQkxFKFtjb25ubGFiZWxdLAotIAlBU19IRUxQX1NUUklORyhbLS1kaXNhYmxlLWNvbm5sYWJl
bF0sCi0gCVtEbyBub3QgYnVpbGQgbGlibmV0ZmlsdGVyX2Nvbm50cmFja10pLAotQEAgLTExMyw4
ICsxMTYsMTQgQEAgQU1fQ09ORElUSU9OQUwoW0VOQUJMRV9TWU5DT05GXSwgW3Rlc3QgIiRlbmFi
bGVfbmZzeW5wcm94eSIgPSAieWVzIl0pCi0gQU1fQ09ORElUSU9OQUwoW0VOQUJMRV9ORlRBQkxF
U10sIFt0ZXN0ICIkZW5hYmxlX25mdGFibGVzIiA9ICJ5ZXMiXSkKLSBBTV9DT05ESVRJT05BTChb
RU5BQkxFX0NPTk5MQUJFTF0sIFt0ZXN0ICIkZW5hYmxlX2Nvbm5sYWJlbCIgPSAieWVzIl0pCi0g
Ci0tUEtHX0NIRUNLX01PRFVMRVMoW2xpYm5mbmV0bGlua10sIFtsaWJuZm5ldGxpbmsgPj0gMS4w
XSwKLS0JW25mbmV0bGluaz0xXSwgW25mbmV0bGluaz0wXSkKLSsjIElmIHNwZWNpZmllZCBleHBs
aWNpdGx5IG9uIHRoZSBjb21tYW5kIGxpbmUsIGVycm9yIG91dCB3aGVuIGxpYnJhcnkgd2FzIG5v
dCBmb3VuZAotKyMgT3RoZXJ3aXNlLCBkaXNhYmxlIGFuZCBjb250aW51ZQotK0FTX0lGKFt0ZXN0
ICJ4JGVuYWJsZV9saWJuZm5ldGxpbmsiID0gInh5ZXMiXSwKLSsJW1BLR19DSEVDS19NT0RVTEVT
KFtsaWJuZm5ldGxpbmtdLCBbbGlibmZuZXRsaW5rID49IDEuMF0sCi0rCQkJICAgW25mbmV0bGlu
az0xXSldLAotKyAgICAgIFt0ZXN0ICJ4JGVuYWJsZV9saWJuZm5ldGxpbmsiID0gInhhdXRvIl0s
Ci0rCVtQS0dfQ0hFQ0tfTU9EVUxFUyhbbGlibmZuZXRsaW5rXSwgW2xpYm5mbmV0bGluayA+PSAx
LjBdLAotKwkJCSAgIFtuZm5ldGxpbms9MV0sIFtuZm5ldGxpbms9MF0pXSkKLSBBTV9DT05ESVRJ
T05BTChbSEFWRV9MSUJORk5FVExJTktdLCBbdGVzdCAiJG5mbmV0bGluayIgPSAxXSkKLSAKLSBp
ZiB0ZXN0ICJ4JGVuYWJsZV9icGZjIiA9ICJ4eWVzIiB8fCB0ZXN0ICJ4JGVuYWJsZV9uZnN5bnBy
b3h5IiA9ICJ4eWVzIjsgdGhlbgotLS0gCi0yLjM5LjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2lwdGFibGVzL2lwdGFibGVzLzAwMDItbmZ0LXJ1bGVwYXJzZS1BZGQtbWlz
c2luZy1icmFjZXMtYXJvdW5kLXRlcm5hcnkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
aXB0YWJsZXMvaXB0YWJsZXMvMDAwMi1uZnQtcnVsZXBhcnNlLUFkZC1taXNzaW5nLWJyYWNlcy1h
cm91bmQtdGVybmFyeS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNGNiYzhi
ZGFmNC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvaXB0YWJsZXMvaXB0
YWJsZXMvMDAwMi1uZnQtcnVsZXBhcnNlLUFkZC1taXNzaW5nLWJyYWNlcy1hcm91bmQtdGVybmFy
eS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM3ICswLDAgQEAKLUZyb20gMjAyNmIwOGJjZTdm
ZTg3YjU5NjRmNzkxMmUxZWVmMzBmMDQ5MjJjMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZy
b206IFBoaWwgU3V0dGVyIDxwaGlsQG53bC5jYz4KLURhdGU6IEZyaSwgMjYgSmFuIDIwMjQgMTg6
NDM6MTAgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gbmZ0OiBydWxlcGFyc2U6IEFkZCBtaXNzaW5n
IGJyYWNlcyBhcm91bmQgdGVybmFyeQotCi1UaGUgZXhwcmVzc2lvbiBldmFsdWF0ZWQgdGhlIHN1
bSBiZWZvcmUgdGhlIHRlcm5heSwgY29uc2VxdWVudGx5IG5vdAotYWRkaW5nIHRhcmdldC0+c2l6
ZSBpZiB0Z3NpemUgd2FzIHplcm8uCi0KLUlkZW50aWZpZWQgYnkgQVNBTiBmb3IgYSBzaW1wbGUg
cnVsZSB1c2luZyBzdGFuZGFyZCB0YXJnZXQ6Ci18ICMgZWJ0YWJsZXMgLUEgSU5QVVQgLXMgZGU6
YWQ6YmU6ZWY6MDowMCAtaiBSRVRVUk4KLXwgIyBlYnRhYmxlcyAtRCBJTlBVVCAtcyBkZTphZDpi
ZTplZjowOjAwIC1qIFJFVFVSTgotfCA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotfCA9PTE4OTI1PT1FUlJPUjogQWRkcmVz
c1Nhbml0aXplcjogaGVhcC1idWZmZXItb3ZlcmZsb3cgb24gYWRkcmVzcyAweDYwMzAwMDAwMDEy
MCBhdCBwYyAweDdmNjI3YTRjNzVjNSBicCAweDdmZmU4ODJiNTE4MCBzcCAweDdmZmU4ODJiNDky
OAotfCBSRUFEIG9mIHNpemUgOCBhdCAweDYwMzAwMDAwMDEyMCB0aHJlYWQgVDAKLXwgWy4uLl0K
LQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbMjAyNmIwOGJjZTdmZTg3YjU5NjRmNzkxMmUx
ZWVmMzBmMDQ5MjJjMV0KLQotRml4ZXM6IDJhNmVlZTg5MDgzYzggKCJuZnQtcnVsZXBhcnNlOiBJ
bnRyb2R1Y2UgbmZ0X2NyZWF0ZV90YXJnZXQoKSIpCi1TaWduZWQtb2ZmLWJ5OiBQaGlsIFN1dHRl
ciA8cGhpbEBud2wuY2M+Ci0tLS0KLSBpcHRhYmxlcy9uZnQtcnVsZXBhcnNlLmMgfCAyICstCi0g
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1n
aXQgYS9pcHRhYmxlcy9uZnQtcnVsZXBhcnNlLmMgYi9pcHRhYmxlcy9uZnQtcnVsZXBhcnNlLmMK
LWluZGV4IDBiYmRmNDRmYWYuLjNiMWNiZTRmYTEgMTAwNjQ0Ci0tLS0gYS9pcHRhYmxlcy9uZnQt
cnVsZXBhcnNlLmMKLSsrKyBiL2lwdGFibGVzL25mdC1ydWxlcGFyc2UuYwotQEAgLTk0LDcgKzk0
LDcgQEAgX19uZnRfY3JlYXRlX3RhcmdldChzdHJ1Y3QgbmZ0X3h0X2N0eCAqY3R4LCBjb25zdCBj
aGFyICpuYW1lLCBzaXplX3QgdGdzaXplKQotIAlpZiAoIXRhcmdldCkKLSAJCXJldHVybiBOVUxM
OwotIAotLQlzaXplID0gWFRfQUxJR04oc2l6ZW9mKCp0YXJnZXQtPnQpKSArIHRnc2l6ZSA/OiB0
YXJnZXQtPnNpemU7Ci0rCXNpemUgPSBYVF9BTElHTihzaXplb2YoKnRhcmdldC0+dCkpICsgKHRn
c2l6ZSA/OiB0YXJnZXQtPnNpemUpOwotIAotIAl0YXJnZXQtPnQgPSB4dGFibGVzX2NhbGxvYygx
LCBzaXplKTsKLSAJdGFyZ2V0LT50LT51LnRhcmdldF9zaXplID0gc2l6ZTsKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9pcHRhYmxlcy9pcHRhYmxlc18xLjguMTAuYmIgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvaXB0YWJsZXMvaXB0YWJsZXNfMS44LjExLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9pcHRhYmxlcy9pcHRh
Ymxlc18xLjguMTAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9pcHRhYmxlcy9p
cHRhYmxlc18xLjguMTEuYmIKaW5kZXggYTk0ZTQ3NDlhZS4uNjg2ZGM1YWZlNSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2lwdGFibGVzL2lwdGFibGVzXzEuOC4xMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvaXB0YWJsZXMvaXB0YWJsZXNfMS44LjExLmJiCkBAIC0x
MywxMCArMTMsOCBAQCBTUkNfVVJJID0gImh0dHA6Ly9uZXRmaWx0ZXIub3JnL3Byb2plY3RzL2lw
dGFibGVzL2ZpbGVzL2lwdGFibGVzLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly9p
cHRhYmxlcy5ydWxlcyBcCiAgICAgICAgICAgIGZpbGU6Ly9pcDZ0YWJsZXMuc2VydmljZSBcCiAg
ICAgICAgICAgIGZpbGU6Ly9pcDZ0YWJsZXMucnVsZXMgXAotICAgICAgICAgICBmaWxlOi8vMDAw
MS1jb25maWd1cmUtQWRkLW9wdGlvbi10by1lbmFibGUtZGlzYWJsZS1saWJuZm5ldGxpbmsucGF0
Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMi1uZnQtcnVsZXBhcnNlLUFkZC1taXNzaW5nLWJy
YWNlcy1hcm91bmQtdGVybmFyeS5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI1Y2MyNTVjMTg5MzU2ZTMxN2QwNzA3NTVjZTkzNzFlYjYzYTFiNzgzYzM0NDk4ZmI4
YzMwMjY0ZjNjYzU5YzljIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ4NzMwM2Q1NWVmOGM5MmJj
YWQ0ZGQzZjk3OGIyNmQyNzIwMTM2NDJiMDI5NDI1Nzc1ZjViYWQxMDA5ZmU3YjIiCiAKIFNZU1RF
TURfU0VSVklDRToke1BOfSA9ICJcCiAgICAgaXB0YWJsZXMuc2VydmljZSBcCi0tIAoyLjQ0LjEK
Cg==

--===============3258551112256757931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/iptables/iptables-module-xt-hmark: PKGSIZE changed from 14728 to 18824 (+28%)

--===============3258551112256757931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/iptables/iptables-apply: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-apply: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-dbg: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-dbg: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-dbg: PKGSIZE changed from 3088120 to 3113112 (+1%)
packages/core2-64-poky-linux/iptables/iptables-dev: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-dev: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-dev: PKGSIZE changed from 35214 to 35402 (+1%)
packages/core2-64-poky-linux/iptables/iptables-doc: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-doc: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-doc: PKGSIZE changed from 148465 to 148754 (+0%)
packages/core2-64-poky-linux/iptables/iptables-locale: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-locale: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-ah: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-ah: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-dnpt: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-dnpt: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-dst: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-dst: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-eui64: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-eui64: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-frag: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-frag: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-hbh: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-hbh: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-hl: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-hl: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-icmp6: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-icmp6: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-ipv6header: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-ipv6header: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-mh: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-mh: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-netmap: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-netmap: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-reject: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-reject: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-rt: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-rt: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-snpt: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-snpt: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-srh: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ip6t-srh: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ipt-ah: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ipt-ah: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ipt-clusterip: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ipt-clusterip: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ipt-ecn: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ipt-ecn: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ipt-icmp: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ipt-icmp: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ipt-netmap: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ipt-netmap: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ipt-realm: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ipt-realm: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ipt-reject: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ipt-reject: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ipt-ttl: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ipt-ttl: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-ipt-ulog: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-ipt-ulog: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-addrtype: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-addrtype: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-audit: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-audit: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-bpf: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-bpf: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-cgroup: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-cgroup: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-checksum: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-checksum: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-classify: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-classify: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-cluster: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-cluster: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-comment: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-comment: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-connbytes: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-connbytes: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-connlimit: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-connlimit: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-connmark: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-connmark: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-connsecmark: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-connsecmark: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-conntrack: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-conntrack: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-cpu: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-cpu: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-ct: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-ct: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-dccp: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-dccp: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-devgroup: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-devgroup: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-dscp: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-dscp: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-ecn: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-ecn: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-esp: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-esp: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-hashlimit: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-hashlimit: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-helper: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-helper: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-hmark: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-hmark: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-hmark: PKGSIZE changed from 14728 to 18824 (+28%)
packages/core2-64-poky-linux/iptables/iptables-module-xt-idletimer: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-idletimer: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-ipcomp: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-ipcomp: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-iprange: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-iprange: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-ipvs: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-ipvs: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-led: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-led: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-length: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-length: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-limit: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-limit: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-log: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-log: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-mac: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-mac: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-mark: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-mark: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-mark: PKGSIZE changed from 29968 to 29840 (-0%)
packages/core2-64-poky-linux/iptables/iptables-module-xt-multiport: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-multiport: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-nat: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-nat: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-nfacct: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-nfacct: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-nflog: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-nflog: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-nfqueue: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-nfqueue: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-osf: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-osf: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-owner: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-owner: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-physdev: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-physdev: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-pkttype: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-pkttype: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-policy: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-policy: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-quota: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-quota: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-rateest: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-rateest: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-recent: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-recent: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-rpfilter: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-rpfilter: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-sctp: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-sctp: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-secmark: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-secmark: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-set: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-set: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-socket: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-socket: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-standard: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-standard: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-statistic: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-statistic: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-string: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-string: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-synproxy: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-synproxy: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-tcp: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-tcp: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-tcpmss: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-tcpmss: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-tcpoptstrip: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-tcpoptstrip: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-tee: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-tee: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-time: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-time: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-tos: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-tos: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-tproxy: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-tproxy: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-trace: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-trace: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-u32: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-u32: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-module-xt-udp: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-module-xt-udp: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-modules: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-modules: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-src: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-src: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables-src: PKGSIZE changed from 1235393 to 1242551 (+1%)
packages/core2-64-poky-linux/iptables/iptables-src: FILELIST: directory renamed /usr/src/debug/iptables/1.8.10/include/linux/netfilter -> /usr/src/debug/iptables/1.8.11/include/linux/netfilter, directory renamed /usr/src/debug/iptables/1.8.10/include/linux/netfilter_ipv6 -> /usr/src/debug/iptables/1.8.11/include/linux/netfilter_ipv6, directory renamed /usr/src/debug/iptables/1.8.10/include/linux/netfilter_ipv4 -> /usr/src/debug/iptables/1.8.11/include/linux/netfilter_ipv4, directory renamed /usr/src/debug/iptables/1.8.10/include/iptables -> /usr/src/debug/iptables/1.8.11/include/iptables, directory renamed /usr/src/debug/iptables/1.8.10/libiptc -> /usr/src/debug/iptables/1.8.11/libiptc, directory renamed /usr/src/debug/iptables/1.8.10/extensions -> /usr/src/debug/iptables/1.8.11/extensions, directory renamed /usr/src/debug/iptables/1.8.10/include/libiptc -> /usr/src/debug/iptables/1.8.11/include/libiptc, directory renamed /usr/src/debug/iptables/1.8.10/include/linux -> /usr/src/debug
 /iptables/1.8.11/include/linux, directory renamed /usr/src/debug/iptables/1.8.10/include/linux/netfilter_arp -> /usr/src/debug/iptables/1.8.11/include/linux/netfilter_arp, directory renamed /usr/src/debug/iptables/1.8.10/include/linux/netfilter/ipset -> /usr/src/debug/iptables/1.8.11/include/linux/netfilter/ipset, directory renamed /usr/src/debug/iptables/1.8.10/iptables -> /usr/src/debug/iptables/1.8.11/iptables, directory renamed /usr/src/debug/iptables/1.8.10/libxtables -> /usr/src/debug/iptables/1.8.11/libxtables, removed "/usr/src/debug/iptables/1.8.10/include/iptables.h /usr/src/debug/iptables/1.8.10/include/xtables.h /usr/src/debug/iptables/1.8.10/include/ip6tables.h", added "/usr/src/debug/iptables/1.8.11/include/iptables.h /usr/src/debug/iptables/1.8.11/include/xtables.h /usr/src/debug/iptables/1.8.11/include/xtables_internal.h /usr/src/debug/iptables/1.8.11/include/ip6tables.h"
packages/core2-64-poky-linux/iptables/iptables-staticdev: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables-staticdev: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables/iptables: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables/iptables: PKGV changed from 1.8.10 [default] to 1.8.11 [default]
packages/core2-64-poky-linux/iptables: PV changed from "1.8.10" to "1.8.11"
packages/core2-64-poky-linux/iptables: SRC_URI changed from "http://netfilter.org/projects/iptables/files/iptables-1.8.10.tar.xz file://iptables.service file://iptables.rules file://ip6tables.service file://ip6tables.rules file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch file://0002-nft-ruleparse-Add-missing-braces-around-ternary.patch" to "http://netfilter.org/projects/iptables/files/iptables-1.8.11.tar.xz file://iptables.service file://iptables.rules file://ip6tables.service file://ip6tables.rules"
packages/core2-64-poky-linux/iptables: PKGV changed from 1.8.10 [default] to 1.8.11 [default]

--===============3258551112256757931==--

