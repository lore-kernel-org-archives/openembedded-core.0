Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01097C54F58
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:11 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.14613.1700059029150162965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=X/H5KoCM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=h2cUlEtH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018bd36a1ad6-e8f7b68c-22b6-4c69-9e2a-4c8708475358-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fUsVfuPa25SrVKDtOJ3ytyMmbRMjqPSQF2OcDsWWrFc=;
	b=X/H5KoCMlRZg0rt+KRkRDC+wzkXV+7KpV1iMP8fPpqzbjsLCvYkFlEUh1a5V9GbQ
	UfX0hsT+CZTGljgGpo7V7tlF/bfCdLOHk7/Rqn5Z2p7vptkGezBDl6x1nHkLih3FiYo
	KJ+nDVpEtFVUdTrcpO+ZSr/P/l74xqGild+9/ELA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fUsVfuPa25SrVKDtOJ3ytyMmbRMjqPSQF2OcDsWWrFc=;
	b=h2cUlEtHJ0IpasGdnRmMJa8qCobsgi0UYpgRw3FfDYLVj7x1p82woJ3pUi4Kp/Lx
	iUU1iVXuRgI822l3aRNxK5XSyhltT5cerQGMRxLZeIpMX6I2HSXCThWuh4c3BzKyOmX
	RKcgF7fxT5Ok+NEgD/Z74ATVmxxe1OOO3tamPdc0=
Content-Type: multipart/mixed; boundary="===============0869857507259189913=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] socat: upgrading to 1.8.0.0 FAILED
Message-ID: <0101018bd36a1ad6-e8f7b68c-22b6-4c69-9e2a-4c8708475358-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190618

--===============0869857507259189913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *socat* to *1.8.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-socat-upgrade-1.7.4.4-1.8.0.0.patch
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
From a195571128a9d11e5bc87e09f32c1fe9a90be43a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 05:18:06 +0000
Subject: [PATCH] socat: upgrade 1.7.4.4 -> 1.8.0.0

---
 .../{socat_1.7.4.4.bb => socat_1.8.0.0.bb}    | 70 ++++++++++++++++++-
 1 file changed, 68 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.7.4.4.bb => socat_1.8.0.0.bb} (40%)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
similarity index 40%
rename from meta/recipes-connectivity/socat/socat_1.7.4.4.bb
rename to meta/recipes-connectivity/socat/socat_1.8.0.0.bb
index 5a379380d1..b7654e0cac 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
@@ -1,3 +1,68 @@
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
+# @@ -1,25 +1,3 @@
+# -smoothly also under RedHat Linux. After yodl 1.31 installation, the following
+# -correction must be performed in /usr/share/yodl/shared.yo in two places:
+# -< whenhtml(htmlcommand(<!)ARG1+htmlcommand(>)))
+# -> whenhtml(htmlcommand(<!--)ARG1+htmlcommand(-->)))
+# -
+# -
+# -license
+# --------
+# -
+# -socat is distributed under the terms of the GNU GPLv2;
+# -except for install-sh, which is copyright MIT, with its own license;
+# -
+# -In addition, as a special exception, the copyright holder
+# -gives permission to link the code of this program with
+# -any version of the OpenSSL library which is distributed
+# -under a license identical to that listed in the included
+# -COPYING.OpenSSL file, and distribute linked combinations
+# -including the two. You must obey the GNU General Public
+# -License in all respects for all of the code used other
+# -than OpenSSL. If you modify this file, you may extend this
+# -exception to your version of the file, but you are not
+# -obligated to do so. If you do not wish to do so, delete
+#  this exception statement from your version.
+#  
+#  
+# @@ -29,3 +7,25 @@
+#  
+#      This program is distributed in the hope that it will be useful,
+#      but WITHOUT ANY WARRANTY; without even the implied warranty of
+# +    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# +    GNU General Public License for more details.
+# +
+# +    You should have received a copy of the GNU General Public License
+# +    along with this program; if not, write to the Free Software
+# +    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+# +
+# +
+# +contact
+# +-------
+# +
+# +For questions, bug reports, ideas, contributions etc. please contact
+# +socat@dest-unreach.org
+# +
+# +For socat source distribution, bug fixes, and latest news see
+# +        http://www.dest-unreach.org/socat/
+# +
+# +www.socat.org is an alternate site providing the same contents.
+# +
+# +public git repository:
+# +	git://repo.or.cz/socat.git
+# +	http://repo.or.cz/socat.git
+# 
+#
+
 SUMMARY = "Multipurpose relay for bidirectional data transfer"
 DESCRIPTION = "Socat is a relay for bidirectional data \
 transfer between two independent data channels."
