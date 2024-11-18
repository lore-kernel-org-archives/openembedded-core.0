Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7329BD62057
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:42 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.4854.1731964657688770827
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Czp5YJfq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bG5t7L6b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019341235de5-59658ae4-29c0-46d3-9704-5d1c514b6649-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964657;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lZBHkKd3LK/xZHpmEXPNBRLOELTC4jWvslSFIsVJL0U=;
	b=Czp5YJfqz0OlQaV5S1x/Y+EUcvr3isuZwV32yw2aR/EjoQwj9jPS2uqLcScpqC/Q
	wWo2FacznKhN95OSfa8biAevVzwMO0dDedwCJUmSpMPkCXhO6X58z8aSEKz3JUEqEzU
	SwydpeeqSVx4UyLst8lX58YL6KU5xGCsqGN4Dexo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964657;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lZBHkKd3LK/xZHpmEXPNBRLOELTC4jWvslSFIsVJL0U=;
	b=bG5t7L6bcvfHWI3csYAQpOtB4p6BG5d8ERNpm6Kfy83sWi0HmYK7K2tvi1BJ98GC
	emLz+o+9v7JYzwXVbI1QrQZd+2pLIlXHYEEvBnAuk6ZjRKohCCY7oFbeZuI0gBXmlJz
	A2CGZFO/7DhXIcvJfHSqMkHOoPn23mJFIccKpIo4=
Content-Type: multipart/mixed; boundary="===============3773284574928148139=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wget: upgrading to 1.25.0 SUCCEEDED
Message-ID: <0101019341235de5-59658ae4-29c0-46d3-9704-5d1c514b6649-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207319

--===============3773284574928148139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wget* to *1.25.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wget-upgrade-1.24.5-1.25.0.patch
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
From cd12402da929b4bf6f34d7bc903f7283d98dc0a0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 13:54:00 +0000
Subject: [PATCH] wget: upgrade 1.24.5 -> 1.25.0

---
 .../wget/0002-improve-reproducibility.patch   |  6 +-
 .../wget/wget/CVE-2024-38428.patch            | 79 -------------------
 .../wget/{wget_1.24.5.bb => wget_1.25.0.bb}   |  5 +-
 3 files changed, 5 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-extended/wget/wget/CVE-2024-38428.patch
 rename meta/recipes-extended/wget/{wget_1.24.5.bb => wget_1.25.0.bb} (46%)

diff --git a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
index 5438bafdcb..6ecb9ef289 100644
--- a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
+++ b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
@@ -1,4 +1,4 @@
-From b86e57b68363d108fe77c6fd588a275d2696cabe Mon Sep 17 00:00:00 2001
+From 304f55a3e2689154d829938d29e43d808ca6298a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 10 Jan 2018 14:43:20 +0800
 Subject: [PATCH] src/Makefile.am: improve reproducibility
@@ -44,10 +44,10 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 18ec622..38d252d 100644
+index 86be533..721a401 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -108,9 +108,13 @@ version.c:  $(wget_SOURCES) ../lib/libgnu.a
+@@ -126,9 +126,13 @@ version.c:  $(wget_SOURCES) ../lib/libgnu.a
  	echo '#include "version.h"' >> $@
  	echo 'const char *version_string = "@VERSION@";' >> $@
  	echo 'const char *compilation_string = "'$(COMPILE)'";' \
