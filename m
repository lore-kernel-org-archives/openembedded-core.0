Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF18C27C63
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:15:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.22182.1701436490758350134
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N913Bkm5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZhQ0EajG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018c25848042-68cfddec-7a06-44da-aa1e-b49c36b5b5dc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nlde3jm8Hoq3jtxp4wynvfcNT+U1GFrHmj/UK/Uoii8=;
	b=N913Bkm53yHPJqkL2QBnqIYX/oURhH6ZPMx6yTfTfXgny3kysd8TXXO0QD5xzT1H
	qa/XUoALDF5OYFhRWXXDIPxUxUMmYE735FNz/PfuCdw9kb3AapXkiDzwVTINXagz7uY
	pXRpHGuj4Sx2cxFLEBDY6Tq/kcD1KKY6flKr3aik=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nlde3jm8Hoq3jtxp4wynvfcNT+U1GFrHmj/UK/Uoii8=;
	b=ZhQ0EajG+5JQzQ0S0kBWCiEAt7mpxfwmVtmDurf+OM2YQ8hvdBZ8ukXvoFFgx0TK
	CyGQxgMndQ8SiBbttN5mxYmnaOQaFdjDKHCLW4wJ7sRa6QU9v8UUJfHsMQ0mnYTKEXi
	Odj5ZadJU9jx7tB1SP1K11llmX3w93oQogXrs3Ak=
Content-Type: multipart/mixed; boundary="===============7189314931284635806=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] socat: upgrading to 1.8.0.0 FAILED
Message-ID: <0101018c25848042-68cfddec-7a06-44da-aa1e-b49c36b5b5dc-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191577

--===============7189314931284635806==
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
From 149df69132ffd95abb1f806ab1b6f77b3c2e4262 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 05:52:14 +0000
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


--===============7189314931284635806==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-socat-upgrade-1.7.4.4-1.8.0.0.patch"

