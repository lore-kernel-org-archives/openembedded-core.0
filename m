Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FE0D5C0DA
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:26 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17182.1765872136269594598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=p97JmAni;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qccIf1Pq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b262e6c54-181def44-037c-4bb7-ae95-76a73d8680f7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872135;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fjynniYpUSo6OYODK3hQVQyc8ZwQBhmY45ehc0Wg0ps=;
	b=p97JmAni5RHspOMx4oRK0jF140tGzbP67C4TmwJaegULvbPWcCJG5RMM2tL8hd/8
	07WAPZuHp825htizdgdj3hkpDbV4NKfyR8m/RmY9NiLQ1rlJqFBAlo/VgYwsaZSC34j
	rjCKmWYK06tsLHPs4jDA0Hri9g9L4MxddGNJ/py4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872135;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fjynniYpUSo6OYODK3hQVQyc8ZwQBhmY45ehc0Wg0ps=;
	b=qccIf1PqUyQPvzkFmQWQI8xRvMWiB6xFKsqpdIS5T2jdvBbU8oONv84Mt3wTOYv8
	nhYQi/wTk7PCAvdG1wrNAftsHovCrLedSjocO61/wUXZp2ozJ+FyoAVM92AjymgspmV
	DQJigH5pH6x8mPaMuW085IH3B+6m3u6SiwQjCANA=
Content-Type: multipart/mixed; boundary="===============0323142339746503476=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] socat: upgrading to 1.8.1.0 SUCCEEDED
Message-ID: <0101019b262e6c54-181def44-037c-4bb7-ae95-76a73d8680f7-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227784

--===============0323142339746503476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *socat* to *1.8.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-socat-upgrade-1.8.0.3-1.8.1.0.patch
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
From 0870aedbdae0fd39cd0b087f815f2d39fbc19cbb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 22:33:56 +0000
Subject: [PATCH] socat: upgrade 1.8.0.3 -> 1.8.1.0

---
 .../0001-fix-compile-procan.c-failed.patch    | 11 +++---
 .../{socat_1.8.0.3.bb => socat_1.8.1.0.bb}    | 34 +++++++++++++++++--
 2 files changed, 36 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.8.0.3.bb => socat_1.8.1.0.bb} (59%)

diff --git a/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch b/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
index ea00dfa0a9..95ce0f2610 100644
--- a/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
+++ b/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
@@ -1,4 +1,4 @@
-From c4c3d5f2d4dfe8167205e8d20b4cb7a197706c16 Mon Sep 17 00:00:00 2001
+From ad92c59f5ae8f24110dda3cb65c8999288aad6dd Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 27 Nov 2024 04:09:59 -0800
 Subject: [PATCH] fix compile procan.c failed
@@ -32,10 +32,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 631d31d..103d4d1 100644
+index 629cb7e..4368a3f 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -110,7 +110,7 @@ socat: socat.o libxio.a
+@@ -112,7 +112,7 @@ socat: socat.o libxio.a
  	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ socat.o libxio.a $(CLIBS)
  
  procan.o: $(srcdir)/procan.c
@@ -44,7 +44,7 @@ index 631d31d..103d4d1 100644
  
  PROCAN_OBJS=procan_main.o procan.o procan-cdefs.o hostan.o error.o sycls.o sysutils.o utils.o vsnprintf_r.o snprinterr.o
  procan: $(PROCAN_OBJS)
-@@ -132,9 +132,9 @@ install: progs $(srcdir)/doc/socat.1
+@@ -134,9 +134,9 @@ install: progs $(srcdir)/doc/socat.1
  	mkdir -p $(DESTDIR)$(BINDEST)
  	$(INSTALL) -m 755 socat $(DESTDIR)$(BINDEST)/socat1
  	ln -sf socat1 $(DESTDIR)$(BINDEST)/socat
@@ -57,6 +57,3 @@ index 631d31d..103d4d1 100644
  	$(INSTALL) -m 755 procan $(DESTDIR)$(BINDEST)
  	$(INSTALL) -m 755 filan $(DESTDIR)$(BINDEST)
  	mkdir -p $(DESTDIR)$(MANDEST)/man1
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb b/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
similarity index 59%
rename from meta/recipes-connectivity/socat/socat_1.8.0.3.bb
rename to meta/recipes-connectivity/socat/socat_1.8.1.0.bb
index b5f5d72f9c..49391c152c 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
@@ -1,3 +1,32 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README
+# +++ README
+# @@ -1,3 +1,7 @@
+# +(http://www.xs4all.nl/~jantien/yodl/) (there seems to be a revival at
+# +http://yodl.sourceforge.net/ though). For socat, the revival version 3.03 is used,
+# +
+# +
+#  license
+#  -------
+#  
+# @@ -25,7 +29,3 @@
+#      but WITHOUT ANY WARRANTY; without even the implied warranty of
+#      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#      GNU General Public License for more details.
+# -
+# -    You should have received a copy of the GNU General Public License
+# -    along with this program; if not, write to the Free Software
+# -    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+# 
+#
+
 SUMMARY = "Multipurpose relay for bidirectional data transfer"
 DESCRIPTION = "Socat is a relay for bidirectional data \
 transfer between two independent data channels."
