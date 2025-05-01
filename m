Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15649C54E90
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:57 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1771.1746113606695801833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZebeNWek;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ADHc1QOg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101968c7b8bf6-f4cef319-e7af-47ae-b49a-9eb3b1b96896-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113629;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G4vLjK91UUWDta4NbQL8SaewPnfuJ54rwUg2KteGbHM=;
	b=ZebeNWek3pBRDAwFo1QB81Di1E0RvDl4k7mfcqCd/ho7sWAbhgUmhGVjDDE6nDWC
	Oxs6v8CgKDooaeKDZZkRLXKX3f/vbXGBvJylv7R9pKzz0vueaYzduKsdhb1lIT8Yw2j
	/kU0QCvbsBxqujjg/9pMlmnHEvJ1qsPISR26rGYc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113629;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G4vLjK91UUWDta4NbQL8SaewPnfuJ54rwUg2KteGbHM=;
	b=ADHc1QOgJdnBpRMnFY7/TADuHLReBbedJojU3v//MjBNYmo41tAFvOBnYamffkv1
	SiFW13JJcYs7guBL8kiFx7jC7DhMm5RdJ0EBivYhyZVJzUaH353BKPxZdTcZwXlacGk
	E9RA2D4o2ZYAAObqyhGAUYl3G9XdIzOCmMvLF7pY=
Content-Type: multipart/mixed; boundary="===============6788696630017039254=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gzip: upgrading to 1.14 FAILED
Message-ID: <010101968c7b8bf6-f4cef319-e7af-47ae-b49a-9eb3b1b96896-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215851

--===============6788696630017039254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gzip* to *1.14* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gzip-upgrade-1.13-1.14.patch
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
From c5f777d4f0fd4f78a8877cc6df1627a0bcd41370 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 10:50:05 +0000
Subject: [PATCH] gzip: upgrade 1.13 -> 1.14

---
 .../wrong-path-fix.patch                      | 13 +++++-----
 .../gzip/{gzip_1.13.bb => gzip_1.14.bb}       | 26 +++++++++++++++++--
 2 files changed, 30 insertions(+), 9 deletions(-)
 rename meta/recipes-extended/gzip/{gzip-1.13 => gzip-1.14}/wrong-path-fix.patch (76%)
 rename meta/recipes-extended/gzip/{gzip_1.13.bb => gzip_1.14.bb} (58%)

diff --git a/meta/recipes-extended/gzip/gzip-1.13/wrong-path-fix.patch b/meta/recipes-extended/gzip/gzip-1.14/wrong-path-fix.patch
similarity index 76%
rename from meta/recipes-extended/gzip/gzip-1.13/wrong-path-fix.patch
rename to meta/recipes-extended/gzip/gzip-1.14/wrong-path-fix.patch
index 7f9e249de8..0684ffeadb 100644
--- a/meta/recipes-extended/gzip/gzip-1.13/wrong-path-fix.patch
+++ b/meta/recipes-extended/gzip/gzip-1.14/wrong-path-fix.patch
@@ -1,4 +1,7 @@
-fix MakeMaker issues with using wrong SHELL/GREP
+From b5f3980808d4d6d7d27ec0452584e674576f7a7e Mon Sep 17 00:00:00 2001
+From: Ming Liu <ming.liu@windriver.com>
+Date: Fri, 21 Nov 2014 04:50:57 -0500
+Subject: [PATCH] fix MakeMaker issues with using wrong SHELL/GREP
 
 A set of substitution is being processed to all target scripts with sed by
 replacing some key words with the detected values at configure time, this
@@ -12,16 +15,15 @@ instead.
 Signed-off-by: Ming Liu <ming.liu@windriver.com>
 
 Upstream-Status: Pending
-
 ---
  Makefile.am | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 4f51b61..80a5ddf 100644
+index 23e0d3e..3455878 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -93,8 +93,7 @@ SUFFIXES = .in
+@@ -95,8 +95,7 @@ SUFFIXES = .in
  .in:
  	$(AM_V_GEN)rm -f $@-t $@ \
  	  && sed \
