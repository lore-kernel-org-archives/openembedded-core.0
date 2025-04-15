Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3C4C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:04 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.20167.1744723984429274328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=elQQ2u3K;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=arYSEEpn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019639a73da1-e6ef28fe-fb91-479b-8c38-2cdaeae97d46-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723983;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0Ax70zbB7hSL+4TN8sPzs7Pbe9N/mWwvRzr0S6G+yKM=;
	b=elQQ2u3KOF0vmwxw5LuimpJZ3YgaFgzu7y4eooG66wsE8Gd6rjgim2fU20P675e7
	jYWKAJV1ACZat5F2p3OilD1rcBtmBGdX5+45cIwYSvAUAq/ajMNdOt6nJG/Z7bIHoOO
	abMxb/yGr10PrMxYFJc99KnBEclbiyAl52dddCTA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723983;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0Ax70zbB7hSL+4TN8sPzs7Pbe9N/mWwvRzr0S6G+yKM=;
	b=arYSEEpnLBU9Ud6OYjMojJgc1BhhfmtT8TUmD6RQX6SlkyJjiObl2AS0KGe9lUIG
	ReIhFmiBP/dsDYkucNXIpvNCvUjwbDss++usXgxKdltw8cVkrJsQnrfwZqCsZwL/36z
	34PL468Sw+0uxOD+Ufw/9gDSPFmk876QaRuKTqsM=
Content-Type: multipart/mixed; boundary="===============6964896483625247259=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gzip: upgrading to 1.14 FAILED
Message-ID: <0101019639a73da1-e6ef28fe-fb91-479b-8c38-2cdaeae97d46-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214905

--===============6964896483625247259==
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
From 1ea3054b9fa00a6345a3bc42b93346e26d2584ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 08:57:14 +0000
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
index 7f9e249de8..a381cbfa22 100644
--- a/meta/recipes-extended/gzip/gzip-1.13/wrong-path-fix.patch
+++ b/meta/recipes-extended/gzip/gzip-1.14/wrong-path-fix.patch
@@ -1,4 +1,7 @@
-fix MakeMaker issues with using wrong SHELL/GREP
+From f07fd2a3c8a28f25b5712682a95c8d94e0c8f423 Mon Sep 17 00:00:00 2001
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


--===============6964896483625247259==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-gzip-upgrade-1.13-1.14.patch"

