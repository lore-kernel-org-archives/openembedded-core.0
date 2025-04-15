Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DBEC3ABAA
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:06 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.20153.1744723974175266570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=d8gSIf/F;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OuRv1MdX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019639a74305-b7763712-bf37-45a2-bfdd-46dbfc204832-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723985;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QHNO8spARZ02O9lq+JFXGjFwZHeGVxOzZBNwQCB9c/Y=;
	b=d8gSIf/Fgo5XSzQzkV8RXdmDhwIXrqsSO8/nl8a2GqACWIXWSvlyyfzfJ2AGbGlO
	E02KJmVo00MCvhGk6y5idt22fVNBjVpwoyCVVj/9vC/VT2fYXTMNTIPKrpY67aiRXet
	0xuWngI2CxB35/BlU72Iu5nMvgORD62HO5WA2p9U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723985;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QHNO8spARZ02O9lq+JFXGjFwZHeGVxOzZBNwQCB9c/Y=;
	b=OuRv1MdXZC2ukpc77xDDg13bhVE+vo04aUUUSuAYL917QCFwUvCEAk2V+sgbR8tX
	Ri9X9SabWbVwMM+wq/Ymmm749Uc/cn51B5gzXs9cYQuXz3k6zJKo7U5guw9G5FDxCz9
	gW0Y8mMAAb3mfwxqCfB5NZqcHC6uvvV1BCCn0ODE=
Content-Type: multipart/mixed; boundary="===============2607550389790989972=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.8.1 SUCCEEDED
Message-ID: <0101019639a74305-b7763712-bf37-45a2-bfdd-46dbfc204832-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214907

--===============2607550389790989972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xz* to *5.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xz-upgrade-5.6.4-5.8.1.patch
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
From c30810d430b99a8a60c4132aaa9814b576e5cd08 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 09:07:20 +0000
Subject: [PATCH] xz: upgrade 5.6.4 -> 5.8.1

---
 .../xz/{xz_5.6.4.bb => xz_5.8.1.bb}           | 56 ++++++++++++++++++-
 1 file changed, 54 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.6.4.bb => xz_5.8.1.bb} (55%)

diff --git a/meta/recipes-extended/xz/xz_5.6.4.bb b/meta/recipes-extended/xz/xz_5.8.1.bb
similarity index 55%
rename from meta/recipes-extended/xz/xz_5.6.4.bb
rename to meta/recipes-extended/xz/xz_5.8.1.bb
index e48f4dbd7f..534e82c494 100644
--- a/meta/recipes-extended/xz/xz_5.6.4.bb
+++ b/meta/recipes-extended/xz/xz_5.8.1.bb
@@ -1,3 +1,55 @@
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
+# @@ -40,6 +40,12 @@
+#          free software licenses. These aren't built or installed as
+#          part of XZ Utils.
+#  
+# +    The following command may be helpful in finding per-file license
+# +    information. It works on xz.git and on a clean file tree extracted
+# +    from a release tarball.
+# +
+# +        sh build-aux/license-check.sh -v
+# +
+#      For the files under the BSD Zero Clause License (0BSD), if
+#      a copyright notice is needed, the following is sufficient:
+#  
+# @@ -59,25 +65,6 @@
+#        - COPYING.GPLv2: GNU General Public License version 2
+#        - COPYING.GPLv3: GNU General Public License version 3
+#  
+# -    A note about old XZ Utils releases:
+# -
+# -        XZ Utils releases 5.4.6 and older and 5.5.1alpha have a
+# -        significant amount of code put into the public domain and
+# -        that obviously remains so. The switch from public domain to
+# -        0BSD for newer releases was made in Febrary 2024 because
+# -        public domain has (real or perceived) legal ambiguities in
+# -        some jurisdictions.
+# -
+# -        There is very little *practical* difference between public
+# -        domain and 0BSD. The main difference likely is that one
+# -        shouldn't claim that 0BSD-licensed code is in the public
+# -        domain; 0BSD-licensed code is copyrighted but available under
+# -        an extremely permissive license. Neither 0BSD nor public domain
+# -        require retaining or reproducing author, copyright holder, or
+# -        license notices when distributing the software. (Compare to,
+# -        for example, BSD 2-Clause "Simplified" License which does have
+# -        such requirements.)
+# -
+#      If you have questions, don't hesitate to ask for more information.
+#      The contact information is in the README file.
+#  
+# 
+#
+
 SUMMARY = "Utilities for managing LZMA compressed files"
 HOMEPAGE = "https://tukaani.org/xz/"
 DESCRIPTION = "XZ Utils is free general-purpose data compression software with a high compression ratio. XZ Utils were written for POSIX-like systems, but also work on some not-so-POSIX systems. XZ Utils are the successor to LZMA Utils."
