Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FEC1C87FD8
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:50 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.12178.1752594941273060025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vFRnLVHb;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PSliBSJY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101980ecc9f65-349b2949-19ff-4165-82a1-58d7b07330df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594948;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u26Fd23eZFUmE0CPYhkZNSuyd1giSq7hkjV/9SJYldo=;
	b=vFRnLVHbl+sb9PNOJA0QMioD8RKwJC57cujeuVJ7/qyr5AGDTtqqXJ4Pt5BszTmy
	AORAbOClKWVRUxJQq452+mI892iZAvBKy8JHMsIeM5S2wMtCba288uApZQqjL+DtL/2
	w/37xUw+ibne32RsTqsXbRUYg67wDs0zW1AVwSz0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594948;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u26Fd23eZFUmE0CPYhkZNSuyd1giSq7hkjV/9SJYldo=;
	b=PSliBSJYb92qTYA8flPMXeLHyubHucJkKlxzb6w4iBsz/rEAslo0CZfuNAK4MOJq
	fXyxlsqo5qq7GmIcuBI41cZsbRU8cdmqxgkwgCVp5g9YhxVE38QWViPbfR3kTXLrf3A
	hs8pyWOQJ2xFtT70yvvqe5KnABIWWsUXi8gTceU0=
Content-Type: multipart/mixed; boundary="===============9010064036456202650=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gi-docgen: upgrading to 2025.4 SUCCEEDED
Message-ID: <010101980ecc9f65-349b2949-19ff-4165-82a1-58d7b07330df-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220365

--===============9010064036456202650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gi-docgen* to *2025.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gi-docgen-upgrade-2025.3-2025.4.patch
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
From 7528eb79a77420cc76c84a01dfd1c4ad61bc5dda Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 13:15:02 +0000
Subject: [PATCH] gi-docgen: upgrade 2025.3 -> 2025.4

---
 .../gi-docgen/{gi-docgen_2025.3.bb => gi-docgen_2025.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gi-docgen/{gi-docgen_2025.3.bb => gi-docgen_2025.4.bb} (94%)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_2025.4.bb
similarity index 94%
rename from meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
rename to meta/recipes-gnome/gi-docgen/gi-docgen_2025.4.bb
index 8651ab8167..19aacb765e 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2025.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f0120247
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
 
-SRCREV = "9ab2ab8fa3f4a04f5d2cc24b0c8e91e73bc57b51"
+SRCREV = "0517026e0bf51b3776efa4689da44ea0c99e343e"
 
 inherit python_setuptools_build_meta
 
-- 
2.47.1


--===============9010064036456202650==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gi-docgen-upgrade-2025.3-2025.4.patch"

RnJvbSA3NTI4ZWI3OWE3NzQyMGNjNzZjODRhMDFkZmQxYzRhZDYxYmM1ZGRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTM6MTU6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aS1kb2NnZW46IHVwZ3JhZGUgMjAyNS4zIC0+IDIwMjUuNAoKLS0tCiAuLi4vZ2ktZG9jZ2VuL3tn
aS1kb2NnZW5fMjAyNS4zLmJiID0+IGdpLWRvY2dlbl8yMDI1LjQuYmJ9ICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ25vbWUvZ2ktZG9jZ2VuL3tnaS1kb2NnZW5fMjAyNS4zLmJiID0+IGdpLWRvY2dl
bl8yMDI1LjQuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2dpLWRv
Y2dlbi9naS1kb2NnZW5fMjAyNS4zLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2dpLWRvY2dlbi9n
aS1kb2NnZW5fMjAyNS40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1nbm9tZS9naS1kb2NnZW4vZ2ktZG9jZ2VuXzIwMjUuMy5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWdub21lL2dpLWRvY2dlbi9naS1kb2NnZW5fMjAyNS40LmJiCmluZGV4IDg2NTFh
YjgxNjcuLjE5YWFjYjc2NWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9naS1kb2Nn
ZW4vZ2ktZG9jZ2VuXzIwMjUuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ2ktZG9jZ2Vu
L2dpLWRvY2dlbl8yMDI1LjQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vZ2ktZG9jZ2VuLnB5O2JlZ2lubGluZT0xO2VuZGxpbmU9NTttZDU9MmRjMGYxZjAx
MjAyNDcKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2dpLWRvY2dl
bi5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCiAKLVNSQ1JFViA9ICI5YWIyYWI4ZmEz
ZjRhMDRmNWQyY2MyNGIwYzhlOTFlNzNiYzU3YjUxIgorU1JDUkVWID0gIjA1MTcwMjZlMGJmNTFi
Mzc3NmVmYTQ2ODlkYTQ0ZWEwYzk5ZTM0M2UiCiAKIGluaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNf
YnVpbGRfbWV0YQogCi0tIAoyLjQ3LjEKCg==

--===============9010064036456202650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gi-docgen/gi-docgen-dbg: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/core2-64-poky-linux/gi-docgen/gi-docgen-dbg: PV changed from "2025.3" to "2025.4"
packages/core2-64-poky-linux/gi-docgen/gi-docgen-dev: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/core2-64-poky-linux/gi-docgen/gi-docgen-dev: PV changed from "2025.3" to "2025.4"
packages/core2-64-poky-linux/gi-docgen/gi-docgen-doc: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/core2-64-poky-linux/gi-docgen/gi-docgen-doc: PV changed from "2025.3" to "2025.4"
packages/core2-64-poky-linux/gi-docgen/gi-docgen-locale: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/core2-64-poky-linux/gi-docgen/gi-docgen-locale: PV changed from "2025.3" to "2025.4"
packages/core2-64-poky-linux/gi-docgen/gi-docgen-src: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/core2-64-poky-linux/gi-docgen/gi-docgen-src: PV changed from "2025.3" to "2025.4"
packages/core2-64-poky-linux/gi-docgen/gi-docgen-staticdev: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/core2-64-poky-linux/gi-docgen/gi-docgen-staticdev: PV changed from "2025.3" to "2025.4"
packages/core2-64-poky-linux/gi-docgen/gi-docgen: PKGSIZE changed from 2310180 to 2314810 (+0%)
packages/core2-64-poky-linux/gi-docgen/gi-docgen: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/core2-64-poky-linux/gi-docgen/gi-docgen: PV changed from "2025.3" to "2025.4"
packages/core2-64-poky-linux/gi-docgen: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/core2-64-poky-linux/gi-docgen: PV changed from "2025.3" to "2025.4"
Changes to packages/core2-64-poky-linux/gi-docgen (sysroot):
  /usr/lib/python3.13/site-packages/gi_docgen-2025.3.dist-info moved to /usr/lib/python3.13/site-packages/gi_docgen-2025.4.dist-info

--===============9010064036456202650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/gi-docgen (sysroot):
  /usr/lib/python3.13/site-packages/gi_docgen-2025.3.dist-info moved to /usr/lib/python3.13/site-packages/gi_docgen-2025.4.dist-info

--===============9010064036456202650==--

