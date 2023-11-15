Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728F4C5AE5B
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:16 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.14628.1700059030845660108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=X+DdWCsE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kBXFtVbI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018bd36a3004-e45aa495-3505-4685-a82d-a7288495a37f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PeT4D9nAK+PejDp76qD5ySWxeEQlR1pezT3VsqUUmHE=;
	b=X+DdWCsEvmJwngoPx4aDMXGrS3eGUXj2BY/+tKJsuGrEtC2HRJe1bIPPe/Y6iKRE
	9vWmBqjrAkiNaBvtYk0NKII4h0Fd4eQtzOUkoSqyzgIHSitWjDguSR5qRUcmvmoT+Cj
	+dtqr0PLDMiUu0pJ6voFRyzV1OTS+oBc5yNtt/NI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PeT4D9nAK+PejDp76qD5ySWxeEQlR1pezT3VsqUUmHE=;
	b=kBXFtVbIflj5nptQ8/orJSAyqTxmzQDTb0WlL9sNCnAZ+5VFHWaFT6rORGssy19w
	WL2R2rAMqJ4Tt306knq4ZXvrqEqxmL1rCKmfCr040DMEYZ9RrxOWHQCu6HnKZCWrKJ4
	am6MW16aGZjyhxaftsrYmoWySIlubpRUmLhl93KU=
Content-Type: multipart/mixed; boundary="===============4301542242383503362=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] p11-kit: upgrading to 0.25.2 FAILED
Message-ID: <0101018bd36a3004-e45aa495-3505-4685-a82d-a7288495a37f-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190721

--===============4301542242383503362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *p11-kit* to *0.25.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-p11-kit-upgrade-0.25.0-0.25.2.patch
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
From 09e245b87f73a96556512cfeede61ae5593023ee Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 14:14:00 +0000
Subject: [PATCH] p11-kit: upgrade 0.25.0 -> 0.25.2

---
 .../p11-kit/files/strerror-1.patch            | 76 -------------------
 .../p11-kit/files/strerror-2.patch            | 30 --------
 .../{p11-kit_0.25.0.bb => p11-kit_0.25.2.bb}  |  6 +-
 3 files changed, 2 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-support/p11-kit/files/strerror-1.patch
 delete mode 100644 meta/recipes-support/p11-kit/files/strerror-2.patch
 rename meta/recipes-support/p11-kit/{p11-kit_0.25.0.bb => p11-kit_0.25.2.bb} (90%)