@@ -17,7 +69,7 @@ LICENSE:${PN}-dbg = "GPL-2.0-or-later"
 LICENSE:${PN}-locale = "GPL-2.0-or-later"
 LICENSE:liblzma = "0BSD"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=c02de712b028a5cc7e22472e8f2b3db1 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=d38d562f6112174de93a9677682231b2 \
                     file://COPYING.0BSD;md5=0672c210ce80c83444339b9aa31fee2f \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=1ebbd3e34237af26da5dc08a4e440464 \
@@ -28,7 +80,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c02de712b028a5cc7e22472e8f2b3db1 \
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "269e3f2e512cbd3314849982014dc199a7b2148cf5c91cedc6db629acdf5e09b"
+SRC_URI[sha256sum] = "507825b599356c10dca1cd720c9d0d0c9d5400b9de300af00e4d1ea150795543"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
-- 
2.47.1


--===============2607550389790989972==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xz-upgrade-5.6.4-5.8.1.patch"

RnJvbSBjMzA4MTBkNDMwYjk5YThhNjBjNDEzMmFhYTk4MTRiNTc2ZTVjZDA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDk6MDc6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
ejogdXBncmFkZSA1LjYuNCAtPiA1LjguMQoKLS0tCiAuLi4veHove3h6XzUuNi40LmJiID0+IHh6
XzUuOC4xLmJifSAgICAgICAgICAgfCA1NiArKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQveHove3h6XzUuNi40LmJiID0+IHh6XzUuOC4xLmJifSAoNTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC94ei94el81LjYuNC5iYiBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC94ei94el81LjguMS5iYgpzaW1pbGFyaXR5IGluZGV4IDU1JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHoveHpfNS42LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC94ei94el81LjguMS5iYgppbmRleCBlNDhmNGRiZDdmLi41MzRlODJjNDk0
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHoveHpfNS42LjQuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuOC4xLmJiCkBAIC0xLDMgKzEsNTUgQEAKKyMg
RklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAn
ZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRo
ZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgor
IyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1w
bGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhl
IGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC00MCw2ICs0
MCwxMiBAQAorIyAgICAgICAgICBmcmVlIHNvZnR3YXJlIGxpY2Vuc2VzLiBUaGVzZSBhcmVuJ3Qg
YnVpbHQgb3IgaW5zdGFsbGVkIGFzCisjICAgICAgICAgIHBhcnQgb2YgWFogVXRpbHMuCisjICAK
KyMgKyAgICBUaGUgZm9sbG93aW5nIGNvbW1hbmQgbWF5IGJlIGhlbHBmdWwgaW4gZmluZGluZyBw
ZXItZmlsZSBsaWNlbnNlCisjICsgICAgaW5mb3JtYXRpb24uIEl0IHdvcmtzIG9uIHh6LmdpdCBh
bmQgb24gYSBjbGVhbiBmaWxlIHRyZWUgZXh0cmFjdGVkCisjICsgICAgZnJvbSBhIHJlbGVhc2Ug
dGFyYmFsbC4KKyMgKworIyArICAgICAgICBzaCBidWlsZC1hdXgvbGljZW5zZS1jaGVjay5zaCAt
dgorIyArCisjICAgICAgRm9yIHRoZSBmaWxlcyB1bmRlciB0aGUgQlNEIFplcm8gQ2xhdXNlIExp
Y2Vuc2UgKDBCU0QpLCBpZgorIyAgICAgIGEgY29weXJpZ2h0IG5vdGljZSBpcyBuZWVkZWQsIHRo
ZSBmb2xsb3dpbmcgaXMgc3VmZmljaWVudDoKKyMgIAorIyBAQCAtNTksMjUgKzY1LDYgQEAKKyMg
ICAgICAgIC0gQ09QWUlORy5HUEx2MjogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgdmVyc2lv
biAyCisjICAgICAgICAtIENPUFlJTkcuR1BMdjM6IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IHZlcnNpb24gMworIyAgCisjIC0gICAgQSBub3RlIGFib3V0IG9sZCBYWiBVdGlscyByZWxlYXNl
czoKKyMgLQorIyAtICAgICAgICBYWiBVdGlscyByZWxlYXNlcyA1LjQuNiBhbmQgb2xkZXIgYW5k
IDUuNS4xYWxwaGEgaGF2ZSBhCisjIC0gICAgICAgIHNpZ25pZmljYW50IGFtb3VudCBvZiBjb2Rl
IHB1dCBpbnRvIHRoZSBwdWJsaWMgZG9tYWluIGFuZAorIyAtICAgICAgICB0aGF0IG9idmlvdXNs
eSByZW1haW5zIHNvLiBUaGUgc3dpdGNoIGZyb20gcHVibGljIGRvbWFpbiB0bworIyAtICAgICAg
ICAwQlNEIGZvciBuZXdlciByZWxlYXNlcyB3YXMgbWFkZSBpbiBGZWJyYXJ5IDIwMjQgYmVjYXVz
ZQorIyAtICAgICAgICBwdWJsaWMgZG9tYWluIGhhcyAocmVhbCBvciBwZXJjZWl2ZWQpIGxlZ2Fs
IGFtYmlndWl0aWVzIGluCisjIC0gICAgICAgIHNvbWUganVyaXNkaWN0aW9ucy4KKyMgLQorIyAt
ICAgICAgICBUaGVyZSBpcyB2ZXJ5IGxpdHRsZSAqcHJhY3RpY2FsKiBkaWZmZXJlbmNlIGJldHdl
ZW4gcHVibGljCisjIC0gICAgICAgIGRvbWFpbiBhbmQgMEJTRC4gVGhlIG1haW4gZGlmZmVyZW5j
ZSBsaWtlbHkgaXMgdGhhdCBvbmUKKyMgLSAgICAgICAgc2hvdWxkbid0IGNsYWltIHRoYXQgMEJT
RC1saWNlbnNlZCBjb2RlIGlzIGluIHRoZSBwdWJsaWMKKyMgLSAgICAgICAgZG9tYWluOyAwQlNE
LWxpY2Vuc2VkIGNvZGUgaXMgY29weXJpZ2h0ZWQgYnV0IGF2YWlsYWJsZSB1bmRlcgorIyAtICAg
ICAgICBhbiBleHRyZW1lbHkgcGVybWlzc2l2ZSBsaWNlbnNlLiBOZWl0aGVyIDBCU0Qgbm9yIHB1
YmxpYyBkb21haW4KKyMgLSAgICAgICAgcmVxdWlyZSByZXRhaW5pbmcgb3IgcmVwcm9kdWNpbmcg
YXV0aG9yLCBjb3B5cmlnaHQgaG9sZGVyLCBvcgorIyAtICAgICAgICBsaWNlbnNlIG5vdGljZXMg
d2hlbiBkaXN0cmlidXRpbmcgdGhlIHNvZnR3YXJlLiAoQ29tcGFyZSB0bywKKyMgLSAgICAgICAg
Zm9yIGV4YW1wbGUsIEJTRCAyLUNsYXVzZSAiU2ltcGxpZmllZCIgTGljZW5zZSB3aGljaCBkb2Vz
IGhhdmUKKyMgLSAgICAgICAgc3VjaCByZXF1aXJlbWVudHMuKQorIyAtCisjICAgICAgSWYgeW91
IGhhdmUgcXVlc3Rpb25zLCBkb24ndCBoZXNpdGF0ZSB0byBhc2sgZm9yIG1vcmUgaW5mb3JtYXRp
b24uCisjICAgICAgVGhlIGNvbnRhY3QgaW5mb3JtYXRpb24gaXMgaW4gdGhlIFJFQURNRSBmaWxl
LgorIyAgCisjIAorIworCiBTVU1NQVJZID0gIlV0aWxpdGllcyBmb3IgbWFuYWdpbmcgTFpNQSBj
b21wcmVzc2VkIGZpbGVzIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly90dWthYW5pLm9yZy94ei8iCiBE
RVNDUklQVElPTiA9ICJYWiBVdGlscyBpcyBmcmVlIGdlbmVyYWwtcHVycG9zZSBkYXRhIGNvbXBy
ZXNzaW9uIHNvZnR3YXJlIHdpdGggYSBoaWdoIGNvbXByZXNzaW9uIHJhdGlvLiBYWiBVdGlscyB3
ZXJlIHdyaXR0ZW4gZm9yIFBPU0lYLWxpa2Ugc3lzdGVtcywgYnV0IGFsc28gd29yayBvbiBzb21l
IG5vdC1zby1QT1NJWCBzeXN0ZW1zLiBYWiBVdGlscyBhcmUgdGhlIHN1Y2Nlc3NvciB0byBMWk1B
IFV0aWxzLiIKQEAgLTE3LDcgKzY5LDcgQEAgTElDRU5TRToke1BOfS1kYmcgPSAiR1BMLTIuMC1v
ci1sYXRlciIKIExJQ0VOU0U6JHtQTn0tbG9jYWxlID0gIkdQTC0yLjAtb3ItbGF0ZXIiCiBMSUNF
TlNFOmxpYmx6bWEgPSAiMEJTRCIKIAotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlO
RzttZDU9YzAyZGU3MTJiMDI4YTVjYzdlMjI0NzJlOGYyYjNkYjEgXAorTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZDM4ZDU2MmY2MTEyMTc0ZGU5M2E5Njc3NjgyMjMxYjIg
XAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy4wQlNEO21kNT0wNjcyYzIxMGNl
ODBjODM0NDQzMzliOWFhMzFmZWUyZiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZ
SU5HLkdQTHYyO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCiAgICAgICAg
ICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HLkdQTHYzO21kNT0xZWJiZDNlMzQyMzdhZjI2ZGE1
ZGMwOGE0ZTQ0MDQ2NCBcCkBAIC0yOCw3ICs4MCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0NPUFlJTkc7bWQ1PWMwMmRlNzEyYjAyOGE1Y2M3ZTIyNDcyZThmMmIzZGIxIFwKIFNSQ19V
UkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3R1a2FhbmktcHJvamVjdC94ei9yZWxlYXNlcy9kb3du
bG9hZC92JHtQVn0veHotJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVz
dCBcCiAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI2OWUzZjJlNTEyY2JkMzMx
NDg0OTk4MjAxNGRjMTk5YTdiMjE0OGNmNWM5MWNlZGM2ZGI2MjlhY2RmNWUwOWIiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNTA3ODI1YjU5OTM1NmMxMGRjYTFjZDcyMGM5ZDBkMGM5ZDU0MDBiOWRl
MzAwYWYwMGU0ZDFlYTE1MDc5NTU0MyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2Vz
L3RhZy92KD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS90dWthYW5pLXByb2plY3QveHovcmVsZWFzZXMvIgogCi0tIAoyLjQ3LjEK
Cg==

