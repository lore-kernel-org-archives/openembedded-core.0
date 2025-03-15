Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EC6C36008
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:43 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.10346.1742048306930262152
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=e+Xt3/xY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Hm7k+97a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101959a2bc63b-3415ebe9-3d04-4883-bbc7-904f9f09cd3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048315;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UCRonjsv2gX07Z9VV+hc9RntzYke3OAdyEQEJvPWapQ=;
	b=e+Xt3/xYWU6OlMDte/PdC3/gvyajNY259mIMtIrYnJxEh8gRn/eHQtsW6sMkp45V
	LrUbfqBgWtNqxsFLQC0aDang8kuKGlZP7BsnlCWFJY0vMYnuRbOxL9htLnmwQZplcQ6
	XDaGM+90lYTYtMTjxAE0z0jiRbMVzzu6lLm6Hycc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048315;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UCRonjsv2gX07Z9VV+hc9RntzYke3OAdyEQEJvPWapQ=;
	b=Hm7k+97aFIbAKW687p/bE0QpauEcSySPapIdCiDlHOMkjJAGqxy9St9Wcl3rsq/r
	p0aziXmDvWxsaweAfVTD8qqT5cWPmOZWz9euYXWJ2vbCYP+PdDQCSbwnNq9dlbWdDjc
	9K2d60B+zVE61EocQPeOw5z5i581EWYeiGKKQTFA=
Content-Type: multipart/mixed; boundary="===============7784624973135550975=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael@opdenacker.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] flac: upgrading to 1.5.0 FAILED
Message-ID: <010101959a2bc63b-3415ebe9-3d04-4883-bbc7-904f9f09cd3c-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212962

--===============7784624973135550975==
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
From 06cafe894cda8f09b40cd3ee9466e5b3c316184b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 13:30:39 +0000
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


--===============7784624973135550975==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-flac-upgrade-1.4.3-1.5.0.patch"