@@ -31,6 +33,3 @@ index 4f51b61..80a5ddf 100644
  		-e "s|'gzip'|$(GZIP_TRANSFORMED)|g" \
  		-e "s|'zdiff'|$(ZDIFF_TRANSFORMED)|g" \
  		-e "s|'zgrep'|$(ZGREP_TRANSFORMED)|g" \
---
-2.7.4
-
diff --git a/meta/recipes-extended/gzip/gzip_1.13.bb b/meta/recipes-extended/gzip/gzip_1.14.bb
similarity index 58%
rename from meta/recipes-extended/gzip/gzip_1.13.bb
rename to meta/recipes-extended/gzip/gzip_1.14.bb
index fd846b30a5..1f3d2f588f 100644
--- a/meta/recipes-extended/gzip/gzip_1.13.bb
+++ b/meta/recipes-extended/gzip/gzip_1.14.bb
@@ -1,3 +1,24 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- gzip.h
+# +++ gzip.h
+# @@ -9,5 +9,5 @@
+#     GNU General Public License for more details.
+#  
+#     You should have received a copy of the GNU General Public License
+# -   along with this program; if not, write to the Free Software Foundation,
+# -   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  */
+# +   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */
+# +
+# 
+#
+
 require gzip.inc
 
 # change to GPL-3.0-or-later in 2007/07. Previous GPL-2.0-or-later version is
@@ -10,7 +31,8 @@ SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
 SRC_URI:append:class-target = " file://wrong-path-fix.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://gzip.h;beginline=8;endline=20;md5=6e47caaa630e0c8bf9f1bc8d94a8ed0e"
+                    file://gzip.h;beginline=8;endline=20;md5=a22158dc3dd3f5cf6e5a556940a49212 \
+                    "
 
 PROVIDES:append:class-native = " gzip-replacement-native"
 
@@ -38,4 +60,4 @@ do_install_ptest() {
             ${B}/tests/Makefile > ${D}${PTEST_PATH}/src/tests/Makefile
 }
 
-SRC_URI[sha256sum] = "20fc818aeebae87cdbf209d35141ad9d3cf312b35a5e6be61bfcfbf9eddd212a"
+SRC_URI[sha256sum] = "613d6ea44f1248d7370c7ccdeee0dd0017a09e6c39de894b3c6f03f981191c6b"
-- 
2.47.1


--===============6788696630017039254==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-gzip-upgrade-1.13-1.14.patch"