@@ -7,13 +36,14 @@ SECTION = "console/network"
 
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=248;endline=278;md5=338c05eadd013872abb1d6e198e10a3f"
+                    file://README;beginline=248;endline=278;md5=25753104995bd8f97956efcdbc671c1f \
+                    "
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
 "
 
-SRC_URI[sha256sum] = "01eb017361d95bb3a6941e840b59e4463a3fabf92df4154ed02b16a2ed6a0095"
+SRC_URI[sha256sum] = "91f222ee65559036600c2505b999acebed48b899f0e2e53ae1c9c31d6986b6a4"
 
 inherit autotools
 
-- 
2.47.1


--===============0323142339746503476==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-socat-upgrade-1.8.0.3-1.8.1.0.patch"

RnJvbSAwODcwYWVkYmRhZTBmZDM5Y2QwYjA4N2Y4MTVmMmQzOWZiYzE5Y2JiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjI6MzM6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
b2NhdDogdXBncmFkZSAxLjguMC4zIC0+IDEuOC4xLjAKCi0tLQogLi4uLzAwMDEtZml4LWNvbXBp
bGUtcHJvY2FuLmMtZmFpbGVkLnBhdGNoICAgIHwgMTEgKysrLS0tCiAuLi4ve3NvY2F0XzEuOC4w
LjMuYmIgPT4gc29jYXRfMS44LjEuMC5iYn0gICAgfCAzNCArKysrKysrKysrKysrKysrKy0tCiAy
IGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zb2NhdC97c29jYXRfMS44LjAuMy5iYiA9PiBzb2Nh
dF8xLjguMS4wLmJifSAoNTklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvc29jYXQvZmlsZXMvMDAwMS1maXgtY29tcGlsZS1wcm9jYW4uYy1mYWlsZWQucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NvY2F0L2ZpbGVzLzAwMDEtZml4LWNvbXBpbGUtcHJv
Y2FuLmMtZmFpbGVkLnBhdGNoCmluZGV4IGVhMDBkZmEwYTkuLjk1Y2UwZjI2MTAgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc29jYXQvZmlsZXMvMDAwMS1maXgtY29tcGls
ZS1wcm9jYW4uYy1mYWlsZWQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9z
b2NhdC9maWxlcy8wMDAxLWZpeC1jb21waWxlLXByb2Nhbi5jLWZhaWxlZC5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gYzRjM2Q1ZjJkNGRmZTgxNjcyMDVlOGQyMGI0Y2I3YTE5NzcwNmMxNiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWQ5MmM1OWY1YWU4ZjI0MTEwZGRhM2NiNjVj
ODk5OTI4OGFhZDZkZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEg
PGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMjcgTm92IDIwMjQgMDQ6MDk6
NTkgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZml4IGNvbXBpbGUgcHJvY2FuLmMgZmFpbGVkCkBA
IC0zMiwxMCArMzIsMTAgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3
aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5pbiBiL01ha2VmaWxlLmluCi1pbmRleCA2
MzFkMzFkLi4xMDNkNGQxIDEwMDY0NAoraW5kZXggNjI5Y2I3ZS4uNDM2OGEzZiAxMDA2NDQKIC0t
LSBhL01ha2VmaWxlLmluCiArKysgYi9NYWtlZmlsZS5pbgotQEAgLTExMCw3ICsxMTAsNyBAQCBz
b2NhdDogc29jYXQubyBsaWJ4aW8uYQorQEAgLTExMiw3ICsxMTIsNyBAQCBzb2NhdDogc29jYXQu
byBsaWJ4aW8uYQogIAkkKENDKSAkKENGTEFHUykgJChMREZMQUdTKSAtbyAkQCBzb2NhdC5vIGxp
Ynhpby5hICQoQ0xJQlMpCiAgCiAgcHJvY2FuLm86ICQoc3JjZGlyKS9wcm9jYW4uYwpAQCAtNDQs
NyArNDQsNyBAQCBpbmRleCA2MzFkMzFkLi4xMDNkNGQxIDEwMDY0NAogIAogIFBST0NBTl9PQkpT
PXByb2Nhbl9tYWluLm8gcHJvY2FuLm8gcHJvY2FuLWNkZWZzLm8gaG9zdGFuLm8gZXJyb3IubyBz
eWNscy5vIHN5c3V0aWxzLm8gdXRpbHMubyB2c25wcmludGZfci5vIHNucHJpbnRlcnIubwogIHBy
b2NhbjogJChQUk9DQU5fT0JKUykKLUBAIC0xMzIsOSArMTMyLDkgQEAgaW5zdGFsbDogcHJvZ3Mg
JChzcmNkaXIpL2RvYy9zb2NhdC4xCitAQCAtMTM0LDkgKzEzNCw5IEBAIGluc3RhbGw6IHByb2dz
ICQoc3JjZGlyKS9kb2Mvc29jYXQuMQogIAlta2RpciAtcCAkKERFU1RESVIpJChCSU5ERVNUKQog
IAkkKElOU1RBTEwpIC1tIDc1NSBzb2NhdCAkKERFU1RESVIpJChCSU5ERVNUKS9zb2NhdDEKICAJ
bG4gLXNmIHNvY2F0MSAkKERFU1RESVIpJChCSU5ERVNUKS9zb2NhdApAQCAtNTcsNiArNTcsMyBA
QCBpbmRleCA2MzFkMzFkLi4xMDNkNGQxIDEwMDY0NAogIAkkKElOU1RBTEwpIC1tIDc1NSBwcm9j
YW4gJChERVNURElSKSQoQklOREVTVCkKICAJJChJTlNUQUxMKSAtbSA3NTUgZmlsYW4gJChERVNU
RElSKSQoQklOREVTVCkKICAJbWtkaXIgLXAgJChERVNURElSKSQoTUFOREVTVCkvbWFuMQotLS0g
Ci0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zb2NhdC9z
b2NhdF8xLjguMC4zLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zb2NhdC9zb2NhdF8x
LjguMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvc29jYXQvc29jYXRfMS44LjAuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9zb2NhdC9zb2NhdF8xLjguMS4wLmJiCmluZGV4IGI1ZjVkNzJmOWMuLjQ5
MzkxYzE1MmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc29jYXQvc29j
YXRfMS44LjAuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NvY2F0L3NvY2F0
XzEuOC4xLjAuYmIKQEAgLTEsMyArMSwzMiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtT
VU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUg
Zm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBs
aWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVk
LCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEg
J0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5
cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIFJFQURN
RQorIyArKysgUkVBRE1FCisjIEBAIC0xLDMgKzEsNyBAQAorIyArKGh0dHA6Ly93d3cueHM0YWxs
Lm5sL35qYW50aWVuL3lvZGwvKSAodGhlcmUgc2VlbXMgdG8gYmUgYSByZXZpdmFsIGF0CisjICto
dHRwOi8veW9kbC5zb3VyY2Vmb3JnZS5uZXQvIHRob3VnaCkuIEZvciBzb2NhdCwgdGhlIHJldml2
YWwgdmVyc2lvbiAzLjAzIGlzIHVzZWQsCisjICsKKyMgKworIyAgbGljZW5zZQorIyAgLS0tLS0t
LQorIyAgCisjIEBAIC0yNSw3ICsyOSwzIEBACisjICAgICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJB
TlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyMgICAgICBNRVJDSEFO
VEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisj
ICAgICAgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMgLQor
IyAtICAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlCisjIC0gICAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwg
d3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUKKyMgLSAgICBGb3VuZGF0aW9uLCBJbmMuLCA2NzUg
TWFzcyBBdmUsIENhbWJyaWRnZSwgTUEgMDIxMzksIFVTQS4KKyMgCisjCisKIFNVTU1BUlkgPSAi
TXVsdGlwdXJwb3NlIHJlbGF5IGZvciBiaWRpcmVjdGlvbmFsIGRhdGEgdHJhbnNmZXIiCiBERVND
UklQVElPTiA9ICJTb2NhdCBpcyBhIHJlbGF5IGZvciBiaWRpcmVjdGlvbmFsIGRhdGEgXAogdHJh
bnNmZXIgYmV0d2VlbiB0d28gaW5kZXBlbmRlbnQgZGF0YSBjaGFubmVscy4iCkBAIC03LDEzICsz
NiwxNCBAQCBTRUNUSU9OID0gImNvbnNvbGUvbmV0d29yayIKIAogTElDRU5TRSA9ICJHUEwtMi4w
LXdpdGgtT3BlblNTTC1leGNlcHRpb24iCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCi0gICAgICAgICAgICAg
ICAgICAgIGZpbGU6Ly9SRUFETUU7YmVnaW5saW5lPTI0ODtlbmRsaW5lPTI3ODttZDU9MzM4YzA1
ZWFkZDAxMzg3MmFiYjFkNmUxOThlMTBhM2YiCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9S
RUFETUU7YmVnaW5saW5lPTI0ODtlbmRsaW5lPTI3ODttZDU9MjU3NTMxMDQ5OTViZDhmOTc5NTZl
ZmNkYmM2NzFjMWYgXAorICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cDov
L3d3dy5kZXN0LXVucmVhY2gub3JnL3NvY2F0L2Rvd25sb2FkL3NvY2F0LSR7UFZ9LnRhci5iejIg
XAogICAgICAgICAgICBmaWxlOi8vMDAwMS1maXgtY29tcGlsZS1wcm9jYW4uYy1mYWlsZWQucGF0
Y2ggXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDFlYjAxNzM2MWQ5NWJiM2E2OTQxZTg0
MGI1OWU0NDYzYTNmYWJmOTJkZjQxNTRlZDAyYjE2YTJlZDZhMDA5NSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI5MWYyMjJlZTY1NTU5MDM2NjAwYzI1MDViOTk5YWNlYmVkNDhiODk5ZjBlMmU1M2Fl
MWM5YzMxZDY5ODZiNmE0IgogCiBpbmhlcml0IGF1dG90b29scwogCi0tIAoyLjQ3LjEKCg==