RnJvbSAwNmNhZmU4OTRjZGE4ZjA5YjQwY2QzZWU5NDY2ZTViM2MzMTYxODRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTM6MzA6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
bGFjOiB1cGdyYWRlIDEuNC4zIC0+IDEuNS4wCgotLS0KIC4uLi9mbGFjL3tmbGFjXzEuNC4zLmJi
ID0+IGZsYWNfMS41LjAuYmJ9ICAgICB8IDI2NyArKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAyNjEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9mbGFjL3tmbGFjXzEuNC4zLmJiID0+IGZsYWNfMS41LjAuYmJ9ICgx
MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmxhYy9mbGFjXzEuNC4z
LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmxhYy9mbGFjXzEuNS4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggMTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZsYWMvZmxh
Y18xLjQuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmxhYy9mbGFjXzEu
NS4wLmJiCmluZGV4IDg3YjY3YmVlMWYuLjZkZWQxMzFiZjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2ZsYWMvZmxhY18xLjQuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9mbGFjL2ZsYWNfMS41LjAuYmIKQEAgLTEsMTkgKzEsMjc0IEBACisjIEZJWE1FOiB0
aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wg
dXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUg
b2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5T
RSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNv
bW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGlj
ZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2Vz
OgorIworIyAtLS0gQ09QWUlORy5GREwKKyMgKysrIENPUFlJTkcuRkRMCisjIEBAIC0xLDEyICsx
LDEyIEBACisjIC0JCUdOVSBGcmVlIERvY3VtZW50YXRpb24gTGljZW5zZQorIyAtCQkgIFZlcnNp
b24gMS4yLCBOb3ZlbWJlciAyMDAyCisjIC0KKyMgLQorIyAtIENvcHlyaWdodCAoQykgMjAwMCwy
MDAxLDIwMDIgIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorIyAtICAgICA1MSBGcmFu
a2xpbiBTdCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgIDAyMTEwLTEzMDEgIFVTQQorIyArCisj
ICsgICAgICAgICAgICAgICAgR05VIEZyZWUgRG9jdW1lbnRhdGlvbiBMaWNlbnNlCisjICsgICAg
ICAgICAgICAgICAgIFZlcnNpb24gMS4zLCAzIE5vdmVtYmVyIDIwMDgKKyMgKworIyArCisjICsg
Q29weXJpZ2h0IChDKSAyMDAwLCAyMDAxLCAyMDAyLCAyMDA3LCAyMDA4IEZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbiwgSW5jLgorIyArICAgICA8aHR0cHM6Ly9mc2Yub3JnLz4KKyMgICBFdmVyeW9u
ZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMg
ICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxsb3dl
ZC4KKyMgLQorIyAgCisjICAwLiBQUkVBTUJMRQorIyAgCisjIEBAIC01MCwxMSArNTAsMTEgQEAK
KyMgIAorIyAgQSAiU2Vjb25kYXJ5IFNlY3Rpb24iIGlzIGEgbmFtZWQgYXBwZW5kaXggb3IgYSBm
cm9udC1tYXR0ZXIgc2VjdGlvbiBvZgorIyAgdGhlIERvY3VtZW50IHRoYXQgZGVhbHMgZXhjbHVz
aXZlbHkgd2l0aCB0aGUgcmVsYXRpb25zaGlwIG9mIHRoZQorIyAtcHVibGlzaGVycyBvciBhdXRo
b3JzIG9mIHRoZSBEb2N1bWVudCB0byB0aGUgRG9jdW1lbnQncyBvdmVyYWxsIHN1YmplY3QKKyMg
LShvciB0byByZWxhdGVkIG1hdHRlcnMpIGFuZCBjb250YWlucyBub3RoaW5nIHRoYXQgY291bGQg
ZmFsbCBkaXJlY3RseQorIyAtd2l0aGluIHRoYXQgb3ZlcmFsbCBzdWJqZWN0LiAgKFRodXMsIGlm
IHRoZSBEb2N1bWVudCBpcyBpbiBwYXJ0IGEKKyMgLXRleHRib29rIG9mIG1hdGhlbWF0aWNzLCBh
IFNlY29uZGFyeSBTZWN0aW9uIG1heSBub3QgZXhwbGFpbiBhbnkKKyMgLW1hdGhlbWF0aWNzLikg
IFRoZSByZWxhdGlvbnNoaXAgY291bGQgYmUgYSBtYXR0ZXIgb2YgaGlzdG9yaWNhbAorIyArcHVi
bGlzaGVycyBvciBhdXRob3JzIG9mIHRoZSBEb2N1bWVudCB0byB0aGUgRG9jdW1lbnQncyBvdmVy
YWxsCisjICtzdWJqZWN0IChvciB0byByZWxhdGVkIG1hdHRlcnMpIGFuZCBjb250YWlucyBub3Ro
aW5nIHRoYXQgY291bGQgZmFsbAorIyArZGlyZWN0bHkgd2l0aGluIHRoYXQgb3ZlcmFsbCBzdWJq
ZWN0LiAgKFRodXMsIGlmIHRoZSBEb2N1bWVudCBpcyBpbgorIyArcGFydCBhIHRleHRib29rIG9m
IG1hdGhlbWF0aWNzLCBhIFNlY29uZGFyeSBTZWN0aW9uIG1heSBub3QgZXhwbGFpbgorIyArYW55
IG1hdGhlbWF0aWNzLikgIFRoZSByZWxhdGlvbnNoaXAgY291bGQgYmUgYSBtYXR0ZXIgb2YgaGlz
dG9yaWNhbAorIyAgY29ubmVjdGlvbiB3aXRoIHRoZSBzdWJqZWN0IG9yIHdpdGggcmVsYXRlZCBt
YXR0ZXJzLCBvciBvZiBsZWdhbCwKKyMgIGNvbW1lcmNpYWwsIHBoaWxvc29waGljYWwsIGV0aGlj
YWwgb3IgcG9saXRpY2FsIHBvc2l0aW9uIHJlZ2FyZGluZworIyAgdGhlbS4KKyMgQEAgLTEwMyw2
ICsxMDMsOSBAQAorIyAgdGhlIHRleHQgbmVhciB0aGUgbW9zdCBwcm9taW5lbnQgYXBwZWFyYW5j
ZSBvZiB0aGUgd29yaydzIHRpdGxlLAorIyAgcHJlY2VkaW5nIHRoZSBiZWdpbm5pbmcgb2YgdGhl
IGJvZHkgb2YgdGhlIHRleHQuCisjICAKKyMgK1RoZSAicHVibGlzaGVyIiBtZWFucyBhbnkgcGVy
c29uIG9yIGVudGl0eSB0aGF0IGRpc3RyaWJ1dGVzIGNvcGllcyBvZgorIyArdGhlIERvY3VtZW50
IHRvIHRoZSBwdWJsaWMuCisjICsKKyMgIEEgc2VjdGlvbiAiRW50aXRsZWQgWFlaIiBtZWFucyBh
IG5hbWVkIHN1YnVuaXQgb2YgdGhlIERvY3VtZW50IHdob3NlCisjICB0aXRsZSBlaXRoZXIgaXMg
cHJlY2lzZWx5IFhZWiBvciBjb250YWlucyBYWVogaW4gcGFyZW50aGVzZXMgZm9sbG93aW5nCisj
ICB0ZXh0IHRoYXQgdHJhbnNsYXRlcyBYWVogaW4gYW5vdGhlciBsYW5ndWFnZS4gIChIZXJlIFhZ
WiBzdGFuZHMgZm9yIGEKKyMgQEAgLTExOCwxNCArMTIxLDEzIEBACisjICBpbXBsaWNhdGlvbiB0
aGF0IHRoZXNlIFdhcnJhbnR5IERpc2NsYWltZXJzIG1heSBoYXZlIGlzIHZvaWQgYW5kIGhhcwor
IyAgbm8gZWZmZWN0IG9uIHRoZSBtZWFuaW5nIG9mIHRoaXMgTGljZW5zZS4KKyMgIAorIyAtCisj
ICAyLiBWRVJCQVRJTSBDT1BZSU5HCisjICAKKyMgIFlvdSBtYXkgY29weSBhbmQgZGlzdHJpYnV0
ZSB0aGUgRG9jdW1lbnQgaW4gYW55IG1lZGl1bSwgZWl0aGVyCisjICBjb21tZXJjaWFsbHkgb3Ig
bm9uY29tbWVyY2lhbGx5LCBwcm92aWRlZCB0aGF0IHRoaXMgTGljZW5zZSwgdGhlCisjICBjb3B5
cmlnaHQgbm90aWNlcywgYW5kIHRoZSBsaWNlbnNlIG5vdGljZSBzYXlpbmcgdGhpcyBMaWNlbnNl
IGFwcGxpZXMKKyMgLXRvIHRoZSBEb2N1bWVudCBhcmUgcmVwcm9kdWNlZCBpbiBhbGwgY29waWVz
LCBhbmQgdGhhdCB5b3UgYWRkIG5vIG90aGVyCisjIC1jb25kaXRpb25zIHdoYXRzb2V2ZXIgdG8g
dGhvc2Ugb2YgdGhpcyBMaWNlbnNlLiAgWW91IG1heSBub3QgdXNlCisjICt0byB0aGUgRG9jdW1l
bnQgYXJlIHJlcHJvZHVjZWQgaW4gYWxsIGNvcGllcywgYW5kIHRoYXQgeW91IGFkZCBubworIyAr
b3RoZXIgY29uZGl0aW9ucyB3aGF0c29ldmVyIHRvIHRob3NlIG9mIHRoaXMgTGljZW5zZS4gIFlv
dSBtYXkgbm90IHVzZQorIyAgdGVjaG5pY2FsIG1lYXN1cmVzIHRvIG9ic3RydWN0IG9yIGNvbnRy
b2wgdGhlIHJlYWRpbmcgb3IgZnVydGhlcgorIyAgY29weWluZyBvZiB0aGUgY29waWVzIHlvdSBt
YWtlIG9yIGRpc3RyaWJ1dGUuICBIb3dldmVyLCB5b3UgbWF5IGFjY2VwdAorIyAgY29tcGVuc2F0
aW9uIGluIGV4Y2hhbmdlIGZvciBjb3BpZXMuICBJZiB5b3UgZGlzdHJpYnV0ZSBhIGxhcmdlIGVu
b3VnaAorIyBAQCAtMTY5LDggKzE3MSw5IEBACisjICBlZGl0aW9uIHRvIHRoZSBwdWJsaWMuCisj
ICAKKyMgIEl0IGlzIHJlcXVlc3RlZCwgYnV0IG5vdCByZXF1aXJlZCwgdGhhdCB5b3UgY29udGFj
dCB0aGUgYXV0aG9ycyBvZiB0aGUKKyMgLURvY3VtZW50IHdlbGwgYmVmb3JlIHJlZGlzdHJpYnV0
aW5nIGFueSBsYXJnZSBudW1iZXIgb2YgY29waWVzLCB0byBnaXZlCisjIC10aGVtIGEgY2hhbmNl
IHRvIHByb3ZpZGUgeW91IHdpdGggYW4gdXBkYXRlZCB2ZXJzaW9uIG9mIHRoZSBEb2N1bWVudC4K
KyMgK0RvY3VtZW50IHdlbGwgYmVmb3JlIHJlZGlzdHJpYnV0aW5nIGFueSBsYXJnZSBudW1iZXIg
b2YgY29waWVzLCB0bworIyArZ2l2ZSB0aGVtIGEgY2hhbmNlIHRvIHByb3ZpZGUgeW91IHdpdGgg
YW4gdXBkYXRlZCB2ZXJzaW9uIG9mIHRoZQorIyArRG9jdW1lbnQuCisjICAKKyMgIAorIyAgNC4g
TU9ESUZJQ0FUSU9OUworIyBAQCAtMjg1LDE2ICsyODgsMTggQEAKKyMgIAorIyAgNi4gQ09MTEVD
VElPTlMgT0YgRE9DVU1FTlRTCisjICAKKyMgLVlvdSBtYXkgbWFrZSBhIGNvbGxlY3Rpb24gY29u
c2lzdGluZyBvZiB0aGUgRG9jdW1lbnQgYW5kIG90aGVyIGRvY3VtZW50cworIyAtcmVsZWFzZWQg
dW5kZXIgdGhpcyBMaWNlbnNlLCBhbmQgcmVwbGFjZSB0aGUgaW5kaXZpZHVhbCBjb3BpZXMgb2Yg
dGhpcworIyAtTGljZW5zZSBpbiB0aGUgdmFyaW91cyBkb2N1bWVudHMgd2l0aCBhIHNpbmdsZSBj
b3B5IHRoYXQgaXMgaW5jbHVkZWQgaW4KKyMgLXRoZSBjb2xsZWN0aW9uLCBwcm92aWRlZCB0aGF0
IHlvdSBmb2xsb3cgdGhlIHJ1bGVzIG9mIHRoaXMgTGljZW5zZSBmb3IKKyMgLXZlcmJhdGltIGNv
cHlpbmcgb2YgZWFjaCBvZiB0aGUgZG9jdW1lbnRzIGluIGFsbCBvdGhlciByZXNwZWN0cy4KKyMg
LQorIyAtWW91IG1heSBleHRyYWN0IGEgc2luZ2xlIGRvY3VtZW50IGZyb20gc3VjaCBhIGNvbGxl
Y3Rpb24sIGFuZCBkaXN0cmlidXRlCisjIC1pdCBpbmRpdmlkdWFsbHkgdW5kZXIgdGhpcyBMaWNl
bnNlLCBwcm92aWRlZCB5b3UgaW5zZXJ0IGEgY29weSBvZiB0aGlzCisjIC1MaWNlbnNlIGludG8g
dGhlIGV4dHJhY3RlZCBkb2N1bWVudCwgYW5kIGZvbGxvdyB0aGlzIExpY2Vuc2UgaW4gYWxsCisj
IC1vdGhlciByZXNwZWN0cyByZWdhcmRpbmcgdmVyYmF0aW0gY29weWluZyBvZiB0aGF0IGRvY3Vt
ZW50LgorIyArWW91IG1heSBtYWtlIGEgY29sbGVjdGlvbiBjb25zaXN0aW5nIG9mIHRoZSBEb2N1
bWVudCBhbmQgb3RoZXIKKyMgK2RvY3VtZW50cyByZWxlYXNlZCB1bmRlciB0aGlzIExpY2Vuc2Us
IGFuZCByZXBsYWNlIHRoZSBpbmRpdmlkdWFsCisjICtjb3BpZXMgb2YgdGhpcyBMaWNlbnNlIGlu
IHRoZSB2YXJpb3VzIGRvY3VtZW50cyB3aXRoIGEgc2luZ2xlIGNvcHkKKyMgK3RoYXQgaXMgaW5j
bHVkZWQgaW4gdGhlIGNvbGxlY3Rpb24sIHByb3ZpZGVkIHRoYXQgeW91IGZvbGxvdyB0aGUgcnVs
ZXMKKyMgK29mIHRoaXMgTGljZW5zZSBmb3IgdmVyYmF0aW0gY29weWluZyBvZiBlYWNoIG9mIHRo
ZSBkb2N1bWVudHMgaW4gYWxsCisjICtvdGhlciByZXNwZWN0cy4KKyMgKworIyArWW91IG1heSBl
eHRyYWN0IGEgc2luZ2xlIGRvY3VtZW50IGZyb20gc3VjaCBhIGNvbGxlY3Rpb24sIGFuZAorIyAr
ZGlzdHJpYnV0ZSBpdCBpbmRpdmlkdWFsbHkgdW5kZXIgdGhpcyBMaWNlbnNlLCBwcm92aWRlZCB5
b3UgaW5zZXJ0IGEKKyMgK2NvcHkgb2YgdGhpcyBMaWNlbnNlIGludG8gdGhlIGV4dHJhY3RlZCBk
b2N1bWVudCwgYW5kIGZvbGxvdyB0aGlzCisjICtMaWNlbnNlIGluIGFsbCBvdGhlciByZXNwZWN0
cyByZWdhcmRpbmcgdmVyYmF0aW0gY29weWluZyBvZiB0aGF0CisjICtkb2N1bWVudC4KKyMgIAor
IyAgCisjICA3LiBBR0dSRUdBVElPTiBXSVRIIElOREVQRU5ERU5UIFdPUktTCisjIEBAIC0zNDAs
MjIgKzM0NSwzOSBAQAorIyAgCisjICA5LiBURVJNSU5BVElPTgorIyAgCisjIC1Zb3UgbWF5IG5v
dCBjb3B5LCBtb2RpZnksIHN1YmxpY2Vuc2UsIG9yIGRpc3RyaWJ1dGUgdGhlIERvY3VtZW50IGV4
Y2VwdAorIyAtYXMgZXhwcmVzc2x5IHByb3ZpZGVkIGZvciB1bmRlciB0aGlzIExpY2Vuc2UuICBB
bnkgb3RoZXIgYXR0ZW1wdCB0bworIyAtY29weSwgbW9kaWZ5LCBzdWJsaWNlbnNlIG9yIGRpc3Ry
aWJ1dGUgdGhlIERvY3VtZW50IGlzIHZvaWQsIGFuZCB3aWxsCisjIC1hdXRvbWF0aWNhbGx5IHRl
cm1pbmF0ZSB5b3VyIHJpZ2h0cyB1bmRlciB0aGlzIExpY2Vuc2UuICBIb3dldmVyLAorIyAtcGFy
dGllcyB3aG8gaGF2ZSByZWNlaXZlZCBjb3BpZXMsIG9yIHJpZ2h0cywgZnJvbSB5b3UgdW5kZXIg
dGhpcworIyAtTGljZW5zZSB3aWxsIG5vdCBoYXZlIHRoZWlyIGxpY2Vuc2VzIHRlcm1pbmF0ZWQg
c28gbG9uZyBhcyBzdWNoCisjIC1wYXJ0aWVzIHJlbWFpbiBpbiBmdWxsIGNvbXBsaWFuY2UuCisj
ICtZb3UgbWF5IG5vdCBjb3B5LCBtb2RpZnksIHN1YmxpY2Vuc2UsIG9yIGRpc3RyaWJ1dGUgdGhl
IERvY3VtZW50CisjICtleGNlcHQgYXMgZXhwcmVzc2x5IHByb3ZpZGVkIHVuZGVyIHRoaXMgTGlj
ZW5zZS4gIEFueSBhdHRlbXB0CisjICtvdGhlcndpc2UgdG8gY29weSwgbW9kaWZ5LCBzdWJsaWNl
bnNlLCBvciBkaXN0cmlidXRlIGl0IGlzIHZvaWQsIGFuZAorIyArd2lsbCBhdXRvbWF0aWNhbGx5
IHRlcm1pbmF0ZSB5b3VyIHJpZ2h0cyB1bmRlciB0aGlzIExpY2Vuc2UuCisjICsKKyMgK0hvd2V2
ZXIsIGlmIHlvdSBjZWFzZSBhbGwgdmlvbGF0aW9uIG9mIHRoaXMgTGljZW5zZSwgdGhlbiB5b3Vy
IGxpY2Vuc2UKKyMgK2Zyb20gYSBwYXJ0aWN1bGFyIGNvcHlyaWdodCBob2xkZXIgaXMgcmVpbnN0
YXRlZCAoYSkgcHJvdmlzaW9uYWxseSwKKyMgK3VubGVzcyBhbmQgdW50aWwgdGhlIGNvcHlyaWdo
dCBob2xkZXIgZXhwbGljaXRseSBhbmQgZmluYWxseQorIyArdGVybWluYXRlcyB5b3VyIGxpY2Vu
c2UsIGFuZCAoYikgcGVybWFuZW50bHksIGlmIHRoZSBjb3B5cmlnaHQgaG9sZGVyCisjICtmYWls
cyB0byBub3RpZnkgeW91IG9mIHRoZSB2aW9sYXRpb24gYnkgc29tZSByZWFzb25hYmxlIG1lYW5z
IHByaW9yIHRvCisjICs2MCBkYXlzIGFmdGVyIHRoZSBjZXNzYXRpb24uCisjICsKKyMgK01vcmVv
dmVyLCB5b3VyIGxpY2Vuc2UgZnJvbSBhIHBhcnRpY3VsYXIgY29weXJpZ2h0IGhvbGRlciBpcwor
IyArcmVpbnN0YXRlZCBwZXJtYW5lbnRseSBpZiB0aGUgY29weXJpZ2h0IGhvbGRlciBub3RpZmll
cyB5b3Ugb2YgdGhlCisjICt2aW9sYXRpb24gYnkgc29tZSByZWFzb25hYmxlIG1lYW5zLCB0aGlz
IGlzIHRoZSBmaXJzdCB0aW1lIHlvdSBoYXZlCisjICtyZWNlaXZlZCBub3RpY2Ugb2YgdmlvbGF0
aW9uIG9mIHRoaXMgTGljZW5zZSAoZm9yIGFueSB3b3JrKSBmcm9tIHRoYXQKKyMgK2NvcHlyaWdo
dCBob2xkZXIsIGFuZCB5b3UgY3VyZSB0aGUgdmlvbGF0aW9uIHByaW9yIHRvIDMwIGRheXMgYWZ0
ZXIKKyMgK3lvdXIgcmVjZWlwdCBvZiB0aGUgbm90aWNlLgorIyArCisjICtUZXJtaW5hdGlvbiBv
ZiB5b3VyIHJpZ2h0cyB1bmRlciB0aGlzIHNlY3Rpb24gZG9lcyBub3QgdGVybWluYXRlIHRoZQor
IyArbGljZW5zZXMgb2YgcGFydGllcyB3aG8gaGF2ZSByZWNlaXZlZCBjb3BpZXMgb3IgcmlnaHRz
IGZyb20geW91IHVuZGVyCisjICt0aGlzIExpY2Vuc2UuICBJZiB5b3VyIHJpZ2h0cyBoYXZlIGJl
ZW4gdGVybWluYXRlZCBhbmQgbm90IHBlcm1hbmVudGx5CisjICtyZWluc3RhdGVkLCByZWNlaXB0
IG9mIGEgY29weSBvZiBzb21lIG9yIGFsbCBvZiB0aGUgc2FtZSBtYXRlcmlhbCBkb2VzCisjICtu
b3QgZ2l2ZSB5b3UgYW55IHJpZ2h0cyB0byB1c2UgaXQuCisjICAKKyMgIAorIyAgMTAuIEZVVFVS
RSBSRVZJU0lPTlMgT0YgVEhJUyBMSUNFTlNFCisjICAKKyMgLVRoZSBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb24gbWF5IHB1Ymxpc2ggbmV3LCByZXZpc2VkIHZlcnNpb25zCisjIC1vZiB0aGUgR05V
IEZyZWUgRG9jdW1lbnRhdGlvbiBMaWNlbnNlIGZyb20gdGltZSB0byB0aW1lLiAgU3VjaCBuZXcK
KyMgLXZlcnNpb25zIHdpbGwgYmUgc2ltaWxhciBpbiBzcGlyaXQgdG8gdGhlIHByZXNlbnQgdmVy
c2lvbiwgYnV0IG1heQorIyAtZGlmZmVyIGluIGRldGFpbCB0byBhZGRyZXNzIG5ldyBwcm9ibGVt
cyBvciBjb25jZXJucy4gIFNlZQorIyAtaHR0cDovL3d3dy5nbnUub3JnL2NvcHlsZWZ0Ly4KKyMg
K1RoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24gbWF5IHB1Ymxpc2ggbmV3LCByZXZpc2VkIHZl
cnNpb25zIG9mIHRoZQorIyArR05VIEZyZWUgRG9jdW1lbnRhdGlvbiBMaWNlbnNlIGZyb20gdGlt
ZSB0byB0aW1lLiAgU3VjaCBuZXcgdmVyc2lvbnMKKyMgK3dpbGwgYmUgc2ltaWxhciBpbiBzcGly
aXQgdG8gdGhlIHByZXNlbnQgdmVyc2lvbiwgYnV0IG1heSBkaWZmZXIgaW4KKyMgK2RldGFpbCB0
byBhZGRyZXNzIG5ldyBwcm9ibGVtcyBvciBjb25jZXJucy4gIFNlZQorIyAraHR0cHM6Ly93d3cu
Z251Lm9yZy9saWNlbnNlcy8uCisjICAKKyMgIEVhY2ggdmVyc2lvbiBvZiB0aGUgTGljZW5zZSBp
cyBnaXZlbiBhIGRpc3Rpbmd1aXNoaW5nIHZlcnNpb24gbnVtYmVyLgorIyAgSWYgdGhlIERvY3Vt
ZW50IHNwZWNpZmllcyB0aGF0IGEgcGFydGljdWxhciBudW1iZXJlZCB2ZXJzaW9uIG9mIHRoaXMK
KyMgQEAgLTM2NCw3ICszODYsMzkgQEAKKyMgIG9mIGFueSBsYXRlciB2ZXJzaW9uIHRoYXQgaGFz
IGJlZW4gcHVibGlzaGVkIChub3QgYXMgYSBkcmFmdCkgYnkgdGhlCisjICBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb24uICBJZiB0aGUgRG9jdW1lbnQgZG9lcyBub3Qgc3BlY2lmeSBhIHZlcnNpb24K
KyMgIG51bWJlciBvZiB0aGlzIExpY2Vuc2UsIHlvdSBtYXkgY2hvb3NlIGFueSB2ZXJzaW9uIGV2
ZXIgcHVibGlzaGVkIChub3QKKyMgLWFzIGEgZHJhZnQpIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb24uCisjICthcyBhIGRyYWZ0KSBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9u
LiAgSWYgdGhlIERvY3VtZW50CisjICtzcGVjaWZpZXMgdGhhdCBhIHByb3h5IGNhbiBkZWNpZGUg
d2hpY2ggZnV0dXJlIHZlcnNpb25zIG9mIHRoaXMKKyMgK0xpY2Vuc2UgY2FuIGJlIHVzZWQsIHRo
YXQgcHJveHkncyBwdWJsaWMgc3RhdGVtZW50IG9mIGFjY2VwdGFuY2Ugb2YgYQorIyArdmVyc2lv
biBwZXJtYW5lbnRseSBhdXRob3JpemVzIHlvdSB0byBjaG9vc2UgdGhhdCB2ZXJzaW9uIGZvciB0
aGUKKyMgK0RvY3VtZW50LgorIyArCisjICsxMS4gUkVMSUNFTlNJTkcKKyMgKworIyArIk1hc3Np
dmUgTXVsdGlhdXRob3IgQ29sbGFib3JhdGlvbiBTaXRlIiAob3IgIk1NQyBTaXRlIikgbWVhbnMg
YW55CisjICtXb3JsZCBXaWRlIFdlYiBzZXJ2ZXIgdGhhdCBwdWJsaXNoZXMgY29weXJpZ2h0YWJs
ZSB3b3JrcyBhbmQgYWxzbworIyArcHJvdmlkZXMgcHJvbWluZW50IGZhY2lsaXRpZXMgZm9yIGFu
eWJvZHkgdG8gZWRpdCB0aG9zZSB3b3Jrcy4gIEEKKyMgK3B1YmxpYyB3aWtpIHRoYXQgYW55Ym9k
eSBjYW4gZWRpdCBpcyBhbiBleGFtcGxlIG9mIHN1Y2ggYSBzZXJ2ZXIuICBBCisjICsiTWFzc2l2
ZSBNdWx0aWF1dGhvciBDb2xsYWJvcmF0aW9uIiAob3IgIk1NQyIpIGNvbnRhaW5lZCBpbiB0aGUg
c2l0ZQorIyArbWVhbnMgYW55IHNldCBvZiBjb3B5cmlnaHRhYmxlIHdvcmtzIHRodXMgcHVibGlz
aGVkIG9uIHRoZSBNTUMgc2l0ZS4KKyMgKworIyArIkNDLUJZLVNBIiBtZWFucyB0aGUgQ3JlYXRp
dmUgQ29tbW9ucyBBdHRyaWJ1dGlvbi1TaGFyZSBBbGlrZSAzLjAKKyMgK2xpY2Vuc2UgcHVibGlz
aGVkIGJ5IENyZWF0aXZlIENvbW1vbnMgQ29ycG9yYXRpb24sIGEgbm90LWZvci1wcm9maXQKKyMg
K2NvcnBvcmF0aW9uIHdpdGggYSBwcmluY2lwYWwgcGxhY2Ugb2YgYnVzaW5lc3MgaW4gU2FuIEZy
YW5jaXNjbywKKyMgK0NhbGlmb3JuaWEsIGFzIHdlbGwgYXMgZnV0dXJlIGNvcHlsZWZ0IHZlcnNp
b25zIG9mIHRoYXQgbGljZW5zZQorIyArcHVibGlzaGVkIGJ5IHRoYXQgc2FtZSBvcmdhbml6YXRp
b24uCisjICsKKyMgKyJJbmNvcnBvcmF0ZSIgbWVhbnMgdG8gcHVibGlzaCBvciByZXB1Ymxpc2gg
YSBEb2N1bWVudCwgaW4gd2hvbGUgb3IgaW4KKyMgK3BhcnQsIGFzIHBhcnQgb2YgYW5vdGhlciBE
b2N1bWVudC4KKyMgKworIyArQW4gTU1DIGlzICJlbGlnaWJsZSBmb3IgcmVsaWNlbnNpbmciIGlm
IGl0IGlzIGxpY2Vuc2VkIHVuZGVyIHRoaXMKKyMgK0xpY2Vuc2UsIGFuZCBpZiBhbGwgd29ya3Mg
dGhhdCB3ZXJlIGZpcnN0IHB1Ymxpc2hlZCB1bmRlciB0aGlzIExpY2Vuc2UKKyMgK3NvbWV3aGVy
ZSBvdGhlciB0aGFuIHRoaXMgTU1DLCBhbmQgc3Vic2VxdWVudGx5IGluY29ycG9yYXRlZCBpbiB3
aG9sZSBvcgorIyAraW4gcGFydCBpbnRvIHRoZSBNTUMsICgxKSBoYWQgbm8gY292ZXIgdGV4dHMg
b3IgaW52YXJpYW50IHNlY3Rpb25zLCBhbmQKKyMgKygyKSB3ZXJlIHRodXMgaW5jb3Jwb3JhdGVk
IHByaW9yIHRvIE5vdmVtYmVyIDEsIDIwMDguCisjICsKKyMgK1RoZSBvcGVyYXRvciBvZiBhbiBN
TUMgU2l0ZSBtYXkgcmVwdWJsaXNoIGFuIE1NQyBjb250YWluZWQgaW4gdGhlIHNpdGUKKyMgK3Vu
ZGVyIENDLUJZLVNBIG9uIHRoZSBzYW1lIHNpdGUgYXQgYW55IHRpbWUgYmVmb3JlIEF1Z3VzdCAx
LCAyMDA5LAorIyArcHJvdmlkZWQgdGhlIE1NQyBpcyBlbGlnaWJsZSBmb3IgcmVsaWNlbnNpbmcu
CisjICAKKyMgIAorIyAgQURERU5EVU06IEhvdyB0byB1c2UgdGhpcyBMaWNlbnNlIGZvciB5b3Vy
IGRvY3VtZW50cworIyBAQCAtMzc1LDcgKzQyOSw3IEBACisjICAKKyMgICAgICBDb3B5cmlnaHQg
KGMpICBZRUFSICBZT1VSIE5BTUUuCisjICAgICAgUGVybWlzc2lvbiBpcyBncmFudGVkIHRvIGNv
cHksIGRpc3RyaWJ1dGUgYW5kL29yIG1vZGlmeSB0aGlzIGRvY3VtZW50CisjIC0gICAgdW5kZXIg
dGhlIHRlcm1zIG9mIHRoZSBHTlUgRnJlZSBEb2N1bWVudGF0aW9uIExpY2Vuc2UsIFZlcnNpb24g
MS4yCisjICsgICAgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgRnJlZSBEb2N1bWVudGF0aW9u
IExpY2Vuc2UsIFZlcnNpb24gMS4zCisjICAgICAgb3IgYW55IGxhdGVyIHZlcnNpb24gcHVibGlz
aGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247CisjICAgICAgd2l0aCBubyBJbnZh
cmlhbnQgU2VjdGlvbnMsIG5vIEZyb250LUNvdmVyIFRleHRzLCBhbmQgbm8gQmFjay1Db3ZlciBU
ZXh0cy4KKyMgICAgICBBIGNvcHkgb2YgdGhlIGxpY2Vuc2UgaXMgaW5jbHVkZWQgaW4gdGhlIHNl
Y3Rpb24gZW50aXRsZWQgIkdOVQorIyBAQCAtMzk0LDQgKzQ0OCw0IEBACisjICBJZiB5b3VyIGRv
Y3VtZW50IGNvbnRhaW5zIG5vbnRyaXZpYWwgZXhhbXBsZXMgb2YgcHJvZ3JhbSBjb2RlLCB3ZQor
IyAgcmVjb21tZW5kIHJlbGVhc2luZyB0aGVzZSBleGFtcGxlcyBpbiBwYXJhbGxlbCB1bmRlciB5
b3VyIGNob2ljZSBvZgorIyAgZnJlZSBzb2Z0d2FyZSBsaWNlbnNlLCBzdWNoIGFzIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSwKKyMgLXRvIHBlcm1pdCB0aGVpciB1c2UgaW4gZnJlZSBz
b2Z0d2FyZS4KKyMgK3RvIHBlcm1pdCB0aGVpciB1c2UgaW4gZnJlZSBzb2Z0d2FyZS4tLS0gc3Jj
L01ha2VmaWxlLmFtCisjICsrKyBzcmMvTWFrZWZpbGUuYW0KKyMgQEAgLTEsNiArMSw2IEBACisj
ICAjICBGTEFDIC0gRnJlZSBMb3NzbGVzcyBBdWRpbyBDb2RlYworIyAgIyAgQ29weXJpZ2h0IChD
KSAyMDAxLTIwMDkgIEpvc2ggQ29hbHNvbgorIyAtIyAgQ29weXJpZ2h0IChDKSAyMDExLTIwMjMg
IFhpcGguT3JnIEZvdW5kYXRpb24KKyMgKyMgIENvcHlyaWdodCAoQykgMjAxMS0yMDI1ICBYaXBo
Lk9yZyBGb3VuZGF0aW9uCisjICAjCisjICAjICBUaGlzIGZpbGUgaXMgcGFydCB0aGUgRkxBQyBw
cm9qZWN0LiAgRkxBQyBpcyBjb21wcmlzZWQgb2Ygc2V2ZXJhbAorIyAgIyAgY29tcG9uZW50cyBk
aXN0cmlidXRlZCB1bmRlciBkaWZmZXJlbnQgbGljZW5zZXMuICBUaGUgY29kZWMgbGlicmFyaWVz
CisjIC0tLSBzcmMvZmxhYy9tYWluLmMKKyMgKysrIHNyYy9mbGFjL21haW4uYworIyBAQCAtMSw2
ICsxLDYgQEAKKyMgIC8qIGZsYWMgLSBDb21tYW5kLWxpbmUgRkxBQyBlbmNvZGVyL2RlY29kZXIK
KyMgICAqIENvcHlyaWdodCAoQykgMjAwMC0yMDA5ICBKb3NoIENvYWxzb24KKyMgLSAqIENvcHly
aWdodCAoQykgMjAxMS0yMDIzICBYaXBoLk9yZyBGb3VuZGF0aW9uCisjICsgKiBDb3B5cmlnaHQg
KEMpIDIwMTEtMjAyNSAgWGlwaC5PcmcgRm91bmRhdGlvbgorIyAgICoKKyMgICAqIFRoaXMgcHJv
Z3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKKyMg
ICAqIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlCisjIC0tLSBDT1BZSU5HLlhpcGgKKyMgKysrIENPUFlJTkcuWGlwaAorIyBAQCAtMSw1
ICsxLDUgQEAKKyMgIENvcHlyaWdodCAoQykgMjAwMC0yMDA5ICBKb3NoIENvYWxzb24KKyMgLUNv
cHlyaWdodCAoQykgMjAxMS0yMDIzICBYaXBoLk9yZyBGb3VuZGF0aW9uCisjICtDb3B5cmlnaHQg
KEMpIDIwMTEtMjAyNSAgWGlwaC5PcmcgRm91bmRhdGlvbgorIyAgCisjICBSZWRpc3RyaWJ1dGlv
biBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMg
IG1vZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSBmb2xsb3dpbmcg
Y29uZGl0aW9ucworIyAKKyMKKwogU1VNTUFSWSA9ICJGcmVlIExvc3NsZXNzIEF1ZGlvIENvZGVj
IgogREVTQ1JJUFRJT04gPSAiRkxBQyBzdGFuZHMgZm9yIEZyZWUgTG9zc2xlc3MgQXVkaW8gQ29k
ZWMsIGEgbG9zc2xlc3MgYXVkaW8gY29tcHJlc3Npb24gZm9ybWF0LiIKIEhPTUVQQUdFID0gImh0
dHBzOi8veGlwaC5vcmcvZmxhYy8iCiBCVUdUUkFDS0VSID0gImh0dHBzOi8vZ2l0aHViLmNvbS94
aXBoL2ZsYWMvaXNzdWVzIgogU0VDVElPTiA9ICJsaWJzIgogTElDRU5TRSA9ICJHRkRMLTEuMiAm
IEdQTC0yLjAtb3ItbGF0ZXIgJiBMR1BMLTIuMS1vci1sYXRlciAmIEJTRC0zLUNsYXVzZSIKLUxJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkcuRkRMO21kNT1hZDE0MTllY2M1NmUwNjBl
Y2NmODE4NGE4N2M0Mjg1ZiBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvTWFrZWZp
bGUuYW07YmVnaW5saW5lPTE7ZW5kbGluZT0xNzttZDU9YjFkYWIyNzA0YmU3ZjAxYmZiZDliN2Y2
ZDVmMDAwYTkgXAorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORy5GREw7bWQ1PTgw
MmU3OWUzOTRlMzcyZDAxZTg2M2UzZjQwNThjZjQwIFwKKyAgICAgICAgICAgICAgICAgICAgZmls
ZTovL3NyYy9NYWtlZmlsZS5hbTtiZWdpbmxpbmU9MTtlbmRsaW5lPTE3O21kNT05Yzg4MjE1MzEz
MmRmOGYzYTFjYjFhOGNhMWYyMzUwZiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZ
SU5HLkdQTDttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMgXAotICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vc3JjL2ZsYWMvbWFpbi5jO2JlZ2lubGluZT0xO2VuZGxpbmU9MTg7
bWQ1PTIzMDk5MTE5YzAzNGQ4OTRiZDFiZjdlZjViZDIyMTAxIFwKKyAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL3NyYy9mbGFjL21haW4uYztiZWdpbmxpbmU9MTtlbmRsaW5lPTE4O21kNT0xZTgy
NmI1MDgzYmExZTAyODg1MmZlN2NlZWM2YThhZCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9DT1BZSU5HLkxHUEw7bWQ1PWZiYzA5MzkwMTg1N2ZjZDExOGYwNjVmOTAwOTgyYzI0IFwKLSAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJTkcuWGlwaDttZDU9MGM5MGU0MWFiMmZhN2U2
OWNhOTM5MTMzMGQ4NzAyMjEgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vaW5jbHVkZS9G
TEFDL2FsbC5oO2JlZ2lubGluZT02NTtlbmRsaW5lPTcwO21kNT0zOWFhZjVlMDNjNzM2NDM2Mzg4
NGM4YjhkZGRhOGVlYSIKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJTkcuWGlwaDtt
ZDU9NzhhMTMxYjJlYTUwNjc1ZDI0NWQyODBjY2MzNGY4YjYgXAorICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vaW5jbHVkZS9GTEFDL2FsbC5oO2JlZ2lubGluZT02NTtlbmRsaW5lPTcwO21kNT0z
OWFhZjVlMDNjNzM2NDM2Mzg4NGM4YjhkZGRhOGVlYSBcCisgICAgICAgICAgICAgICAgICAgICIK
IAogU1JDX1VSSSA9ICJodHRwOi8vZG93bmxvYWRzLnhpcGgub3JnL3JlbGVhc2VzL2ZsYWMvJHtC
UH0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZjNThlNjljZDIyMzQ4ZjQ0MWI4NjEw
OTJiODI1ZTU5MWQwYjgyMmUxMDZkZTZlYjBlZTRkMDVkMjcyMDViNzAiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZjJjMWM3NjU5MmE4MmZmZmY4NDEzYmEzYzRhMTI5OWI2YzdhYjA2YzczNGRlZTAz
ZmQ4ODYzMDQ4NWMyYjkyMCIKIAogQ1ZFX1BST0RVQ1QgPSAibGliZmxhYyBmbGFjIgogCi0tIAoy
LjQ0LjEKCg==