diff --git a/meta/recipes-support/p11-kit/files/strerror-1.patch b/meta/recipes-support/p11-kit/files/strerror-1.patch
deleted file mode 100644
index 6af4fee724..0000000000
--- a/meta/recipes-support/p11-kit/files/strerror-1.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 3ba2c55dfdc8ff20de369f07f6c57d08718d3add Mon Sep 17 00:00:00 2001
-From: Adam Sampson <ats@offog.org>
-Date: Sun, 2 Jul 2023 15:22:49 +0100
-Subject: [PATCH] Check for GNU strerror_r using the compiler only
-
-The new test that was added to distinguish GNU/XSI strerror_r ran a
-compiled program, which doesn't work when cross-compiling. The only
-difference at compile time is that the GNU version returns char * and
-the XSI version returns int, so detect it by compiling a program that
-dereferences the return value.
-
-Signed-off-by: Adam Sampson <ats@offog.org>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 19 +++++++------------
- meson.build  | 10 +++++-----
- 2 files changed, 12 insertions(+), 17 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 40f5a583..29890622 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -146,19 +146,14 @@ if test "$os_unix" = "yes"; then
- 
- 	AC_CHECK_FUNC(
- 		[strerror_r],
--		[AC_RUN_IFELSE(
--			[AC_LANG_SOURCE([[
--				#include <errno.h>
--				#include <string.h>
--
--				int main (void)
--				{
--					char buf[32];
--					return strerror_r (EINVAL, buf, 32);
--				}
--			]])],
--                        [AC_DEFINE([HAVE_XSI_STRERROR_R], 1, [Whether XSI-compliant strerror_r() is available])],
-+		[AC_COMPILE_IFELSE(
-+			[AC_LANG_PROGRAM([[#include <errno.h>
-+					   #include <string.h>]],
-+					 [[/* GNU strerror_r returns char *, XSI returns int */
-+					    char buf[32];
-+					    return *strerror_r (EINVAL, buf, 32);]])],
- 			[AC_DEFINE([HAVE_GNU_STRERROR_R], 1, [Whether GNU-specific strerror_r() is available])],
-+                        [AC_DEFINE([HAVE_XSI_STRERROR_R], 1, [Whether XSI-compliant strerror_r() is available])],
- 			[])],
- 		[])
- 
-diff --git a/meson.build b/meson.build
-index 0f8c8da0..4cc3f89a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -306,15 +306,15 @@ if cc.has_function('strerror_r', prefix: '#include <string.h>')
- 
- int main (void)
- {
-+    /* GNU strerror_r returns char *, XSI returns int */
-     char buf[32];
--    return strerror_r (EINVAL, buf, 32);
-+    return *strerror_r (EINVAL, buf, 32);
- }
- '''
--  strerror_r_check = cc.run(strerror_r_code, name : 'strerror_r check')
--  if strerror_r_check.returncode() == 0
--    conf.set('HAVE_XSI_STRERROR_R', 1)
--  else
-+  if cc.compiles(strerror_r_code, name : 'GNU strerror_r check')
-     conf.set('HAVE_GNU_STRERROR_R', 1)
-+  else
-+    conf.set('HAVE_XSI_STRERROR_R', 1)
-   endif
- endif
- 
diff --git a/meta/recipes-support/p11-kit/files/strerror-2.patch b/meta/recipes-support/p11-kit/files/strerror-2.patch
deleted file mode 100644
index 1a9180b508..0000000000
--- a/meta/recipes-support/p11-kit/files/strerror-2.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7aa6251bf4ce36d027d53c9c96bb05f90ef7eb5b Mon Sep 17 00:00:00 2001
-From: Adam Sampson <ats@offog.org>
-Date: Sun, 2 Jul 2023 15:44:06 +0100
-Subject: [PATCH] Define _GNU_SOURCE when testing for strerror_r
-
-The Meson check for GNU/XSI strerror_r didn't inherit the project
-options that include _GNU_SOURCE (unlike the autoconf version), so the
-result didn't match how the code that uses it will be compiled. Add
-_GNU_SOURCE explicitly as with the following checks.
-
-Signed-off-by: Adam Sampson <ats@offog.org>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/meson.build b/meson.build
-index 4cc3f89a..9a72e148 100644
---- a/meson.build
-+++ b/meson.build
-@@ -301,6 +301,7 @@ endforeach
- 
- if cc.has_function('strerror_r', prefix: '#include <string.h>')
-   strerror_r_code = '''
-+#define _GNU_SOURCE
- #include <errno.h>
- #include <string.h>
- 
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb
similarity index 90%
rename from meta/recipes-support/p11-kit/p11-kit_0.25.0.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.25.2.bb
index ad1fda3f3b..107dbd0534 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.0.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb
@@ -10,10 +10,8 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit;branch=master;protocol=https \
-           file://strerror-1.patch \
-           file://strerror-2.patch"
-SRCREV = "a8cce8bd8065bbf80bd47219f85f0cd9cf27dd0c"
+SRC_URI = "git://github.com/p11-glue/p11-kit;branch=master;protocol=https"
+SRCREV = "66d6b42ef8dd84fcd8e199ac9f23f822f1a058c9"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.39.2


--===============4301542242383503362==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-p11-kit-upgrade-0.25.0-0.25.2.patch"

RnJvbSAwOWUyNDViODdmNzNhOTY1NTY1MTJjZmVlZGU2MWFlNTU5MzAyM2VlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTQ6MTQ6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
MTEta2l0OiB1cGdyYWRlIDAuMjUuMCAtPiAwLjI1LjIKCi0tLQogLi4uL3AxMS1raXQvZmlsZXMv
c3RyZXJyb3ItMS5wYXRjaCAgICAgICAgICAgIHwgNzYgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
L3AxMS1raXQvZmlsZXMvc3RyZXJyb3ItMi5wYXRjaCAgICAgICAgICAgIHwgMzAgLS0tLS0tLS0K
IC4uLi97cDExLWtpdF8wLjI1LjAuYmIgPT4gcDExLWtpdF8wLjI1LjIuYmJ9ICB8ICA2ICstCiAz
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTEwIGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvZmlsZXMvc3RyZXJyb3It
MS5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQv
ZmlsZXMvc3RyZXJyb3ItMi5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1r
aXQve3AxMS1raXRfMC4yNS4wLmJiID0+IHAxMS1raXRfMC4yNS4yLmJifSAoOTAlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvZmlsZXMvc3RyZXJyb3ItMS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvZmlsZXMvc3RyZXJyb3ItMS5wYXRjaApk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNmFmNGZlZTcyNC4uMDAwMDAwMDAwMAotLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0L2ZpbGVzL3N0cmVycm9yLTEucGF0Y2gKKysr
IC9kZXYvbnVsbApAQCAtMSw3NiArMCwwIEBACi1Gcm9tIDNiYTJjNTVkZmRjOGZmMjBkZTM2OWYw
N2Y2YzU3ZDA4NzE4ZDNhZGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBBZGFtIFNh
bXBzb24gPGF0c0BvZmZvZy5vcmc+Ci1EYXRlOiBTdW4sIDIgSnVsIDIwMjMgMTU6MjI6NDkgKzAx
MDAKLVN1YmplY3Q6IFtQQVRDSF0gQ2hlY2sgZm9yIEdOVSBzdHJlcnJvcl9yIHVzaW5nIHRoZSBj
b21waWxlciBvbmx5Ci0KLVRoZSBuZXcgdGVzdCB0aGF0IHdhcyBhZGRlZCB0byBkaXN0aW5ndWlz
aCBHTlUvWFNJIHN0cmVycm9yX3IgcmFuIGEKLWNvbXBpbGVkIHByb2dyYW0sIHdoaWNoIGRvZXNu
J3Qgd29yayB3aGVuIGNyb3NzLWNvbXBpbGluZy4gVGhlIG9ubHkKLWRpZmZlcmVuY2UgYXQgY29t
cGlsZSB0aW1lIGlzIHRoYXQgdGhlIEdOVSB2ZXJzaW9uIHJldHVybnMgY2hhciAqIGFuZAotdGhl
IFhTSSB2ZXJzaW9uIHJldHVybnMgaW50LCBzbyBkZXRlY3QgaXQgYnkgY29tcGlsaW5nIGEgcHJv
Z3JhbSB0aGF0Ci1kZXJlZmVyZW5jZXMgdGhlIHJldHVybiB2YWx1ZS4KLQotU2lnbmVkLW9mZi1i
eTogQWRhbSBTYW1wc29uIDxhdHNAb2Zmb2cub3JnPgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2tw
b3J0Ci1TaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLS0t
LQotIGNvbmZpZ3VyZS5hYyB8IDE5ICsrKysrKystLS0tLS0tLS0tLS0KLSBtZXNvbi5idWlsZCAg
fCAxMCArKysrKy0tLS0tCi0gMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxNyBk
ZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwot
aW5kZXggNDBmNWE1ODMuLjI5ODkwNjIyIDEwMDY0NAotLS0tIGEvY29uZmlndXJlLmFjCi0rKysg
Yi9jb25maWd1cmUuYWMKLUBAIC0xNDYsMTkgKzE0NiwxNCBAQCBpZiB0ZXN0ICIkb3NfdW5peCIg
PSAieWVzIjsgdGhlbgotIAotIAlBQ19DSEVDS19GVU5DKAotIAkJW3N0cmVycm9yX3JdLAotLQkJ
W0FDX1JVTl9JRkVMU0UoCi0tCQkJW0FDX0xBTkdfU09VUkNFKFtbCi0tCQkJCSNpbmNsdWRlIDxl
cnJuby5oPgotLQkJCQkjaW5jbHVkZSA8c3RyaW5nLmg+Ci0tCi0tCQkJCWludCBtYWluICh2b2lk
KQotLQkJCQl7Ci0tCQkJCQljaGFyIGJ1ZlszMl07Ci0tCQkJCQlyZXR1cm4gc3RyZXJyb3JfciAo
RUlOVkFMLCBidWYsIDMyKTsKLS0JCQkJfQotLQkJCV1dKV0sCi0tICAgICAgICAgICAgICAgICAg
ICAgICAgW0FDX0RFRklORShbSEFWRV9YU0lfU1RSRVJST1JfUl0sIDEsIFtXaGV0aGVyIFhTSS1j
b21wbGlhbnQgc3RyZXJyb3JfcigpIGlzIGF2YWlsYWJsZV0pXSwKLSsJCVtBQ19DT01QSUxFX0lG
RUxTRSgKLSsJCQlbQUNfTEFOR19QUk9HUkFNKFtbI2luY2x1ZGUgPGVycm5vLmg+Ci0rCQkJCQkg
ICAjaW5jbHVkZSA8c3RyaW5nLmg+XV0sCi0rCQkJCQkgW1svKiBHTlUgc3RyZXJyb3JfciByZXR1
cm5zIGNoYXIgKiwgWFNJIHJldHVybnMgaW50ICovCi0rCQkJCQkgICAgY2hhciBidWZbMzJdOwot
KwkJCQkJICAgIHJldHVybiAqc3RyZXJyb3JfciAoRUlOVkFMLCBidWYsIDMyKTtdXSldLAotIAkJ
CVtBQ19ERUZJTkUoW0hBVkVfR05VX1NUUkVSUk9SX1JdLCAxLCBbV2hldGhlciBHTlUtc3BlY2lm
aWMgc3RyZXJyb3JfcigpIGlzIGF2YWlsYWJsZV0pXSwKLSsgICAgICAgICAgICAgICAgICAgICAg
ICBbQUNfREVGSU5FKFtIQVZFX1hTSV9TVFJFUlJPUl9SXSwgMSwgW1doZXRoZXIgWFNJLWNvbXBs
aWFudCBzdHJlcnJvcl9yKCkgaXMgYXZhaWxhYmxlXSldLAotIAkJCVtdKV0sCi0gCQlbXSkKLSAK
LWRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCAwZjhjOGRhMC4u
NGNjM2Y4OWEgMTAwNjQ0Ci0tLS0gYS9tZXNvbi5idWlsZAotKysrIGIvbWVzb24uYnVpbGQKLUBA
IC0zMDYsMTUgKzMwNiwxNSBAQCBpZiBjYy5oYXNfZnVuY3Rpb24oJ3N0cmVycm9yX3InLCBwcmVm
aXg6ICcjaW5jbHVkZSA8c3RyaW5nLmg+JykKLSAKLSBpbnQgbWFpbiAodm9pZCkKLSB7Ci0rICAg
IC8qIEdOVSBzdHJlcnJvcl9yIHJldHVybnMgY2hhciAqLCBYU0kgcmV0dXJucyBpbnQgKi8KLSAg
ICAgY2hhciBidWZbMzJdOwotLSAgICByZXR1cm4gc3RyZXJyb3JfciAoRUlOVkFMLCBidWYsIDMy
KTsKLSsgICAgcmV0dXJuICpzdHJlcnJvcl9yIChFSU5WQUwsIGJ1ZiwgMzIpOwotIH0KLSAnJycK
LS0gIHN0cmVycm9yX3JfY2hlY2sgPSBjYy5ydW4oc3RyZXJyb3Jfcl9jb2RlLCBuYW1lIDogJ3N0
cmVycm9yX3IgY2hlY2snKQotLSAgaWYgc3RyZXJyb3Jfcl9jaGVjay5yZXR1cm5jb2RlKCkgPT0g
MAotLSAgICBjb25mLnNldCgnSEFWRV9YU0lfU1RSRVJST1JfUicsIDEpCi0tICBlbHNlCi0rICBp
ZiBjYy5jb21waWxlcyhzdHJlcnJvcl9yX2NvZGUsIG5hbWUgOiAnR05VIHN0cmVycm9yX3IgY2hl
Y2snKQotICAgICBjb25mLnNldCgnSEFWRV9HTlVfU1RSRVJST1JfUicsIDEpCi0rICBlbHNlCi0r
ICAgIGNvbmYuc2V0KCdIQVZFX1hTSV9TVFJFUlJPUl9SJywgMSkKLSAgIGVuZGlmCi0gZW5kaWYK
LSAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvZmlsZXMvc3RyZXJy
b3ItMi5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvZmlsZXMvc3RyZXJyb3It
Mi5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMWE5MTgwYjUwOC4uMDAwMDAw
MDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0L2ZpbGVzL3N0cmVycm9yLTIu
cGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzMCArMCwwIEBACi1Gcm9tIDdhYTYyNTFiZjRjZTM2
ZDAyN2Q1M2M5Yzk2YmIwNWY5MGVmN2ViNWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9t
OiBBZGFtIFNhbXBzb24gPGF0c0BvZmZvZy5vcmc+Ci1EYXRlOiBTdW4sIDIgSnVsIDIwMjMgMTU6
NDQ6MDYgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gRGVmaW5lIF9HTlVfU09VUkNFIHdoZW4gdGVz
dGluZyBmb3Igc3RyZXJyb3JfcgotCi1UaGUgTWVzb24gY2hlY2sgZm9yIEdOVS9YU0kgc3RyZXJy
b3JfciBkaWRuJ3QgaW5oZXJpdCB0aGUgcHJvamVjdAotb3B0aW9ucyB0aGF0IGluY2x1ZGUgX0dO
VV9TT1VSQ0UgKHVubGlrZSB0aGUgYXV0b2NvbmYgdmVyc2lvbiksIHNvIHRoZQotcmVzdWx0IGRp
ZG4ndCBtYXRjaCBob3cgdGhlIGNvZGUgdGhhdCB1c2VzIGl0IHdpbGwgYmUgY29tcGlsZWQuIEFk
ZAotX0dOVV9TT1VSQ0UgZXhwbGljaXRseSBhcyB3aXRoIHRoZSBmb2xsb3dpbmcgY2hlY2tzLgot
Ci1TaWduZWQtb2ZmLWJ5OiBBZGFtIFNhbXBzb24gPGF0c0BvZmZvZy5vcmc+Ci0KLVVwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQKLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRv
bkBhcm0uY29tPgotLS0tCi0gbWVzb24uYnVpbGQgfCAxICsKLSAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKLQotZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWlu
ZGV4IDRjYzNmODlhLi45YTcyZTE0OCAxMDA2NDQKLS0tLSBhL21lc29uLmJ1aWxkCi0rKysgYi9t
ZXNvbi5idWlsZAotQEAgLTMwMSw2ICszMDEsNyBAQCBlbmRmb3JlYWNoCi0gCi0gaWYgY2MuaGFz
X2Z1bmN0aW9uKCdzdHJlcnJvcl9yJywgcHJlZml4OiAnI2luY2x1ZGUgPHN0cmluZy5oPicpCi0g
ICBzdHJlcnJvcl9yX2NvZGUgPSAnJycKLSsjZGVmaW5lIF9HTlVfU09VUkNFCi0gI2luY2x1ZGUg
PGVycm5vLmg+Ci0gI2luY2x1ZGUgPHN0cmluZy5oPgotIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjUuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L3AxMS1raXQvcDExLWtpdF8wLjI1LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjUuMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjUuMi5iYgppbmRl
eCBhZDFmZGEzZjNiLi4xMDdkYmQwNTM0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9wMTEta2l0L3AxMS1raXRfMC4yNS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Ax
MS1raXQvcDExLWtpdF8wLjI1LjIuYmIKQEAgLTEwLDEwICsxMCw4IEBAIERFUEVORFMgPSAibGli
dGFzbjEgbGlidGFzbjEtbmF0aXZlIGxpYmZmaSIKIAogREVQRU5EUzphcHBlbmQgPSAiJHtAJyBn
bGliLTIuMCcgaWYgZC5nZXRWYXIoJ0dUS0RPQ19FTkFCTEVEJykgPT0gJ1RydWUnIGVsc2UgJyd9
IgogCi1TUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcDExLWdsdWUvcDExLWtpdDticmFuY2g9
bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKLSAgICAgICAgICAgZmlsZTovL3N0cmVycm9yLTEucGF0
Y2ggXAotICAgICAgICAgICBmaWxlOi8vc3RyZXJyb3ItMi5wYXRjaCIKLVNSQ1JFViA9ICJhOGNj
ZThiZDgwNjViYmY4MGJkNDcyMTlmODVmMGNkOWNmMjdkZDBjIgorU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRodWIuY29tL3AxMS1nbHVlL3AxMS1raXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIK
K1NSQ1JFViA9ICI2NmQ2YjQyZWY4ZGQ4NGZjZDhlMTk5YWM5ZjIzZjgyMmYxYTA1OGM5IgogUyA9
ICIke1dPUktESVJ9L2dpdCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiIKLS0gCjIuMzkuMgoK

--===============4301542242383503362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-c10aea23f679fa05899b7d4fee28ce870319be43"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c10aea23f679fa05899b7d4fee28ce870319be43"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 110 Local 98 Mirrors 0 Missed 12 Current 285 (89% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 304 of 395 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 305 of 395 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 306 of 395 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 347 of 395 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: Running task 821 of 1151 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_recipe_qa)
NOTE: Running task 857 of 1151 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_write_config)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_recipe_qa: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_write_config: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe p11-kit-0.25.2-r0: task do_write_config: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 362 of 395 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe p11-kit-0.25.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 959 of 1151 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 371 of 395 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 378 of 395 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 380 of 395 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 390 of 395 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 395 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 395 of 395 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe p11-kit-0.25.2-r0: task do_fetch: Succeeded
NOTE: Running task 1133 of 1151 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_unpack)
NOTE: Running task 1134 of 1151 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.25.2-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.25.2-r0: task do_unpack: Succeeded
NOTE: Running task 1135 of 1151 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_patch)
NOTE: Running task 1136 of 1151 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_collect_spdx_deps)
NOTE: recipe p11-kit-0.25.2-r0: task do_patch: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_patch: Succeeded
NOTE: Running task 1137 of 1151 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1138 of 1151 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_populate_lic)
NOTE: recipe p11-kit-0.25.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe p11-kit-0.25.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_populate_lic: Started
NOTE: recipe p11-kit-0.25.2-r0: task do_populate_lic: Succeeded
NOTE: recipe p11-kit-0.25.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1139 of 1151 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_configure)
NOTE: recipe p11-kit-0.25.2-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.2
 2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sys
 root']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'qemu-native', 'quilt-native', 'bash-completion', 'libtasn1', 'libffi', 'gettext-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'gtk-doc-native', 'libtasn1-native', 'xz-native', 'glib-2.0-native', 'zlib-native', 'libtirpc-native', 'libffi-native', 'libedit-native', 'libtool-native', 'libnsl2-native', 'expat-native', 'bzip2-native', 'util-linux-libuuid-native', 'sqlite3-native', 'gdbm-native', 'openssl-native', 'ncurses-native', 'linux-libc-headers', 'libgcc', 'texinfo-dummy-native', 'gettext-minimal-native', 'attr-native', 'python3-wheel-native', 'python3-installer-native', 'python3-build-native', 'python3-setuptools-native', 're2c-native', 'libmpc-native', 'zstd-native', 'gnu-config-native', 'mpfr-native', 'binutils-cross-x86_64', 'gmp-native', 'flex-native', 'util-linux-native', 'libpcre2-native', 'cmake-native', 'perl-native',
  'python3-flit-core-native', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'm4-native', 'libcap-ng-native', 'make-native', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| gtkdocize: GTK_DOC_CHECK not called in /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/git/configure.ac