--===============0323142339746503476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/socat: PV changed from "1.8.0.3" to "1.8.1.0"
packages/x86-64-v3-poky-linux/socat: SRC_URI changed from "http://www.dest-unreach.org/socat/download/socat-1.8.0.3.tar.bz2 file://0001-fix-compile-procan.c-failed.patch" to "http://www.dest-unreach.org/socat/download/socat-1.8.1.0.tar.bz2 file://0001-fix-compile-procan.c-failed.patch"
packages/x86-64-v3-poky-linux/socat: PKGV changed from 1.8.0.3 [default] to 1.8.1.0 [default]
packages/x86-64-v3-poky-linux/socat/socat-dbg: PV changed from "1.8.0.3" to "1.8.1.0"
packages/x86-64-v3-poky-linux/socat/socat-dbg: PKGSIZE changed from 1994768 to 2063808 (+3%)
packages/x86-64-v3-poky-linux/socat/socat-dbg: PKGV changed from 1.8.0.3 [default] to 1.8.1.0 [default]
packages/x86-64-v3-poky-linux/socat/socat-dev: PV changed from "1.8.0.3" to "1.8.1.0"
packages/x86-64-v3-poky-linux/socat/socat-dev: PKGV changed from 1.8.0.3 [default] to 1.8.1.0 [default]
packages/x86-64-v3-poky-linux/socat/socat-doc: PV changed from "1.8.0.3" to "1.8.1.0"
packages/x86-64-v3-poky-linux/socat/socat-doc: PKGSIZE changed from 166902 to 170601 (+2%)
packages/x86-64-v3-poky-linux/socat/socat-doc: PKGV changed from 1.8.0.3 [default] to 1.8.1.0 [default]
packages/x86-64-v3-poky-linux/socat/socat-locale: PV changed from "1.8.0.3" to "1.8.1.0"
packages/x86-64-v3-poky-linux/socat/socat-locale: PKGV changed from 1.8.0.3 [default] to 1.8.1.0 [default]
packages/x86-64-v3-poky-linux/socat/socat-src: PV changed from "1.8.0.3" to "1.8.1.0"
packages/x86-64-v3-poky-linux/socat/socat-src: PKGSIZE changed from 1274570 to 1309321 (+3%)
packages/x86-64-v3-poky-linux/socat/socat-src: FILELIST: removed "/usr/src/debug/socat/1.8.0.3/xio-progcall.c /usr/src/debug/socat/1.8.0.3/xiodiag.c /usr/src/debug/socat/1.8.0.3/xio-progcall.h /usr/src/debug/socat/1.8.0.3/xio-fdnum.h /usr/src/debug/socat/1.8.0.3/xio-ip6.c /usr/src/debug/socat/1.8.0.3/xio-dccp.c /usr/src/debug/socat/1.8.0.3/xio-dccp.h /usr/src/debug/socat/1.8.0.3/xio-fdnum.c /usr/src/debug/socat/1.8.0.3/xio-ip6.h /usr/src/debug/socat/1.8.0.3/xioshutdown.c /usr/src/debug/socat/1.8.0.3/xio-ip4.c /usr/src/debug/socat/1.8.0.3/xio-ip4.h /usr/src/debug/socat/1.8.0.3/xioopts.c /usr/src/debug/socat/1.8.0.3/xioopts.h /usr/src/debug/socat/1.8.0.3/xio-pipe.h /usr/src/debug/socat/1.8.0.3/xio-pipe.c /usr/src/debug/socat/1.8.0.3/sslcls.h /usr/src/debug/socat/1.8.0.3/xiosignal.c /usr/src/debug/socat/1.8.0.3/sslcls.c /usr/src/debug/socat/1.8.0.3/xio-fs.h /usr/src/debug/socat/1.8.0.3/xio-fs.c /usr/src/debug/socat/1.8.0.3/xio-socket.h /usr/src/debug/socat/1.8.0.3/xio-socks5.h /usr/src/
 debug/socat/1.8.0.3/xio-system.h /usr/src/debug/socat/1.8.0.3/xio-socket.c /usr/src/debug/socat/1.8.0.3/xio-socks5.c /usr/src/debug/socat/1.8.0.3/xio-system.c /usr/src/debug/socat/1.8.0.3/xio-named.c /usr/src/debug/socat/1.8.0.3/xio-socks.c /usr/src/debug/socat/1.8.0.3/xio-named.h /usr/src/debug/socat/1.8.0.3/xio-socks.h /usr/src/debug/socat/1.8.0.3/xio-tun.c /usr/src/debug/socat/1.8.0.3/xio-tun.h /usr/src/debug/socat/1.8.0.3/xio-ascii.c /usr/src/debug/socat/1.8.0.3/xio-gopen.h /usr/src/debug/socat/1.8.0.3/snprinterr.h /usr/src/debug/socat/1.8.0.3/xio-gopen.c /usr/src/debug/socat/1.8.0.3/procan-cdefs.c /usr/src/debug/socat/1.8.0.3/xio-ascii.h /usr/src/debug/socat/1.8.0.3/snprinterr.c /usr/src/debug/socat/1.8.0.3/compat.h /usr/src/debug/socat/1.8.0.3/xio-exec.h /usr/src/debug/socat/1.8.0.3/xio-socketpair.h /usr/src/debug/socat/1.8.0.3/xiowrite.c /usr/src/debug/socat/1.8.0.3/xio-ip.c /usr/src/debug/socat/1.8.0.3/xio-proxy.c /usr/src/debug/socat/1.8.0.3/xio-socketpair.c /usr/src/debug/
 socat/1.8.0.3/xio-exec.c /usr/src/debug/socat/1.8.0.3/xio-ip.h /usr/src/debug/socat/1.8.0.3/xio-proxy.h /usr/src/debug/socat/1.8.0.3/procan.c /usr/src/debug/socat/1.8.0.3/xio-posixmq.c /usr/src/debug/socat/1.8.0.3/xio-process.c /usr/src/debug/socat/1.8.0.3/xio-stdio.h /usr/src/debug/socat/1.8.0.3/sysutils.h /usr/src/debug/socat/1.8.0.3/xio-termios.c /usr/src/debug/socat/1.8.0.3/xiolayer.c /usr/src/debug/socat/1.8.0.3/xio-posixmq.h /usr/src/debug/socat/1.8.0.3/xio-process.h /usr/src/debug/socat/1.8.0.3/xio-stdio.c /usr/src/debug/socat/1.8.0.3/procan.h /usr/src/debug/socat/1.8.0.3/xio-termios.h /usr/src/debug/socat/1.8.0.3/xiolayer.h /usr/src/debug/socat/1.8.0.3/xiosigchld.c /usr/src/debug/socat/1.8.0.3/xio-sctp.h /usr/src/debug/socat/1.8.0.3/sysutils.c /usr/src/debug/socat/1.8.0.3/dalan.h /usr/src/debug/socat/1.8.0.3/filan.h /usr/src/debug/socat/1.8.0.3/error.h /usr/src/debug/socat/1.8.0.3/nestlex.c /usr/src/debug/socat/1.8.0.3/xio-sctp.c /usr/src/debug/socat/1.8.0.3/nestlex.h /usr/s
 rc/debug/socat/1.8.0.3/error.c /usr/src/debug/socat/1.8.0.3/dalan.c /usr/src/debug/socat/1.8.0.3/filan.c /usr/src/debug/socat/1.8.0.3/xio-creat.c /usr/src/debug/socat/1.8.0.3/xioinitialize.c /usr/src/debug/socat/1.8.0.3/xio-creat.h /usr/src/debug/socat/1.8.0.3/xioclose.c /usr/src/debug/socat/1.8.0.3/xioexit.c /usr/src/debug/socat/1.8.0.3/xio-unix.h /usr/src/debug/socat/1.8.0.3/xio-unix.c /usr/src/debug/socat/1.8.0.3/xioparam.c /usr/src/debug/socat/1.8.0.3/socat.c /usr/src/debug/socat/1.8.0.3/xio-fd.c /usr/src/debug/socat/1.8.0.3/filan_main.c /usr/src/debug/socat/1.8.0.3/xio-fd.h /usr/src/debug/socat/1.8.0.3/xio-file.c /usr/src/debug/socat/1.8.0.3/xio-file.h /usr/src/debug/socat/1.8.0.3/vsnprintf_r.c /usr/src/debug/socat/1.8.0.3/hostan.h /usr/src/debug/socat/1.8.0.3/hostan.c /usr/src/debug/socat/1.8.0.3/vsnprintf_r.h /usr/src/debug/socat/1.8.0.3/xio-udp.c /usr/src/debug/socat/1.8.0.3/xio-udp.h /usr/src/debug/socat/1.8.0.3/procan_main.c /usr/src/debug/socat/1.8.0.3/xio-openssl.h /usr/
 src/debug/socat/1.8.0.3/xio-namespaces.h /usr/src/debug/socat/1.8.0.3/xio-pty.c /usr/src/debug/socat/1.8.0.3/xio-pty.h /usr/src/debug/socat/1.8.0.3/xio-namespaces.c /usr/src/debug/socat/1.8.0.3/xiohelp.c /usr/src/debug/socat/1.8.0.3/xio-listen.h /usr/src/debug/socat/1.8.0.3/xiohelp.h /usr/src/debug/socat/1.8.0.3/xio-listen.c /usr/src/debug/socat/1.8.0.3/xio-ipapp.h /usr/src/debug/socat/1.8.0.3/xio-vsock.h /usr/src/debug/socat/1.8.0.3/sycls.c /usr/src/debug/socat/1.8.0.3/utils.c /usr/src/debug/socat/1.8.0.3/xio-ipapp.c /usr/src/debug/socat/1.8.0.3/fdname.c /usr/src/debug/socat/1.8.0.3/sycls.h /usr/src/debug/socat/1.8.0.3/utils.h /usr/src/debug/socat/1.8.0.3/xio-vsock.c /usr/src/debug/socat/1.8.0.3/xio-interface.c /usr/src/debug/socat/1.8.0.3/xiolockfile.c /usr/src/debug/socat/1.8.0.3/xio-interface.h /usr/src/debug/socat/1.8.0.3/xioread.c /usr/src/debug/socat/1.8.0.3/xiolockfile.h /usr/src/debug/socat/1.8.0.3/xio.h /usr/src/debug/socat/1.8.0.3/xio-shell.c /usr/src/debug/socat/1.8.0.3/
 xio-shell.h /usr/src/debug/socat/1.8.0.3/xio-rawip.h /usr/src/debug/socat/1.8.0.3/xio-rawip.c /usr/src/debug/socat/1.8.0.3/xio-tcp.h /usr/src/debug/socat/1.8.0.3/xio-readline.c /usr/src/debug/socat/1.8.0.3/xioopen.c /usr/src/debug/socat/1.8.0.3/xio-readline.h /usr/src/debug/socat/1.8.0.3/xio-tcp.c /usr/src/debug/socat/1.8.0.3/xioopen.h /usr/src/debug/socat/1.8.0.3/xio-openssl.c /usr/src/debug/socat/1.8.0.3/xio-udplite.c /usr/src/debug/socat/1.8.0.3/xio-udplite.h", added "/usr/src/debug/socat/1.8.1.0/xiosigchld.c /usr/src/debug/socat/1.8.1.0/xio-sctp.h /usr/src/debug/socat/1.8.1.0/dalan.h /usr/src/debug/socat/1.8.1.0/filan.h /usr/src/debug/socat/1.8.1.0/error.h /usr/src/debug/socat/1.8.1.0/nestlex.c /usr/src/debug/socat/1.8.1.0/xio-sctp.c /usr/src/debug/socat/1.8.1.0/nestlex.h /usr/src/debug/socat/1.8.1.0/error.c /usr/src/debug/socat/1.8.1.0/dalan.c /usr/src/debug/socat/1.8.1.0/filan.c /usr/src/debug/socat/1.8.1.0/xio-creat.c /usr/src/debug/socat/1.8.1.0/xioinitialize.c /usr/src/debu
 g/socat/1.8.1.0/xioclose.c /usr/src/debug/socat/1.8.1.0/xio-creat.h /usr/src/debug/socat/1.8.1.0/xioexit.c /usr/src/debug/socat/1.8.1.0/xio-unix.h /usr/src/debug/socat/1.8.1.0/xio-unix.c /usr/src/debug/socat/1.8.1.0/xioparam.c /usr/src/debug/socat/1.8.1.0/socat.c /usr/src/debug/socat/1.8.1.0/xio-fd.c /usr/src/debug/socat/1.8.1.0/xio-text.h /usr/src/debug/socat/1.8.1.0/filan_main.c /usr/src/debug/socat/1.8.1.0/xio-text.c /usr/src/debug/socat/1.8.1.0/xio-fd.h /usr/src/debug/socat/1.8.1.0/xio-file.c /usr/src/debug/socat/1.8.1.0/xio-file.h /usr/src/debug/socat/1.8.1.0/vsnprintf_r.c /usr/src/debug/socat/1.8.1.0/hostan.h /usr/src/debug/socat/1.8.1.0/hostan.c /usr/src/debug/socat/1.8.1.0/vsnprintf_r.h /usr/src/debug/socat/1.8.1.0/xio-udp.c /usr/src/debug/socat/1.8.1.0/xio-udp.h /usr/src/debug/socat/1.8.1.0/procan_main.c /usr/src/debug/socat/1.8.1.0/xio-namespaces.h /usr/src/debug/socat/1.8.1.0/xio-pty.c /usr/src/debug/socat/1.8.1.0/xio-pty.h /usr/src/debug/socat/1.8.1.0/xio-namespaces.c /u
 sr/src/debug/socat/1.8.1.0/xiohelp.c /usr/src/debug/socat/1.8.1.0/xio-listen.h /usr/src/debug/socat/1.8.1.0/xio-stall.c /usr/src/debug/socat/1.8.1.0/xiohelp.h /usr/src/debug/socat/1.8.1.0/xio-stall.h /usr/src/debug/socat/1.8.1.0/xio-listen.c /usr/src/debug/socat/1.8.1.0/xio-ipapp.h /usr/src/debug/socat/1.8.1.0/xio-netlink.h /usr/src/debug/socat/1.8.1.0/xio-vsock.h /usr/src/debug/socat/1.8.1.0/sycls.c /usr/src/debug/socat/1.8.1.0/utils.c /usr/src/debug/socat/1.8.1.0/xio-ipapp.c /usr/src/debug/socat/1.8.1.0/fdname.c /usr/src/debug/socat/1.8.1.0/sycls.h /usr/src/debug/socat/1.8.1.0/utils.h /usr/src/debug/socat/1.8.1.0/xio-vsock.c /usr/src/debug/socat/1.8.1.0/xio-interface.c /usr/src/debug/socat/1.8.1.0/xiolockfile.c /usr/src/debug/socat/1.8.1.0/xio-interface.h /usr/src/debug/socat/1.8.1.0/xioread.c /usr/src/debug/socat/1.8.1.0/xiolockfile.h /usr/src/debug/socat/1.8.1.0/xio.h /usr/src/debug/socat/1.8.1.0/xio-shell.c /usr/src/debug/socat/1.8.1.0/xio-shell.h /usr/src/debug/socat/1.8.1.0/p
 rocan.h /usr/src/debug/socat/1.8.1.0/xio-rawip.h /usr/src/debug/socat/1.8.1.0/xio-rawip.c /usr/src/debug/socat/1.8.1.0/xio-tcp.h /usr/src/debug/socat/1.8.1.0/xio-readline.c /usr/src/debug/socat/1.8.1.0/xioopen.c /usr/src/debug/socat/1.8.1.0/xio-readline.h /usr/src/debug/socat/1.8.1.0/xio-tcp.c /usr/src/debug/socat/1.8.1.0/xioopen.h /usr/src/debug/socat/1.8.1.0/xio-openssl.c /usr/src/debug/socat/1.8.1.0/xio-udplite.c /usr/src/debug/socat/1.8.1.0/xio-udplite.h /usr/src/debug/socat/1.8.1.0/xio-openssl.h /usr/src/debug/socat/1.8.1.0/xio-progcall.c /usr/src/debug/socat/1.8.1.0/xio-progcall.h /usr/src/debug/socat/1.8.1.0/xiodiag.c /usr/src/debug/socat/1.8.1.0/xio-fdnum.h /usr/src/debug/socat/1.8.1.0/xio-ip6.c /usr/src/debug/socat/1.8.1.0/xio-dccp.c /usr/src/debug/socat/1.8.1.0/xio-dccp.h /usr/src/debug/socat/1.8.1.0/xio-fdnum.c /usr/src/debug/socat/1.8.1.0/xio-ip6.h /usr/src/debug/socat/1.8.1.0/xioshutdown.c /usr/src/debug/socat/1.8.1.0/xio-ip4.c /usr/src/debug/socat/1.8.1.0/xio-ip4.h /us
 r/src/debug/socat/1.8.1.0/xioopts.c /usr/src/debug/socat/1.8.1.0/xioopts.h /usr/src/debug/socat/1.8.1.0/xio-stdio.c /usr/src/debug/socat/1.8.1.0/xio-pipe.h /usr/src/debug/socat/1.8.1.0/xio-pipe.c /usr/src/debug/socat/1.8.1.0/sslcls.h /usr/src/debug/socat/1.8.1.0/xiosignal.c /usr/src/debug/socat/1.8.1.0/sslcls.c /usr/src/debug/socat/1.8.1.0/xio-posixmq.h /usr/src/debug/socat/1.8.1.0/xio-process.h /usr/src/debug/socat/1.8.1.0/xio-fs.h /usr/src/debug/socat/1.8.1.0/xio-fs.c /usr/src/debug/socat/1.8.1.0/xio-socket.h /usr/src/debug/socat/1.8.1.0/xio-socks5.h /usr/src/debug/socat/1.8.1.0/xio-system.h /usr/src/debug/socat/1.8.1.0/xio-socket.c /usr/src/debug/socat/1.8.1.0/xio-socks5.c /usr/src/debug/socat/1.8.1.0/xio-system.c /usr/src/debug/socat/1.8.1.0/xio-named.c /usr/src/debug/socat/1.8.1.0/xio-socks.c /usr/src/debug/socat/1.8.1.0/xio-named.h /usr/src/debug/socat/1.8.1.0/xio-socks.h /usr/src/debug/socat/1.8.1.0/xio-tun.c /usr/src/debug/socat/1.8.1.0/xio-tun.h /usr/src/debug/socat/1.8.1.0
 /xio-ascii.c /usr/src/debug/socat/1.8.1.0/xio-gopen.h /usr/src/debug/socat/1.8.1.0/snprinterr.h /usr/src/debug/socat/1.8.1.0/xio-gopen.c /usr/src/debug/socat/1.8.1.0/procan-cdefs.c /usr/src/debug/socat/1.8.1.0/xio-ascii.h /usr/src/debug/socat/1.8.1.0/snprinterr.c /usr/src/debug/socat/1.8.1.0/compat.h /usr/src/debug/socat/1.8.1.0/xio-exec.h /usr/src/debug/socat/1.8.1.0/xio-socketpair.h /usr/src/debug/socat/1.8.1.0/xiowrite.c /usr/src/debug/socat/1.8.1.0/xio-ip.c /usr/src/debug/socat/1.8.1.0/xio-proxy.c /usr/src/debug/socat/1.8.1.0/xio-socketpair.c /usr/src/debug/socat/1.8.1.0/xio-exec.c /usr/src/debug/socat/1.8.1.0/xio-ip.h /usr/src/debug/socat/1.8.1.0/xio-proxy.h /usr/src/debug/socat/1.8.1.0/procan.c /usr/src/debug/socat/1.8.1.0/xio-netlink.c /usr/src/debug/socat/1.8.1.0/xio-posixmq.c /usr/src/debug/socat/1.8.1.0/xio-process.c /usr/src/debug/socat/1.8.1.0/sysutils.h /usr/src/debug/socat/1.8.1.0/xio-stdio.h /usr/src/debug/socat/1.8.1.0/xio-termios.c /usr/src/debug/socat/1.8.1.0/xiola
 yer.c /usr/src/debug/socat/1.8.1.0/xio-termios.h /usr/src/debug/socat/1.8.1.0/xiolayer.h /usr/src/debug/socat/1.8.1.0/sysutils.c"