RnJvbSAxZWEzMDU0YjlmYTAwYTYzNDVhM2JjNDJiOTMzNDZlMjZkMjU4NGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDg6NTc6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
emlwOiB1cGdyYWRlIDEuMTMgLT4gMS4xNAoKLS0tCiAuLi4vd3JvbmctcGF0aC1maXgucGF0Y2gg
ICAgICAgICAgICAgICAgICAgICAgfCAxMyArKysrKy0tLS0tCiAuLi4vZ3ppcC97Z3ppcF8xLjEz
LmJiID0+IGd6aXBfMS4xNC5iYn0gICAgICAgfCAyNiArKysrKysrKysrKysrKysrKy0tCiAyIGZp
bGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2d6aXAve2d6aXAtMS4xMyA9PiBnemlwLTEuMTR9L3dyb25nLXBh
dGgtZml4LnBhdGNoICg3NiUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2d6aXAve2d6
aXBfMS4xMy5iYiA9PiBnemlwXzEuMTQuYmJ9ICg1OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2d6aXAvZ3ppcC0xLjEzL3dyb25nLXBhdGgtZml4LnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2d6aXAvZ3ppcC0xLjE0L3dyb25nLXBhdGgtZml4LnBhdGNoCnNpbWls
YXJpdHkgaW5kZXggNzYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9nemlwL2d6
aXAtMS4xMy93cm9uZy1wYXRoLWZpeC5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2d6aXAvZ3ppcC0xLjE0L3dyb25nLXBhdGgtZml4LnBhdGNoCmluZGV4IDdmOWUyNDlkZTgu
LmEzODFjYmZhMjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9nemlwL2d6aXAt
MS4xMy93cm9uZy1wYXRoLWZpeC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3pp
cC9nemlwLTEuMTQvd3JvbmctcGF0aC1maXgucGF0Y2gKQEAgLTEsNCArMSw3IEBACi1maXggTWFr
ZU1ha2VyIGlzc3VlcyB3aXRoIHVzaW5nIHdyb25nIFNIRUxML0dSRVAKK0Zyb20gZjA3ZmQyYTNj
OGEyOGYyNWI1NzEyNjgyYTk1YzhkOTRlMGM4ZjQyMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb206IE1pbmcgTGl1IDxtaW5nLmxpdUB3aW5kcml2ZXIuY29tPgorRGF0ZTogRnJpLCAyMSBO
b3YgMjAxNCAwNDo1MDo1NyAtMDUwMAorU3ViamVjdDogW1BBVENIXSBmaXggTWFrZU1ha2VyIGlz
c3VlcyB3aXRoIHVzaW5nIHdyb25nIFNIRUxML0dSRVAKIAogQSBzZXQgb2Ygc3Vic3RpdHV0aW9u
IGlzIGJlaW5nIHByb2Nlc3NlZCB0byBhbGwgdGFyZ2V0IHNjcmlwdHMgd2l0aCBzZWQgYnkKIHJl
cGxhY2luZyBzb21lIGtleSB3b3JkcyB3aXRoIHRoZSBkZXRlY3RlZCB2YWx1ZXMgYXQgY29uZmln
dXJlIHRpbWUsIHRoaXMKQEAgLTEyLDE2ICsxNSwxNSBAQCBpbnN0ZWFkLgogU2lnbmVkLW9mZi1i
eTogTWluZyBMaXUgPG1pbmcubGl1QHdpbmRyaXZlci5jb20+CiAKIFVwc3RyZWFtLVN0YXR1czog
UGVuZGluZwotCiAtLS0KICBNYWtlZmlsZS5hbSB8IDMgKy0tCiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuYW0g
Yi9NYWtlZmlsZS5hbQotaW5kZXggNGY1MWI2MS4uODBhNWRkZiAxMDA2NDQKK2luZGV4IDIzZTBk
M2UuLjM0NTU4NzggMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5hbQogKysrIGIvTWFrZWZpbGUuYW0K
LUBAIC05Myw4ICs5Myw3IEBAIFNVRkZJWEVTID0gLmluCitAQCAtOTUsOCArOTUsNyBAQCBTVUZG
SVhFUyA9IC5pbgogIC5pbjoKICAJJChBTV9WX0dFTilybSAtZiAkQC10ICRAIFwKICAJICAmJiBz
ZWQgXApAQCAtMzEsNiArMzMsMyBAQCBpbmRleCA0ZjUxYjYxLi44MGE1ZGRmIDEwMDY0NAogIAkJ
LWUgInN8J2d6aXAnfCQoR1pJUF9UUkFOU0ZPUk1FRCl8ZyIgXAogIAkJLWUgInN8J3pkaWZmJ3wk
KFpESUZGX1RSQU5TRk9STUVEKXxnIiBcCiAgCQktZSAic3wnemdyZXAnfCQoWkdSRVBfVFJBTlNG
T1JNRUQpfGciIFwKLS0tCi0yLjcuNAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZ3ppcC9nemlwXzEuMTMuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3ppcC9nemlwXzEu
MTQuYmIKc2ltaWxhcml0eSBpbmRleCA1OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2d6aXAvZ3ppcF8xLjEzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3pp
cC9nemlwXzEuMTQuYmIKaW5kZXggZmQ4NDZiMzBhNS4uMWYzZDJmNTg4ZiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2d6aXAvZ3ppcF8xLjEzLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9nemlwL2d6aXBfMS4xNC5iYgpAQCAtMSwzICsxLDI0IEBACisjIEZJWE1FOiB0
aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wg
dXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUg
b2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5T
RSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNv
bW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGlj
ZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2Vz
OgorIworIyAtLS0gZ3ppcC5oCisjICsrKyBnemlwLmgKKyMgQEAgLTksNSArOSw1IEBACisjICAg
ICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAgCisjICAg
ICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZQorIyAtICAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUg
dG8gdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwKKyMgLSAgIEluYy4sIDUxIEZyYW5rbGlu
IFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSwgVVNBLiAgKi8KKyMg
KyAgIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtLiAgSWYgbm90LCBzZWUgPGh0dHBzOi8vd3d3Lmdu
dS5vcmcvbGljZW5zZXMvPi4gICovCisjICsKKyMgCisjCisKIHJlcXVpcmUgZ3ppcC5pbmMKIAog
IyBjaGFuZ2UgdG8gR1BMLTMuMC1vci1sYXRlciBpbiAyMDA3LzA3LiBQcmV2aW91cyBHUEwtMi4w
LW9yLWxhdGVyIHZlcnNpb24gaXMKQEAgLTEwLDcgKzMxLDggQEAgU1JDX1VSSSA9ICIke0dOVV9N
SVJST1J9L2d6aXAvJHtCUH0udGFyLmd6IFwKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLXRhcmdldCA9
ICIgZmlsZTovL3dyb25nLXBhdGgtZml4LnBhdGNoIgogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT0xZWJiZDNlMzQyMzdhZjI2ZGE1ZGMwOGE0ZTQ0MDQ2NCBcCi0gICAg
ICAgICAgICAgICAgICAgIGZpbGU6Ly9nemlwLmg7YmVnaW5saW5lPTg7ZW5kbGluZT0yMDttZDU9
NmU0N2NhYWE2MzBlMGM4YmY5ZjFiYzhkOTRhOGVkMGUiCisgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9nemlwLmg7YmVnaW5saW5lPTg7ZW5kbGluZT0yMDttZDU9YTIyMTU4ZGMzZGQzZjVjZjZl
NWE1NTY5NDBhNDkyMTIgXAorICAgICAgICAgICAgICAgICAgICAiCiAKIFBST1ZJREVTOmFwcGVu
ZDpjbGFzcy1uYXRpdmUgPSAiIGd6aXAtcmVwbGFjZW1lbnQtbmF0aXZlIgogCkBAIC0zOCw0ICs2
MCw0IEBAIGRvX2luc3RhbGxfcHRlc3QoKSB7CiAgICAgICAgICAgICAke0J9L3Rlc3RzL01ha2Vm
aWxlID4gJHtEfSR7UFRFU1RfUEFUSH0vc3JjL3Rlc3RzL01ha2VmaWxlCiB9CiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICIyMGZjODE4YWVlYmFlODdjZGJmMjA5ZDM1MTQxYWQ5ZDNjZjMxMmIzNWE1
ZTZiZTYxYmZjZmJmOWVkZGQyMTJhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYxM2Q2ZWE0NGYx
MjQ4ZDczNzBjN2NjZGVlZTBkZDAwMTdhMDllNmMzOWRlODk0YjNjNmYwM2Y5ODExOTFjNmIiCi0t
IAoyLjQ3LjEKCg==