RnJvbSBjNWY3NzdkNGYwZmQ0Zjc4YTg4NzdjYzZkZjE2MjdhMGJjZDQxMzcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMDo1MDowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd6
aXA6IHVwZ3JhZGUgMS4xMyAtPiAxLjE0CgotLS0KIC4uLi93cm9uZy1wYXRoLWZpeC5wYXRjaCAg
ICAgICAgICAgICAgICAgICAgICB8IDEzICsrKysrLS0tLS0KIC4uLi9nemlwL3tnemlwXzEuMTMu
YmIgPT4gZ3ppcF8xLjE0LmJifSAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvZ3ppcC97Z3ppcC0xLjEzID0+IGd6aXAtMS4xNH0vd3JvbmctcGF0
aC1maXgucGF0Y2ggKDc2JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3ppcC97Z3pp
cF8xLjEzLmJiID0+IGd6aXBfMS4xNC5iYn0gKDU4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZ3ppcC9nemlwLTEuMTMvd3JvbmctcGF0aC1maXgucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvZ3ppcC9nemlwLTEuMTQvd3JvbmctcGF0aC1maXgucGF0Y2gKc2ltaWxh
cml0eSBpbmRleCA3NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2d6aXAvZ3pp
cC0xLjEzL3dyb25nLXBhdGgtZml4LnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZ3ppcC9nemlwLTEuMTQvd3JvbmctcGF0aC1maXgucGF0Y2gKaW5kZXggN2Y5ZTI0OWRlOC4u
MDY4NGZmZWFkYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2d6aXAvZ3ppcC0x
LjEzL3dyb25nLXBhdGgtZml4LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9nemlw
L2d6aXAtMS4xNC93cm9uZy1wYXRoLWZpeC5wYXRjaApAQCAtMSw0ICsxLDcgQEAKLWZpeCBNYWtl
TWFrZXIgaXNzdWVzIHdpdGggdXNpbmcgd3JvbmcgU0hFTEwvR1JFUAorRnJvbSBiNWYzOTgwODA4
ZDRkNmQ3ZDI3ZWMwNDUyNTg0ZTY3NDU3NmY3YTdlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbTogTWluZyBMaXUgPG1pbmcubGl1QHdpbmRyaXZlci5jb20+CitEYXRlOiBGcmksIDIxIE5v
diAyMDE0IDA0OjUwOjU3IC0wNTAwCitTdWJqZWN0OiBbUEFUQ0hdIGZpeCBNYWtlTWFrZXIgaXNz
dWVzIHdpdGggdXNpbmcgd3JvbmcgU0hFTEwvR1JFUAogCiBBIHNldCBvZiBzdWJzdGl0dXRpb24g
aXMgYmVpbmcgcHJvY2Vzc2VkIHRvIGFsbCB0YXJnZXQgc2NyaXB0cyB3aXRoIHNlZCBieQogcmVw
bGFjaW5nIHNvbWUga2V5IHdvcmRzIHdpdGggdGhlIGRldGVjdGVkIHZhbHVlcyBhdCBjb25maWd1
cmUgdGltZSwgdGhpcwpAQCAtMTIsMTYgKzE1LDE1IEBAIGluc3RlYWQuCiBTaWduZWQtb2ZmLWJ5
OiBNaW5nIExpdSA8bWluZy5saXVAd2luZHJpdmVyLmNvbT4KIAogVXBzdHJlYW0tU3RhdHVzOiBQ
ZW5kaW5nCi0KIC0tLQogIE1ha2VmaWxlLmFtIHwgMyArLS0KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBi
L01ha2VmaWxlLmFtCi1pbmRleCA0ZjUxYjYxLi44MGE1ZGRmIDEwMDY0NAoraW5kZXggMjNlMGQz
ZS4uMzQ1NTg3OCAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLmFtCiArKysgYi9NYWtlZmlsZS5hbQot
QEAgLTkzLDggKzkzLDcgQEAgU1VGRklYRVMgPSAuaW4KK0BAIC05NSw4ICs5NSw3IEBAIFNVRkZJ
WEVTID0gLmluCiAgLmluOgogIAkkKEFNX1ZfR0VOKXJtIC1mICRALXQgJEAgXAogIAkgICYmIHNl
ZCBcCkBAIC0zMSw2ICszMywzIEBAIGluZGV4IDRmNTFiNjEuLjgwYTVkZGYgMTAwNjQ0CiAgCQkt
ZSAic3wnZ3ppcCd8JChHWklQX1RSQU5TRk9STUVEKXxnIiBcCiAgCQktZSAic3wnemRpZmYnfCQo
WkRJRkZfVFJBTlNGT1JNRUQpfGciIFwKICAJCS1lICJzfCd6Z3JlcCd8JChaR1JFUF9UUkFOU0ZP
Uk1FRCl8ZyIgXAotLS0KLTIuNy40Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9nemlwL2d6aXBfMS4xMy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9nemlwL2d6aXBfMS4x
NC5iYgpzaW1pbGFyaXR5IGluZGV4IDU4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZ3ppcC9nemlwXzEuMTMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9nemlw
L2d6aXBfMS4xNC5iYgppbmRleCBmZDg0NmIzMGE1Li4xZjNkMmY1ODhmIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3ppcC9nemlwXzEuMTMuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2d6aXAvZ3ppcF8xLjE0LmJiCkBAIC0xLDMgKzEsMjQgQEAKKyMgRklYTUU6IHRo
ZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1
cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBv
bGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNF
IHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29t
bWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNl
bnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6
CisjCisjIC0tLSBnemlwLmgKKyMgKysrIGd6aXAuaAorIyBAQCAtOSw1ICs5LDUgQEAKKyMgICAg
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisjICAKKyMgICAg
IFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlCisjIC0gICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0
byB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLAorIyAtICAgSW5jLiwgNTEgRnJhbmtsaW4g
U3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxLCBVU0EuICAqLworIyAr
ICAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uICBJZiBub3QsIHNlZSA8aHR0cHM6Ly93d3cuZ251
Lm9yZy9saWNlbnNlcy8+LiAgKi8KKyMgKworIyAKKyMKKwogcmVxdWlyZSBnemlwLmluYwogCiAj
IGNoYW5nZSB0byBHUEwtMy4wLW9yLWxhdGVyIGluIDIwMDcvMDcuIFByZXZpb3VzIEdQTC0yLjAt
b3ItbGF0ZXIgdmVyc2lvbiBpcwpAQCAtMTAsNyArMzEsOCBAQCBTUkNfVVJJID0gIiR7R05VX01J
UlJPUn0vZ3ppcC8ke0JQfS50YXIuZ3ogXAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0g
IiBmaWxlOi8vd3JvbmctcGF0aC1maXgucGF0Y2giCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0NPUFlJTkc7bWQ1PTFlYmJkM2UzNDIzN2FmMjZkYTVkYzA4YTRlNDQwNDY0IFwKLSAgICAg
ICAgICAgICAgICAgICAgZmlsZTovL2d6aXAuaDtiZWdpbmxpbmU9ODtlbmRsaW5lPTIwO21kNT02
ZTQ3Y2FhYTYzMGUwYzhiZjlmMWJjOGQ5NGE4ZWQwZSIKKyAgICAgICAgICAgICAgICAgICAgZmls
ZTovL2d6aXAuaDtiZWdpbmxpbmU9ODtlbmRsaW5lPTIwO21kNT1hMjIxNThkYzNkZDNmNWNmNmU1
YTU1Njk0MGE0OTIxMiBcCisgICAgICAgICAgICAgICAgICAgICIKIAogUFJPVklERVM6YXBwZW5k
OmNsYXNzLW5hdGl2ZSA9ICIgZ3ppcC1yZXBsYWNlbWVudC1uYXRpdmUiCiAKQEAgLTM4LDQgKzYw
LDQgQEAgZG9faW5zdGFsbF9wdGVzdCgpIHsKICAgICAgICAgICAgICR7Qn0vdGVzdHMvTWFrZWZp
bGUgPiAke0R9JHtQVEVTVF9QQVRIfS9zcmMvdGVzdHMvTWFrZWZpbGUKIH0KIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjIwZmM4MThhZWViYWU4N2NkYmYyMDlkMzUxNDFhZDlkM2NmMzEyYjM1YTVl
NmJlNjFiZmNmYmY5ZWRkZDIxMmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjEzZDZlYTQ0ZjEy
NDhkNzM3MGM3Y2NkZWVlMGRkMDAxN2EwOWU2YzM5ZGU4OTRiM2M2ZjAzZjk4MTE5MWM2YiIKLS0g
CjIuNDcuMQoK