packages/x86-64-v3-poky-linux/socat/socat-src: PKGV changed from 1.8.0.3 [default] to 1.8.1.0 [default]
packages/x86-64-v3-poky-linux/socat/socat-staticdev: PV changed from "1.8.0.3" to "1.8.1.0"
packages/x86-64-v3-poky-linux/socat/socat-staticdev: PKGV changed from 1.8.0.3 [default] to 1.8.1.0 [default]
packages/x86-64-v3-poky-linux/socat/socat: PV changed from "1.8.0.3" to "1.8.1.0"
packages/x86-64-v3-poky-linux/socat/socat: PKGSIZE changed from 696489 to 725188 (+4%)
packages/x86-64-v3-poky-linux/socat/socat: PKGV changed from 1.8.0.3 [default] to 1.8.1.0 [default]

--===============0323142339746503476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-d82bbce3b11f59b664d8cf0ddff94b682f7bbbb6"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:d82bbce3b11f59b664d8cf0ddff94b682f7bbbb6"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 139 Local 128 Mirrors 0 Missed 11 Current 187 (92% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 253 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 255 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 259 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe socat-1.8.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe socat-1.8.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 770 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_fetch)
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 261 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 262 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 264 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe socat-1.8.1.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe socat-1.8.1.0-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 771 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_unpack)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 267 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe socat-1.8.1.0-r0: task do_unpack: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 269 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 270 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/openssl/3.5.4/temp/log.do_packagedata_setscene.3508013
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 273 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_package_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe socat-1.8.1.0-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 276 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 279 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running task 777 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe socat-1.8.1.0-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 285 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe socat-1.8.1.0-r0: task do_patch: Succeeded
NOTE: Running task 783 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 784 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_populate_lic)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe socat-1.8.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.8.1.0-r0: task do_populate_lic: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_package_setscene: Started
NOTE: recipe socat-1.8.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_deploy_source_date_epoch unihash changed to eab60a9963c61a95f019238df65e9c75ea52adba87be0ef9a450787d6f5d78fd
NOTE: recipe socat-1.8.1.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_populate_lic unihash changed to 9d75f02ebe0dd87caba08094e9d2959138b98bfd6e2e6ae387edee1e2502d7f7
NOTE: recipe openssl-3.5.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 286 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 292 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 296 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 301 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 308 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 322 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 324 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 943 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata)
NOTE: Running task 944 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.8.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata: Started
NOTE: recipe socat-1.8.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 954 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_configure)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 956 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_collect_spdx_deps)
NOTE: recipe socat-1.8.1.0-r0: task do_configure: Started
NOTE: recipe socat-1.8.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe socat-1.8.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe socat-1.8.1.0-r0: task do_configure: Succeeded
NOTE: Running task 957 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_compile)
NOTE: recipe socat-1.8.1.0-r0: task do_compile: Started
NOTE: recipe socat-1.8.1.0-r0: task do_compile: Succeeded
NOTE: Running task 958 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_install)
NOTE: recipe socat-1.8.1.0-r0: task do_install: Started
NOTE: recipe socat-1.8.1.0-r0: task do_install: Succeeded
NOTE: Running task 959 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_package)
NOTE: Running task 960 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_populate_sysroot)
NOTE: recipe socat-1.8.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe socat-1.8.1.0-r0: task do_package: Started
NOTE: recipe socat-1.8.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_populate_sysroot unihash changed to 2d6318bde73b4213c98283b5b11febc214bf65c804f08005475fb4760cb6b0c9
NOTE: Setscene tasks completed
NOTE: recipe socat-1.8.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_package unihash changed to fc4c97c9b6e422148ae7adf574546a026eb7e195094c4522c80b380c8c5582e6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_package_write_ipk became valid
NOTE: Running setscene task 321 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 322 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_package_write_deb_setscene)
NOTE: recipe socat-1.8.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe socat-1.8.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.8.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe socat-1.8.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe socat-1.8.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.8.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 326 of 326 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_packagedata_setscene)
NOTE: recipe socat-1.8.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.8.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 962 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_create_spdx)
NOTE: Running task 966 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_package_qa)
NOTE: recipe socat-1.8.1.0-r0: task do_create_spdx: Started
NOTE: recipe socat-1.8.1.0-r0: task do_package_qa: Started
NOTE: recipe socat-1.8.1.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 967 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_create_package_spdx)
NOTE: recipe socat-1.8.1.0-r0: task do_create_package_spdx: Started
NOTE: recipe socat-1.8.1.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_package_qa unihash changed to fc22b0ccf9f94d96ea0d0473cc08bb6c6f7db24a9f28d5cb77553bdb3c2c521f
NOTE: recipe socat-1.8.1.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 968 of 968 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.0.bb:do_build)
NOTE: Tasks Summary: Attempted 968 tasks of which 951 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-fips went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0323142339746503476==--