--===============2607550389790989972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9622467 to 9424302 (-2%)
packages/core2-64-poky-linux/xz: PACKAGES: added "xz-locale-ka xz-locale-nl"
packages/core2-64-poky-linux/xz: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz: SRC_URI changed from "https://github.com/tukaani-project/xz/releases/download/v5.6.4/xz-5.6.4.tar.gz file://run-ptest" to "https://github.com/tukaani-project/xz/releases/download/v5.8.1/xz-5.8.1.tar.gz file://run-ptest"
packages/core2-64-poky-linux/xz: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/liblzma: PKGSIZE changed from 194624 to 194808 (+0%)
packages/core2-64-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.6.4", added "/usr/lib/liblzma.so.5.8.1"
packages/core2-64-poky-linux/xz/liblzma: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/liblzma: PV changed from "5.6.4" to "5.8.1"
Changes to packages/core2-64-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.6.4 to liblzma.so.5.8.1
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.6.4 to liblzma.so.5.8.1
  /usr/lib/liblzma.so.5.6.4 moved to /usr/lib/liblzma.so.5.8.1
packages/core2-64-poky-linux/xz/xz-dbg: PKGSIZE changed from 2142224 to 2206032 (+3%)
packages/core2-64-poky-linux/xz/xz-dbg: FILELIST: removed "/usr/lib/.debug/liblzma.so.5.6.4", added "/usr/lib/.debug/liblzma.so.5.8.1"
packages/core2-64-poky-linux/xz/xz-dbg: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-dbg: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-dev: PKGSIZE changed from 226685 to 229962 (+1%)
packages/core2-64-poky-linux/xz/xz-dev: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-dev: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-doc: PKGSIZE changed from 1005987 to 1290628 (+28%)
packages/core2-64-poky-linux/xz/xz-doc: FILELIST: added "/usr/share/man/it/man1/lzmore.1 /usr/share/man/it/man1/xzmore.1 /usr/share/man/it/man1/unxz.1 /usr/share/man/it/man1/lzcmp.1 /usr/share/man/it/man1/xzcmp.1 /usr/share/man/it/man1/lzless.1 /usr/share/man/it/man1/xzless.1 /usr/share/man/it/man1/xzdec.1 /usr/share/man/it/man1/xzcat.1 /usr/share/man/it/man1/lzcat.1 /usr/share/man/sr/man1/lzless.1 /usr/share/man/sr/man1/unlzma.1 /usr/share/man/sr/man1/xzless.1 /usr/share/man/it/man1/unlzma.1 /usr/share/man/it/man1/lzmadec.1 /usr/share/man/it/man1/xz.1 /usr/share/man/sr/man1/lzdiff.1 /usr/share/man/sr/man1/lzma.1 /usr/share/man/sr/man1/xzdiff.1 /usr/share/man/sr/man1/lzmadec.1 /usr/share/man/it/man1/lzdiff.1 /usr/share/man/sr/man1/lzmainfo.1 /usr/share/man/it/man1/xzdiff.1 /usr/share/man/sr/man1/xz.1 /usr/share/man/sr/man1/unxz.1 /usr/share/man/sr/man1/lzfgrep.1 /usr/share/man/it/man1/lzma.1 /usr/share/man/sr/man1/xzfgrep.1 /usr/share/man/sr/man1/lzgrep.1 /usr/share/man/sr/man1/xzgre
 p.1 /usr/share/man/it/man1/xzgrep.1 /usr/share/man/it/man1/lzfgrep.1 /usr/share/man/it/man1/lzgrep.1 /usr/share/man/sr/man1/xzegrep.1 /usr/share/man/sr/man1/lzegrep.1 /usr/share/man/sr/man1/lzcmp.1 /usr/share/man/sr/man1/xzcmp.1 /usr/share/man/it/man1/lzmainfo.1 /usr/share/man/sr/man1/lzmore.1 /usr/share/man/it/man1/lzegrep.1 /usr/share/man/sr/man1/xzmore.1 /usr/share/man/sr/man1/lzcat.1 /usr/share/man/sr/man1/xzdec.1 /usr/share/man/sr/man1/xzcat.1 /usr/share/man/it/man1/xzfgrep.1 /usr/share/man/it/man1/xzegrep.1"
