Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DBEC369B8
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.20191.1744723993671735255
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=T2WrzXzz;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BjnXt1J9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019639a76146-9fa0c53f-dd68-49c7-b294-fc483c834e4e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723993;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DACl7XFiuT6BACM5au0FX8RfPMSWg2pY3oiuruqKAh0=;
	b=T2WrzXzzPmcJ2BGtf1mUXvsv5gy9r7dJDuuUVB/XAdmoskcTO8Y3mv3ywnABS5/c
	3kiZe6VOuhcsjQTIGit3gVCGXhesplvR6BIauw+SnSuews0cCv6LC+13FSjA60w/7Qe
	kWsR1jGm2Z0ET98Si1vnkXlfvAjGUM+79IQ7BtUM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723993;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DACl7XFiuT6BACM5au0FX8RfPMSWg2pY3oiuruqKAh0=;
	b=BjnXt1J9KELq+EvDNY9jgqs4a8fTIo8Hd5E2ra4RuOReQC+SW2rs39nmv+Qw+CuL
	SKCRp0hYWhJWw2FQjWdjbG7Cw+8iiPIpasG+Zs6YOG4zhQShSRktQ7hhLZjfEiq1mMW
	eoXSNKLBgtS4AaOgZUhPDUxnyApNLiIR8C31cGLU=
Content-Type: multipart/mixed; boundary="===============7865469742765704449=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iso-codes: upgrading to 4.18.0 SUCCEEDED
Message-ID: <0101019639a76146-9fa0c53f-dd68-49c7-b294-fc483c834e4e-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214939

--===============7865469742765704449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *iso-codes* to *4.18.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iso-codes-upgrade-4.17.0-4.18.0.patch
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
From 2933bd271de58be49ecb91a8a1e3c234aa603e2b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 13:01:39 +0000
Subject: [PATCH] iso-codes: upgrade 4.17.0 -> 4.18.0