@@ -7,11 +72,12 @@ SECTION = "console/network"
 
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
+                    file://README;beginline=257;endline=287;md5=50ddb8f6b31e128a75c3b6e972b7b6ba \
+                    "
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "fbd42bd2f0e54a3af6d01bdf15385384ab82dbc0e4f1a5e153b3e0be1b6380ac"
+SRC_URI[sha256sum] = "e1de683dd22ee0e3a6c6bbff269abe18ab0c9d7eb650204f125155b9005faca7"
 
 inherit autotools
 
-- 
2.39.2


--===============0869857507259189913==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-socat-upgrade-1.7.4.4-1.8.0.0.patch"

RnJvbSBhMTk1NTcxMTI4YTlkMTFlNWJjODdlMDlmMzJjMWZlOWE5MGJlNDNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDU6MTg6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
b2NhdDogdXBncmFkZSAxLjcuNC40IC0+IDEuOC4wLjAKCi0tLQogLi4uL3tzb2NhdF8xLjcuNC40
LmJiID0+IHNvY2F0XzEuOC4wLjAuYmJ9ICAgIHwgNzAgKysrKysrKysrKysrKysrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zb2NhdC97c29jYXRfMS43LjQuNC5iYiA9PiBzb2NhdF8x
LjguMC4wLmJifSAoNDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
c29jYXQvc29jYXRfMS43LjQuNC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc29jYXQv
c29jYXRfMS44LjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDQwJQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L3NvY2F0L3NvY2F0XzEuNy40LjQuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvc29jYXQvc29jYXRfMS44LjAuMC5iYgppbmRleCA1YTM3OTM4
MGQxLi5iNzY1NGUwY2FjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Nv
Y2F0L3NvY2F0XzEuNy40LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zb2Nh
dC9zb2NhdF8xLjguMC4wLmJiCkBAIC0xLDMgKzEsNjggQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBSRUFETUUKKyMgKysrIFJFQURNRQorIyBAQCAtMSwyNSArMSwzIEBACisjIC1zbW9vdGhseSBh
bHNvIHVuZGVyIFJlZEhhdCBMaW51eC4gQWZ0ZXIgeW9kbCAxLjMxIGluc3RhbGxhdGlvbiwgdGhl
IGZvbGxvd2luZworIyAtY29ycmVjdGlvbiBtdXN0IGJlIHBlcmZvcm1lZCBpbiAvdXNyL3NoYXJl
L3lvZGwvc2hhcmVkLnlvIGluIHR3byBwbGFjZXM6CisjIC08IHdoZW5odG1sKGh0bWxjb21tYW5k
KDwhKUFSRzEraHRtbGNvbW1hbmQoPikpKQorIyAtPiB3aGVuaHRtbChodG1sY29tbWFuZCg8IS0t
KUFSRzEraHRtbGNvbW1hbmQoLS0+KSkpCisjIC0KKyMgLQorIyAtbGljZW5zZQorIyAtLS0tLS0t
LQorIyAtCisjIC1zb2NhdCBpcyBkaXN0cmlidXRlZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdO
VSBHUEx2MjsKKyMgLWV4Y2VwdCBmb3IgaW5zdGFsbC1zaCwgd2hpY2ggaXMgY29weXJpZ2h0IE1J
VCwgd2l0aCBpdHMgb3duIGxpY2Vuc2U7CisjIC0KKyMgLUluIGFkZGl0aW9uLCBhcyBhIHNwZWNp
YWwgZXhjZXB0aW9uLCB0aGUgY29weXJpZ2h0IGhvbGRlcgorIyAtZ2l2ZXMgcGVybWlzc2lvbiB0
byBsaW5rIHRoZSBjb2RlIG9mIHRoaXMgcHJvZ3JhbSB3aXRoCisjIC1hbnkgdmVyc2lvbiBvZiB0
aGUgT3BlblNTTCBsaWJyYXJ5IHdoaWNoIGlzIGRpc3RyaWJ1dGVkCisjIC11bmRlciBhIGxpY2Vu
c2UgaWRlbnRpY2FsIHRvIHRoYXQgbGlzdGVkIGluIHRoZSBpbmNsdWRlZAorIyAtQ09QWUlORy5P
cGVuU1NMIGZpbGUsIGFuZCBkaXN0cmlidXRlIGxpbmtlZCBjb21iaW5hdGlvbnMKKyMgLWluY2x1
ZGluZyB0aGUgdHdvLiBZb3UgbXVzdCBvYmV5IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKKyMgLUxp
Y2Vuc2UgaW4gYWxsIHJlc3BlY3RzIGZvciBhbGwgb2YgdGhlIGNvZGUgdXNlZCBvdGhlcgorIyAt
dGhhbiBPcGVuU1NMLiBJZiB5b3UgbW9kaWZ5IHRoaXMgZmlsZSwgeW91IG1heSBleHRlbmQgdGhp
cworIyAtZXhjZXB0aW9uIHRvIHlvdXIgdmVyc2lvbiBvZiB0aGUgZmlsZSwgYnV0IHlvdSBhcmUg
bm90CisjIC1vYmxpZ2F0ZWQgdG8gZG8gc28uIElmIHlvdSBkbyBub3Qgd2lzaCB0byBkbyBzbywg
ZGVsZXRlCisjICB0aGlzIGV4Y2VwdGlvbiBzdGF0ZW1lbnQgZnJvbSB5b3VyIHZlcnNpb24uCisj
ICAKKyMgIAorIyBAQCAtMjksMyArNywyNSBAQAorIyAgCisjICAgICAgVGhpcyBwcm9ncmFtIGlz
IGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisjICAgICAg
YnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFu
dHkgb2YKKyMgKyAgICBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFS
IFBVUlBPU0UuICBTZWUgdGhlCisjICsgICAgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9y
IG1vcmUgZGV0YWlscy4KKyMgKworIyArICAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNv
cHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisjICsgICAgYWxvbmcgd2l0aCB0
aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUKKyMgKyAgICBG
b3VuZGF0aW9uLCBJbmMuLCA2NzUgTWFzcyBBdmUsIENhbWJyaWRnZSwgTUEgMDIxMzksIFVTQS4K
KyMgKworIyArCisjICtjb250YWN0CisjICstLS0tLS0tCisjICsKKyMgK0ZvciBxdWVzdGlvbnMs
IGJ1ZyByZXBvcnRzLCBpZGVhcywgY29udHJpYnV0aW9ucyBldGMuIHBsZWFzZSBjb250YWN0Cisj
ICtzb2NhdEBkZXN0LXVucmVhY2gub3JnCisjICsKKyMgK0ZvciBzb2NhdCBzb3VyY2UgZGlzdHJp
YnV0aW9uLCBidWcgZml4ZXMsIGFuZCBsYXRlc3QgbmV3cyBzZWUKKyMgKyAgICAgICAgaHR0cDov
L3d3dy5kZXN0LXVucmVhY2gub3JnL3NvY2F0LworIyArCisjICt3d3cuc29jYXQub3JnIGlzIGFu
IGFsdGVybmF0ZSBzaXRlIHByb3ZpZGluZyB0aGUgc2FtZSBjb250ZW50cy4KKyMgKworIyArcHVi
bGljIGdpdCByZXBvc2l0b3J5OgorIyArCWdpdDovL3JlcG8ub3IuY3ovc29jYXQuZ2l0CisjICsJ
aHR0cDovL3JlcG8ub3IuY3ovc29jYXQuZ2l0CisjIAorIworCiBTVU1NQVJZID0gIk11bHRpcHVy
cG9zZSByZWxheSBmb3IgYmlkaXJlY3Rpb25hbCBkYXRhIHRyYW5zZmVyIgogREVTQ1JJUFRJT04g
PSAiU29jYXQgaXMgYSByZWxheSBmb3IgYmlkaXJlY3Rpb25hbCBkYXRhIFwKIHRyYW5zZmVyIGJl
dHdlZW4gdHdvIGluZGVwZW5kZW50IGRhdGEgY2hhbm5lbHMuIgpAQCAtNywxMSArNzIsMTIgQEAg
U0VDVElPTiA9ICJjb25zb2xlL25ldHdvcmsiCiAKIExJQ0VOU0UgPSAiR1BMLTIuMC13aXRoLU9w
ZW5TU0wtZXhjZXB0aW9uIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9
YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMgXAotICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vUkVBRE1FO2JlZ2lubGluZT0yNTc7ZW5kbGluZT0yODc7bWQ1PTgyNTIwYjA1MmYzMjJh
YzJiNWIzZGZkYzdjN2VlYTg2IgorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vUkVBRE1FO2Jl
Z2lubGluZT0yNTc7ZW5kbGluZT0yODc7bWQ1PTUwZGRiOGY2YjMxZTEyOGE3NWMzYjZlOTcyYjdi
NmJhIFwKKyAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHA6Ly93d3cuZGVz
dC11bnJlYWNoLm9yZy9zb2NhdC9kb3dubG9hZC9zb2NhdC0ke1BWfS50YXIuYnoyIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZmJkNDJiZDJmMGU1NGEzYWY2ZDAxYmRmMTUzODUzODRhYjgyZGJj
MGU0ZjFhNWUxNTNiM2UwYmUxYjYzODBhYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlMWRlNjgz
ZGQyMmVlMGUzYTZjNmJiZmYyNjlhYmUxOGFiMGM5ZDdlYjY1MDIwNGYxMjUxNTViOTAwNWZhY2E3
IgogCiBpbmhlcml0IGF1dG90b29scwogCi0tIAoyLjM5LjIKCg==