RnJvbSAxNDlkZjY5MTMyZmZkOTVhYmIxZjgwNmFiMWI2Zjc3YjNjMmU0MjYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwNTo1MjoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNv
Y2F0OiB1cGdyYWRlIDEuNy40LjQgLT4gMS44LjAuMAoKLS0tCiAuLi4ve3NvY2F0XzEuNy40LjQu
YmIgPT4gc29jYXRfMS44LjAuMC5iYn0gICAgfCA3MCArKysrKysrKysrKysrKysrKystCiAxIGZp
bGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L3NvY2F0L3tzb2NhdF8xLjcuNC40LmJiID0+IHNvY2F0XzEu
OC4wLjAuYmJ9ICg0MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9z
b2NhdC9zb2NhdF8xLjcuNC40LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zb2NhdC9z
b2NhdF8xLjguMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvc29jYXQvc29jYXRfMS43LjQuNC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9zb2NhdC9zb2NhdF8xLjguMC4wLmJiCmluZGV4IDVhMzc5Mzgw
ZDEuLmI3NjU0ZTBjYWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc29j
YXQvc29jYXRfMS43LjQuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NvY2F0
L3NvY2F0XzEuOC4wLjAuYmIKQEAgLTEsMyArMSw2OCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IFJFQURNRQorIyArKysgUkVBRE1FCisjIEBAIC0xLDI1ICsxLDMgQEAKKyMgLXNtb290aGx5IGFs
c28gdW5kZXIgUmVkSGF0IExpbnV4LiBBZnRlciB5b2RsIDEuMzEgaW5zdGFsbGF0aW9uLCB0aGUg
Zm9sbG93aW5nCisjIC1jb3JyZWN0aW9uIG11c3QgYmUgcGVyZm9ybWVkIGluIC91c3Ivc2hhcmUv
eW9kbC9zaGFyZWQueW8gaW4gdHdvIHBsYWNlczoKKyMgLTwgd2hlbmh0bWwoaHRtbGNvbW1hbmQo
PCEpQVJHMStodG1sY29tbWFuZCg+KSkpCisjIC0+IHdoZW5odG1sKGh0bWxjb21tYW5kKDwhLS0p
QVJHMStodG1sY29tbWFuZCgtLT4pKSkKKyMgLQorIyAtCisjIC1saWNlbnNlCisjIC0tLS0tLS0t
CisjIC0KKyMgLXNvY2F0IGlzIGRpc3RyaWJ1dGVkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05V
IEdQTHYyOworIyAtZXhjZXB0IGZvciBpbnN0YWxsLXNoLCB3aGljaCBpcyBjb3B5cmlnaHQgTUlU
LCB3aXRoIGl0cyBvd24gbGljZW5zZTsKKyMgLQorIyAtSW4gYWRkaXRpb24sIGFzIGEgc3BlY2lh
bCBleGNlcHRpb24sIHRoZSBjb3B5cmlnaHQgaG9sZGVyCisjIC1naXZlcyBwZXJtaXNzaW9uIHRv
IGxpbmsgdGhlIGNvZGUgb2YgdGhpcyBwcm9ncmFtIHdpdGgKKyMgLWFueSB2ZXJzaW9uIG9mIHRo
ZSBPcGVuU1NMIGxpYnJhcnkgd2hpY2ggaXMgZGlzdHJpYnV0ZWQKKyMgLXVuZGVyIGEgbGljZW5z
ZSBpZGVudGljYWwgdG8gdGhhdCBsaXN0ZWQgaW4gdGhlIGluY2x1ZGVkCisjIC1DT1BZSU5HLk9w
ZW5TU0wgZmlsZSwgYW5kIGRpc3RyaWJ1dGUgbGlua2VkIGNvbWJpbmF0aW9ucworIyAtaW5jbHVk
aW5nIHRoZSB0d28uIFlvdSBtdXN0IG9iZXkgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYworIyAtTGlj
ZW5zZSBpbiBhbGwgcmVzcGVjdHMgZm9yIGFsbCBvZiB0aGUgY29kZSB1c2VkIG90aGVyCisjIC10
aGFuIE9wZW5TU0wuIElmIHlvdSBtb2RpZnkgdGhpcyBmaWxlLCB5b3UgbWF5IGV4dGVuZCB0aGlz
CisjIC1leGNlcHRpb24gdG8geW91ciB2ZXJzaW9uIG9mIHRoZSBmaWxlLCBidXQgeW91IGFyZSBu
b3QKKyMgLW9ibGlnYXRlZCB0byBkbyBzby4gSWYgeW91IGRvIG5vdCB3aXNoIHRvIGRvIHNvLCBk
ZWxldGUKKyMgIHRoaXMgZXhjZXB0aW9uIHN0YXRlbWVudCBmcm9tIHlvdXIgdmVyc2lvbi4KKyMg
IAorIyAgCisjIEBAIC0yOSwzICs3LDI1IEBACisjICAKKyMgICAgICBUaGlzIHByb2dyYW0gaXMg
ZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyMgICAgICBi
dXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50
eSBvZgorIyArICAgIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIg
UFVSUE9TRS4gIFNlZSB0aGUKKyMgKyAgICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3Ig
bW9yZSBkZXRhaWxzLgorIyArCisjICsgICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29w
eSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKKyMgKyAgICBhbG9uZyB3aXRoIHRo
aXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQorIyArICAgIEZv
dW5kYXRpb24sIEluYy4sIDY3NSBNYXNzIEF2ZSwgQ2FtYnJpZGdlLCBNQSAwMjEzOSwgVVNBLgor
IyArCisjICsKKyMgK2NvbnRhY3QKKyMgKy0tLS0tLS0KKyMgKworIyArRm9yIHF1ZXN0aW9ucywg
YnVnIHJlcG9ydHMsIGlkZWFzLCBjb250cmlidXRpb25zIGV0Yy4gcGxlYXNlIGNvbnRhY3QKKyMg
K3NvY2F0QGRlc3QtdW5yZWFjaC5vcmcKKyMgKworIyArRm9yIHNvY2F0IHNvdXJjZSBkaXN0cmli
dXRpb24sIGJ1ZyBmaXhlcywgYW5kIGxhdGVzdCBuZXdzIHNlZQorIyArICAgICAgICBodHRwOi8v
d3d3LmRlc3QtdW5yZWFjaC5vcmcvc29jYXQvCisjICsKKyMgK3d3dy5zb2NhdC5vcmcgaXMgYW4g
YWx0ZXJuYXRlIHNpdGUgcHJvdmlkaW5nIHRoZSBzYW1lIGNvbnRlbnRzLgorIyArCisjICtwdWJs
aWMgZ2l0IHJlcG9zaXRvcnk6CisjICsJZ2l0Oi8vcmVwby5vci5jei9zb2NhdC5naXQKKyMgKwlo
dHRwOi8vcmVwby5vci5jei9zb2NhdC5naXQKKyMgCisjCisKIFNVTU1BUlkgPSAiTXVsdGlwdXJw
b3NlIHJlbGF5IGZvciBiaWRpcmVjdGlvbmFsIGRhdGEgdHJhbnNmZXIiCiBERVNDUklQVElPTiA9
ICJTb2NhdCBpcyBhIHJlbGF5IGZvciBiaWRpcmVjdGlvbmFsIGRhdGEgXAogdHJhbnNmZXIgYmV0
d2VlbiB0d28gaW5kZXBlbmRlbnQgZGF0YSBjaGFubmVscy4iCkBAIC03LDExICs3MiwxMiBAQCBT
RUNUSU9OID0gImNvbnNvbGUvbmV0d29yayIKIAogTElDRU5TRSA9ICJHUEwtMi4wLXdpdGgtT3Bl
blNTTC1leGNlcHRpb24iCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1i
MjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCi0gICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9SRUFETUU7YmVnaW5saW5lPTI1NztlbmRsaW5lPTI4NzttZDU9ODI1MjBiMDUyZjMyMmFj
MmI1YjNkZmRjN2M3ZWVhODYiCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9SRUFETUU7YmVn
aW5saW5lPTI1NztlbmRsaW5lPTI4NzttZDU9NTBkZGI4ZjZiMzFlMTI4YTc1YzNiNmU5NzJiN2I2
YmEgXAorICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5kZXN0
LXVucmVhY2gub3JnL3NvY2F0L2Rvd25sb2FkL3NvY2F0LSR7UFZ9LnRhci5iejIiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJmYmQ0MmJkMmYwZTU0YTNhZjZkMDFiZGYxNTM4NTM4NGFiODJkYmMw
ZTRmMWE1ZTE1M2IzZTBiZTFiNjM4MGFjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImUxZGU2ODNk
ZDIyZWUwZTNhNmM2YmJmZjI2OWFiZTE4YWIwYzlkN2ViNjUwMjA0ZjEyNTE1NWI5MDA1ZmFjYTci
CiAKIGluaGVyaXQgYXV0b3Rvb2xzCiAKLS0gCjIuMzkuMgoK