packages/core2-64-poky-linux/xz/xz-doc: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-doc: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-ca: PKGSIZE changed from 31014 to 15587 (-50%)
packages/core2-64-poky-linux/xz/xz-locale-ca: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-ca: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-cs: PKGSIZE changed from 15436 to 7983 (-48%)
packages/core2-64-poky-linux/xz/xz-locale-cs: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-cs: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-da: PKGSIZE changed from 11042 to 9040 (-18%)
packages/core2-64-poky-linux/xz/xz-locale-da: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-da: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-de: PKGSIZE changed from 32560 to 29882 (-8%)
packages/core2-64-poky-linux/xz/xz-locale-de: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-de: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-eo: PKGSIZE changed from 29979 to 15060 (-50%)
packages/core2-64-poky-linux/xz/xz-locale-eo: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-eo: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-es: PKGSIZE changed from 31175 to 29228 (-6%)
packages/core2-64-poky-linux/xz/xz-locale-es: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-es: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-fi: PKGSIZE changed from 21441 to 28225 (+32%)
packages/core2-64-poky-linux/xz/xz-locale-fi: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-fi: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-fr: PKGSIZE changed from 19342 to 10232 (-47%)
packages/core2-64-poky-linux/xz/xz-locale-fr: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-fr: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-hr: PKGSIZE changed from 30343 to 28799 (-5%)
packages/core2-64-poky-linux/xz/xz-locale-hr: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-hr: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-hu: PKGSIZE changed from 31658 to 15949 (-50%)
packages/core2-64-poky-linux/xz/xz-locale-hu: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-hu: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-it: PKGSIZE changed from 19130 to 28688 (+50%)
packages/core2-64-poky-linux/xz/xz-locale-it: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-it: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-ko: PKGSIZE changed from 31480 to 29850 (-5%)
packages/core2-64-poky-linux/xz/xz-locale-ko: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-ko: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-pl: PKGSIZE changed from 30611 to 29090 (-5%)
packages/core2-64-poky-linux/xz/xz-locale-pl: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-pl: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PKGSIZE changed from 30957 to 15660 (-49%)
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-pt: PKGSIZE changed from 18992 to 28796 (+52%)
packages/core2-64-poky-linux/xz/xz-locale-pt: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-pt: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-ro: PKGSIZE changed from 32640 to 30418 (-7%)
packages/core2-64-poky-linux/xz/xz-locale-ro: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-ro: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-sr: PKGSIZE changed from 38426 to 36503 (-5%)
packages/core2-64-poky-linux/xz/xz-locale-sr: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-sr: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-sv: PKGSIZE changed from 30379 to 28399 (-7%)
packages/core2-64-poky-linux/xz/xz-locale-sv: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-sv: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-tr: PKGSIZE changed from 22029 to 28887 (+31%)
packages/core2-64-poky-linux/xz/xz-locale-tr: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-tr: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-uk: PKGSIZE changed from 40332 to 39005 (-3%)
packages/core2-64-poky-linux/xz/xz-locale-uk: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-uk: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-vi: PKGSIZE changed from 32859 to 16808 (-49%)
packages/core2-64-poky-linux/xz/xz-locale-vi: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-vi: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PKGSIZE changed from 28989 to 14488 (-50%)
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-locale-zh-tw: PKGSIZE changed from 28682 to 26773 (-7%)
packages/core2-64-poky-linux/xz/xz-locale-zh-tw: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-locale-zh-tw: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-ptest: PKGSIZE changed from 476511 to 476811 (+0%)
packages/core2-64-poky-linux/xz/xz-ptest: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-ptest: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-src: PKGSIZE changed from 1649222 to 1692651 (+3%)
packages/core2-64-poky-linux/xz/xz-src: FILELIST: directory renamed /usr/src/debug/xz/5.6.4/src/xz -> /usr/src/debug/xz/5.8.1/src/xz, directory renamed /usr/src/debug/xz/5.6.4/src/liblzma/simple -> /usr/src/debug/xz/5.8.1/src/liblzma/simple, directory renamed /usr/src/debug/xz/5.6.4/src/liblzma/common -> /usr/src/debug/xz/5.8.1/src/liblzma/common, directory renamed /usr/src/debug/xz/5.6.4/src/liblzma/lz -> /usr/src/debug/xz/5.8.1/src/liblzma/lz, directory renamed /usr/src/debug/xz/5.6.4/src/liblzma/lzma -> /usr/src/debug/xz/5.8.1/src/liblzma/lzma, directory renamed /usr/src/debug/xz/5.6.4/tests -> /usr/src/debug/xz/5.8.1/tests, directory renamed /usr/src/debug/xz/5.6.4/src/liblzma/api/lzma -> /usr/src/debug/xz/5.8.1/src/liblzma/api/lzma, directory renamed /usr/src/debug/xz/5.6.4/src/lzmainfo -> /usr/src/debug/xz/5.8.1/src/lzmainfo, directory renamed /usr/src/debug/xz/5.6.4/src/liblzma/rangecoder -> /usr/src/debug/xz/5.8.1/src/liblzma/rangecoder, directory renamed /usr/src/debug/xz/5.
 6.4/src/xzdec -> /usr/src/debug/xz/5.8.1/src/xzdec, directory renamed /usr/src/debug/xz/5.6.4/src/liblzma/delta -> /usr/src/debug/xz/5.8.1/src/liblzma/delta, removed "/usr/src/debug/xz/5.6.4/src/liblzma/check/check.h /usr/src/debug/xz/5.6.4/src/common/tuklib_physmem.c /usr/src/debug/xz/5.6.4/src/common/tuklib_cpucores.c /usr/src/debug/xz/5.6.4/src/liblzma/check/check.c /usr/src/debug/xz/5.6.4/src/common/tuklib_cpucores.h /usr/src/debug/xz/5.6.4/src/common/tuklib_physmem.h /usr/src/debug/xz/5.6.4/src/common/tuklib_progname.c /usr/src/debug/xz/5.6.4/src/common/tuklib_progname.h /usr/src/debug/xz/5.6.4/src/common/tuklib_open_stdxxx.h /usr/src/debug/xz/5.6.4/src/liblzma/check/crc32_table_le.h /usr/src/debug/xz/5.6.4/src/common/tuklib_open_stdxxx.c /usr/src/debug/xz/5.6.4/src/liblzma/check/crc32_fast.c /usr/src/debug/xz/5.6.4/src/liblzma/check/crc64_fast.c /usr/src/debug/xz/5.6.4/src/common/tuklib_mbstr_width.c /usr/src/debug/xz/5.6.4/src/liblzma/check/crc_x86_clmul.h /usr/src/debug/xz/5
 .6.4/src/common/tuklib_mbstr_fw.c /usr/src/debug/xz/5.6.4/src/common/tuklib_exit.c /usr/src/debug/xz/5.6.4/src/liblzma/check/crc32_table.c /usr/src/debug/xz/5.6.4/src/liblzma/check/crc64_table.c /usr/src/debug/xz/5.6.4/src/common/tuklib_exit.h /usr/src/debug/xz/5.6.4/src/common/tuklib_integer.h /usr/src/debug/xz/5.6.4/src/common/mythread.h /usr/src/debug/xz/5.6.4/src/common/tuklib_mbstr.h /usr/src/debug/xz/5.6.4/src/liblzma/check/sha256.c /usr/src/debug/xz/5.6.4/src/liblzma/check/crc64_table_le.h", added "/usr/src/debug/xz/5.8.1/src/liblzma/check/check.h /usr/src/debug/xz/5.8.1/src/common/tuklib_physmem.c /usr/src/debug/xz/5.8.1/src/common/tuklib_cpucores.c /usr/src/debug/xz/5.8.1/src/liblzma/check/check.c /usr/src/debug/xz/5.8.1/src/common/tuklib_cpucores.h /usr/src/debug/xz/5.8.1/src/common/tuklib_physmem.h /usr/src/debug/xz/5.8.1/src/common/tuklib_progname.c /usr/src/debug/xz/5.8.1/src/common/tuklib_progname.h /usr/src/debug/xz/5.8.1/src/common/tuklib_open_stdxxx.h /usr/src/debug
 /xz/5.8.1/src/liblzma/check/crc32_table_le.h /usr/src/debug/xz/5.8.1/src/common/tuklib_open_stdxxx.c /usr/src/debug/xz/5.8.1/src/liblzma/check/crc32_fast.c /usr/src/debug/xz/5.8.1/src/liblzma/check/crc64_fast.c /usr/src/debug/xz/5.8.1/src/liblzma/check/crc_common.h /usr/src/debug/xz/5.8.1/src/common/tuklib_mbstr_width.c /usr/src/debug/xz/5.8.1/src/liblzma/check/crc_x86_clmul.h /usr/src/debug/xz/5.8.1/src/common/tuklib_mbstr_fw.c /usr/src/debug/xz/5.8.1/src/common/tuklib_exit.c /usr/src/debug/xz/5.8.1/src/common/tuklib_mbstr_wrap.c /usr/src/debug/xz/5.8.1/src/common/tuklib_mbstr_wrap.h /usr/src/debug/xz/5.8.1/src/common/tuklib_exit.h /usr/src/debug/xz/5.8.1/src/common/tuklib_integer.h /usr/src/debug/xz/5.8.1/src/common/mythread.h /usr/src/debug/xz/5.8.1/src/common/tuklib_mbstr.h /usr/src/debug/xz/5.8.1/src/liblzma/check/sha256.c /usr/src/debug/xz/5.8.1/src/common/tuklib_mbstr_nonprint.c /usr/src/debug/xz/5.8.1/src/common/tuklib_mbstr_nonprint.h /usr/src/debug/xz/5.8.1/src/liblzma/che
 ck/crc64_table_le.h"