---
 ...so-codes_4.17.0.bb => iso-codes_4.18.0.bb} | 46 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.17.0.bb => iso-codes_4.18.0.bb} (31%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
similarity index 31%
rename from meta/recipes-support/iso-codes/iso-codes_4.17.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
index bba2cd9de1..519c108473 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
@@ -1,3 +1,45 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -2,7 +2,7 @@
+#                         Version 2.1, February 1999
+#  
+#   Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+# - 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+# + <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -484,8 +484,7 @@
+#      Lesser General Public License for more details.
+#  
+#      You should have received a copy of the GNU Lesser General Public
+# -    License along with this library; if not, write to the Free Software
+# -    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+# +    License along with this library; if not, see <https://www.gnu.org/licenses/>.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+# @@ -496,7 +495,7 @@
+#    Yoyodyne, Inc., hereby disclaims all copyright interest in the
+#    library `Frob' (a library for tweaking knobs) written by James Random Hacker.
+#  
+# -  <signature of Ty Coon>, 1 April 1990
+# -  Ty Coon, President of Vice
+# +  <signature of Moe Ghoul>, 1 April 1990
+# +  Moe Ghoul, President of Vice
+#  
+#  That's all there is to it!
+# 
+#
+
 SUMMARY = "ISO language, territory, currency, script codes and their translations"
 DESCRIPTION = "Provides lists of various ISO standards (e.g. country, \
 language, language scripts, and currency names) in one place, rather \
@@ -6,10 +48,10 @@ HOMEPAGE = "https://salsa.debian.org/iso-codes-team/iso-codes"
 BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
 
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "0640070a001ca6edfa8ab6b61fe3230e66b3963b"
+SRCREV = "5be4d112d420706eacd913a3ebd85549fe9eeae4"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.47.1


--===============7865469742765704449==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iso-codes-upgrade-4.17.0-4.18.0.patch"

RnJvbSAyOTMzYmQyNzFkZTU4YmU0OWVjYjkxYThhMWUzYzIzNGFhNjAzZTJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMTM6MDE6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
c28tY29kZXM6IHVwZ3JhZGUgNC4xNy4wIC0+IDQuMTguMAoKLS0tCiAuLi5zby1jb2Rlc180LjE3
LjAuYmIgPT4gaXNvLWNvZGVzXzQuMTguMC5iYn0gfCA0NiArKysrKysrKysrKysrKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9pc28tY29kZXMve2lzby1jb2Rlc180LjE3LjAuYmIgPT4gaXNv
LWNvZGVzXzQuMTguMC5iYn0gKDMxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTcuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2lz
by1jb2Rlcy9pc28tY29kZXNfNC4xOC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggMzElCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2lzby1jb2Rlcy9pc28tY29kZXNfNC4xNy4wLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTguMC5i
YgppbmRleCBiYmEyY2Q5ZGUxLi41MTljMTA4NDczIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTcuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTguMC5iYgpAQCAtMSwzICsxLDQ1IEBACisj
IEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkg
J2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0
aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4K
KyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFt
cGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRo
ZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMiw3ICsy
LDcgQEAKKyMgICAgICAgICAgICAgICAgICAgICAgICAgVmVyc2lvbiAyLjEsIEZlYnJ1YXJ5IDE5
OTkKKyMgIAorIyAgIENvcHlyaWdodCAoQykgMTk5MSwgMTk5OSBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb24sIEluYy4KKyMgLSA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24s
IE1BICAwMjExMC0xMzAxICBVU0EKKyMgKyA8aHR0cHM6Ly9mc2Yub3JnLz4KKyMgICBFdmVyeW9u
ZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMg
ICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxsb3dl
ZC4KKyMgIAorIyBAQCAtNDg0LDggKzQ4NCw3IEBACisjICAgICAgTGVzc2VyIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMgIAorIyAgICAgIFlvdSBzaG91bGQgaGF2
ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyMgLSAg
ICBMaWNlbnNlIGFsb25nIHdpdGggdGhpcyBsaWJyYXJ5OyBpZiBub3QsIHdyaXRlIHRvIHRoZSBG
cmVlIFNvZnR3YXJlCisjIC0gICAgRm91bmRhdGlvbiwgSW5jLiwgNTEgRnJhbmtsaW4gU3RyZWV0
LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSAgVVNBCisjICsgICAgTGljZW5z
ZSBhbG9uZyB3aXRoIHRoaXMgbGlicmFyeTsgaWYgbm90LCBzZWUgPGh0dHBzOi8vd3d3LmdudS5v
cmcvbGljZW5zZXMvPi4KKyMgIAorIyAgQWxzbyBhZGQgaW5mb3JtYXRpb24gb24gaG93IHRvIGNv
bnRhY3QgeW91IGJ5IGVsZWN0cm9uaWMgYW5kIHBhcGVyIG1haWwuCisjICAKKyMgQEAgLTQ5Niw3
ICs0OTUsNyBAQAorIyAgICBZb3lvZHluZSwgSW5jLiwgaGVyZWJ5IGRpc2NsYWltcyBhbGwgY29w
eXJpZ2h0IGludGVyZXN0IGluIHRoZQorIyAgICBsaWJyYXJ5IGBGcm9iJyAoYSBsaWJyYXJ5IGZv
ciB0d2Vha2luZyBrbm9icykgd3JpdHRlbiBieSBKYW1lcyBSYW5kb20gSGFja2VyLgorIyAgCisj
IC0gIDxzaWduYXR1cmUgb2YgVHkgQ29vbj4sIDEgQXByaWwgMTk5MAorIyAtICBUeSBDb29uLCBQ
cmVzaWRlbnQgb2YgVmljZQorIyArICA8c2lnbmF0dXJlIG9mIE1vZSBHaG91bD4sIDEgQXByaWwg
MTk5MAorIyArICBNb2UgR2hvdWwsIFByZXNpZGVudCBvZiBWaWNlCisjICAKKyMgIFRoYXQncyBh
bGwgdGhlcmUgaXMgdG8gaXQhCisjIAorIworCiBTVU1NQVJZID0gIklTTyBsYW5ndWFnZSwgdGVy
cml0b3J5LCBjdXJyZW5jeSwgc2NyaXB0IGNvZGVzIGFuZCB0aGVpciB0cmFuc2xhdGlvbnMiCiBE
RVNDUklQVElPTiA9ICJQcm92aWRlcyBsaXN0cyBvZiB2YXJpb3VzIElTTyBzdGFuZGFyZHMgKGUu
Zy4gY291bnRyeSwgXAogbGFuZ3VhZ2UsIGxhbmd1YWdlIHNjcmlwdHMsIGFuZCBjdXJyZW5jeSBu
YW1lcykgaW4gb25lIHBsYWNlLCByYXRoZXIgXApAQCAtNiwxMCArNDgsMTAgQEAgSE9NRVBBR0Ug
PSAiaHR0cHM6Ly9zYWxzYS5kZWJpYW4ub3JnL2lzby1jb2Rlcy10ZWFtL2lzby1jb2RlcyIKIEJV
R1RSQUNLRVIgPSAiaHR0cHM6Ly9zYWxzYS5kZWJpYW4ub3JnL2lzby1jb2Rlcy10ZWFtL2lzby1j
b2Rlcy9pc3N1ZXMiCiAKIExJQ0VOU0UgPSAiTEdQTC0yLjEtb25seSIKLUxJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZj
IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NGJmNjYxYzFlMzc5M2U1
NWM4ZDEwNTFiYzVlMGFlMjEiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vc2Fsc2EuZGViaWFuLm9yZy9p
c28tY29kZXMtdGVhbS9pc28tY29kZXMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluOyIK
LVNSQ1JFViA9ICIwNjQwMDcwYTAwMWNhNmVkZmE4YWI2YjYxZmUzMjMwZTY2YjM5NjNiIgorU1JD
UkVWID0gIjViZTRkMTEyZDQyMDcwNmVhY2Q5MTNhM2ViZDg1NTQ5ZmU5ZWVhZTQiCiAKICMgaW5o
ZXJpdCBnZXR0ZXh0IGNhbm5vdCBiZSB1c2VkLCBiZWNhdXNlIGl0IGFkZHMgZ2V0dGV4dC1uYXRp
dmUgdG8gQkFTRURFUEVORFMgd2hpY2gKICMgYXJlIGluaGliaXRlZCBieSBhbGxhcmNoCi0tIAoy
LjQ3LjEKCg==

--===============7865469742765704449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/iso-codes/iso-codes-dbg: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-dbg: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-dev: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-dev: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-doc: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-doc: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PKGSIZE changed from 535 to 583 (+9%)
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PKGSIZE changed from 69266 to 73123 (+6%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGSIZE changed from 90031 to 91222 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PKGSIZE changed from 64811 to 67063 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGSIZE changed from 93250 to 93552 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: FILELIST: added "/usr/share/locale/ckb/LC_MESSAGES/iso_15924.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PKGSIZE changed from 10993 to 11365 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PKGSIZE changed from 21905 to 37697 (+72%)
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PKGSIZE changed from 56049 to 697077 (+1144%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGSIZE changed from 148778 to 149019 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGSIZE changed from 184137 to 705506 (+283%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGSIZE changed from 602413 to 602577 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PKGSIZE changed from 185532 to 185603 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PKGSIZE changed from 54247 to 54703 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGSIZE changed from 43947 to 44208 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pa-pk: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pa-pk: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PKGSIZE changed from 83624 to 87122 (+4%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ro-md: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ro-md: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PKGSIZE changed from 220699 to 234105 (+6%)
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: FILELIST: added "/usr/share/locale/sk/LC_MESSAGES/iso_639_5.mo /usr/share/locale/sk/LC_MESSAGES/iso_639-5.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PKGSIZE changed from 83028 to 84008 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PKGSIZE changed from 864464 to 869036 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: FILELIST: added "/usr/share/locale/zh_CN/LC_MESSAGES/iso_639-5.mo /usr/share/locale/zh_CN/LC_MESSAGES/iso_639_5.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGSIZE changed from 271007 to 278408 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/iso_639-5.mo /usr/share/locale/zh_TW/LC_MESSAGES/iso_639_5.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGSIZE changed from 121592 to 129028 (+6%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-src: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-src: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes/iso-codes: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes/iso-codes: PKGSIZE changed from 3009238 to 3008762 (-0%)
packages/all-poky-linux/iso-codes: PKGV changed from 4.17.0 [default] to 4.18.0 [default]
packages/all-poky-linux/iso-codes: PV changed from "4.17.0" to "4.18.0"
packages/all-poky-linux/iso-codes: PACKAGES: removed "iso-codes-locale-zh-hans iso-codes-locale-zh-hant"

--===============7865469742765704449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: FILELIST: added "/usr/share/locale/ckb/LC_MESSAGES/iso_15924.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PKGSIZE changed from 21905 to 37697 (+72%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PKGSIZE changed from 56049 to 697077 (+1144%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGSIZE changed from 184137 to 705506 (+283%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: FILELIST: added "/usr/share/locale/sk/LC_MESSAGES/iso_639_5.mo /usr/share/locale/sk/LC_MESSAGES/iso_639-5.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: FILELIST: added "/usr/share/locale/zh_CN/LC_MESSAGES/iso_639-5.mo /usr/share/locale/zh_CN/LC_MESSAGES/iso_639_5.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/iso_639-5.mo /usr/share/locale/zh_TW/LC_MESSAGES/iso_639_5.mo"
packages/all-poky-linux/iso-codes: PACKAGES: removed "iso-codes-locale-zh-hans iso-codes-locale-zh-hant"

--===============7865469742765704449==--

