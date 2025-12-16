Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC17D609A0
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17390.1765872134595423694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UNPjtIt1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kFWhL+Tn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262ef583-f3fd7802-7530-4d42-9c93-79e006c7c70d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=H1XTC3dd4AyUeA0Kmcwlfv80tCfuyLhTYb3oKak2LPE=;
	b=UNPjtIt1hz1+N9Mj13g2Ay6YZDnljEIv2d1phyVUlb9kVnFmTsqjbrc++xsRMkPK
	3kmwhTuAh3TaLIlMynQ71pJWAc+Hqb2TBAyhuKGmfhxSHNK/Cf2wnvuRopchuKSZi7X
	wB2J4Q1iUHwiW1OLypfxFUWxczcUdJ77i/kuZ0tU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=H1XTC3dd4AyUeA0Kmcwlfv80tCfuyLhTYb3oKak2LPE=;
	b=kFWhL+TnxG9LAKUsFfv2k5IBxrwW342a31szs+1XbrF0Z4YYvk+ndfLhDmnp357s
	IK88sUULIpH80mG1GIiHYp0YaEJur+ZwDCdS9qVQ0okA2kWVrdTyeqUAFD3ZNwwznje
	v7Q+Awx4K364OGapjXy+CV8hjN7Sqn3cSEYJ6ao4=
Content-Type: multipart/mixed; boundary="===============7828018038968047862=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libxslt: upgrading to 1.1.45 SUCCEEDED
Message-ID: <0101019b262ef583-f3fd7802-7530-4d42-9c93-79e006c7c70d-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227922

--===============7828018038968047862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxslt* to *1.1.45* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxslt-upgrade-1.1.43-1.1.45.patch
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
From f397b868f9136b28835b6bee396ece9a23a24995 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 07:45:17 +0000
Subject: [PATCH] libxslt: upgrade 1.1.43 -> 1.1.45

---
 .../gnome-libxslt-bug-139-apple-fix.diff      | 103 ------------------
 .../{libxslt_1.1.43.bb => libxslt_1.1.45.bb}  |   5 +-
 2 files changed, 2 insertions(+), 106 deletions(-)
 delete mode 100644 meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.diff
 rename meta/recipes-support/libxslt/{libxslt_1.1.43.bb => libxslt_1.1.45.bb} (92%)