--===============7189314931284635806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1847 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-b7915e631b55fbb33dc497e041f96df9e077f084"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b7915e631b55fbb33dc497e041f96df9e077f084"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 161 Local 149 Mirrors 0 Missed 12 Current 179 (92% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 182 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 194 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 201 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx_setscene)
NOTE: Running task 280 of 999 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_recipe_qa)
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
NOTE: Running task 313 of 999 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 293 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 314 of 999 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 295 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 299 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_deploy_source_date_epoch unihash changed to 37d38f23e8fce73c55e054522ad39ca7fa4bf62541786c428d3a329955e57a66
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
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
NOTE: recipe socat-1.8.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 987 of 999 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_configure)
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
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o socat.o ../socat-1.8.0.0/socat.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioinitialize.o ../socat-1.8.0.0/xioinitialize.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xiohelp.o ../socat-1.8.0.0/xiohelp.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioparam.o ../socat-1.8.0.0/xioparam.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xiodiag.o ../socat-1.8.0.0/xiodiag.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioopen.o ../socat-1.8.0.0/xioopen.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioopts.o ../socat-1.8.0.0/xioopts.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xiosignal.o ../socat-1.8.0.0/xiosignal.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xiosigchld.o ../socat-1.8.0.0/xiosigchld.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioread.o ../socat-1.8.0.0/xioread.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xiowrite.o ../socat-1.8.0.0/xiowrite.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xiolayer.o ../socat-1.8.0.0/xiolayer.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioshutdown.o ../socat-1.8.0.0/xioshutdown.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioclose.o ../socat-1.8.0.0/xioclose.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xioexit.o ../socat-1.8.0.0/xioexit.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-process.o ../socat-1.8.0.0/xio-process.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-fd.o ../socat-1.8.0.0/xio-fd.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-fdnum.o ../socat-1.8.0.0/xio-fdnum.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-stdio.o ../socat-1.8.0.0/xio-stdio.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-pipe.o ../socat-1.8.0.0/xio-pipe.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-socketpair.o ../socat-1.8.0.0/xio-socketpair.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-gopen.o ../socat-1.8.0.0/xio-gopen.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-creat.o ../socat-1.8.0.0/xio-creat.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-file.o ../socat-1.8.0.0/xio-file.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-named.o ../socat-1.8.0.0/xio-named.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-socket.o ../socat-1.8.0.0/xio-socket.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-interface.o ../socat-1.8.0.0/xio-interface.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-listen.o ../socat-1.8.0.0/xio-listen.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-unix.o ../socat-1.8.0.0/xio-unix.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-vsock.o ../socat-1.8.0.0/xio-vsock.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-ip.o ../socat-1.8.0.0/xio-ip.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-ip4.o ../socat-1.8.0.0/xio-ip4.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-ip6.o ../socat-1.8.0.0/xio-ip6.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-ipapp.o ../socat-1.8.0.0/xio-ipapp.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-tcp.o ../socat-1.8.0.0/xio-tcp.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-sctp.o ../socat-1.8.0.0/xio-sctp.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-dccp.o ../socat-1.8.0.0/xio-dccp.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-rawip.o ../socat-1.8.0.0/xio-rawip.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-posixmq.o ../socat-1.8.0.0/xio-posixmq.c
| ../socat-1.8.0.0/xio-interface.c: In function 'xioopen_interface':
| ../socat-1.8.0.0/xio-interface.c:111:4: warning: '__builtin_strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
|   111 |    strncpy(sfd->para.interface.name, ifname, IFNAMSIZ);
|       |    ^
| ../socat-1.8.0.0/xio-unix.c: In function 'xiosetunix':
| ../socat-1.8.0.0/xio-unix.c:101:4: warning: '__builtin_strncpy' specified bound 108 equals destination size [-Wstringop-truncation]
|   101 |    strncpy(saun->sun_path, path, sizeof(saun->sun_path));       /* ok */
|       |    ^
| ../socat-1.8.0.0/xio-socket.c: In function 'xiobind':
| ../socat-1.8.0.0/xio-socket.c:2160:13: warning: '__builtin_strncpy' specified bound 108 equals destination size [-Wstringop-truncation]
|  2160 |             strncpy(us->un.sun_path+(abstract?1:0), sockname, sizeof(us->un.sun_path));
|       |             ^
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-socks.o ../socat-1.8.0.0/xio-socks.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-socks5.o ../socat-1.8.0.0/xio-socks5.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-proxy.o ../socat-1.8.0.0/xio-proxy.c
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
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-udp.o ../socat-1.8.0.0/xio-udp.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-udplite.o ../socat-1.8.0.0/xio-udplite.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-progcall.o ../socat-1.8.0.0/xio-progcall.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-exec.o ../socat-1.8.0.0/xio-exec.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-system.o ../socat-1.8.0.0/xio-system.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-shell.o ../socat-1.8.0.0/xio-shell.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-termios.o ../socat-1.8.0.0/xio-termios.c
| ../socat-1.8.0.0/xio-ip6.c: In function 'xiotype_ip6_join_source_group':
| ../socat-1.8.0.0/xio-ip6.c:580:4: warning: '__builtin_strncpy' output may be truncated copying 16 bytes from a string of length 511 [-Wstringop-truncation]
|   580 |    strncpy(opt->value2.u_string/*ifindex*/, buff, IF_NAMESIZE);
|       |    ^
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-readline.o ../socat-1.8.0.0/xio-readline.c
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
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-pty.o ../socat-1.8.0.0/xio-pty.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-openssl.o ../socat-1.8.0.0/xio-openssl.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-streams.o ../socat-1.8.0.0/xio-streams.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-namespaces.o ../socat-1.8.0.0/xio-namespaces.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-ascii.o ../socat-1.8.0.0/xio-ascii.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xiolockfile.o ../socat-1.8.0.0/xiolockfile.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-tcpwrap.o ../socat-1.8.0.0/xio-tcpwrap.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-fs.o ../socat-1.8.0.0/xio-fs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o xio-tun.o ../socat-1.8.0.0/xio-tun.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o error.o ../socat-1.8.0.0/error.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -I.   -c -o dalan.o ../socat-1.8.0.0/dalan.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/socat-1.8.0.0=/usr/src/debug/socat/1.8.0.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/build=/usr/src/debug/socat/1.8.0.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/buil
 d/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot-native=  -fcommon -D_GNU_SOURCE -Wall -Wno-parentheses  -DHAVE_CONFIG_H -I.  -c -D CC=\"x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/recipe-sysroot\" -o procan.o procan.c
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3453928:181 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3453928, line 181
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3453928, line 165
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3453928, line 160
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3453928, line 155
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3453928, line 150
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3453928, line 194
NOTE: recipe socat-1.8.0.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 988 tasks of which 978 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201055128.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201055128.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: socat-1.8.0.0-r0 do_compile: oe_runmake failed
ERROR: socat-1.8.0.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/run.do_compile.3453928', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/log.do_compile.3453928
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_compile) failed with exit code '1'

--===============7189314931284635806==--