diff --git a/meta/recipes-extended/wget/wget/CVE-2024-38428.patch b/meta/recipes-extended/wget/wget/CVE-2024-38428.patch
deleted file mode 100644
index ed99a05464..0000000000
--- a/meta/recipes-extended/wget/wget/CVE-2024-38428.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From ed0c7c7e0e8f7298352646b2fd6e06a11e242ace Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
-Date: Sun, 2 Jun 2024 12:40:16 +0200
-Subject: Properly re-implement userinfo parsing (rfc2396)
-
-* src/url.c (url_skip_credentials): Properly re-implement userinfo parsing (rfc2396)
-
-The reason why the implementation is based on RFC 2396, an outdated standard,
-is that the whole file is based on that RFC, and mixing standard here might be
-dangerous.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/wget.git/commit/?id=ed0c7c7e0e8f7298352646b2fd6e06a11e242ace]
-CVE: CVE-2024-38428
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- src/url.c | 40 ++++++++++++++++++++++++++++++++++------
- 1 file changed, 34 insertions(+), 6 deletions(-)
-
-diff --git a/src/url.c b/src/url.c
-index 69e948b..07c3bc8 100644
---- a/src/url.c
-+++ b/src/url.c
-@@ -41,6 +41,7 @@ as that of the covered work.  */
- #include "url.h"
- #include "host.h"  /* for is_valid_ipv6_address */
- #include "c-strcase.h"
-+#include "c-ctype.h"
- 
- #ifdef HAVE_ICONV
- # include <iconv.h>
-@@ -526,12 +527,39 @@ scheme_leading_string (enum url_scheme scheme)
- static const char *
- url_skip_credentials (const char *url)
- {
--  /* Look for '@' that comes before terminators, such as '/', '?',
--     '#', or ';'.  */
--  const char *p = (const char *)strpbrk (url, "@/?#;");
--  if (!p || *p != '@')
--    return url;
--  return p + 1;
-+  /*
-+   * This whole file implements https://www.rfc-editor.org/rfc/rfc2396 .
-+   * RFC 2396 is outdated since 2005 and needs a rewrite or a thorough re-visit.
-+   *
-+   * The RFC says
-+   * server        = [ [ userinfo "@" ] hostport ]
-+   * userinfo      = *( unreserved | escaped | ";" | ":" | "&" | "=" | "+" | "$" | "," )
-+   * unreserved    = alphanum | mark
-+   * mark          = "-" | "_" | "." | "!" | "~" | "*" | "'" | "(" | ")"
-+   */
-+  static const char *allowed = "-_.!~*'();:&=+$,";
-+
-+  for (const char *p = url; *p; p++)
-+    {
-+      if (c_isalnum(*p))
-+        continue;
-+
-+      if (strchr(allowed, *p))
-+        continue;
-+
-+      if (*p == '%' && c_isxdigit(p[1]) && c_isxdigit(p[2]))
-+        {
-+          p += 2;
-+          continue;
-+        }
-+
-+      if (*p == '@')
-+        return p + 1;
-+
-+      break;
-+    }
-+
-+  return url;
- }
- 
- /* Parse credentials contained in [BEG, END).  The region is expected
--- 
-cgit v1.1
-
diff --git a/meta/recipes-extended/wget/wget_1.24.5.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
similarity index 46%
rename from meta/recipes-extended/wget/wget_1.24.5.bb
rename to meta/recipes-extended/wget/wget_1.25.0.bb
index 602fc9e627..93fefc9092 100644
--- a/meta/recipes-extended/wget/wget_1.24.5.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -1,8 +1,7 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
-           file://CVE-2024-38428.patch \
-          "
+           "
 
-SRC_URI[sha256sum] = "fa2dc35bab5184ecbc46a9ef83def2aaaa3f4c9f3c97d4bd19dcb07d4da637de"
+SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"
 
 require wget.inc
-- 
2.44.1


--===============3773284574928148139==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wget-upgrade-1.24.5-1.25.0.patch"

RnJvbSBjZDEyNDAyZGE5MjliNGJmNmYzNGQ3YmM5MDNmNzI4M2Q5OGRjMGEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMTM6NTQ6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
Z2V0OiB1cGdyYWRlIDEuMjQuNSAtPiAxLjI1LjAKCi0tLQogLi4uL3dnZXQvMDAwMi1pbXByb3Zl
LXJlcHJvZHVjaWJpbGl0eS5wYXRjaCAgIHwgIDYgKy0KIC4uLi93Z2V0L3dnZXQvQ1ZFLTIwMjQt
Mzg0MjgucGF0Y2ggICAgICAgICAgICB8IDc5IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi93Z2V0
L3t3Z2V0XzEuMjQuNS5iYiA9PiB3Z2V0XzEuMjUuMC5iYn0gICB8ICA1ICstCiAzIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgODUgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldC9DVkUtMjAyNC0zODQyOC5wYXRjaAog
cmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3t3Z2V0XzEuMjQuNS5iYiA9PiB3Z2V0
XzEuMjUuMC5iYn0gKDQ2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dl
dC93Z2V0LzAwMDItaW1wcm92ZS1yZXByb2R1Y2liaWxpdHkucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvd2dldC93Z2V0LzAwMDItaW1wcm92ZS1yZXByb2R1Y2liaWxpdHkucGF0Y2gKaW5k
ZXggNTQzOGJhZmRjYi4uNmVjYjllZjI4OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3dnZXQvd2dldC8wMDAyLWltcHJvdmUtcmVwcm9kdWNpYmlsaXR5LnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3dnZXQvMDAwMi1pbXByb3ZlLXJlcHJvZHVjaWJpbGl0
eS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjg2ZTU3YjY4MzYzZDEwOGZlNzdjNmZkNTg4
YTI3NWQyNjk2Y2FiZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzA0ZjU1YTNlMjY4
OTE1NGQ4Mjk5MzhkMjllNDNkODA4Y2E2Mjk4YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMTAg
SmFuIDIwMTggMTQ6NDM6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gc3JjL01ha2VmaWxlLmFt
OiBpbXByb3ZlIHJlcHJvZHVjaWJpbGl0eQpAQCAtNDQsMTAgKzQ0LDEwIEBAIFNpZ25lZC1vZmYt
Ynk6IEpvZSBTbGF0ZXIgPGpzbGF0ZXJAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9zcmMvTWFrZWZpbGUuYW0gYi9zcmMvTWFr
ZWZpbGUuYW0KLWluZGV4IDE4ZWM2MjIuLjM4ZDI1MmQgMTAwNjQ0CitpbmRleCA4NmJlNTMzLi43
MjFhNDAxIDEwMDY0NAogLS0tIGEvc3JjL01ha2VmaWxlLmFtCiArKysgYi9zcmMvTWFrZWZpbGUu
YW0KLUBAIC0xMDgsOSArMTA4LDEzIEBAIHZlcnNpb24uYzogICQod2dldF9TT1VSQ0VTKSAuLi9s
aWIvbGliZ251LmEKK0BAIC0xMjYsOSArMTI2LDEzIEBAIHZlcnNpb24uYzogICQod2dldF9TT1VS
Q0VTKSAuLi9saWIvbGliZ251LmEKICAJZWNobyAnI2luY2x1ZGUgInZlcnNpb24uaCInID4+ICRA
CiAgCWVjaG8gJ2NvbnN0IGNoYXIgKnZlcnNpb25fc3RyaW5nID0gIkBWRVJTSU9OQCI7JyA+PiAk
QAogIAllY2hvICdjb25zdCBjaGFyICpjb21waWxhdGlvbl9zdHJpbmcgPSAiJyQoQ09NUElMRSkn
IjsnIFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3dnZXQvQ1ZFLTIw
MjQtMzg0MjgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0L0NWRS0yMDI0
LTM4NDI4LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBlZDk5YTA1NDY0Li4w
MDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3dnZXQvQ1ZFLTIwMjQt
Mzg0MjgucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw3OSArMCwwIEBACi1Gcm9tIGVkMGM3Yzdl
MGU4ZjcyOTgzNTI2NDZiMmZkNmUwNmExMWUyNDJhY2UgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
Ci1Gcm9tOiA9P1VURi04P3E/VGltPTIwUj1DMz1CQ2hzZW4/PSA8dGltLnJ1ZWhzZW5AZ214LmRl
PgotRGF0ZTogU3VuLCAyIEp1biAyMDI0IDEyOjQwOjE2ICswMjAwCi1TdWJqZWN0OiBQcm9wZXJs
eSByZS1pbXBsZW1lbnQgdXNlcmluZm8gcGFyc2luZyAocmZjMjM5NikKLQotKiBzcmMvdXJsLmMg
KHVybF9za2lwX2NyZWRlbnRpYWxzKTogUHJvcGVybHkgcmUtaW1wbGVtZW50IHVzZXJpbmZvIHBh
cnNpbmcgKHJmYzIzOTYpCi0KLVRoZSByZWFzb24gd2h5IHRoZSBpbXBsZW1lbnRhdGlvbiBpcyBi
YXNlZCBvbiBSRkMgMjM5NiwgYW4gb3V0ZGF0ZWQgc3RhbmRhcmQsCi1pcyB0aGF0IHRoZSB3aG9s
ZSBmaWxlIGlzIGJhc2VkIG9uIHRoYXQgUkZDLCBhbmQgbWl4aW5nIHN0YW5kYXJkIGhlcmUgbWln
aHQgYmUKLWRhbmdlcm91cy4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9n
aXQuc2F2YW5uYWguZ251Lm9yZy9jZ2l0L3dnZXQuZ2l0L2NvbW1pdC8/aWQ9ZWQwYzdjN2UwZThm
NzI5ODM1MjY0NmIyZmQ2ZTA2YTExZTI0MmFjZV0KLUNWRTogQ1ZFLTIwMjQtMzg0MjgKLVNpZ25l
ZC1vZmYtYnk6IFZpamF5IEFudXN1cmkgPHZhbnVzdXJpQG12aXN0YS5jb20+Ci0tLS0KLSBzcmMv
dXJsLmMgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCi0gMSBm
aWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1n
aXQgYS9zcmMvdXJsLmMgYi9zcmMvdXJsLmMKLWluZGV4IDY5ZTk0OGIuLjA3YzNiYzggMTAwNjQ0
Ci0tLS0gYS9zcmMvdXJsLmMKLSsrKyBiL3NyYy91cmwuYwotQEAgLTQxLDYgKzQxLDcgQEAgYXMg
dGhhdCBvZiB0aGUgY292ZXJlZCB3b3JrLiAgKi8KLSAjaW5jbHVkZSAidXJsLmgiCi0gI2luY2x1
ZGUgImhvc3QuaCIgIC8qIGZvciBpc192YWxpZF9pcHY2X2FkZHJlc3MgKi8KLSAjaW5jbHVkZSAi
Yy1zdHJjYXNlLmgiCi0rI2luY2x1ZGUgImMtY3R5cGUuaCIKLSAKLSAjaWZkZWYgSEFWRV9JQ09O
VgotICMgaW5jbHVkZSA8aWNvbnYuaD4KLUBAIC01MjYsMTIgKzUyNywzOSBAQCBzY2hlbWVfbGVh
ZGluZ19zdHJpbmcgKGVudW0gdXJsX3NjaGVtZSBzY2hlbWUpCi0gc3RhdGljIGNvbnN0IGNoYXIg
KgotIHVybF9za2lwX2NyZWRlbnRpYWxzIChjb25zdCBjaGFyICp1cmwpCi0gewotLSAgLyogTG9v
ayBmb3IgJ0AnIHRoYXQgY29tZXMgYmVmb3JlIHRlcm1pbmF0b3JzLCBzdWNoIGFzICcvJywgJz8n
LAotLSAgICAgJyMnLCBvciAnOycuICAqLwotLSAgY29uc3QgY2hhciAqcCA9IChjb25zdCBjaGFy
ICopc3RycGJyayAodXJsLCAiQC8/IzsiKTsKLS0gIGlmICghcCB8fCAqcCAhPSAnQCcpCi0tICAg
IHJldHVybiB1cmw7Ci0tICByZXR1cm4gcCArIDE7Ci0rICAvKgotKyAgICogVGhpcyB3aG9sZSBm
aWxlIGltcGxlbWVudHMgaHR0cHM6Ly93d3cucmZjLWVkaXRvci5vcmcvcmZjL3JmYzIzOTYgLgot
KyAgICogUkZDIDIzOTYgaXMgb3V0ZGF0ZWQgc2luY2UgMjAwNSBhbmQgbmVlZHMgYSByZXdyaXRl
IG9yIGEgdGhvcm91Z2ggcmUtdmlzaXQuCi0rICAgKgotKyAgICogVGhlIFJGQyBzYXlzCi0rICAg
KiBzZXJ2ZXIgICAgICAgID0gWyBbIHVzZXJpbmZvICJAIiBdIGhvc3Rwb3J0IF0KLSsgICAqIHVz
ZXJpbmZvICAgICAgPSAqKCB1bnJlc2VydmVkIHwgZXNjYXBlZCB8ICI7IiB8ICI6IiB8ICImIiB8
ICI9IiB8ICIrIiB8ICIkIiB8ICIsIiApCi0rICAgKiB1bnJlc2VydmVkICAgID0gYWxwaGFudW0g
fCBtYXJrCi0rICAgKiBtYXJrICAgICAgICAgID0gIi0iIHwgIl8iIHwgIi4iIHwgIiEiIHwgIn4i
IHwgIioiIHwgIiciIHwgIigiIHwgIikiCi0rICAgKi8KLSsgIHN0YXRpYyBjb25zdCBjaGFyICph
bGxvd2VkID0gIi1fLiF+KicoKTs6Jj0rJCwiOwotKwotKyAgZm9yIChjb25zdCBjaGFyICpwID0g
dXJsOyAqcDsgcCsrKQotKyAgICB7Ci0rICAgICAgaWYgKGNfaXNhbG51bSgqcCkpCi0rICAgICAg
ICBjb250aW51ZTsKLSsKLSsgICAgICBpZiAoc3RyY2hyKGFsbG93ZWQsICpwKSkKLSsgICAgICAg
IGNvbnRpbnVlOwotKwotKyAgICAgIGlmICgqcCA9PSAnJScgJiYgY19pc3hkaWdpdChwWzFdKSAm
JiBjX2lzeGRpZ2l0KHBbMl0pKQotKyAgICAgICAgewotKyAgICAgICAgICBwICs9IDI7Ci0rICAg
ICAgICAgIGNvbnRpbnVlOwotKyAgICAgICAgfQotKwotKyAgICAgIGlmICgqcCA9PSAnQCcpCi0r
ICAgICAgICByZXR1cm4gcCArIDE7Ci0rCi0rICAgICAgYnJlYWs7Ci0rICAgIH0KLSsKLSsgIHJl
dHVybiB1cmw7Ci0gfQotIAotIC8qIFBhcnNlIGNyZWRlbnRpYWxzIGNvbnRhaW5lZCBpbiBbQkVH
LCBFTkQpLiAgVGhlIHJlZ2lvbiBpcyBleHBlY3RlZAotLS0gCi1jZ2l0IHYxLjEKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldF8xLjI0LjUuYmIgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0XzEuMjUuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDQ2JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0XzEuMjQuNS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldF8xLjI1LjAuYmIKaW5kZXggNjAy
ZmM5ZTYyNy4uOTNmZWZjOTA5MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dn
ZXQvd2dldF8xLjI0LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldF8x
LjI1LjAuYmIKQEAgLTEsOCArMSw3IEBACiBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vd2dldC93
Z2V0LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLWltcHJvdmUtcmVwcm9k
dWNpYmlsaXR5LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL0NWRS0yMDI0LTM4NDI4LnBhdGNo
IFwKLSAgICAgICAgICAiCisgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImZh
MmRjMzViYWI1MTg0ZWNiYzQ2YTllZjgzZGVmMmFhYWEzZjRjOWYzYzk3ZDRiZDE5ZGNiMDdkNGRh
NjM3ZGUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzY2ZTQ4NDIzZTc5MzU5ZWEzMWU0MWRiOWU1
YzI4OTY3NTk0N2E3ZmNmMmVmZGNlZGI3MjZhYzlkMGRhMzc4NCIKIAogcmVxdWlyZSB3Z2V0Lmlu
YwotLSAKMi40NC4xCgo=

--===============3773284574928148139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/wget/wget-locale-id: PKGSIZE changed from 61462 to 78658 (+28%)

--===============3773284574928148139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/wget: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget: SRC_URI changed from "https://ftp.gnu.org/gnu/wget/wget-1.24.5.tar.gz file://0002-improve-reproducibility.patch file://CVE-2024-38428.patch" to "https://ftp.gnu.org/gnu/wget/wget-1.25.0.tar.gz file://0002-improve-reproducibility.patch"
packages/core2-64-poky-linux/wget: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-dbg: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-dbg: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-dbg: PKGSIZE changed from 1597456 to 1602520 (+0%)
packages/core2-64-poky-linux/wget/wget-dev: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-dev: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-doc: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-doc: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-doc: PKGSIZE changed from 232841 to 233106 (+0%)
packages/core2-64-poky-linux/wget/wget-locale-af: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-af: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-be: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-be: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-be: PKGSIZE changed from 98965 to 99060 (+0%)
packages/core2-64-poky-linux/wget/wget-locale-bg: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-bg: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-ca: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-ca: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-cs: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-cs: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-da: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-da: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-de: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-de: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-el: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-el: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-en-gb: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-en-gb: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-eo: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-eo: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-es: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-es: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-et: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-et: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-eu: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-eu: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-fi: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-fi: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-fr: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-fr: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-ga: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-ga: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-gl: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-gl: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-he: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-he: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-hr: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-hr: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-hr: PKGSIZE changed from 82194 to 82888 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-hu: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-hu: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-id: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-id: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-id: PKGSIZE changed from 61462 to 78658 (+28%)
packages/core2-64-poky-linux/wget/wget-locale-it: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-it: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-ja: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-ja: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-ka: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-ka: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-ko: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-ko: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-lt: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-lt: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-ms: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-ms: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-nb: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-nb: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-nl: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-nl: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-pl: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-pl: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-pt-br: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-pt-br: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-pt: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-pt: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-ro: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-ro: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-ru: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-ru: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-rw: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-rw: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-sk: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-sk: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-sl: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-sl: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-sr: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-sr: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-sv: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-sv: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-tr: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-tr: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-uk: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-uk: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-vi: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-vi: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-zh-cn: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-zh-cn: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-locale-zh-cn: PKGSIZE changed from 80030 to 80705 (+1%)
packages/core2-64-poky-linux/wget/wget-locale-zh-tw: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-locale-zh-tw: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-src: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-src: FILELIST: directory renamed /usr/src/debug/wget/1.24.5/src -> /usr/src/debug/wget/1.25.0/src, directory renamed /usr/src/debug/wget/1.24.5/lib/malloc -> /usr/src/debug/wget/1.25.0/lib/malloc, directory renamed /usr/src/debug/wget/1.24.5/lib/sys -> /usr/src/debug/wget/1.25.0/lib/sys, removed "/usr/src/debug/wget/1.24.5/lib/idx.h /usr/src/debug/wget/1.24.5/lib/xmemdup0.c /usr/src/debug/wget/1.24.5/lib/xmemdup0.h /usr/src/debug/wget/1.24.5/lib/ioctl.c /usr/src/debug/wget/1.24.5/lib/quotearg.h /usr/src/debug/wget/1.24.5/lib/sha1-stream.c /usr/src/debug/wget/1.24.5/lib/quotearg.c /usr/src/debug/wget/1.24.5/lib/mbsrtowcs.c /usr/src/debug/wget/1.24.5/lib/mbrtoc32.c /usr/src/debug/wget/1.24.5/lib/c-strcasecmp.c /usr/src/debug/wget/1.24.5/lib/string.h /usr/src/debug/wget/1.24.5/lib/mbsrtowcs-impl.h /usr/src/debug/wget/1.24.5/lib/sha256.c /usr/src/debug/wget/1.24.5/lib/uchar.h /usr/src/debug/wget/1.24.5/lib/wchar.h /usr/src/debug/wget/1.24.5/lib/geto
 pt.c /usr/src/debug/wget/1.24.5/lib/sha256.h /usr/src/debug/wget/1.24.5/lib/sha1.h /usr/src/debug/wget/1.24.5/lib/fflush.c /usr/src/debug/wget/1.24.5/lib/sha1.c /usr/src/debug/wget/1.24.5/lib/c-strcaseeq.h /usr/src/debug/wget/1.24.5/lib/ialloc.h /usr/src/debug/wget/1.24.5/lib/mbiter.h /usr/src/debug/wget/1.24.5/lib/xalloc.h /usr/src/debug/wget/1.24.5/lib/fnmatch.h /usr/src/debug/wget/1.24.5/lib/getopt-core.h /usr/src/debug/wget/1.24.5/lib/dirname.h /usr/src/debug/wget/1.24.5/lib/fnmatch.c /usr/src/debug/wget/1.24.5/lib/getopt-ext.h /usr/src/debug/wget/1.24.5/lib/getopt_int.h /usr/src/debug/wget/1.24.5/lib/fseeko.c /usr/src/debug/wget/1.24.5/lib/memchr.c /usr/src/debug/wget/1.24.5/lib/setlocale_null-unlocked.c /usr/src/debug/wget/1.24.5/lib/quote.h /usr/src/debug/wget/1.24.5/lib/md5.c /usr/src/debug/wget/1.24.5/lib/md5.h /usr/src/debug/wget/1.24.5/lib/xalloc-die.c /usr/src/debug/wget/1.24.5/lib/fcntl.c /usr/src/debug/wget/1.24.5/lib/base32.h /usr/src/debug/wget/1.24.5/lib/fcntl.h /us
 r/src/debug/wget/1.24.5/lib/regex.h /usr/src/debug/wget/1.24.5/lib/mbchar.h /usr/src/debug/wget/1.24.5/lib/strtol.c /usr/src/debug/wget/1.24.5/lib/base32.c /usr/src/debug/wget/1.24.5/lib/c-ctype.h /usr/src/debug/wget/1.24.5/lib/tmpdir.c /usr/src/debug/wget/1.24.5/lib/stdlib.h /usr/src/debug/wget/1.24.5/lib/tmpdir.h /usr/src/debug/wget/1.24.5/lib/xmalloc.c /usr/src/debug/wget/1.24.5/lib/c-strcase.h /usr/src/debug/wget/1.24.5/lib/regcomp.c /usr/src/debug/wget/1.24.5/lib/getopt1.c /usr/src/debug/wget/1.24.5/lib/dirent.h /usr/src/debug/wget/1.24.5/lib/hard-locale.c /usr/src/debug/wget/1.24.5/lib/hard-locale.h /usr/src/debug/wget/1.24.5/lib/localcharset.h /usr/src/debug/wget/1.24.5/lib/fseek.c /usr/src/debug/wget/1.24.5/lib/localcharset.c /usr/src/debug/wget/1.24.5/lib/c-strncasecmp.c /usr/src/debug/wget/1.24.5/lib/mbsrtowcs-state.c /usr/src/debug/wget/1.24.5/lib/strnlen1.h /usr/src/debug/wget/1.24.5/lib/regexec.c /usr/src/debug/wget/1.24.5/lib/strerror.c /usr/src/debug/wget/1.24.5/lib/s
 trnlen1.c /usr/src/debug/wget/1.24.5/lib/setlocale_null.h /usr/src/debug/wget/1.24.5/lib/basename.c /usr/src/debug/wget/1.24.5/lib/exitfail.h /usr/src/debug/wget/1.24.5/lib/setlocale_null.c /usr/src/debug/wget/1.24.5/lib/exitfail.c /usr/src/debug/wget/1.24.5/lib/regex_internal.c /usr/src/debug/wget/1.24.5/lib/regex_internal.h /usr/src/debug/wget/1.24.5/lib/af_alg.h /usr/src/debug/wget/1.24.5/lib/basename-lgpl.c /usr/src/debug/wget/1.24.5/lib/xstrndup.h /usr/src/debug/wget/1.24.5/lib/xstrndup.c /usr/src/debug/wget/1.24.5/lib/basename-lgpl.h /usr/src/debug/wget/1.24.5/lib/btowc.c /usr/src/debug/wget/1.24.5/lib/mbrtowc.c /usr/src/debug/wget/1.24.5/lib/fopen.c /usr/src/debug/wget/1.24.5/lib/fnmatch_loop.c /usr/src/debug/wget/1.24.5/lib/stdio.h", added "/usr/src/debug/wget/1.25.0/lib/fcntl.c /usr/src/debug/wget/1.25.0/lib/base32.h /usr/src/debug/wget/1.25.0/lib/fcntl.h /usr/src/debug/wget/1.25.0/lib/regex.h /usr/src/debug/wget/1.25.0/lib/mbchar.h /usr/src/debug/wget/1.25.0/lib/strtol.c /
 usr/src/debug/wget/1.25.0/lib/base32.c /usr/src/debug/wget/1.25.0/lib/c-ctype.h /usr/src/debug/wget/1.25.0/lib/tmpdir.c /usr/src/debug/wget/1.25.0/lib/stdlib.h /usr/src/debug/wget/1.25.0/lib/tmpdir.h /usr/src/debug/wget/1.25.0/lib/xmalloc.c /usr/src/debug/wget/1.25.0/lib/c-strcase.h /usr/src/debug/wget/1.25.0/lib/regcomp.c /usr/src/debug/wget/1.25.0/lib/getopt1.c /usr/src/debug/wget/1.25.0/lib/dirent.h /usr/src/debug/wget/1.25.0/lib/hard-locale.c /usr/src/debug/wget/1.25.0/lib/hard-locale.h /usr/src/debug/wget/1.25.0/lib/localcharset.h /usr/src/debug/wget/1.25.0/lib/fseek.c /usr/src/debug/wget/1.25.0/lib/localcharset.c /usr/src/debug/wget/1.25.0/lib/c-strncasecmp.c /usr/src/debug/wget/1.25.0/lib/mbsrtowcs-state.c /usr/src/debug/wget/1.25.0/lib/strnlen1.h /usr/src/debug/wget/1.25.0/lib/regexec.c /usr/src/debug/wget/1.25.0/lib/strerror.c /usr/src/debug/wget/1.25.0/lib/strnlen1.c /usr/src/debug/wget/1.25.0/lib/setlocale_null.h /usr/src/debug/wget/1.25.0/lib/basename.c /usr/src/debug/wg
 et/1.25.0/lib/exitfail.h /usr/src/debug/wget/1.25.0/lib/setlocale_null.c /usr/src/debug/wget/1.25.0/lib/exitfail.c /usr/src/debug/wget/1.25.0/lib/regex_internal.c /usr/src/debug/wget/1.25.0/lib/regex_internal.h /usr/src/debug/wget/1.25.0/lib/af_alg.h /usr/src/debug/wget/1.25.0/lib/basename-lgpl.c /usr/src/debug/wget/1.25.0/lib/xstrndup.h /usr/src/debug/wget/1.25.0/lib/xstrndup.c /usr/src/debug/wget/1.25.0/lib/basename-lgpl.h /usr/src/debug/wget/1.25.0/lib/btowc.c /usr/src/debug/wget/1.25.0/lib/mbrtowc.c /usr/src/debug/wget/1.25.0/lib/fopen.c /usr/src/debug/wget/1.25.0/lib/fnmatch_loop.c /usr/src/debug/wget/1.25.0/lib/stdio.h /usr/src/debug/wget/1.25.0/lib/idx.h /usr/src/debug/wget/1.25.0/lib/xmemdup0.c /usr/src/debug/wget/1.25.0/lib/xmemdup0.h /usr/src/debug/wget/1.25.0/lib/ioctl.c /usr/src/debug/wget/1.25.0/lib/quotearg.h /usr/src/debug/wget/1.25.0/lib/sha1-stream.c /usr/src/debug/wget/1.25.0/lib/quotearg.c /usr/src/debug/wget/1.25.0/lib/mbsrtowcs.c /usr/src/debug/wget/1.25.0/lib/m
 brtoc32.c /usr/src/debug/wget/1.25.0/lib/c-strcasecmp.c /usr/src/debug/wget/1.25.0/lib/string.h /usr/src/debug/wget/1.25.0/lib/mbsrtowcs-impl.h /usr/src/debug/wget/1.25.0/lib/sha256.c /usr/src/debug/wget/1.25.0/lib/uchar.h /usr/src/debug/wget/1.25.0/lib/wchar.h /usr/src/debug/wget/1.25.0/lib/getopt.c /usr/src/debug/wget/1.25.0/lib/sha256.h /usr/src/debug/wget/1.25.0/lib/sha1.h /usr/src/debug/wget/1.25.0/lib/fflush.c /usr/src/debug/wget/1.25.0/lib/sha1.c /usr/src/debug/wget/1.25.0/lib/c-strcaseeq.h /usr/src/debug/wget/1.25.0/lib/ialloc.h /usr/src/debug/wget/1.25.0/lib/mbiter.h /usr/src/debug/wget/1.25.0/lib/xalloc.h /usr/src/debug/wget/1.25.0/lib/fnmatch.h /usr/src/debug/wget/1.25.0/lib/getopt-core.h /usr/src/debug/wget/1.25.0/lib/dirname.h /usr/src/debug/wget/1.25.0/lib/fnmatch.c /usr/src/debug/wget/1.25.0/lib/getopt-ext.h /usr/src/debug/wget/1.25.0/lib/getopt_int.h /usr/src/debug/wget/1.25.0/lib/reallocarray.c /usr/src/debug/wget/1.25.0/lib/fseeko.c /usr/src/debug/wget/1.25.0/lib/m
 emchr.c /usr/src/debug/wget/1.25.0/lib/setlocale_null-unlocked.c /usr/src/debug/wget/1.25.0/lib/quote.h /usr/src/debug/wget/1.25.0/lib/md5.c /usr/src/debug/wget/1.25.0/lib/md5.h /usr/src/debug/wget/1.25.0/lib/xalloc-die.c"
packages/core2-64-poky-linux/wget/wget-src: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget-src: PKGSIZE changed from 2909494 to 2943803 (+1%)
packages/core2-64-poky-linux/wget/wget-staticdev: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget-staticdev: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget: PKGV changed from 1.24.5 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/wget/wget: PV changed from "1.24.5" to "1.25.0"
packages/core2-64-poky-linux/wget/wget: PKGSIZE changed from 565401 to 569497 (+1%)

--===============3773284574928148139==--