packages/core2-64-poky-linux/xz/xz-src: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-src: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz-staticdev: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz-staticdev: PV changed from "5.6.4" to "5.8.1"
packages/core2-64-poky-linux/xz/xz: PKGSIZE changed from 158871 to 167095 (+5%)
packages/core2-64-poky-linux/xz/xz: PKGV changed from 5.6.4 [default] to 5.8.1 [default]
packages/core2-64-poky-linux/xz/xz: PV changed from "5.6.4" to "5.8.1"
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.6.4 to liblzma.so.5.8.1
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.6.4 to liblzma.so.5.8.1
  /usr/lib/liblzma.so.5.6.4 moved to /usr/lib/liblzma.so.5.8.1

--===============2607550389790989972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xz: PACKAGES: added "xz-locale-ka xz-locale-nl"
packages/core2-64-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.6.4", added "/usr/lib/liblzma.so.5.8.1"
Changes to packages/core2-64-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.6.4 to liblzma.so.5.8.1
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.6.4 to liblzma.so.5.8.1
  /usr/lib/liblzma.so.5.6.4 moved to /usr/lib/liblzma.so.5.8.1
packages/core2-64-poky-linux/xz/xz-doc: FILELIST: added "/usr/share/man/sr/man1/lzgrep.1 /usr/share/man/sr/man1/xzgrep.1 /usr/share/man/sr/man1/unxz.1 /usr/share/man/sr/man1/lzfgrep.1 /usr/share/man/sr/man1/xzfgrep.1 /usr/share/man/it/man1/lzcmp.1 /usr/share/man/it/man1/xzcmp.1 /usr/share/man/it/man1/lzgrep.1 /usr/share/man/it/man1/xzgrep.1 /usr/share/man/sr/man1/lzcmp.1 /usr/share/man/sr/man1/xzcmp.1 /usr/share/man/sr/man1/lzdiff.1 /usr/share/man/sr/man1/xzdiff.1 /usr/share/man/it/man1/lzmore.1 /usr/share/man/it/man1/xzmore.1 /usr/share/man/it/man1/lzma.1 /usr/share/man/it/man1/unxz.1 /usr/share/man/it/man1/unlzma.1 /usr/share/man/it/man1/lzmainfo.1 /usr/share/man/it/man1/lzcat.1 /usr/share/man/it/man1/xzcat.1 /usr/share/man/sr/man1/lzmadec.1 /usr/share/man/sr/man1/lzmore.1 /usr/share/man/sr/man1/xzmore.1 /usr/share/man/sr/man1/lzma.1 /usr/share/man/sr/man1/xzdec.1 /usr/share/man/it/man1/xzdiff.1 /usr/share/man/it/man1/lzdiff.1 /usr/share/man/it/man1/xzegrep.1 /usr/share/man/it/man1
 /lzegrep.1 /usr/share/man/it/man1/lzfgrep.1 /usr/share/man/sr/man1/unlzma.1 /usr/share/man/it/man1/xzfgrep.1 /usr/share/man/it/man1/lzless.1 /usr/share/man/it/man1/xzdec.1 /usr/share/man/it/man1/xzless.1 /usr/share/man/sr/man1/lzcat.1 /usr/share/man/sr/man1/xzcat.1 /usr/share/man/sr/man1/lzmainfo.1 /usr/share/man/it/man1/xz.1 /usr/share/man/sr/man1/lzless.1 /usr/share/man/sr/man1/xz.1 /usr/share/man/sr/man1/lzegrep.1 /usr/share/man/sr/man1/xzegrep.1 /usr/share/man/it/man1/lzmadec.1 /usr/share/man/sr/man1/xzless.1"