--===============7784624973135550975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (922 cached, 1 parsed). 1884 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:0df91bfae5524f20d357357b2764088722bc7c3d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 104 Local 94 Mirrors 0 Missed 10 Current 267 (90% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 363 of 371 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 366 of 371 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 369 of 371 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1082 of 1101 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_fetch)
NOTE: recipe flac-1.5.0-r0: task do_fetch: Started
NOTE: recipe flac-1.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1083 of 1101 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_unpack)
NOTE: Running task 1084 of 1101 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.5.0-r0: task do_unpack: Started
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1085 of 1101 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_patch)
NOTE: Running task 1086 of 1101 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_collect_spdx_deps)
NOTE: recipe flac-1.5.0-r0: task do_patch: Started
NOTE: recipe flac-1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1088 of 1101 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_lic)
NOTE: Running task 1089 of 1101 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_configure)
NOTE: recipe flac-1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_lic: Started
NOTE: recipe flac-1.5.0-r0: task do_configure: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_lic unihash changed to b783d13f40d477c5593e42b298fedf17c99f55af309749db3df04a22f2b41989
NOTE: recipe flac-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1090 of 1101 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_compile)
NOTE: recipe flac-1.5.0-r0: task do_compile: Started
NOTE: recipe flac-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1091 of 1101 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_install)
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
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 flac++.pc '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/lib/pkgconfig'
|  /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../../../flac-1.5.0/src/libFLAC++/libFLAC++.m4 '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/aclocal'
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/temp/run.do_install.1306752:157 exit 2 from 'sed -i "s#/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/flac-1.5.0/include#/usr/include#g" /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/doc/flac/FLAC.tag /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/image/usr/share/doc/flac/api/*.html'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/temp/run.do_install.1306752, line 157
| 	#2: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/temp/run.do_install.1306752, line 207
NOTE: recipe flac-1.5.0-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 1091 tasks of which 1082 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315133006.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315133006.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_install
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/temp/log.do_install.1306752
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: flac-1.5.0-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/temp/run.do_install.1306752' failed with exit code 2
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/flac/1.5.0/temp/log.do_install.1306752
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_install) failed with exit code '1'

--===============7784624973135550975==--