--===============0869857507259189913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1846 entries from dependency cache.
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
DISTRO_VERSION       = "4.3+snapshot-0b5a25c531a2c87976d90eadefeae57be9c3f613"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0b5a25c531a2c87976d90eadefeae57be9c3f613"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 161 Local 149 Mirrors 0 Missed 12 Current 179 (92% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 182 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 194 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 201 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx_setscene)
NOTE: Running task 290 of 999 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_recipe_qa)
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_recipe_qa: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 285 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 286 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 323 of 999 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 293 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 324 of 999 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 295 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 299 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 306 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 308 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 810 of 999 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_patch)
NOTE: recipe socat-1.8.0.0-r0: task do_patch: Started
NOTE: recipe socat-1.8.0.0-r0: task do_patch: Succeeded
NOTE: Running task 839 of 999 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 840 of 999 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_populate_lic)
NOTE: recipe socat-1.8.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.8.0.0-r0: task do_populate_lic: Started
NOTE: recipe socat-1.8.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 340 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 969 of 999 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 986 of 999 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_collect_spdx_deps)
NOTE: recipe socat-1.8.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.8.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe socat-1.8.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 987 of 999 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_configure)
NOTE: recipe socat-1.8.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_configure: Started
NOTE: recipe socat-1.8.0.0-r0: task do_configure: Succeeded
NOTE: Running task 988 of 999 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_compile)
NOTE: recipe socat-1.8.0.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 52
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o socat.o ../socat-1.8.0.0/socat.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioinitialize.o ../socat-1.8.0.0/xioinitialize.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xiohelp.o ../socat-1.8.0.0/xiohelp.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioparam.o ../socat-1.8.0.0/xioparam.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xiodiag.o ../socat-1.8.0.0/xiodiag.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioopen.o ../socat-1.8.0.0/xioopen.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioopts.o ../socat-1.8.0.0/xioopts.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xiosignal.o ../socat-1.8.0.0/xiosignal.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xiosigchld.o ../socat-1.8.0.0/xiosigchld.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioread.o ../socat-1.8.0.0/xioread.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xiowrite.o ../socat-1.8.0.0/xiowrite.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xiolayer.o ../socat-1.8.0.0/xiolayer.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioshutdown.o ../socat-1.8.0.0/xioshutdown.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioclose.o ../socat-1.8.0.0/xioclose.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioexit.o ../socat-1.8.0.0/xioexit.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-process.o ../socat-1.8.0.0/xio-process.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-fd.o ../socat-1.8.0.0/xio-fd.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-fdnum.o ../socat-1.8.0.0/xio-fdnum.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-stdio.o ../socat-1.8.0.0/xio-stdio.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-pipe.o ../socat-1.8.0.0/xio-pipe.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-socketpair.o ../socat-1.8.0.0/xio-socketpair.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-gopen.o ../socat-1.8.0.0/xio-gopen.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-creat.o ../socat-1.8.0.0/xio-creat.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-file.o ../socat-1.8.0.0/xio-file.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-named.o ../socat-1.8.0.0/xio-named.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-socket.o ../socat-1.8.0.0/xio-socket.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-interface.o ../socat-1.8.0.0/xio-interface.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-listen.o ../socat-1.8.0.0/xio-listen.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-unix.o ../socat-1.8.0.0/xio-unix.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-vsock.o ../socat-1.8.0.0/xio-vsock.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-ip.o ../socat-1.8.0.0/xio-ip.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-ip4.o ../socat-1.8.0.0/xio-ip4.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-ip6.o ../socat-1.8.0.0/xio-ip6.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-ipapp.o ../socat-1.8.0.0/xio-ipapp.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-tcp.o ../socat-1.8.0.0/xio-tcp.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-sctp.o ../socat-1.8.0.0/xio-sctp.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-dccp.o ../socat-1.8.0.0/xio-dccp.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-rawip.o ../socat-1.8.0.0/xio-rawip.c
| ../socat-1.8.0.0/xio-interface.c: In function 'xioopen_interface':
| ../socat-1.8.0.0/xio-interface.c:111:4: warning: '__builtin_strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
|   111 |    strncpy(sfd->para.interface.name, ifname, IFNAMSIZ);
|       |    ^
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-posixmq.o ../socat-1.8.0.0/xio-posixmq.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-socks.o ../socat-1.8.0.0/xio-socks.c
| ../socat-1.8.0.0/xio-unix.c: In function 'xiosetunix':
| ../socat-1.8.0.0/xio-unix.c:101:4: warning: '__builtin_strncpy' specified bound 108 equals destination size [-Wstringop-truncation]
|   101 |    strncpy(saun->sun_path, path, sizeof(saun->sun_path));       /* ok */
|       |    ^
| ../socat-1.8.0.0/xio-socket.c: In function 'xiobind':
| ../socat-1.8.0.0/xio-socket.c:2160:13: warning: '__builtin_strncpy' specified bound 108 equals destination size [-Wstringop-truncation]
|  2160 |             strncpy(us->un.sun_path+(abstract?1:0), sockname, sizeof(us->un.sun_path));
|       |             ^
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-socks5.o ../socat-1.8.0.0/xio-socks5.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-proxy.o ../socat-1.8.0.0/xio-proxy.c
| ../socat-1.8.0.0/xio-ip6.c: In function 'xiolog_ancillary_ip6':
| ../socat-1.8.0.0/xio-ip6.c:271:9: warning: unused variable 'scratch2' [-Wunused-variable]
|   271 |    char scratch2[32];
|       |         ^~~~~~~~
| ../socat-1.8.0.0/xio-ip6.c:270:9: warning: unused variable 'scratch1' [-Wunused-variable]
|   270 |    char scratch1[42];   /* can hold an IPv6 address in ASCII */
|       |         ^~~~~~~~
| ../socat-1.8.0.0/xio-ip6.c: At top level:
| ../socat-1.8.0.0/xio-ip6.c:359:14: warning: 'inet6addr_info' defined but not used [-Wunused-function]
|   359 | static char *inet6addr_info(const struct in6_addr *sa, char *buff, size_t blen) {
|       |              ^~~~~~~~~~~~~~
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-udp.o ../socat-1.8.0.0/xio-udp.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-udplite.o ../socat-1.8.0.0/xio-udplite.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-progcall.o ../socat-1.8.0.0/xio-progcall.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-exec.o ../socat-1.8.0.0/xio-exec.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-system.o ../socat-1.8.0.0/xio-system.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-shell.o ../socat-1.8.0.0/xio-shell.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-termios.o ../socat-1.8.0.0/xio-termios.c
| ../socat-1.8.0.0/xio-ip6.c: In function 'xiotype_ip6_join_source_group':
| ../socat-1.8.0.0/xio-ip6.c:580:4: warning: '__builtin_strncpy' output may be truncated copying 16 bytes from a string of length 511 [-Wstringop-truncation]
|   580 |    strncpy(opt->value2.u_string/*ifindex*/, buff, IF_NAMESIZE);
|       |    ^
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-readline.o ../socat-1.8.0.0/xio-readline.c
| In file included from ../socat-1.8.0.0/xioopen.h:10,
|                  from ../socat-1.8.0.0/xio-socks.c:11:
| ../socat-1.8.0.0/xio-socks.c: In function '_xioopen_socks4_connect':
| ../socat-1.8.0.0/xio-socks.c:423:64: warning: array subscript 'struct socks4[0]' is partly outside array bounds of 'unsigned char[8]' [-Warray-bounds=]
|   423 |          replyhead->version, replyhead->action, ntohs(replyhead->port),
|       |                                                                ^~
| ../socat-1.8.0.0/error.h:124:58: note: in definition of macro 'Info7'
|   124 | #define Info7(m,a1,a2,a3,a4,a5,a6,a7) msg(E_INFO,m,a1,a2,a3,a4,a5,a6,a7)
|       |                                                          ^~
| ../socat-1.8.0.0/xio-socks.c:342:18: note: object 'buff' of size 8
|   342 |    unsigned char buff[SIZEOF_STRUCT_SOCKS4];
|       |                  ^~~~
| ../socat-1.8.0.0/xio-socks.c:423:39: warning: array subscript 'struct socks4[0]' is partly outside array bounds of 'unsigned char[8]' [-Warray-bounds=]
|   423 |          replyhead->version, replyhead->action, ntohs(replyhead->port),
|       |                                       ^~
| ../socat-1.8.0.0/error.h:124:55: note: in definition of macro 'Info7'
|   124 | #define Info7(m,a1,a2,a3,a4,a5,a6,a7) msg(E_INFO,m,a1,a2,a3,a4,a5,a6,a7)
|       |                                                       ^~
| ../socat-1.8.0.0/xio-socks.c:342:18: note: object 'buff' of size 8
|   342 |    unsigned char buff[SIZEOF_STRUCT_SOCKS4];
|       |                  ^~~~
| ../socat-1.8.0.0/xio-socks.c:423:19: warning: array subscript 'struct socks4[0]' is partly outside array bounds of 'unsigned char[8]' [-Warray-bounds=]
|   423 |          replyhead->version, replyhead->action, ntohs(replyhead->port),
|       |                   ^~
| ../socat-1.8.0.0/error.h:124:52: note: in definition of macro 'Info7'
|   124 | #define Info7(m,a1,a2,a3,a4,a5,a6,a7) msg(E_INFO,m,a1,a2,a3,a4,a5,a6,a7)
|       |                                                    ^~
| ../socat-1.8.0.0/xio-socks.c:342:18: note: object 'buff' of size 8
|   342 |    unsigned char buff[SIZEOF_STRUCT_SOCKS4];
|       |                  ^~~~
| ../socat-1.8.0.0/xio-socks.c:428:17: warning: array subscript 'struct socks4[0]' is partly outside array bounds of 'unsigned char[8]' [-Warray-bounds=]
|   428 |    if (replyhead->version != 0) {
|       |                 ^~
| ../socat-1.8.0.0/xio-socks.c:342:18: note: object 'buff' of size 8
|   342 |    unsigned char buff[SIZEOF_STRUCT_SOCKS4];
|       |                  ^~~~
| ../socat-1.8.0.0/xio-socks.c:433:21: warning: array subscript 'struct socks4[0]' is partly outside array bounds of 'unsigned char[8]' [-Warray-bounds=]
|   433 |    switch (replyhead->action) {
|       |                     ^~
| ../socat-1.8.0.0/xio-socks.c:342:18: note: object 'buff' of size 8
|   342 |    unsigned char buff[SIZEOF_STRUCT_SOCKS4];
|       |                  ^~~~
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-pty.o ../socat-1.8.0.0/xio-pty.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-openssl.o ../socat-1.8.0.0/xio-openssl.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-streams.o ../socat-1.8.0.0/xio-streams.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-namespaces.o ../socat-1.8.0.0/xio-namespaces.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-ascii.o ../socat-1.8.0.0/xio-ascii.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xiolockfile.o ../socat-1.8.0.0/xiolockfile.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-tcpwrap.o ../socat-1.8.0.0/xio-tcpwrap.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-fs.o ../socat-1.8.0.0/xio-fs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-tun.o ../socat-1.8.0.0/xio-tun.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o error.o ../socat-1.8.0.0/error.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o dalan.o ../socat-1.8.0.0/dalan.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -c -D CC=\"x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot\" -o procan.o procan.c
| cc1: fatal error: procan.c: No such file or directory
| compilation terminated.
| make: *** [Makefile:113: procan.o] Error 1
| make: *** Waiting for unfinished jobs....
| ../socat-1.8.0.0/xio-pty.c: In function 'xioopen_pty':
| ../socat-1.8.0.0/xio-pty.c:50:10: warning: unused variable 'tn' [-Wunused-variable]
|    50 |    char *tn = NULL;
|       |          ^~
| ../socat-1.8.0.0/xio-openssl.c: In function '_xioopen_openssl_listen':
| ../socat-1.8.0.0/xio-openssl.c:782:16: warning: 'ERR_func_error_string' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|   782 |                Msg4(level, "SSL_accept(): %s / %s / %s / %s", error_string,
|       |                ^~~~
| In file included from ../socat-1.8.0.0/sysincludes.h:198,
|                  from ../socat-1.8.0.0/xiosysincludes.h:11,
|                  from ../socat-1.8.0.0/xio-openssl.c:7:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot/usr/include/openssl/err.h:459:35: note: declared here
|   459 | OSSL_DEPRECATEDIN_3_0 const char *ERR_func_error_string(unsigned long e);
|       |                                   ^~~~~~~~~~~~~~~~~~~~~
| ../socat-1.8.0.0/xio-openssl.c: In function '_xioopen_openssl_prepare':
| ../socat-1.8.0.0/xio-openssl.c:1300:7: warning: 'DH_new' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1300 |       dh = DH_new();
|       |       ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot/usr/include/openssl/dsa.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot/usr/include/openssl/x509.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot/usr/include/openssl/ssl.h:31,
|                  from ../socat-1.8.0.0/sysincludes.h:197:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot/usr/include/openssl/dh.h:206:27: note: declared here
|   206 | OSSL_DEPRECATEDIN_3_0 DH *DH_new(void);
|       |                           ^~~~~~
| ../socat-1.8.0.0/xio-openssl.c:1305:13: warning: 'DH_free' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1305 |             DH_free(dh);
|       |             ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot/usr/include/openssl/dh.h:207:28: note: declared here
|   207 | OSSL_DEPRECATEDIN_3_0 void DH_free(DH *dh);
|       |                            ^~~~~~~
| ../socat-1.8.0.0/xio-openssl.c:1318:7: warning: 'DH_set0_pqg' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1318 |       if (!DH_set0_pqg(dh, p, NULL, g)) {
|       |       ^~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot/usr/include/openssl/dh.h:262:27: note: declared here
|   262 | OSSL_DEPRECATEDIN_3_0 int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g);
|       |                           ^~~~~~~~~~~
| ../socat-1.8.0.0/xio-openssl.c:1319:15: warning: 'DH_free' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1319 |               DH_free(dh);
|       |               ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot/usr/include/openssl/dh.h:207:28: note: declared here
|   207 | OSSL_DEPRECATEDIN_3_0 void DH_free(DH *dh);
|       |                            ^~~~~~~
| ../socat-1.8.0.0/xio-openssl.c:1336:7: warning: 'DH_free' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1336 |       DH_free(dh);
|       |       ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot/usr/include/openssl/dh.h:207:28: note: declared here
|   207 | OSSL_DEPRECATEDIN_3_0 void DH_free(DH *dh);
|       |                            ^~~~~~~
| ../socat-1.8.0.0/xio-openssl.c:1355:7: warning: 'EC_KEY_new_by_curve_name' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  1355 |       ecdh = EC_KEY_new_by_curve_name(nid);
|       |       ^~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot/usr/include/openssl/x509.h:33:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot/usr/include/openssl/ec.h:1001:31: note: declared here
|  1001 | OSSL_DEPRECATEDIN_3_0 EC_KEY *EC_KEY_new_by_curve_name(int nid);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~
| ../socat-1.8.0.0/xio-openssl.c: In function 'xioSSL_connect':
| ../socat-1.8.0.0/xio-openssl.c:2022:16: warning: 'ERR_func_error_string' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2022 |                Msg4(level, "SSL_connect(): %s / %s / %s / %s", error_string,
|       |                ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot/usr/include/openssl/err.h:459:35: note: declared here
|   459 | OSSL_DEPRECATEDIN_3_0 const char *ERR_func_error_string(unsigned long e);
|       |                                   ^~~~~~~~~~~~~~~~~~~~~
| ../socat-1.8.0.0/xio-openssl.c: In function 'xioread_openssl':
| ../socat-1.8.0.0/xio-openssl.c:2082:16: warning: 'ERR_func_error_string' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2082 |                Error4("SSL_read(): %s / %s / %s / %s", error_string,
|       |                ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot/usr/include/openssl/err.h:459:35: note: declared here
|   459 | OSSL_DEPRECATEDIN_3_0 const char *ERR_func_error_string(unsigned long e);
|       |                                   ^~~~~~~~~~~~~~~~~~~~~
| ../socat-1.8.0.0/xio-openssl.c: In function 'xiowrite_openssl':
| ../socat-1.8.0.0/xio-openssl.c:2141:16: warning: 'ERR_func_error_string' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
|  2141 |                Error4("SSL_write(): %s / %s / %s / %s", error_string,
|       |                ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot/usr/include/openssl/err.h:459:35: note: declared here
|   459 | OSSL_DEPRECATEDIN_3_0 const char *ERR_func_error_string(unsigned long e);
|       |                                   ^~~~~~~~~~~~~~~~~~~~~
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3415555:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3415555, line 182
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3415555, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3415555, line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3415555, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3415555, line 151
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3415555, line 195
NOTE: recipe socat-1.8.0.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 988 tasks of which 978 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115051727.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115051727.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: socat-1.8.0.0-r0 do_compile: oe_runmake failed
ERROR: socat-1.8.0.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3415555', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/log.do_compile.3415555
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_compile) failed with exit code '1'

--===============0869857507259189913==--

