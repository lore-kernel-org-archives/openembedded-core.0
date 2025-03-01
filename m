Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4DFC36017
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:40 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.7045.1740828318040449150
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JWW7LMq/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=G9cpb4O6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019551746a2e-c166e2ed-22fd-47af-9fd0-0760479d4b73-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=i4uHause4hqCy242SHfw6k1NU1QM7rfmNP7XQYTjJ0Y=;
	b=JWW7LMq/xOq5q5/mxmmRiBiFWLoyTTXhaOn8qVPu1ZYh+2rfLA5yWBMeLF6M+Mx2
	tm0mPFlWqR+bB0zuwmHrY6bDyMkgCKym7pyELCPHa4wJfiqnOv5Qtc5aC54w6bwzZ5N
	gE4UIoYeyPza18iahDlw/XRO9B28Y3py2GKO0O+E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=i4uHause4hqCy242SHfw6k1NU1QM7rfmNP7XQYTjJ0Y=;
	b=G9cpb4O6lm/+g2+eKBFUn+9fTA2muEaL+tJME64Q+m+tuGH88F53YVQEe3eI+zOl
	iD6HLcEzjkZAVn5tkKT9ZY18LUfoaGkl0lBioW2+LN+vDuJ+sP7Bc+BTDWrpdPCdBDB
	SJjVXkt6AGAaRDxlQYALwvPIyBqtjTFyCUFUVbI0=
Content-Type: multipart/mixed; boundary="===============2107093595188567020=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael@opdenacker.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] flac: upgrading to 1.5.0 FAILED
Message-ID: <0101019551746a2e-c166e2ed-22fd-47af-9fd0-0760479d4b73-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212171

--===============2107093595188567020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *flac* to *1.5.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-flac-upgrade-1.4.3-1.5.0.patch
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
From 237afa626409e2524427daaa35d5f67c62300042 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 11:01:43 +0000
Subject: [PATCH] flac: upgrade 1.4.3 -> 1.5.0

---
 .../flac/{flac_1.4.3.bb => flac_1.5.0.bb}     | 267 +++++++++++++++++-
 1 file changed, 261 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/flac/{flac_1.4.3.bb => flac_1.5.0.bb} (11%)

diff --git a/meta/recipes-multimedia/flac/flac_1.4.3.bb b/meta/recipes-multimedia/flac/flac_1.5.0.bb
similarity index 11%
rename from meta/recipes-multimedia/flac/flac_1.4.3.bb
rename to meta/recipes-multimedia/flac/flac_1.5.0.bb
index 87b67bee1f..6ded131bf6 100644
--- a/meta/recipes-multimedia/flac/flac_1.4.3.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -1,19 +1,274 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING.FDL
+# +++ COPYING.FDL
+# @@ -1,12 +1,12 @@
+# -		GNU Free Documentation License
+# -		  Version 1.2, November 2002
+# -
+# -
+# - Copyright (C) 2000,2001,2002  Free Software Foundation, Inc.
+# -     51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+# +
+# +                GNU Free Documentation License
+# +                 Version 1.3, 3 November 2008
+# +
+# +
+# + Copyright (C) 2000, 2001, 2002, 2007, 2008 Free Software Foundation, Inc.
+# +     <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+# -
+#  
+#  0. PREAMBLE
+#  
+# @@ -50,11 +50,11 @@
+#  
+#  A "Secondary Section" is a named appendix or a front-matter section of
+#  the Document that deals exclusively with the relationship of the
+# -publishers or authors of the Document to the Document's overall subject
+# -(or to related matters) and contains nothing that could fall directly
+# -within that overall subject.  (Thus, if the Document is in part a
+# -textbook of mathematics, a Secondary Section may not explain any
+# -mathematics.)  The relationship could be a matter of historical
+# +publishers or authors of the Document to the Document's overall
+# +subject (or to related matters) and contains nothing that could fall
+# +directly within that overall subject.  (Thus, if the Document is in
+# +part a textbook of mathematics, a Secondary Section may not explain
+# +any mathematics.)  The relationship could be a matter of historical
+#  connection with the subject or with related matters, or of legal,
+#  commercial, philosophical, ethical or political position regarding
+#  them.
+# @@ -103,6 +103,9 @@
+#  the text near the most prominent appearance of the work's title,
+#  preceding the beginning of the body of the text.
+#  
+# +The "publisher" means any person or entity that distributes copies of
+# +the Document to the public.
+# +
+#  A section "Entitled XYZ" means a named subunit of the Document whose
+#  title either is precisely XYZ or contains XYZ in parentheses following
+#  text that translates XYZ in another language.  (Here XYZ stands for a
+# @@ -118,14 +121,13 @@
+#  implication that these Warranty Disclaimers may have is void and has
+#  no effect on the meaning of this License.
+#  
+# -
+#  2. VERBATIM COPYING
+#  
+#  You may copy and distribute the Document in any medium, either
+#  commercially or noncommercially, provided that this License, the
+#  copyright notices, and the license notice saying this License applies
+# -to the Document are reproduced in all copies, and that you add no other
+# -conditions whatsoever to those of this License.  You may not use
+# +to the Document are reproduced in all copies, and that you add no
+# +other conditions whatsoever to those of this License.  You may not use
+#  technical measures to obstruct or control the reading or further
+#  copying of the copies you make or distribute.  However, you may accept
+#  compensation in exchange for copies.  If you distribute a large enough
+# @@ -169,8 +171,9 @@
+#  edition to the public.
+#  
+#  It is requested, but not required, that you contact the authors of the
+# -Document well before redistributing any large number of copies, to give
+# -them a chance to provide you with an updated version of the Document.
+# +Document well before redistributing any large number of copies, to
+# +give them a chance to provide you with an updated version of the
+# +Document.
+#  
+#  
+#  4. MODIFICATIONS
+# @@ -285,16 +288,18 @@
+#  
+#  6. COLLECTIONS OF DOCUMENTS
+#  
+# -You may make a collection consisting of the Document and other documents
+# -released under this License, and replace the individual copies of this
+# -License in the various documents with a single copy that is included in
+# -the collection, provided that you follow the rules of this License for
+# -verbatim copying of each of the documents in all other respects.
+# -
+# -You may extract a single document from such a collection, and distribute
+# -it individually under this License, provided you insert a copy of this
+# -License into the extracted document, and follow this License in all
+# -other respects regarding verbatim copying of that document.
+# +You may make a collection consisting of the Document and other
+# +documents released under this License, and replace the individual
+# +copies of this License in the various documents with a single copy
+# +that is included in the collection, provided that you follow the rules
+# +of this License for verbatim copying of each of the documents in all
+# +other respects.
+# +
+# +You may extract a single document from such a collection, and
+# +distribute it individually under this License, provided you insert a
+# +copy of this License into the extracted document, and follow this
+# +License in all other respects regarding verbatim copying of that
+# +document.
+#  
+#  
+#  7. AGGREGATION WITH INDEPENDENT WORKS
+# @@ -340,22 +345,39 @@
+#  
+#  9. TERMINATION
+#  
+# -You may not copy, modify, sublicense, or distribute the Document except
+# -as expressly provided for under this License.  Any other attempt to
+# -copy, modify, sublicense or distribute the Document is void, and will
+# -automatically terminate your rights under this License.  However,
+# -parties who have received copies, or rights, from you under this
+# -License will not have their licenses terminated so long as such
+# -parties remain in full compliance.
+# +You may not copy, modify, sublicense, or distribute the Document
+# +except as expressly provided under this License.  Any attempt
+# +otherwise to copy, modify, sublicense, or distribute it is void, and
+# +will automatically terminate your rights under this License.
+# +
+# +However, if you cease all violation of this License, then your license
+# +from a particular copyright holder is reinstated (a) provisionally,
+# +unless and until the copyright holder explicitly and finally
+# +terminates your license, and (b) permanently, if the copyright holder
+# +fails to notify you of the violation by some reasonable means prior to
+# +60 days after the cessation.
+# +
+# +Moreover, your license from a particular copyright holder is
+# +reinstated permanently if the copyright holder notifies you of the
+# +violation by some reasonable means, this is the first time you have
+# +received notice of violation of this License (for any work) from that
+# +copyright holder, and you cure the violation prior to 30 days after
+# +your receipt of the notice.
+# +
+# +Termination of your rights under this section does not terminate the
+# +licenses of parties who have received copies or rights from you under
+# +this License.  If your rights have been terminated and not permanently
+# +reinstated, receipt of a copy of some or all of the same material does
+# +not give you any rights to use it.
+#  
+#  
+#  10. FUTURE REVISIONS OF THIS LICENSE
+#  
+# -The Free Software Foundation may publish new, revised versions
+# -of the GNU Free Documentation License from time to time.  Such new
+# -versions will be similar in spirit to the present version, but may
+# -differ in detail to address new problems or concerns.  See
+# -http://www.gnu.org/copyleft/.
+# +The Free Software Foundation may publish new, revised versions of the
+# +GNU Free Documentation License from time to time.  Such new versions
+# +will be similar in spirit to the present version, but may differ in
+# +detail to address new problems or concerns.  See
+# +https://www.gnu.org/licenses/.
+#  
+#  Each version of the License is given a distinguishing version number.
+#  If the Document specifies that a particular numbered version of this
+# @@ -364,7 +386,39 @@
+#  of any later version that has been published (not as a draft) by the
+#  Free Software Foundation.  If the Document does not specify a version
+#  number of this License, you may choose any version ever published (not
+# -as a draft) by the Free Software Foundation.
+# +as a draft) by the Free Software Foundation.  If the Document
+# +specifies that a proxy can decide which future versions of this
+# +License can be used, that proxy's public statement of acceptance of a
+# +version permanently authorizes you to choose that version for the
+# +Document.
+# +
+# +11. RELICENSING
+# +
+# +"Massive Multiauthor Collaboration Site" (or "MMC Site") means any
+# +World Wide Web server that publishes copyrightable works and also
+# +provides prominent facilities for anybody to edit those works.  A
+# +public wiki that anybody can edit is an example of such a server.  A
+# +"Massive Multiauthor Collaboration" (or "MMC") contained in the site
+# +means any set of copyrightable works thus published on the MMC site.
+# +
+# +"CC-BY-SA" means the Creative Commons Attribution-Share Alike 3.0
+# +license published by Creative Commons Corporation, a not-for-profit
+# +corporation with a principal place of business in San Francisco,
+# +California, as well as future copyleft versions of that license
+# +published by that same organization.
+# +
+# +"Incorporate" means to publish or republish a Document, in whole or in
+# +part, as part of another Document.
+# +
+# +An MMC is "eligible for relicensing" if it is licensed under this
+# +License, and if all works that were first published under this License
+# +somewhere other than this MMC, and subsequently incorporated in whole or
+# +in part into the MMC, (1) had no cover texts or invariant sections, and
+# +(2) were thus incorporated prior to November 1, 2008.
+# +
+# +The operator of an MMC Site may republish an MMC contained in the site
+# +under CC-BY-SA on the same site at any time before August 1, 2009,
+# +provided the MMC is eligible for relicensing.
+#  
+#  
+#  ADDENDUM: How to use this License for your documents
+# @@ -375,7 +429,7 @@
+#  
+#      Copyright (c)  YEAR  YOUR NAME.
+#      Permission is granted to copy, distribute and/or modify this document
+# -    under the terms of the GNU Free Documentation License, Version 1.2
+# +    under the terms of the GNU Free Documentation License, Version 1.3
+#      or any later version published by the Free Software Foundation;
+#      with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
+#      A copy of the license is included in the section entitled "GNU
+# @@ -394,4 +448,4 @@
+#  If your document contains nontrivial examples of program code, we
+#  recommend releasing these examples in parallel under your choice of
+#  free software license, such as the GNU General Public License,
+# -to permit their use in free software.
+# +to permit their use in free software.--- src/Makefile.am
+# +++ src/Makefile.am
+# @@ -1,6 +1,6 @@
+#  #  FLAC - Free Lossless Audio Codec
+#  #  Copyright (C) 2001-2009  Josh Coalson
+# -#  Copyright (C) 2011-2023  Xiph.Org Foundation
+# +#  Copyright (C) 2011-2025  Xiph.Org Foundation
+#  #
+#  #  This file is part the FLAC project.  FLAC is comprised of several
+#  #  components distributed under different licenses.  The codec libraries
+# --- src/flac/main.c
+# +++ src/flac/main.c
+# @@ -1,6 +1,6 @@
+#  /* flac - Command-line FLAC encoder/decoder
+#   * Copyright (C) 2000-2009  Josh Coalson
+# - * Copyright (C) 2011-2023  Xiph.Org Foundation
+# + * Copyright (C) 2011-2025  Xiph.Org Foundation
+#   *
+#   * This program is free software; you can redistribute it and/or
+#   * modify it under the terms of the GNU General Public License
+# --- COPYING.Xiph
+# +++ COPYING.Xiph
+# @@ -1,5 +1,5 @@
+#  Copyright (C) 2000-2009  Josh Coalson
+# -Copyright (C) 2011-2023  Xiph.Org Foundation
+# +Copyright (C) 2011-2025  Xiph.Org Foundation
+#  
+#  Redistribution and use in source and binary forms, with or without
+#  modification, are permitted provided that the following conditions
+# 
+#
+
 SUMMARY = "Free Lossless Audio Codec"
 DESCRIPTION = "FLAC stands for Free Lossless Audio Codec, a lossless audio compression format."
 HOMEPAGE = "https://xiph.org/flac/"
 BUGTRACKER = "https://github.com/xiph/flac/issues"
 SECTION = "libs"
 LICENSE = "GFDL-1.2 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