packages/core2-64-poky-linux/xz/xz-doc: PKGSIZE changed from 1005987 to 1290628 (+28%)
packages/core2-64-poky-linux/xz/xz-locale-ca: PKGSIZE changed from 31014 to 15587 (-50%)
packages/core2-64-poky-linux/xz/xz-locale-cs: PKGSIZE changed from 15436 to 7983 (-48%)
packages/core2-64-poky-linux/xz/xz-locale-da: PKGSIZE changed from 11042 to 9040 (-18%)
packages/core2-64-poky-linux/xz/xz-locale-eo: PKGSIZE changed from 29979 to 15060 (-50%)
packages/core2-64-poky-linux/xz/xz-locale-fi: PKGSIZE changed from 21441 to 28225 (+32%)
packages/core2-64-poky-linux/xz/xz-locale-fr: PKGSIZE changed from 19342 to 10232 (-47%)
packages/core2-64-poky-linux/xz/xz-locale-hu: PKGSIZE changed from 31658 to 15949 (-50%)
packages/core2-64-poky-linux/xz/xz-locale-it: PKGSIZE changed from 19130 to 28688 (+50%)
packages/core2-64-poky-linux/xz/xz-locale-pt-br: PKGSIZE changed from 30957 to 15660 (-49%)
packages/core2-64-poky-linux/xz/xz-locale-pt: PKGSIZE changed from 18992 to 28796 (+52%)
packages/core2-64-poky-linux/xz/xz-locale-tr: PKGSIZE changed from 22029 to 28887 (+31%)
packages/core2-64-poky-linux/xz/xz-locale-vi: PKGSIZE changed from 32859 to 16808 (-49%)
packages/core2-64-poky-linux/xz/xz-locale-zh-cn: PKGSIZE changed from 28989 to 14488 (-50%)
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.6.4 to liblzma.so.5.8.1
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.6.4 to liblzma.so.5.8.1
  /usr/lib/liblzma.so.5.6.4 moved to /usr/lib/liblzma.so.5.8.1

--===============2607550389790989972==--