| NOTE: Executing meson -Dgtk_doc=false -Dman=false...
| Submodule 'pkcs11-json' (https://github.com/p11-glue/pkcs11-json.git) registered for path './'
| Cloning into '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/git/subprojects/pkcs11-json'...
| fatal: unable to access 'https://github.com/p11-glue/pkcs11-json.git/': Could not resolve host: github.com
| fatal: clone of 'https://github.com/p11-glue/pkcs11-json.git' into submodule path '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/git/subprojects/pkcs11-json' failed
| Failed to clone 'subprojects/pkcs11-json'. Retry scheduled
| Cloning into '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/git/subprojects/pkcs11-json'...
| fatal: unable to access 'https://github.com/p11-glue/pkcs11-json.git/': Could not resolve host: github.com
| fatal: clone of 'https://github.com/p11-glue/pkcs11-json.git' into submodule path '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/git/subprojects/pkcs11-json' failed
| Failed to clone 'subprojects/pkcs11-json' a second time, aborting
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/git
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/build
| Build type: cross build
| Project name: p11-kit
| Project version: 0.25.2
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/recipe-sysroot ld.bfd 2.41.0.20230926
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Has header "libintl.h" : YES
| Library intl found: NO
| Checking for size of "unsigned long" : 8
| Run-time dependency threads found: YES
| Checking for function "pthread_create" with dependency threads: YES
| Checking for function "nanosleep" : YES
| Checking for function "dlopen" : YES
| Library nsl found: NO
| Has header "locale.h" : YES
| Checking for type "locale_t" : YES
| Checking for function "newlocale" : YES
| Checking for function "strerror_l" : YES
| Has header "sys/resource.h" : YES
| Has header "sys/un.h" : YES
| Has header "ucred.h" : NO
| Checking for function "fdwalk" : NO
| Checking for function "getauxval" : YES
| Checking for function "getexecname" : NO
| Checking for function "getpeereid" : NO
| Checking for function "getpeerucred" : NO
| Checking for function "getprogname" : NO
| Checking for function "getresuid" : YES
| Checking for function "isatty" : YES
| Checking for function "issetugid" : NO
| Checking for function "mkdtemp" : YES
| Checking for function "mkstemp" : YES
| Checking for function "readpassphrase" : NO
| Checking for function "secure_getenv" : YES
| Checking for function "strndup" : YES
| Checking whether type "struct dirent" has member "d_type" : YES
| Checking if "thread-local storage class" compiles: YES
| Checking for function "gmtime_r" : YES
| Checking if "program_invocation_short_name_test_code" : links: YES
| Checking if "__libc_enable_secure" : links: YES
| Checking if "vsock_test" compiles: YES
| Checking for type "sighandler_t" : NO
| Checking for type "sig_t" : NO
| Checking for type "__sighandler_t" : NO
| Checking for type "sighandler_t" : NO
| Checking for type "sig_t" : YES
| Checking for type "__sighandler_t" : YES
| Has header "stdbool.h" : YES
| Checking for function "asprintf" : YES
| Checking for function "basename" : YES
| Checking for function "memdup" : NO
| Checking for function "reallocarray" : YES
| Checking for function "secure_getenv" : YES (cached)
| Checking for function "setenv" : YES
| Checking for function "strnstr" : NO
| Checking for function "vasprintf" : YES
| Checking for function "strerror_r" : YES
| Checking if "GNU strerror_r check" compiles: YES
| Header "errno.h" has symbol "program_invocation_short_name" : YES
| Header "stdio.h" has symbol "asprintf" : YES
| Header "stdio.h" has symbol "vasprintf" : YES
| Header "stdlib.h" has symbol "reallocarray" : YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency libffi found: YES 3.4.4
| Run-time dependency libtasn1 found: YES 4.19.0
| Program asn1Parser found: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/recipe-sysroot-native/usr/bin/asn1Parser)
| Found CMake: NO
| Run-time dependency libsystemd found: NO (tried pkgconfig and cmake)
| Run-time dependency systemd found: NO (tried pkgconfig and cmake)
| Configuring config.h using configuration
| Program python3 found: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/recipe-sysroot-native/usr/bin/nativepython3)
| 
| ../git/meson.build:452:22: ERROR: git submodule failed to init
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/temp/run.do_configure.3406408:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/temp/run.do_configure.3406408, line 177
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/temp/run.do_configure.3406408, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/temp/run.do_configure.3406408, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/temp/run.do_configure.3406408, line 190
NOTE: recipe p11-kit-0.25.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1139 tasks of which 1129 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115141337.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115141337.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: p11-kit-0.25.2-r0 do_configure: meson failed
ERROR: p11-kit-0.25.2-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/temp/run.do_configure.3406408', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/p11-kit/0.25.2/temp/log.do_configure.3406408
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.2.bb:do_configure) failed with exit code '1'

--===============4301542242383503362==--