-                    file://src/Makefile.am;beginline=1;endline=17;md5=b1dab2704be7f01bfbd9b7f6d5f000a9 \
+LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=802e79e394e372d01e863e3f4058cf40 \
+                    file://src/Makefile.am;beginline=1;endline=17;md5=9c882153132df8f3a1cb1a8ca1f2350f \
                     file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://src/flac/main.c;beginline=1;endline=18;md5=23099119c034d894bd1bf7ef5bd22101 \
+                    file://src/flac/main.c;beginline=1;endline=18;md5=1e826b5083ba1e028852fe7ceec6a8ad \
                     file://COPYING.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://COPYING.Xiph;md5=0c90e41ab2fa7e69ca9391330d870221 \
-                    file://include/FLAC/all.h;beginline=65;endline=70;md5=39aaf5e03c7364363884c8b8ddda8eea"
+                    file://COPYING.Xiph;md5=78a131b2ea50675d245d280ccc34f8b6 \
+                    file://include/FLAC/all.h;beginline=65;endline=70;md5=39aaf5e03c7364363884c8b8ddda8eea \
+                    "
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
-SRC_URI[sha256sum] = "6c58e69cd22348f441b861092b825e591d0b822e106de6eb0ee4d05d27205b70"
+SRC_URI[sha256sum] = "f2c1c76592a82ffff8413ba3c4a1299b6c7ab06c734dee03fd88630485c2b920"
 
 CVE_PRODUCT = "libflac flac"
 
-- 
2.44.1


--===============2107093595188567020==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-flac-upgrade-1.4.3-1.5.0.patch"