diff --git a/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.diff b/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.diff
deleted file mode 100644
index c7220ab954..0000000000
--- a/meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.diff
+++ /dev/null
@@ -1,103 +0,0 @@
-From 345d6826d0eae6f0a962456b8ed6f6a1bad0877d Mon Sep 17 00:00:00 2001
-From: David Kilzer <ddkilzer@apple.com>
-Date: Sat, 24 May 2025 15:06:42 -0700
-Subject: [PATCH] libxslt: Type confusion in xmlNode.psvi between stylesheet
- and source nodes
-
-* libxslt/functions.c:
-(xsltDocumentFunctionLoadDocument):
-- Implement fix suggested by Ivan Fratric.  This copies the xmlDoc,
-  calls xsltCleanupSourceDoc() to remove pvsi fields, then adds the
-  xmlDoc to tctxt->docList.
-- Add error handling for functions that may return NULL.
-* libxslt/transform.c:
-- Remove static keyword so this can be called from
-  xsltDocumentFunctionLoadDocument().
-* libxslt/transformInternals.h: Add.
-(xsltCleanupSourceDoc): Add declaration.
-
-Fixes #139.
-
-CVE: CVE-2025-7424
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libxslt/-/issues/139]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- libxslt/functions.c          | 16 +++++++++++++++-
- libxslt/transform.c          |  3 ++-
- libxslt/transformInternals.h |  9 +++++++++
- 3 files changed, 26 insertions(+), 2 deletions(-)
- create mode 100644 libxslt/transformInternals.h
-
-diff --git a/libxslt/functions.c b/libxslt/functions.c
-index 72a58dc4..11ec039f 100644
---- a/libxslt/functions.c
-+++ b/libxslt/functions.c
-@@ -34,6 +34,7 @@
- #include "numbersInternals.h"
- #include "keys.h"
- #include "documents.h"
-+#include "transformInternals.h"
- 
- #ifdef WITH_XSLT_DEBUG
- #define WITH_XSLT_DEBUG_FUNCTION
-@@ -125,7 +126,20 @@ xsltDocumentFunctionLoadDocument(xmlXPathParserContextPtr ctxt,
- 	    /*
- 	    * This selects the stylesheet's doc itself.
- 	    */
--	    doc = tctxt->style->doc;
-+	    doc = xmlCopyDoc(tctxt->style->doc, 1);
-+	    if (doc == NULL) {
-+		xsltTransformError(tctxt, NULL, NULL,
-+		    "document() : failed to copy style doc\n");
-+		goto out_fragment;
-+	    }
-+	    xsltCleanupSourceDoc(doc); /* Remove psvi fields. */
-+	    idoc = xsltNewDocument(tctxt, doc);
-+	    if (idoc == NULL) {
-+		xsltTransformError(tctxt, NULL, NULL,
-+		    "document() : failed to create xsltDocument\n");
-+		xmlFreeDoc(doc);
-+		goto out_fragment;
-+	    }
- 	} else {
-             goto out_fragment;
- 	}
-diff --git a/libxslt/transform.c b/libxslt/transform.c
-index 54ef821b..38c2dce6 100644
---- a/libxslt/transform.c
-+++ b/libxslt/transform.c
-@@ -43,6 +43,7 @@
- #include "xsltlocale.h"
- #include "pattern.h"
- #include "transform.h"
-+#include "transformInternals.h"
- #include "variables.h"
- #include "numbersInternals.h"
- #include "namespaces.h"
-@@ -5757,7 +5758,7 @@ xsltCountKeys(xsltTransformContextPtr ctxt)
-  *
-  * Resets source node flags and ids stored in 'psvi' member.
-  */
--static void
-+void
- xsltCleanupSourceDoc(xmlDocPtr doc) {
-     xmlNodePtr cur = (xmlNodePtr) doc;
-     void **psviPtr;
-diff --git a/libxslt/transformInternals.h b/libxslt/transformInternals.h
-new file mode 100644
-index 00000000..d0f42823
---- /dev/null
-+++ b/libxslt/transformInternals.h
-@@ -0,0 +1,9 @@
-+/*
-+ * Summary: set of internal interfaces for the XSLT engine transformation part.
-+ *
-+ * Copy: See Copyright for the status of this software.
-+ *
-+ * Author: David Kilzer <ddkilzer@apple.com>
-+ */
-+
-+void xsltCleanupSourceDoc(xmlDocPtr doc);
--- 
-2.39.5 (Apple Git-154)
-
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipes-support/libxslt/libxslt_1.1.45.bb
similarity index 92%
rename from meta/recipes-support/libxslt/libxslt_1.1.43.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.45.bb
index 3393be7ebe..c3440a99d4 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.45.bb
@@ -13,10 +13,9 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 DEPENDS = "libxml2"
 
-SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz \
-           file://gnome-libxslt-bug-139-apple-fix.diff"
+SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a"
+SRC_URI[sha256sum] = "9acfe68419c4d06a45c550321b3212762d92f41465062ca4ea19e632ee5d216e"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.47.1


--===============7828018038968047862==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxslt-upgrade-1.1.43-1.1.45.patch"

RnJvbSBmMzk3Yjg2OGY5MTM2YjI4ODM1YjZiZWUzOTZlY2U5YTIzYTI0OTk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDc6NDU6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4c2x0OiB1cGdyYWRlIDEuMS40MyAtPiAxLjEuNDUKCi0tLQogLi4uL2dub21lLWxpYnhzbHQt
YnVnLTEzOS1hcHBsZS1maXguZGlmZiAgICAgIHwgMTAzIC0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
L3tsaWJ4c2x0XzEuMS40My5iYiA9PiBsaWJ4c2x0XzEuMS40NS5iYn0gIHwgICA1ICstCiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTA2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvZmlsZXMvZ25vbWUtbGlieHNs
dC1idWctMTM5LWFwcGxlLWZpeC5kaWZmCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
eHNsdC97bGlieHNsdF8xLjEuNDMuYmIgPT4gbGlieHNsdF8xLjEuNDUuYmJ9ICg5MiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9maWxlcy9nbm9tZS1saWJ4c2x0
LWJ1Zy0xMzktYXBwbGUtZml4LmRpZmYgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0L2Zp
bGVzL2dub21lLWxpYnhzbHQtYnVnLTEzOS1hcHBsZS1maXguZGlmZgpkZWxldGVkIGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggYzcyMjBhYjk1NC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJ4c2x0L2ZpbGVzL2dub21lLWxpYnhzbHQtYnVnLTEzOS1hcHBsZS1maXguZGlm
ZgorKysgL2Rldi9udWxsCkBAIC0xLDEwMyArMCwwIEBACi1Gcm9tIDM0NWQ2ODI2ZDBlYWU2ZjBh
OTYyNDU2YjhlZDZmNmExYmFkMDg3N2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBE
YXZpZCBLaWx6ZXIgPGRka2lsemVyQGFwcGxlLmNvbT4KLURhdGU6IFNhdCwgMjQgTWF5IDIwMjUg
MTU6MDY6NDIgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSF0gbGlieHNsdDogVHlwZSBjb25mdXNpb24g
aW4geG1sTm9kZS5wc3ZpIGJldHdlZW4gc3R5bGVzaGVldAotIGFuZCBzb3VyY2Ugbm9kZXMKLQot
KiBsaWJ4c2x0L2Z1bmN0aW9ucy5jOgotKHhzbHREb2N1bWVudEZ1bmN0aW9uTG9hZERvY3VtZW50
KToKLS0gSW1wbGVtZW50IGZpeCBzdWdnZXN0ZWQgYnkgSXZhbiBGcmF0cmljLiAgVGhpcyBjb3Bp
ZXMgdGhlIHhtbERvYywKLSAgY2FsbHMgeHNsdENsZWFudXBTb3VyY2VEb2MoKSB0byByZW1vdmUg
cHZzaSBmaWVsZHMsIHRoZW4gYWRkcyB0aGUKLSAgeG1sRG9jIHRvIHRjdHh0LT5kb2NMaXN0Lgot
LSBBZGQgZXJyb3IgaGFuZGxpbmcgZm9yIGZ1bmN0aW9ucyB0aGF0IG1heSByZXR1cm4gTlVMTC4K
LSogbGlieHNsdC90cmFuc2Zvcm0uYzoKLS0gUmVtb3ZlIHN0YXRpYyBrZXl3b3JkIHNvIHRoaXMg
Y2FuIGJlIGNhbGxlZCBmcm9tCi0gIHhzbHREb2N1bWVudEZ1bmN0aW9uTG9hZERvY3VtZW50KCku
Ci0qIGxpYnhzbHQvdHJhbnNmb3JtSW50ZXJuYWxzLmg6IEFkZC4KLSh4c2x0Q2xlYW51cFNvdXJj
ZURvYyk6IEFkZCBkZWNsYXJhdGlvbi4KLQotRml4ZXMgIzEzOS4KLQotQ1ZFOiBDVkUtMjAyNS03
NDI0Ci1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRsYWIuZ25vbWUub3Jn
L0dOT01FL2xpYnhzbHQvLS9pc3N1ZXMvMTM5XQotU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24g
PHJvc3MuYnVydG9uQGFybS5jb20+Ci0tLS0KLSBsaWJ4c2x0L2Z1bmN0aW9ucy5jICAgICAgICAg
IHwgMTYgKysrKysrKysrKysrKysrLQotIGxpYnhzbHQvdHJhbnNmb3JtLmMgICAgICAgICAgfCAg
MyArKy0KLSBsaWJ4c2x0L3RyYW5zZm9ybUludGVybmFscy5oIHwgIDkgKysrKysrKysrCi0gMyBm
aWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotIGNyZWF0ZSBt
b2RlIDEwMDY0NCBsaWJ4c2x0L3RyYW5zZm9ybUludGVybmFscy5oCi0KLWRpZmYgLS1naXQgYS9s
aWJ4c2x0L2Z1bmN0aW9ucy5jIGIvbGlieHNsdC9mdW5jdGlvbnMuYwotaW5kZXggNzJhNThkYzQu
LjExZWMwMzlmIDEwMDY0NAotLS0tIGEvbGlieHNsdC9mdW5jdGlvbnMuYwotKysrIGIvbGlieHNs
dC9mdW5jdGlvbnMuYwotQEAgLTM0LDYgKzM0LDcgQEAKLSAjaW5jbHVkZSAibnVtYmVyc0ludGVy
bmFscy5oIgotICNpbmNsdWRlICJrZXlzLmgiCi0gI2luY2x1ZGUgImRvY3VtZW50cy5oIgotKyNp
bmNsdWRlICJ0cmFuc2Zvcm1JbnRlcm5hbHMuaCIKLSAKLSAjaWZkZWYgV0lUSF9YU0xUX0RFQlVH
Ci0gI2RlZmluZSBXSVRIX1hTTFRfREVCVUdfRlVOQ1RJT04KLUBAIC0xMjUsNyArMTI2LDIwIEBA
IHhzbHREb2N1bWVudEZ1bmN0aW9uTG9hZERvY3VtZW50KHhtbFhQYXRoUGFyc2VyQ29udGV4dFB0
ciBjdHh0LAotIAkgICAgLyoKLSAJICAgICogVGhpcyBzZWxlY3RzIHRoZSBzdHlsZXNoZWV0J3Mg
ZG9jIGl0c2VsZi4KLSAJICAgICovCi0tCSAgICBkb2MgPSB0Y3R4dC0+c3R5bGUtPmRvYzsKLSsJ
ICAgIGRvYyA9IHhtbENvcHlEb2ModGN0eHQtPnN0eWxlLT5kb2MsIDEpOwotKwkgICAgaWYgKGRv
YyA9PSBOVUxMKSB7Ci0rCQl4c2x0VHJhbnNmb3JtRXJyb3IodGN0eHQsIE5VTEwsIE5VTEwsCi0r
CQkgICAgImRvY3VtZW50KCkgOiBmYWlsZWQgdG8gY29weSBzdHlsZSBkb2NcbiIpOwotKwkJZ290
byBvdXRfZnJhZ21lbnQ7Ci0rCSAgICB9Ci0rCSAgICB4c2x0Q2xlYW51cFNvdXJjZURvYyhkb2Mp
OyAvKiBSZW1vdmUgcHN2aSBmaWVsZHMuICovCi0rCSAgICBpZG9jID0geHNsdE5ld0RvY3VtZW50
KHRjdHh0LCBkb2MpOwotKwkgICAgaWYgKGlkb2MgPT0gTlVMTCkgewotKwkJeHNsdFRyYW5zZm9y
bUVycm9yKHRjdHh0LCBOVUxMLCBOVUxMLAotKwkJICAgICJkb2N1bWVudCgpIDogZmFpbGVkIHRv
IGNyZWF0ZSB4c2x0RG9jdW1lbnRcbiIpOwotKwkJeG1sRnJlZURvYyhkb2MpOwotKwkJZ290byBv
dXRfZnJhZ21lbnQ7Ci0rCSAgICB9Ci0gCX0gZWxzZSB7Ci0gICAgICAgICAgICAgZ290byBvdXRf
ZnJhZ21lbnQ7Ci0gCX0KLWRpZmYgLS1naXQgYS9saWJ4c2x0L3RyYW5zZm9ybS5jIGIvbGlieHNs
dC90cmFuc2Zvcm0uYwotaW5kZXggNTRlZjgyMWIuLjM4YzJkY2U2IDEwMDY0NAotLS0tIGEvbGli
eHNsdC90cmFuc2Zvcm0uYwotKysrIGIvbGlieHNsdC90cmFuc2Zvcm0uYwotQEAgLTQzLDYgKzQz
LDcgQEAKLSAjaW5jbHVkZSAieHNsdGxvY2FsZS5oIgotICNpbmNsdWRlICJwYXR0ZXJuLmgiCi0g
I2luY2x1ZGUgInRyYW5zZm9ybS5oIgotKyNpbmNsdWRlICJ0cmFuc2Zvcm1JbnRlcm5hbHMuaCIK
LSAjaW5jbHVkZSAidmFyaWFibGVzLmgiCi0gI2luY2x1ZGUgIm51bWJlcnNJbnRlcm5hbHMuaCIK
LSAjaW5jbHVkZSAibmFtZXNwYWNlcy5oIgotQEAgLTU3NTcsNyArNTc1OCw3IEBAIHhzbHRDb3Vu
dEtleXMoeHNsdFRyYW5zZm9ybUNvbnRleHRQdHIgY3R4dCkKLSAgKgotICAqIFJlc2V0cyBzb3Vy
Y2Ugbm9kZSBmbGFncyBhbmQgaWRzIHN0b3JlZCBpbiAncHN2aScgbWVtYmVyLgotICAqLwotLXN0
YXRpYyB2b2lkCi0rdm9pZAotIHhzbHRDbGVhbnVwU291cmNlRG9jKHhtbERvY1B0ciBkb2MpIHsK
LSAgICAgeG1sTm9kZVB0ciBjdXIgPSAoeG1sTm9kZVB0cikgZG9jOwotICAgICB2b2lkICoqcHN2
aVB0cjsKLWRpZmYgLS1naXQgYS9saWJ4c2x0L3RyYW5zZm9ybUludGVybmFscy5oIGIvbGlieHNs
dC90cmFuc2Zvcm1JbnRlcm5hbHMuaAotbmV3IGZpbGUgbW9kZSAxMDA2NDQKLWluZGV4IDAwMDAw
MDAwLi5kMGY0MjgyMwotLS0tIC9kZXYvbnVsbAotKysrIGIvbGlieHNsdC90cmFuc2Zvcm1JbnRl
cm5hbHMuaAotQEAgLTAsMCArMSw5IEBACi0rLyoKLSsgKiBTdW1tYXJ5OiBzZXQgb2YgaW50ZXJu
YWwgaW50ZXJmYWNlcyBmb3IgdGhlIFhTTFQgZW5naW5lIHRyYW5zZm9ybWF0aW9uIHBhcnQuCi0r
ICoKLSsgKiBDb3B5OiBTZWUgQ29weXJpZ2h0IGZvciB0aGUgc3RhdHVzIG9mIHRoaXMgc29mdHdh
cmUuCi0rICoKLSsgKiBBdXRob3I6IERhdmlkIEtpbHplciA8ZGRraWx6ZXJAYXBwbGUuY29tPgot
KyAqLwotKwotK3ZvaWQgeHNsdENsZWFudXBTb3VyY2VEb2MoeG1sRG9jUHRyIGRvYyk7Ci0tLSAK
LTIuMzkuNSAoQXBwbGUgR2l0LTE1NCkKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGlieHNsdC9saWJ4c2x0XzEuMS40My5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhz
bHQvbGlieHNsdF8xLjEuNDUuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS40My5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS40NS5iYgppbmRleCAzMzkzYmU3
ZWJlLi5jMzQ0MGE5OWQ0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0
L2xpYnhzbHRfMS4xLjQzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGli
eHNsdF8xLjEuNDUuYmIKQEAgLTEzLDEwICsxMyw5IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0NvcHlyaWdodDttZDU9MGNkOWEwN2FmYmViMjQwMjZjOWIwM2FlY2ZlYmE0NTgiCiBTRUNU
SU9OID0gImxpYnMiCiBERVBFTkRTID0gImxpYnhtbDIiCiAKLVNSQ19VUkkgPSAiaHR0cHM6Ly9k
b3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9saWJ4c2x0LzEuMS9saWJ4c2x0LSR7UFZ9LnRhci54
eiBcCi0gICAgICAgICAgIGZpbGU6Ly9nbm9tZS1saWJ4c2x0LWJ1Zy0xMzktYXBwbGUtZml4LmRp
ZmYiCitTUkNfVVJJID0gImh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvbGlieHNs
dC8xLjEvbGlieHNsdC0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1YTNk
NmIzODNjYTVhZmMyMzViMTcxMTE4ZTkwZjVmZjZhYTI3ZTlmZWEzMzAzMDY1MjMxYTZkNDAzZjAx
ODNhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlhY2ZlNjg0MTljNGQwNmE0NWM1NTAzMjFiMzIx
Mjc2MmQ5MmY0MTQ2NTA2MmNhNGVhMTllNjMyZWU1ZDIxNmUiCiAKIFVQU1RSRUFNX0NIRUNLX1JF
R0VYID0gImxpYnhzbHQtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKLS0gCjIuNDcuMQoK

--===============7828018038968047862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libxslt/libxslt-dev: FILELIST: added "/usr/include/libxslt/transformInternals.h"
packages/x86-64-v3-poky-linux/libxslt/libxslt: FILELIST: removed "/usr/lib/libexslt.so.0.8.24 /usr/lib/libxslt.so.1.1.43", added "/usr/lib/libexslt.so.0.8.25 /usr/lib/libxslt.so.1.1.45"
Changes to packages/x86-64-v3-poky-linux/libxslt (sysroot):
  /usr/lib/libexslt.so.0 changed symlink target from libexslt.so.0.8.24 to libexslt.so.0.8.25
  /usr/lib/libexslt.so changed symlink target from libexslt.so.0.8.24 to libexslt.so.0.8.25
  /usr/lib/libxslt.so.1 changed symlink target from libxslt.so.1.1.43 to libxslt.so.1.1.45
  /usr/lib/libxslt.so changed symlink target from libxslt.so.1.1.43 to libxslt.so.1.1.45
  /usr/lib/libexslt.so.0.8.24 moved to /usr/lib/libexslt.so.0.8.25
  /usr/lib/libxslt.so.1.1.43 moved to /usr/lib/libxslt.so.1.1.45
  /usr/include/libxslt/transformInternals.h was added

--===============7828018038968047862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxslt: PKGV changed from 1.1.43 [default] to 1.1.45 [default]
packages/x86-64-v3-poky-linux/libxslt: SRC_URI changed from "https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.43.tar.xz file://gnome-libxslt-bug-139-apple-fix.diff" to "https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.45.tar.xz"
packages/x86-64-v3-poky-linux/libxslt: PV changed from "1.1.43" to "1.1.45"
packages/x86-64-v3-poky-linux/libxslt/libxslt-bin: PKGV changed from 1.1.43 [default] to 1.1.45 [default]
packages/x86-64-v3-poky-linux/libxslt/libxslt-bin: PV changed from "1.1.43" to "1.1.45"
packages/x86-64-v3-poky-linux/libxslt/libxslt-dbg: FILELIST: removed "/usr/lib/.debug/libexslt.so.0.8.24 /usr/lib/.debug/libxslt.so.1.1.43", added "/usr/lib/.debug/libxslt.so.1.1.45 /usr/lib/.debug/libexslt.so.0.8.25"
packages/x86-64-v3-poky-linux/libxslt/libxslt-dbg: PKGV changed from 1.1.43 [default] to 1.1.45 [default]
packages/x86-64-v3-poky-linux/libxslt/libxslt-dbg: PV changed from "1.1.43" to "1.1.45"
packages/x86-64-v3-poky-linux/libxslt/libxslt-dbg: PKGSIZE changed from 1086936 to 1087104 (+0%)
packages/x86-64-v3-poky-linux/libxslt/libxslt-dev: FILELIST: added "/usr/include/libxslt/transformInternals.h"
packages/x86-64-v3-poky-linux/libxslt/libxslt-dev: PKGV changed from 1.1.43 [default] to 1.1.45 [default]
packages/x86-64-v3-poky-linux/libxslt/libxslt-dev: PV changed from "1.1.43" to "1.1.45"
packages/x86-64-v3-poky-linux/libxslt/libxslt-dev: PKGSIZE changed from 125728 to 125965 (+0%)
packages/x86-64-v3-poky-linux/libxslt/libxslt-doc: PKGV changed from 1.1.43 [default] to 1.1.45 [default]
packages/x86-64-v3-poky-linux/libxslt/libxslt-doc: PV changed from "1.1.43" to "1.1.45"
packages/x86-64-v3-poky-linux/libxslt/libxslt-locale: PKGV changed from 1.1.43 [default] to 1.1.45 [default]
packages/x86-64-v3-poky-linux/libxslt/libxslt-locale: PV changed from "1.1.43" to "1.1.45"
packages/x86-64-v3-poky-linux/libxslt/libxslt-src: FILELIST: directory renamed /usr/src/debug/libxslt/1.1.43/xsltproc -> /usr/src/debug/libxslt/1.1.45/xsltproc, directory renamed /usr/src/debug/libxslt/1.1.43/libexslt -> /usr/src/debug/libxslt/1.1.45/libexslt, directory renamed /usr/src/debug/libxslt/1.1.43/libxslt -> /usr/src/debug/libxslt/1.1.45/libxslt
packages/x86-64-v3-poky-linux/libxslt/libxslt-src: PKGV changed from 1.1.43 [default] to 1.1.45 [default]
packages/x86-64-v3-poky-linux/libxslt/libxslt-src: PV changed from "1.1.43" to "1.1.45"
packages/x86-64-v3-poky-linux/libxslt/libxslt-src: PKGSIZE changed from 1302190 to 1302768 (+0%)
packages/x86-64-v3-poky-linux/libxslt/libxslt-staticdev: PKGV changed from 1.1.43 [default] to 1.1.45 [default]
packages/x86-64-v3-poky-linux/libxslt/libxslt-staticdev: PV changed from "1.1.43" to "1.1.45"
packages/x86-64-v3-poky-linux/libxslt/libxslt: FILELIST: removed "/usr/lib/libexslt.so.0.8.24 /usr/lib/libxslt.so.1.1.43", added "/usr/lib/libxslt.so.1.1.45 /usr/lib/libexslt.so.0.8.25"
packages/x86-64-v3-poky-linux/libxslt/libxslt: PKGV changed from 1.1.43 [default] to 1.1.45 [default]
packages/x86-64-v3-poky-linux/libxslt/libxslt: PV changed from "1.1.43" to "1.1.45"
Changes to packages/x86-64-v3-poky-linux/libxslt (sysroot):
  /usr/lib/libexslt.so.0 changed symlink target from libexslt.so.0.8.24 to libexslt.so.0.8.25
  /usr/lib/libexslt.so changed symlink target from libexslt.so.0.8.24 to libexslt.so.0.8.25
  /usr/lib/libxslt.so.1 changed symlink target from libxslt.so.1.1.43 to libxslt.so.1.1.45
  /usr/lib/libxslt.so changed symlink target from libxslt.so.1.1.43 to libxslt.so.1.1.45
  /usr/lib/libexslt.so.0.8.24 moved to /usr/lib/libexslt.so.0.8.25
  /usr/lib/libxslt.so.1.1.43 moved to /usr/lib/libxslt.so.1.1.45
  /usr/include/libxslt/transformInternals.h was added

--===============7828018038968047862==--