--===============6788696630017039254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1899 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (927 cached, 1 parsed). 1897 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:702d291d8672d210e1c52585361c231eea51f9ac"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 345 Local 334 Mirrors 0 Missed 11 Current 390 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 620 of 735 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe gzip-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1323 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_fetch)
NOTE: recipe gzip-1.14-r0: task do_fetch: Started
NOTE: recipe gzip-1.14-r0: task do_fetch: Succeeded
NOTE: Running task 1516 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_unpack)
NOTE: Running task 1517 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.14-r0: task do_unpack: Started
NOTE: recipe gzip-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gzip-1.14-r0: task do_unpack: Succeeded
NOTE: Running task 1783 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_patch)
NOTE: recipe gzip-1.14-r0: task do_patch: Started
NOTE: Running task 1981 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe gzip-1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gzip-1.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gzip-1.14-r0: task do_patch: Succeeded
NOTE: Running task 2045 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2046 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_populate_lic)
NOTE: recipe gzip-1.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gzip-1.14-r0: task do_populate_lic: Started
NOTE: recipe gzip-1.14-r0: task do_populate_lic: Succeeded
NOTE: recipe gzip-1.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_deploy_source_date_epoch unihash changed to 1e40b710a15b14108bd215d732c0c028aabb1dcdd82e4ffa9af61ded5fade124
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_populate_lic unihash changed to 790ede3dd903b95ae0dc2cb32e3f095b2b92b159e47d2d5fb559a4f10d410b87
NOTE: Setscene tasks completed
NOTE: Running task 2047 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_configure)
NOTE: recipe gzip-1.14-r0: task do_configure: Started
NOTE: recipe gzip-1.14-r0: task do_configure: Succeeded
NOTE: Running task 2048 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_configure_ptest_base)
NOTE: recipe gzip-1.14-r0: task do_configure_ptest_base: Started
NOTE: recipe gzip-1.14-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2049 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_compile)
NOTE: recipe gzip-1.14-r0: task do_compile: Started
NOTE: recipe gzip-1.14-r0: task do_compile: Succeeded
NOTE: Running task 2050 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_compile_ptest_base)
NOTE: recipe gzip-1.14-r0: task do_compile_ptest_base: Started
NOTE: recipe gzip-1.14-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2051 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_install)
NOTE: recipe gzip-1.14-r0: task do_install: Started
NOTE: recipe gzip-1.14-r0: task do_install: Succeeded
NOTE: Running task 2052 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_install_ptest_base)
NOTE: recipe gzip-1.14-r0: task do_install_ptest_base: Started
NOTE: recipe gzip-1.14-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2053 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package)
NOTE: Running task 2054 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_populate_sysroot)
NOTE: recipe gzip-1.14-r0: task do_populate_sysroot: Started
NOTE: recipe gzip-1.14-r0: task do_package: Started
NOTE: recipe gzip-1.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_populate_sysroot unihash changed to 6fbfe6123cd01897f48db073c855fa106b2e391984c8a7084e54130ab11f4e5e
NOTE: Setscene tasks completed
NOTE: recipe gzip-1.14-r0: task do_package: Succeeded
NOTE: Running task 2055 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_packagedata)
NOTE: recipe gzip-1.14-r0: task do_packagedata: Started
NOTE: recipe gzip-1.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2056 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_create_spdx)
NOTE: Running task 2057 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_write_ipk)
NOTE: Running task 2058 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_write_deb)
NOTE: Running task 2059 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_write_rpm)
NOTE: Running task 2060 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_qa)
NOTE: recipe gzip-1.14-r0: task do_create_spdx: Started
NOTE: recipe gzip-1.14-r0: task do_package_write_ipk: Started
NOTE: recipe gzip-1.14-r0: task do_package_write_deb: Started
NOTE: recipe gzip-1.14-r0: task do_package_write_rpm: Started
NOTE: recipe gzip-1.14-r0: task do_package_qa: Started
NOTE: recipe gzip-1.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2061 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_create_package_spdx)
NOTE: recipe gzip-1.14-r0: task do_create_package_spdx: Started
NOTE: recipe gzip-1.14-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gzip-1.14-r0: task do_package_write_deb: Succeeded
NOTE: recipe gzip-1.14-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gzip-1.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gzip-1.14-r0: task do_package_qa: Failed
NOTE: Tasks Summary: Attempted 2061 tasks of which 2039 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501104927.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501104927.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gzip/1.14/temp/log.do_package_qa.2000806
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gzip-1.14-r0 do_package_qa: QA Issue: File /usr/lib/gzip/ptest/src/tests/Makefile in package gzip-ptest contains reference to TMPDIR [buildpaths]
ERROR: gzip-1.14-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gzip/1.14/temp/log.do_package_qa.2000806
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_qa) failed with exit code '1'

--===============6788696630017039254==--