RnJvbSAyMzdhZmE2MjY0MDllMjUyNDQyN2RhYWEzNWQ1ZjY3YzYyMzAwMDQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAxMTowMTo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZs
YWM6IHVwZ3JhZGUgMS40LjMgLT4gMS41LjAKCi0tLQogLi4uL2ZsYWMve2ZsYWNfMS40LjMuYmIg
PT4gZmxhY18xLjUuMC5iYn0gICAgIHwgMjY3ICsrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNo
YW5nZWQsIDI2MSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2ZsYWMve2ZsYWNfMS40LjMuYmIgPT4gZmxhY18xLjUuMC5iYn0gKDEx
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mbGFjL2ZsYWNfMS40LjMu
YmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mbGFjL2ZsYWNfMS41LjAuYmIKc2ltaWxhcml0
eSBpbmRleCAxMSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmxhYy9mbGFj
XzEuNC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mbGFjL2ZsYWNfMS41
LjAuYmIKaW5kZXggODdiNjdiZWUxZi4uNmRlZDEzMWJmNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZmxhYy9mbGFjXzEuNC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2ZsYWMvZmxhY18xLjUuMC5iYgpAQCAtMSwxOSArMSwyNzQgQEAKKyMgRklYTUU6IHRo
ZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1
cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBv
bGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNF
IHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29t
bWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNl
bnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6
CisjCisjIC0tLSBDT1BZSU5HLkZETAorIyArKysgQ09QWUlORy5GREwKKyMgQEAgLTEsMTIgKzEs
MTIgQEAKKyMgLQkJR05VIEZyZWUgRG9jdW1lbnRhdGlvbiBMaWNlbnNlCisjIC0JCSAgVmVyc2lv
biAxLjIsIE5vdmVtYmVyIDIwMDIKKyMgLQorIyAtCisjIC0gQ29weXJpZ2h0IChDKSAyMDAwLDIw
MDEsMjAwMiAgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisjIC0gICAgIDUxIEZyYW5r
bGluIFN0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSAgVVNBCisjICsKKyMg
KyAgICAgICAgICAgICAgICBHTlUgRnJlZSBEb2N1bWVudGF0aW9uIExpY2Vuc2UKKyMgKyAgICAg
ICAgICAgICAgICAgVmVyc2lvbiAxLjMsIDMgTm92ZW1iZXIgMjAwOAorIyArCisjICsKKyMgKyBD
b3B5cmlnaHQgKEMpIDIwMDAsIDIwMDEsIDIwMDIsIDIwMDcsIDIwMDggRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uLCBJbmMuCisjICsgICAgIDxodHRwczovL2ZzZi5vcmcvPgorIyAgIEV2ZXJ5b25l
IGlzIHBlcm1pdHRlZCB0byBjb3B5IGFuZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGllcworIyAg
IG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwgYnV0IGNoYW5naW5nIGl0IGlzIG5vdCBhbGxvd2Vk
LgorIyAtCisjICAKKyMgIDAuIFBSRUFNQkxFCisjICAKKyMgQEAgLTUwLDExICs1MCwxMSBAQAor
IyAgCisjICBBICJTZWNvbmRhcnkgU2VjdGlvbiIgaXMgYSBuYW1lZCBhcHBlbmRpeCBvciBhIGZy
b250LW1hdHRlciBzZWN0aW9uIG9mCisjICB0aGUgRG9jdW1lbnQgdGhhdCBkZWFscyBleGNsdXNp
dmVseSB3aXRoIHRoZSByZWxhdGlvbnNoaXAgb2YgdGhlCisjIC1wdWJsaXNoZXJzIG9yIGF1dGhv
cnMgb2YgdGhlIERvY3VtZW50IHRvIHRoZSBEb2N1bWVudCdzIG92ZXJhbGwgc3ViamVjdAorIyAt
KG9yIHRvIHJlbGF0ZWQgbWF0dGVycykgYW5kIGNvbnRhaW5zIG5vdGhpbmcgdGhhdCBjb3VsZCBm
YWxsIGRpcmVjdGx5CisjIC13aXRoaW4gdGhhdCBvdmVyYWxsIHN1YmplY3QuICAoVGh1cywgaWYg
dGhlIERvY3VtZW50IGlzIGluIHBhcnQgYQorIyAtdGV4dGJvb2sgb2YgbWF0aGVtYXRpY3MsIGEg
U2Vjb25kYXJ5IFNlY3Rpb24gbWF5IG5vdCBleHBsYWluIGFueQorIyAtbWF0aGVtYXRpY3MuKSAg
VGhlIHJlbGF0aW9uc2hpcCBjb3VsZCBiZSBhIG1hdHRlciBvZiBoaXN0b3JpY2FsCisjICtwdWJs
aXNoZXJzIG9yIGF1dGhvcnMgb2YgdGhlIERvY3VtZW50IHRvIHRoZSBEb2N1bWVudCdzIG92ZXJh
bGwKKyMgK3N1YmplY3QgKG9yIHRvIHJlbGF0ZWQgbWF0dGVycykgYW5kIGNvbnRhaW5zIG5vdGhp
bmcgdGhhdCBjb3VsZCBmYWxsCisjICtkaXJlY3RseSB3aXRoaW4gdGhhdCBvdmVyYWxsIHN1Ympl
Y3QuICAoVGh1cywgaWYgdGhlIERvY3VtZW50IGlzIGluCisjICtwYXJ0IGEgdGV4dGJvb2sgb2Yg
bWF0aGVtYXRpY3MsIGEgU2Vjb25kYXJ5IFNlY3Rpb24gbWF5IG5vdCBleHBsYWluCisjICthbnkg
bWF0aGVtYXRpY3MuKSAgVGhlIHJlbGF0aW9uc2hpcCBjb3VsZCBiZSBhIG1hdHRlciBvZiBoaXN0
b3JpY2FsCisjICBjb25uZWN0aW9uIHdpdGggdGhlIHN1YmplY3Qgb3Igd2l0aCByZWxhdGVkIG1h
dHRlcnMsIG9yIG9mIGxlZ2FsLAorIyAgY29tbWVyY2lhbCwgcGhpbG9zb3BoaWNhbCwgZXRoaWNh
bCBvciBwb2xpdGljYWwgcG9zaXRpb24gcmVnYXJkaW5nCisjICB0aGVtLgorIyBAQCAtMTAzLDYg
KzEwMyw5IEBACisjICB0aGUgdGV4dCBuZWFyIHRoZSBtb3N0IHByb21pbmVudCBhcHBlYXJhbmNl
IG9mIHRoZSB3b3JrJ3MgdGl0bGUsCisjICBwcmVjZWRpbmcgdGhlIGJlZ2lubmluZyBvZiB0aGUg
Ym9keSBvZiB0aGUgdGV4dC4KKyMgIAorIyArVGhlICJwdWJsaXNoZXIiIG1lYW5zIGFueSBwZXJz
b24gb3IgZW50aXR5IHRoYXQgZGlzdHJpYnV0ZXMgY29waWVzIG9mCisjICt0aGUgRG9jdW1lbnQg
dG8gdGhlIHB1YmxpYy4KKyMgKworIyAgQSBzZWN0aW9uICJFbnRpdGxlZCBYWVoiIG1lYW5zIGEg
bmFtZWQgc3VidW5pdCBvZiB0aGUgRG9jdW1lbnQgd2hvc2UKKyMgIHRpdGxlIGVpdGhlciBpcyBw
cmVjaXNlbHkgWFlaIG9yIGNvbnRhaW5zIFhZWiBpbiBwYXJlbnRoZXNlcyBmb2xsb3dpbmcKKyMg
IHRleHQgdGhhdCB0cmFuc2xhdGVzIFhZWiBpbiBhbm90aGVyIGxhbmd1YWdlLiAgKEhlcmUgWFla
IHN0YW5kcyBmb3IgYQorIyBAQCAtMTE4LDE0ICsxMjEsMTMgQEAKKyMgIGltcGxpY2F0aW9uIHRo
YXQgdGhlc2UgV2FycmFudHkgRGlzY2xhaW1lcnMgbWF5IGhhdmUgaXMgdm9pZCBhbmQgaGFzCisj
ICBubyBlZmZlY3Qgb24gdGhlIG1lYW5pbmcgb2YgdGhpcyBMaWNlbnNlLgorIyAgCisjIC0KKyMg
IDIuIFZFUkJBVElNIENPUFlJTkcKKyMgIAorIyAgWW91IG1heSBjb3B5IGFuZCBkaXN0cmlidXRl
IHRoZSBEb2N1bWVudCBpbiBhbnkgbWVkaXVtLCBlaXRoZXIKKyMgIGNvbW1lcmNpYWxseSBvciBu
b25jb21tZXJjaWFsbHksIHByb3ZpZGVkIHRoYXQgdGhpcyBMaWNlbnNlLCB0aGUKKyMgIGNvcHly
aWdodCBub3RpY2VzLCBhbmQgdGhlIGxpY2Vuc2Ugbm90aWNlIHNheWluZyB0aGlzIExpY2Vuc2Ug
YXBwbGllcworIyAtdG8gdGhlIERvY3VtZW50IGFyZSByZXByb2R1Y2VkIGluIGFsbCBjb3BpZXMs
IGFuZCB0aGF0IHlvdSBhZGQgbm8gb3RoZXIKKyMgLWNvbmRpdGlvbnMgd2hhdHNvZXZlciB0byB0
aG9zZSBvZiB0aGlzIExpY2Vuc2UuICBZb3UgbWF5IG5vdCB1c2UKKyMgK3RvIHRoZSBEb2N1bWVu
dCBhcmUgcmVwcm9kdWNlZCBpbiBhbGwgY29waWVzLCBhbmQgdGhhdCB5b3UgYWRkIG5vCisjICtv
dGhlciBjb25kaXRpb25zIHdoYXRzb2V2ZXIgdG8gdGhvc2Ugb2YgdGhpcyBMaWNlbnNlLiAgWW91
IG1heSBub3QgdXNlCisjICB0ZWNobmljYWwgbWVhc3VyZXMgdG8gb2JzdHJ1Y3Qgb3IgY29udHJv
bCB0aGUgcmVhZGluZyBvciBmdXJ0aGVyCisjICBjb3B5aW5nIG9mIHRoZSBjb3BpZXMgeW91IG1h
a2Ugb3IgZGlzdHJpYnV0ZS4gIEhvd2V2ZXIsIHlvdSBtYXkgYWNjZXB0CisjICBjb21wZW5zYXRp
b24gaW4gZXhjaGFuZ2UgZm9yIGNvcGllcy4gIElmIHlvdSBkaXN0cmlidXRlIGEgbGFyZ2UgZW5v
dWdoCisjIEBAIC0xNjksOCArMTcxLDkgQEAKKyMgIGVkaXRpb24gdG8gdGhlIHB1YmxpYy4KKyMg
IAorIyAgSXQgaXMgcmVxdWVzdGVkLCBidXQgbm90IHJlcXVpcmVkLCB0aGF0IHlvdSBjb250YWN0
IHRoZSBhdXRob3JzIG9mIHRoZQorIyAtRG9jdW1lbnQgd2VsbCBiZWZvcmUgcmVkaXN0cmlidXRp
bmcgYW55IGxhcmdlIG51bWJlciBvZiBjb3BpZXMsIHRvIGdpdmUKKyMgLXRoZW0gYSBjaGFuY2Ug
dG8gcHJvdmlkZSB5b3Ugd2l0aCBhbiB1cGRhdGVkIHZlcnNpb24gb2YgdGhlIERvY3VtZW50Lgor
IyArRG9jdW1lbnQgd2VsbCBiZWZvcmUgcmVkaXN0cmlidXRpbmcgYW55IGxhcmdlIG51bWJlciBv
ZiBjb3BpZXMsIHRvCisjICtnaXZlIHRoZW0gYSBjaGFuY2UgdG8gcHJvdmlkZSB5b3Ugd2l0aCBh
biB1cGRhdGVkIHZlcnNpb24gb2YgdGhlCisjICtEb2N1bWVudC4KKyMgIAorIyAgCisjICA0LiBN
T0RJRklDQVRJT05TCisjIEBAIC0yODUsMTYgKzI4OCwxOCBAQAorIyAgCisjICA2LiBDT0xMRUNU
SU9OUyBPRiBET0NVTUVOVFMKKyMgIAorIyAtWW91IG1heSBtYWtlIGEgY29sbGVjdGlvbiBjb25z
aXN0aW5nIG9mIHRoZSBEb2N1bWVudCBhbmQgb3RoZXIgZG9jdW1lbnRzCisjIC1yZWxlYXNlZCB1
bmRlciB0aGlzIExpY2Vuc2UsIGFuZCByZXBsYWNlIHRoZSBpbmRpdmlkdWFsIGNvcGllcyBvZiB0
aGlzCisjIC1MaWNlbnNlIGluIHRoZSB2YXJpb3VzIGRvY3VtZW50cyB3aXRoIGEgc2luZ2xlIGNv
cHkgdGhhdCBpcyBpbmNsdWRlZCBpbgorIyAtdGhlIGNvbGxlY3Rpb24sIHByb3ZpZGVkIHRoYXQg
eW91IGZvbGxvdyB0aGUgcnVsZXMgb2YgdGhpcyBMaWNlbnNlIGZvcgorIyAtdmVyYmF0aW0gY29w
eWluZyBvZiBlYWNoIG9mIHRoZSBkb2N1bWVudHMgaW4gYWxsIG90aGVyIHJlc3BlY3RzLgorIyAt
CisjIC1Zb3UgbWF5IGV4dHJhY3QgYSBzaW5nbGUgZG9jdW1lbnQgZnJvbSBzdWNoIGEgY29sbGVj
dGlvbiwgYW5kIGRpc3RyaWJ1dGUKKyMgLWl0IGluZGl2aWR1YWxseSB1bmRlciB0aGlzIExpY2Vu
c2UsIHByb3ZpZGVkIHlvdSBpbnNlcnQgYSBjb3B5IG9mIHRoaXMKKyMgLUxpY2Vuc2UgaW50byB0
aGUgZXh0cmFjdGVkIGRvY3VtZW50LCBhbmQgZm9sbG93IHRoaXMgTGljZW5zZSBpbiBhbGwKKyMg
LW90aGVyIHJlc3BlY3RzIHJlZ2FyZGluZyB2ZXJiYXRpbSBjb3B5aW5nIG9mIHRoYXQgZG9jdW1l
bnQuCisjICtZb3UgbWF5IG1ha2UgYSBjb2xsZWN0aW9uIGNvbnNpc3Rpbmcgb2YgdGhlIERvY3Vt
ZW50IGFuZCBvdGhlcgorIyArZG9jdW1lbnRzIHJlbGVhc2VkIHVuZGVyIHRoaXMgTGljZW5zZSwg
YW5kIHJlcGxhY2UgdGhlIGluZGl2aWR1YWwKKyMgK2NvcGllcyBvZiB0aGlzIExpY2Vuc2UgaW4g
dGhlIHZhcmlvdXMgZG9jdW1lbnRzIHdpdGggYSBzaW5nbGUgY29weQorIyArdGhhdCBpcyBpbmNs
dWRlZCBpbiB0aGUgY29sbGVjdGlvbiwgcHJvdmlkZWQgdGhhdCB5b3UgZm9sbG93IHRoZSBydWxl
cworIyArb2YgdGhpcyBMaWNlbnNlIGZvciB2ZXJiYXRpbSBjb3B5aW5nIG9mIGVhY2ggb2YgdGhl
IGRvY3VtZW50cyBpbiBhbGwKKyMgK290aGVyIHJlc3BlY3RzLgorIyArCisjICtZb3UgbWF5IGV4
dHJhY3QgYSBzaW5nbGUgZG9jdW1lbnQgZnJvbSBzdWNoIGEgY29sbGVjdGlvbiwgYW5kCisjICtk
aXN0cmlidXRlIGl0IGluZGl2aWR1YWxseSB1bmRlciB0aGlzIExpY2Vuc2UsIHByb3ZpZGVkIHlv
dSBpbnNlcnQgYQorIyArY29weSBvZiB0aGlzIExpY2Vuc2UgaW50byB0aGUgZXh0cmFjdGVkIGRv
Y3VtZW50LCBhbmQgZm9sbG93IHRoaXMKKyMgK0xpY2Vuc2UgaW4gYWxsIG90aGVyIHJlc3BlY3Rz
IHJlZ2FyZGluZyB2ZXJiYXRpbSBjb3B5aW5nIG9mIHRoYXQKKyMgK2RvY3VtZW50LgorIyAgCisj
ICAKKyMgIDcuIEFHR1JFR0FUSU9OIFdJVEggSU5ERVBFTkRFTlQgV09SS1MKKyMgQEAgLTM0MCwy
MiArMzQ1LDM5IEBACisjICAKKyMgIDkuIFRFUk1JTkFUSU9OCisjICAKKyMgLVlvdSBtYXkgbm90
IGNvcHksIG1vZGlmeSwgc3VibGljZW5zZSwgb3IgZGlzdHJpYnV0ZSB0aGUgRG9jdW1lbnQgZXhj
ZXB0CisjIC1hcyBleHByZXNzbHkgcHJvdmlkZWQgZm9yIHVuZGVyIHRoaXMgTGljZW5zZS4gIEFu
eSBvdGhlciBhdHRlbXB0IHRvCisjIC1jb3B5LCBtb2RpZnksIHN1YmxpY2Vuc2Ugb3IgZGlzdHJp
YnV0ZSB0aGUgRG9jdW1lbnQgaXMgdm9pZCwgYW5kIHdpbGwKKyMgLWF1dG9tYXRpY2FsbHkgdGVy
bWluYXRlIHlvdXIgcmlnaHRzIHVuZGVyIHRoaXMgTGljZW5zZS4gIEhvd2V2ZXIsCisjIC1wYXJ0
aWVzIHdobyBoYXZlIHJlY2VpdmVkIGNvcGllcywgb3IgcmlnaHRzLCBmcm9tIHlvdSB1bmRlciB0
aGlzCisjIC1MaWNlbnNlIHdpbGwgbm90IGhhdmUgdGhlaXIgbGljZW5zZXMgdGVybWluYXRlZCBz
byBsb25nIGFzIHN1Y2gKKyMgLXBhcnRpZXMgcmVtYWluIGluIGZ1bGwgY29tcGxpYW5jZS4KKyMg
K1lvdSBtYXkgbm90IGNvcHksIG1vZGlmeSwgc3VibGljZW5zZSwgb3IgZGlzdHJpYnV0ZSB0aGUg
RG9jdW1lbnQKKyMgK2V4Y2VwdCBhcyBleHByZXNzbHkgcHJvdmlkZWQgdW5kZXIgdGhpcyBMaWNl
bnNlLiAgQW55IGF0dGVtcHQKKyMgK290aGVyd2lzZSB0byBjb3B5LCBtb2RpZnksIHN1YmxpY2Vu
c2UsIG9yIGRpc3RyaWJ1dGUgaXQgaXMgdm9pZCwgYW5kCisjICt3aWxsIGF1dG9tYXRpY2FsbHkg
dGVybWluYXRlIHlvdXIgcmlnaHRzIHVuZGVyIHRoaXMgTGljZW5zZS4KKyMgKworIyArSG93ZXZl
ciwgaWYgeW91IGNlYXNlIGFsbCB2aW9sYXRpb24gb2YgdGhpcyBMaWNlbnNlLCB0aGVuIHlvdXIg
bGljZW5zZQorIyArZnJvbSBhIHBhcnRpY3VsYXIgY29weXJpZ2h0IGhvbGRlciBpcyByZWluc3Rh
dGVkIChhKSBwcm92aXNpb25hbGx5LAorIyArdW5sZXNzIGFuZCB1bnRpbCB0aGUgY29weXJpZ2h0
IGhvbGRlciBleHBsaWNpdGx5IGFuZCBmaW5hbGx5CisjICt0ZXJtaW5hdGVzIHlvdXIgbGljZW5z
ZSwgYW5kIChiKSBwZXJtYW5lbnRseSwgaWYgdGhlIGNvcHlyaWdodCBob2xkZXIKKyMgK2ZhaWxz
IHRvIG5vdGlmeSB5b3Ugb2YgdGhlIHZpb2xhdGlvbiBieSBzb21lIHJlYXNvbmFibGUgbWVhbnMg
cHJpb3IgdG8KKyMgKzYwIGRheXMgYWZ0ZXIgdGhlIGNlc3NhdGlvbi4KKyMgKworIyArTW9yZW92
ZXIsIHlvdXIgbGljZW5zZSBmcm9tIGEgcGFydGljdWxhciBjb3B5cmlnaHQgaG9sZGVyIGlzCisj
ICtyZWluc3RhdGVkIHBlcm1hbmVudGx5IGlmIHRoZSBjb3B5cmlnaHQgaG9sZGVyIG5vdGlmaWVz
IHlvdSBvZiB0aGUKKyMgK3Zpb2xhdGlvbiBieSBzb21lIHJlYXNvbmFibGUgbWVhbnMsIHRoaXMg
aXMgdGhlIGZpcnN0IHRpbWUgeW91IGhhdmUKKyMgK3JlY2VpdmVkIG5vdGljZSBvZiB2aW9sYXRp
b24gb2YgdGhpcyBMaWNlbnNlIChmb3IgYW55IHdvcmspIGZyb20gdGhhdAorIyArY29weXJpZ2h0
IGhvbGRlciwgYW5kIHlvdSBjdXJlIHRoZSB2aW9sYXRpb24gcHJpb3IgdG8gMzAgZGF5cyBhZnRl
cgorIyAreW91ciByZWNlaXB0IG9mIHRoZSBub3RpY2UuCisjICsKKyMgK1Rlcm1pbmF0aW9uIG9m
IHlvdXIgcmlnaHRzIHVuZGVyIHRoaXMgc2VjdGlvbiBkb2VzIG5vdCB0ZXJtaW5hdGUgdGhlCisj
ICtsaWNlbnNlcyBvZiBwYXJ0aWVzIHdobyBoYXZlIHJlY2VpdmVkIGNvcGllcyBvciByaWdodHMg
ZnJvbSB5b3UgdW5kZXIKKyMgK3RoaXMgTGljZW5zZS4gIElmIHlvdXIgcmlnaHRzIGhhdmUgYmVl
biB0ZXJtaW5hdGVkIGFuZCBub3QgcGVybWFuZW50bHkKKyMgK3JlaW5zdGF0ZWQsIHJlY2VpcHQg
b2YgYSBjb3B5IG9mIHNvbWUgb3IgYWxsIG9mIHRoZSBzYW1lIG1hdGVyaWFsIGRvZXMKKyMgK25v
dCBnaXZlIHlvdSBhbnkgcmlnaHRzIHRvIHVzZSBpdC4KKyMgIAorIyAgCisjICAxMC4gRlVUVVJF
IFJFVklTSU9OUyBPRiBUSElTIExJQ0VOU0UKKyMgIAorIyAtVGhlIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbiBtYXkgcHVibGlzaCBuZXcsIHJldmlzZWQgdmVyc2lvbnMKKyMgLW9mIHRoZSBHTlUg
RnJlZSBEb2N1bWVudGF0aW9uIExpY2Vuc2UgZnJvbSB0aW1lIHRvIHRpbWUuICBTdWNoIG5ldwor
IyAtdmVyc2lvbnMgd2lsbCBiZSBzaW1pbGFyIGluIHNwaXJpdCB0byB0aGUgcHJlc2VudCB2ZXJz
aW9uLCBidXQgbWF5CisjIC1kaWZmZXIgaW4gZGV0YWlsIHRvIGFkZHJlc3MgbmV3IHByb2JsZW1z
IG9yIGNvbmNlcm5zLiAgU2VlCisjIC1odHRwOi8vd3d3LmdudS5vcmcvY29weWxlZnQvLgorIyAr
VGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiBtYXkgcHVibGlzaCBuZXcsIHJldmlzZWQgdmVy
c2lvbnMgb2YgdGhlCisjICtHTlUgRnJlZSBEb2N1bWVudGF0aW9uIExpY2Vuc2UgZnJvbSB0aW1l
IHRvIHRpbWUuICBTdWNoIG5ldyB2ZXJzaW9ucworIyArd2lsbCBiZSBzaW1pbGFyIGluIHNwaXJp
dCB0byB0aGUgcHJlc2VudCB2ZXJzaW9uLCBidXQgbWF5IGRpZmZlciBpbgorIyArZGV0YWlsIHRv
IGFkZHJlc3MgbmV3IHByb2JsZW1zIG9yIGNvbmNlcm5zLiAgU2VlCisjICtodHRwczovL3d3dy5n
bnUub3JnL2xpY2Vuc2VzLy4KKyMgIAorIyAgRWFjaCB2ZXJzaW9uIG9mIHRoZSBMaWNlbnNlIGlz
IGdpdmVuIGEgZGlzdGluZ3Vpc2hpbmcgdmVyc2lvbiBudW1iZXIuCisjICBJZiB0aGUgRG9jdW1l
bnQgc3BlY2lmaWVzIHRoYXQgYSBwYXJ0aWN1bGFyIG51bWJlcmVkIHZlcnNpb24gb2YgdGhpcwor
IyBAQCAtMzY0LDcgKzM4NiwzOSBAQAorIyAgb2YgYW55IGxhdGVyIHZlcnNpb24gdGhhdCBoYXMg
YmVlbiBwdWJsaXNoZWQgKG5vdCBhcyBhIGRyYWZ0KSBieSB0aGUKKyMgIEZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbi4gIElmIHRoZSBEb2N1bWVudCBkb2VzIG5vdCBzcGVjaWZ5IGEgdmVyc2lvbgor
IyAgbnVtYmVyIG9mIHRoaXMgTGljZW5zZSwgeW91IG1heSBjaG9vc2UgYW55IHZlcnNpb24gZXZl
ciBwdWJsaXNoZWQgKG5vdAorIyAtYXMgYSBkcmFmdCkgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbi4KKyMgK2FzIGEgZHJhZnQpIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24u
ICBJZiB0aGUgRG9jdW1lbnQKKyMgK3NwZWNpZmllcyB0aGF0IGEgcHJveHkgY2FuIGRlY2lkZSB3
aGljaCBmdXR1cmUgdmVyc2lvbnMgb2YgdGhpcworIyArTGljZW5zZSBjYW4gYmUgdXNlZCwgdGhh
dCBwcm94eSdzIHB1YmxpYyBzdGF0ZW1lbnQgb2YgYWNjZXB0YW5jZSBvZiBhCisjICt2ZXJzaW9u
IHBlcm1hbmVudGx5IGF1dGhvcml6ZXMgeW91IHRvIGNob29zZSB0aGF0IHZlcnNpb24gZm9yIHRo
ZQorIyArRG9jdW1lbnQuCisjICsKKyMgKzExLiBSRUxJQ0VOU0lORworIyArCisjICsiTWFzc2l2
ZSBNdWx0aWF1dGhvciBDb2xsYWJvcmF0aW9uIFNpdGUiIChvciAiTU1DIFNpdGUiKSBtZWFucyBh
bnkKKyMgK1dvcmxkIFdpZGUgV2ViIHNlcnZlciB0aGF0IHB1Ymxpc2hlcyBjb3B5cmlnaHRhYmxl
IHdvcmtzIGFuZCBhbHNvCisjICtwcm92aWRlcyBwcm9taW5lbnQgZmFjaWxpdGllcyBmb3IgYW55
Ym9keSB0byBlZGl0IHRob3NlIHdvcmtzLiAgQQorIyArcHVibGljIHdpa2kgdGhhdCBhbnlib2R5
IGNhbiBlZGl0IGlzIGFuIGV4YW1wbGUgb2Ygc3VjaCBhIHNlcnZlci4gIEEKKyMgKyJNYXNzaXZl
IE11bHRpYXV0aG9yIENvbGxhYm9yYXRpb24iIChvciAiTU1DIikgY29udGFpbmVkIGluIHRoZSBz
aXRlCisjICttZWFucyBhbnkgc2V0IG9mIGNvcHlyaWdodGFibGUgd29ya3MgdGh1cyBwdWJsaXNo
ZWQgb24gdGhlIE1NQyBzaXRlLgorIyArCisjICsiQ0MtQlktU0EiIG1lYW5zIHRoZSBDcmVhdGl2
ZSBDb21tb25zIEF0dHJpYnV0aW9uLVNoYXJlIEFsaWtlIDMuMAorIyArbGljZW5zZSBwdWJsaXNo
ZWQgYnkgQ3JlYXRpdmUgQ29tbW9ucyBDb3Jwb3JhdGlvbiwgYSBub3QtZm9yLXByb2ZpdAorIyAr
Y29ycG9yYXRpb24gd2l0aCBhIHByaW5jaXBhbCBwbGFjZSBvZiBidXNpbmVzcyBpbiBTYW4gRnJh
bmNpc2NvLAorIyArQ2FsaWZvcm5pYSwgYXMgd2VsbCBhcyBmdXR1cmUgY29weWxlZnQgdmVyc2lv
bnMgb2YgdGhhdCBsaWNlbnNlCisjICtwdWJsaXNoZWQgYnkgdGhhdCBzYW1lIG9yZ2FuaXphdGlv
bi4KKyMgKworIyArIkluY29ycG9yYXRlIiBtZWFucyB0byBwdWJsaXNoIG9yIHJlcHVibGlzaCBh
IERvY3VtZW50LCBpbiB3aG9sZSBvciBpbgorIyArcGFydCwgYXMgcGFydCBvZiBhbm90aGVyIERv
Y3VtZW50LgorIyArCisjICtBbiBNTUMgaXMgImVsaWdpYmxlIGZvciByZWxpY2Vuc2luZyIgaWYg
aXQgaXMgbGljZW5zZWQgdW5kZXIgdGhpcworIyArTGljZW5zZSwgYW5kIGlmIGFsbCB3b3JrcyB0
aGF0IHdlcmUgZmlyc3QgcHVibGlzaGVkIHVuZGVyIHRoaXMgTGljZW5zZQorIyArc29tZXdoZXJl
IG90aGVyIHRoYW4gdGhpcyBNTUMsIGFuZCBzdWJzZXF1ZW50bHkgaW5jb3Jwb3JhdGVkIGluIHdo
b2xlIG9yCisjICtpbiBwYXJ0IGludG8gdGhlIE1NQywgKDEpIGhhZCBubyBjb3ZlciB0ZXh0cyBv
ciBpbnZhcmlhbnQgc2VjdGlvbnMsIGFuZAorIyArKDIpIHdlcmUgdGh1cyBpbmNvcnBvcmF0ZWQg
cHJpb3IgdG8gTm92ZW1iZXIgMSwgMjAwOC4KKyMgKworIyArVGhlIG9wZXJhdG9yIG9mIGFuIE1N
QyBTaXRlIG1heSByZXB1Ymxpc2ggYW4gTU1DIGNvbnRhaW5lZCBpbiB0aGUgc2l0ZQorIyArdW5k
ZXIgQ0MtQlktU0Egb24gdGhlIHNhbWUgc2l0ZSBhdCBhbnkgdGltZSBiZWZvcmUgQXVndXN0IDEs
IDIwMDksCisjICtwcm92aWRlZCB0aGUgTU1DIGlzIGVsaWdpYmxlIGZvciByZWxpY2Vuc2luZy4K
KyMgIAorIyAgCisjICBBRERFTkRVTTogSG93IHRvIHVzZSB0aGlzIExpY2Vuc2UgZm9yIHlvdXIg
ZG9jdW1lbnRzCisjIEBAIC0zNzUsNyArNDI5LDcgQEAKKyMgIAorIyAgICAgIENvcHlyaWdodCAo
YykgIFlFQVIgIFlPVVIgTkFNRS4KKyMgICAgICBQZXJtaXNzaW9uIGlzIGdyYW50ZWQgdG8gY29w
eSwgZGlzdHJpYnV0ZSBhbmQvb3IgbW9kaWZ5IHRoaXMgZG9jdW1lbnQKKyMgLSAgICB1bmRlciB0
aGUgdGVybXMgb2YgdGhlIEdOVSBGcmVlIERvY3VtZW50YXRpb24gTGljZW5zZSwgVmVyc2lvbiAx
LjIKKyMgKyAgICB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBGcmVlIERvY3VtZW50YXRpb24g
TGljZW5zZSwgVmVyc2lvbiAxLjMKKyMgICAgICBvciBhbnkgbGF0ZXIgdmVyc2lvbiBwdWJsaXNo
ZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsKKyMgICAgICB3aXRoIG5vIEludmFy
aWFudCBTZWN0aW9ucywgbm8gRnJvbnQtQ292ZXIgVGV4dHMsIGFuZCBubyBCYWNrLUNvdmVyIFRl
eHRzLgorIyAgICAgIEEgY29weSBvZiB0aGUgbGljZW5zZSBpcyBpbmNsdWRlZCBpbiB0aGUgc2Vj
dGlvbiBlbnRpdGxlZCAiR05VCisjIEBAIC0zOTQsNCArNDQ4LDQgQEAKKyMgIElmIHlvdXIgZG9j
dW1lbnQgY29udGFpbnMgbm9udHJpdmlhbCBleGFtcGxlcyBvZiBwcm9ncmFtIGNvZGUsIHdlCisj
ICByZWNvbW1lbmQgcmVsZWFzaW5nIHRoZXNlIGV4YW1wbGVzIGluIHBhcmFsbGVsIHVuZGVyIHlv
dXIgY2hvaWNlIG9mCisjICBmcmVlIHNvZnR3YXJlIGxpY2Vuc2UsIHN1Y2ggYXMgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlLAorIyAtdG8gcGVybWl0IHRoZWlyIHVzZSBpbiBmcmVlIHNv
ZnR3YXJlLgorIyArdG8gcGVybWl0IHRoZWlyIHVzZSBpbiBmcmVlIHNvZnR3YXJlLi0tLSBzcmMv
TWFrZWZpbGUuYW0KKyMgKysrIHNyYy9NYWtlZmlsZS5hbQorIyBAQCAtMSw2ICsxLDYgQEAKKyMg
ICMgIEZMQUMgLSBGcmVlIExvc3NsZXNzIEF1ZGlvIENvZGVjCisjICAjICBDb3B5cmlnaHQgKEMp
IDIwMDEtMjAwOSAgSm9zaCBDb2Fsc29uCisjIC0jICBDb3B5cmlnaHQgKEMpIDIwMTEtMjAyMyAg
WGlwaC5PcmcgRm91bmRhdGlvbgorIyArIyAgQ29weXJpZ2h0IChDKSAyMDExLTIwMjUgIFhpcGgu
T3JnIEZvdW5kYXRpb24KKyMgICMKKyMgICMgIFRoaXMgZmlsZSBpcyBwYXJ0IHRoZSBGTEFDIHBy
b2plY3QuICBGTEFDIGlzIGNvbXByaXNlZCBvZiBzZXZlcmFsCisjICAjICBjb21wb25lbnRzIGRp
c3RyaWJ1dGVkIHVuZGVyIGRpZmZlcmVudCBsaWNlbnNlcy4gIFRoZSBjb2RlYyBsaWJyYXJpZXMK
KyMgLS0tIHNyYy9mbGFjL21haW4uYworIyArKysgc3JjL2ZsYWMvbWFpbi5jCisjIEBAIC0xLDYg
KzEsNiBAQAorIyAgLyogZmxhYyAtIENvbW1hbmQtbGluZSBGTEFDIGVuY29kZXIvZGVjb2Rlcgor
IyAgICogQ29weXJpZ2h0IChDKSAyMDAwLTIwMDkgIEpvc2ggQ29hbHNvbgorIyAtICogQ29weXJp
Z2h0IChDKSAyMDExLTIwMjMgIFhpcGguT3JnIEZvdW5kYXRpb24KKyMgKyAqIENvcHlyaWdodCAo
QykgMjAxMS0yMDI1ICBYaXBoLk9yZyBGb3VuZGF0aW9uCisjICAgKgorIyAgICogVGhpcyBwcm9n
cmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgorIyAg
ICogbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UKKyMgLS0tIENPUFlJTkcuWGlwaAorIyArKysgQ09QWUlORy5YaXBoCisjIEBAIC0xLDUg
KzEsNSBAQAorIyAgQ29weXJpZ2h0IChDKSAyMDAwLTIwMDkgIEpvc2ggQ29hbHNvbgorIyAtQ29w
eXJpZ2h0IChDKSAyMDExLTIwMjMgIFhpcGguT3JnIEZvdW5kYXRpb24KKyMgK0NvcHlyaWdodCAo
QykgMjAxMS0yMDI1ICBYaXBoLk9yZyBGb3VuZGF0aW9uCisjICAKKyMgIFJlZGlzdHJpYnV0aW9u
IGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAg
bW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBj
b25kaXRpb25zCisjIAorIworCiBTVU1NQVJZID0gIkZyZWUgTG9zc2xlc3MgQXVkaW8gQ29kZWMi
CiBERVNDUklQVElPTiA9ICJGTEFDIHN0YW5kcyBmb3IgRnJlZSBMb3NzbGVzcyBBdWRpbyBDb2Rl
YywgYSBsb3NzbGVzcyBhdWRpbyBjb21wcmVzc2lvbiBmb3JtYXQuIgogSE9NRVBBR0UgPSAiaHR0
cHM6Ly94aXBoLm9yZy9mbGFjLyIKIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL3hp
cGgvZmxhYy9pc3N1ZXMiCiBTRUNUSU9OID0gImxpYnMiCiBMSUNFTlNFID0gIkdGREwtMS4yICYg
R1BMLTIuMC1vci1sYXRlciAmIExHUEwtMi4xLW9yLWxhdGVyICYgQlNELTMtQ2xhdXNlIgotTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORy5GREw7bWQ1PWFkMTQxOWVjYzU2ZTA2MGVj
Y2Y4MTg0YTg3YzQyODVmIFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9NYWtlZmls
ZS5hbTtiZWdpbmxpbmU9MTtlbmRsaW5lPTE3O21kNT1iMWRhYjI3MDRiZTdmMDFiZmJkOWI3ZjZk
NWYwMDBhOSBcCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLkZETDttZDU9ODAy
ZTc5ZTM5NGUzNzJkMDFlODYzZTNmNDA1OGNmNDAgXAorICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vc3JjL01ha2VmaWxlLmFtO2JlZ2lubGluZT0xO2VuZGxpbmU9MTc7bWQ1PTljODgyMTUzMTMy
ZGY4ZjNhMWNiMWE4Y2ExZjIzNTBmIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJ
TkcuR1BMO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCi0gICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9zcmMvZmxhYy9tYWluLmM7YmVnaW5saW5lPTE7ZW5kbGluZT0xODtt
ZDU9MjMwOTkxMTljMDM0ZDg5NGJkMWJmN2VmNWJkMjIxMDEgXAorICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vc3JjL2ZsYWMvbWFpbi5jO2JlZ2lubGluZT0xO2VuZGxpbmU9MTg7bWQ1PTFlODI2
YjUwODNiYTFlMDI4ODUyZmU3Y2VlYzZhOGFkIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTov
L0NPUFlJTkcuTEdQTDttZDU9ZmJjMDkzOTAxODU3ZmNkMTE4ZjA2NWY5MDA5ODJjMjQgXAotICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy5YaXBoO21kNT0wYzkwZTQxYWIyZmE3ZTY5
Y2E5MzkxMzMwZDg3MDIyMSBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9pbmNsdWRlL0ZM
QUMvYWxsLmg7YmVnaW5saW5lPTY1O2VuZGxpbmU9NzA7bWQ1PTM5YWFmNWUwM2M3MzY0MzYzODg0
YzhiOGRkZGE4ZWVhIgorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy5YaXBoO21k
NT03OGExMzFiMmVhNTA2NzVkMjQ1ZDI4MGNjYzM0ZjhiNiBcCisgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9pbmNsdWRlL0ZMQUMvYWxsLmg7YmVnaW5saW5lPTY1O2VuZGxpbmU9NzA7bWQ1PTM5
YWFmNWUwM2M3MzY0MzYzODg0YzhiOGRkZGE4ZWVhIFwKKyAgICAgICAgICAgICAgICAgICAgIgog
CiBTUkNfVVJJID0gImh0dHA6Ly9kb3dubG9hZHMueGlwaC5vcmcvcmVsZWFzZXMvZmxhYy8ke0JQ
fS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmM1OGU2OWNkMjIzNDhmNDQxYjg2MTA5
MmI4MjVlNTkxZDBiODIyZTEwNmRlNmViMGVlNGQwNWQyNzIwNWI3MCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJmMmMxYzc2NTkyYTgyZmZmZjg0MTNiYTNjNGExMjk5YjZjN2FiMDZjNzM0ZGVlMDNm
ZDg4NjMwNDg1YzJiOTIwIgogCiBDVkVfUFJPRFVDVCA9ICJsaWJmbGFjIGZsYWMiCiAKLS0gCjIu
NDQuMQoK