--===============6964896483625247259==
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
workspace            = "tmp-auh-upgrades:45429b61da3528b56307c27fb3350f9d26a7dd02"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 348 Local 336 Mirrors 0 Missed 12 Current 387 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1322 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_recipe_qa)
NOTE: recipe gzip-1.14-r0: task do_recipe_qa: Started
NOTE: recipe gzip-1.14-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1796 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_fetch)
NOTE: recipe gzip-1.14-r0: task do_fetch: Started
NOTE: recipe gzip-1.14-r0: task do_fetch: Succeeded
NOTE: Running task 1976 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_unpack)
NOTE: Running task 1977 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.14-r0: task do_unpack: Started
NOTE: recipe gzip-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gzip-1.14-r0: task do_unpack: Succeeded
NOTE: Running task 2043 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_patch)
NOTE: Running task 2044 of 2062 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.14-r0: task do_patch: Started
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
NOTE: recipe gzip-1.14-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gzip-1.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gzip-1.14-r0: task do_package_write_deb: Succeeded
NOTE: recipe gzip-1.14-r0: task do_package_qa: Failed
NOTE: Tasks Summary: Attempted 2061 tasks of which 2038 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415085636.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415085636.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gzip/1.14/temp/log.do_package_qa.493120
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gzip-1.14-r0 do_package_qa: QA Issue: File /usr/lib/gzip/ptest/src/tests/Makefile in package gzip-ptest contains reference to TMPDIR [buildpaths]
ERROR: gzip-1.14-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gzip/1.14/temp/log.do_package_qa.493120
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.14.bb:do_package_qa) failed with exit code '1'

--===============6964896483625247259==--