--===============2107093595188567020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1881 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5eda5c2a1c6ca17803b85f828bebd1709a1c5079"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 99 Local 88 Mirrors 0 Missed 11 Current 206 (88% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 273 of 305 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 277 of 305 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 791 of 924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 279 of 305 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_fetch: Started
NOTE: recipe flac-1.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 796 of 924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 281 of 305 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 282 of 305 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.5.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 287 of 305 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 290 of 305 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 799 of 924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 805 of 924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 806 of 924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_lic)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 902 of 924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 911 of 924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_collect_spdx_deps)
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_lic: Started
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_lic unihash changed to b783d13f40d477c5593e42b298fedf17c99f55af309749db3df04a22f2b41989
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch unihash changed to 9151e897994419837a7872aea042875d7a06a6d31ab13efa9e878daba3762229
NOTE: Setscene tasks completed
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 912 of 924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_configure)
NOTE: Setscene tasks completed
NOTE: recipe flac-1.5.0-r0: task do_configure: Started
NOTE: recipe flac-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 913 of 924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_compile)
NOTE: recipe flac-1.5.0-r0: task do_compile: Started
NOTE: recipe flac-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 914 of 924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_install)
NOTE: recipe flac-1.5.0-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.23.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/au
 toconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'linux-libc-headers', 'libogg', 'gettext-native', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pseudo-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 75 DESTDIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image install
| Making install in doc
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/doc'
| Making install in .
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/doc'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/doc'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/doc'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/doc'
| Making install in images
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/doc/images'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/doc/images'
| make[3]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/doc/flac/images'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../flac-1.5.0/doc/images/logo.svg ../../../flac-1.5.0/doc/images/logo130.gif '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/doc/flac/images'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/doc/images'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/doc/images'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/doc'
| Making install in include
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include'
| Making install in FLAC
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/FLAC'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/FLAC'
| make[3]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/include/FLAC'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../flac-1.5.0/include/FLAC/all.h ../../../flac-1.5.0/include/FLAC/assert.h ../../../flac-1.5.0/include/FLAC/callback.h ../../../flac-1.5.0/include/FLAC/export.h ../../../flac-1.5.0/include/FLAC/format.h ../../../flac-1.5.0/include/FLAC/metadata.h ../../../flac-1.5.0/include/FLAC/ordinals.h ../../../flac-1.5.0/include/FLAC/stream_decoder.h ../../../flac-1.5.0/include/FLAC/stream_encoder.h '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/include/FLAC'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/FLAC'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/FLAC'
| Making install in FLAC++
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/FLAC++'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/FLAC++'
| make[3]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/include/FLAC++'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../flac-1.5.0/include/FLAC++/all.h ../../../flac-1.5.0/include/FLAC++/decoder.h ../../../flac-1.5.0/include/FLAC++/encoder.h ../../../flac-1.5.0/include/FLAC++/export.h ../../../flac-1.5.0/include/FLAC++/metadata.h '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/include/FLAC++'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/FLAC++'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/FLAC++'
| Making install in share
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/share'
| Making install in grabbag
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/share/grabbag'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/share/grabbag'
| make[4]: Nothing to be done for 'install-exec-am'.
| make[4]: Nothing to be done for 'install-data-am'.
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/share/grabbag'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/share/grabbag'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/share'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/share'
| make[4]: Nothing to be done for 'install-exec-am'.
| make[4]: Nothing to be done for 'install-data-am'.
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/share'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/share'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/share'
| Making install in test_libs_common
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/test_libs_common'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/test_libs_common'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/test_libs_common'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include/test_libs_common'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/include'
| Making install in m4
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/m4'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/m4'
| make[2]: Nothing to be done for 'install-exec-am'.
| make[2]: Nothing to be done for 'install-data-am'.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/m4'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/m4'
| Making install in man
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/man'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/man'
| make[2]: Nothing to be done for 'install-exec-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/man/man1'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../flac-1.5.0/man/flac.1 ../../flac-1.5.0/man/metaflac.1 '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/man/man1'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/man'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/man'
| Making install in src
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src'
| Making install in libFLAC
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC'
| Making install in include
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC/include'
| Making install in private
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC/include/private'
| make[5]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC/include/private'
| make[5]: Nothing to be done for 'install-exec-am'.
| make[5]: Nothing to be done for 'install-data-am'.
| make[5]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC/include/private'
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC/include/private'
| Making install in protected
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC/include/protected'
| make[5]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC/include/protected'
| make[5]: Nothing to be done for 'install-exec-am'.
| make[5]: Nothing to be done for 'install-data-am'.
| make[5]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC/include/protected'
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC/include/protected'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC/include'
| make[5]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC/include'
| make[5]: Nothing to be done for 'install-exec-am'.
| make[5]: Nothing to be done for 'install-data-am'.
| make[5]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC/include'
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC/include'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC/include'
| Making install in .
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/aclocal'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib/pkgconfig'
|  /bin/bash ../../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c   libFLAC.la '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../flac-1.5.0/src/libFLAC/libFLAC.m4 '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/aclocal'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 flac.pc '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib/pkgconfig'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c .libs/libFLAC.so.14.0.0 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib/libFLAC.so.14.0.0
| libtool: install: (cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib && { ln -s -f libFLAC.so.14.0.0 libFLAC.so.14 || { rm -f libFLAC.so.14 && ln -s libFLAC.so.14.0.0 libFLAC.so.14; }; })
| libtool: install: (cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib && { ln -s -f libFLAC.so.14.0.0 libFLAC.so || { rm -f libFLAC.so && ln -s libFLAC.so.14.0.0 libFLAC.so; }; })
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c .libs/libFLAC.lai /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib/libFLAC.la
| libtool: warning: remember to run 'libtool --finish /usr/lib'
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC'
| Making install in share
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/share'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/share'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/share'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/share'
| Making install in flac
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/flac'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/flac'
| make[3]: Nothing to be done for 'install-data-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/bin'
|   /bin/bash ../../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c flac '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/bin'
| libtool: warning: '../../src/libFLAC/libFLAC.la' has not been installed in '/usr/lib'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c .libs/flac /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/bin/flac
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/flac'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/flac'
| Making install in metaflac
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/metaflac'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/metaflac'
| make[3]: Nothing to be done for 'install-data-am'.
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/bin'
|   /bin/bash ../../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c metaflac '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/bin'
| libtool: warning: '../../src/libFLAC/libFLAC.la' has not been installed in '/usr/lib'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c .libs/metaflac /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/bin/metaflac
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/metaflac'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/metaflac'
| Making install in test_grabbag
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_grabbag'
| Making install in cuesheet
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_grabbag/cuesheet'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_grabbag/cuesheet'
| make[4]: Nothing to be done for 'install-exec-am'.
| make[4]: Nothing to be done for 'install-data-am'.
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_grabbag/cuesheet'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_grabbag/cuesheet'
| Making install in picture
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_grabbag/picture'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_grabbag/picture'
| make[4]: Nothing to be done for 'install-exec-am'.
| make[4]: Nothing to be done for 'install-data-am'.
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_grabbag/picture'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_grabbag/picture'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_grabbag'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_grabbag'
| make[4]: Nothing to be done for 'install-exec-am'.
| make[4]: Nothing to be done for 'install-data-am'.
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_grabbag'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_grabbag'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_grabbag'
| Making install in test_libs_common
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_libs_common'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_libs_common'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_libs_common'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_libs_common'
| Making install in test_libFLAC
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_libFLAC'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_libFLAC'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_libFLAC'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_libFLAC'
| Making install in test_seeking
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_seeking'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_seeking'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_seeking'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_seeking'
| Making install in test_streams
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_streams'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_streams'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_streams'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_streams'
| Making install in utils
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/utils'
| Making install in flacdiff
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/utils/flacdiff'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/utils/flacdiff'
| make[4]: Nothing to be done for 'install-exec-am'.
| make[4]: Nothing to be done for 'install-data-am'.
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/utils/flacdiff'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/utils/flacdiff'
| Making install in flactimer
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/utils/flactimer'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/utils/flactimer'
| make[4]: Nothing to be done for 'install-exec-am'.
| make[4]: Nothing to be done for 'install-data-am'.
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/utils/flactimer'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/utils/flactimer'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/utils'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/utils'
| make[4]: Nothing to be done for 'install-exec-am'.
| make[4]: Nothing to be done for 'install-data-am'.
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/utils'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/utils'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/utils'
| Making install in libFLAC++
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC++'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC++'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/aclocal'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib/pkgconfig'
|  /bin/bash ../../libtool   --mode=install /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c   libFLAC++.la '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../flac-1.5.0/src/libFLAC++/libFLAC++.m4 '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/aclocal'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 flac++.pc '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib/pkgconfig'
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c .libs/libFLAC++.so.11.0.0 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib/libFLAC++.so.11.0.0
| libtool: install: (cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib && { ln -s -f libFLAC++.so.11.0.0 libFLAC++.so.11 || { rm -f libFLAC++.so.11 && ln -s libFLAC++.so.11.0.0 libFLAC++.so.11; }; })
| libtool: install: (cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib && { ln -s -f libFLAC++.so.11.0.0 libFLAC++.so || { rm -f libFLAC++.so && ln -s libFLAC++.so.11.0.0 libFLAC++.so; }; })
| libtool: install: /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c .libs/libFLAC++.lai /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib/libFLAC++.la
| libtool: warning: remember to run 'libtool --finish /usr/lib'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC++'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/libFLAC++'
| Making install in test_libFLAC++
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_libFLAC++'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_libFLAC++'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_libFLAC++'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src/test_libFLAC++'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/src'
| Making install in test
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test'
| Making install in cuesheets
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/cuesheets'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/cuesheets'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/cuesheets'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/cuesheets'
| Making install in foreign-metadata-test-files
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/foreign-metadata-test-files'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/foreign-metadata-test-files'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/foreign-metadata-test-files'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/foreign-metadata-test-files'
| Making install in flac-to-flac-metadata-test-files
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/flac-to-flac-metadata-test-files'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/flac-to-flac-metadata-test-files'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/flac-to-flac-metadata-test-files'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/flac-to-flac-metadata-test-files'
| Making install in metaflac-test-files
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/metaflac-test-files'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/metaflac-test-files'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/metaflac-test-files'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/metaflac-test-files'
| Making install in pictures
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/pictures'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/pictures'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/pictures'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test/pictures'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/test'
| Making install in oss-fuzz
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/oss-fuzz'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/oss-fuzz'
| make[2]: Nothing to be done for 'install-exec-am'.
| make[2]: Nothing to be done for 'install-data-am'.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/oss-fuzz'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/oss-fuzz'
| Making install in examples
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples'
| Making install in c
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c'
| Making install in decode
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/decode'
| Making install in file
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/decode/file'
| make[5]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/decode/file'
| make[5]: Nothing to be done for 'install-exec-am'.
| make[5]: Nothing to be done for 'install-data-am'.
| make[5]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/decode/file'
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/decode/file'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/decode'
| make[5]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/decode'
| make[5]: Nothing to be done for 'install-exec-am'.
| make[5]: Nothing to be done for 'install-data-am'.
| make[5]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/decode'
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/decode'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/decode'
| Making install in encode
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/encode'
| Making install in file
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/encode/file'
| make[5]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/encode/file'
| make[5]: Nothing to be done for 'install-exec-am'.
| make[5]: Nothing to be done for 'install-data-am'.
| make[5]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/encode/file'
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/encode/file'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/encode'
| make[5]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/encode'
| make[5]: Nothing to be done for 'install-exec-am'.
| make[5]: Nothing to be done for 'install-data-am'.
| make[5]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/encode'
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/encode'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c/encode'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c'
| make[4]: Nothing to be done for 'install-exec-am'.
| make[4]: Nothing to be done for 'install-data-am'.
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/c'
| Making install in cpp
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp'
| Making install in decode
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/decode'
| Making install in file
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/decode/file'
| make[5]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/decode/file'
| make[5]: Nothing to be done for 'install-exec-am'.
| make[5]: Nothing to be done for 'install-data-am'.
| make[5]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/decode/file'
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/decode/file'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/decode'
| make[5]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/decode'
| make[5]: Nothing to be done for 'install-exec-am'.
| make[5]: Nothing to be done for 'install-data-am'.
| make[5]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/decode'
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/decode'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/decode'
| Making install in encode
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/encode'
| Making install in file
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/encode/file'
| make[5]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/encode/file'
| make[5]: Nothing to be done for 'install-exec-am'.
| make[5]: Nothing to be done for 'install-data-am'.
| make[5]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/encode/file'
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/encode/file'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/encode'
| make[5]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/encode'
| make[5]: Nothing to be done for 'install-exec-am'.
| make[5]: Nothing to be done for 'install-data-am'.
| make[5]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/encode'
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/encode'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp/encode'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp'
| make[4]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp'
| make[4]: Nothing to be done for 'install-exec-am'.
| make[4]: Nothing to be done for 'install-data-am'.
| make[4]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp'
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples/cpp'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples'
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples'
| make[3]: Nothing to be done for 'install-exec-am'.
| make[3]: Nothing to be done for 'install-data-am'.
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build/examples'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build'
| make[2]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build'
| make[2]: Nothing to be done for 'install-exec-am'.
| make[2]: Nothing to be done for 'install-data-am'.
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/build'
| sed: can't read /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/doc/flac/FLAC.tag: No such file or directory
| sed: can't read /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/doc/flac/api/*.html: No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/temp/run.do_install.1031702:157 exit 2 from 'sed -i "s#/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/flac-1.5.0/include#/usr/include#g" /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/doc/flac/FLAC.tag /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/doc/flac/api/*.html'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/temp/run.do_install.1031702, line 157
| 	#2: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/temp/run.do_install.1031702, line 207
NOTE: recipe flac-1.5.0-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 914 tasks of which 904 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250301110111.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250301110111.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_install
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/temp/log.do_install.1031702
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: flac-1.5.0-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/temp/run.do_install.1031702' failed with exit code 2
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/temp/log.do_install.1031702
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_install) failed with exit code '1'

--===============2107093595188567020==--

