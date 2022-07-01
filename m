Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19C9C2BBEA
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.39380.1656687063067681468
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OfO+Fur+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010181ba3e6b71-e123f4c0-a490-4fc1-b306-ca90fc6f8dc7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DwGTI3oL6KqRPAhrWYy6c3Dya4/6XOPYT3+QZwlhPOU=;
	b=OfO+Fur+d0qoy10oDuTsrCW5bfLm/81hqawME4+4zXMLIbAEogFaPeB1+kJDdXyK
	EBm46OxOyAhNxeTy6BAI39jYoSzaqmc+1c5xlSkRkRtx06eXsK3E4xJbSyI7k5cRcNa
	3L4qi8Az9TRNnR6L9f4unJOtjggeypFhfsKOkUTk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DwGTI3oL6KqRPAhrWYy6c3Dya4/6XOPYT3+QZwlhPOU=;
	b=gQLCRD/tyrZAIkag4dgEdw3LP8FR9yRUR36LmQToblpXVw4uWejvdAzWa7LDELeT
	G+Cggt7qvoiWzdXp+xPD+u0zFUIEKEVPaOIodwC/caT7CSC2Nn0PAXkMMthKpyeBJ9s
	LxRTG02Gjhg3xylloA7J+gBJmjtz5Nv9Q3iX5FJ4=
Content-Type: multipart/mixed; boundary="===============6486541831065978591=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 37.0.3 SUCCEEDED
Message-ID: 
 <01010181ba3e6b71-e123f4c0-a490-4fc1-b306-ca90fc6f8dc7-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167488

--===============6486541831065978591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography-vectors* to *37.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-upgrade-37.0.2-37.0.3.patch
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
--===============6486541831065978591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-37.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-37.0.3.tar.gz"
packages/core2-32-poky-linux/python3-cryptography-vectors: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGSIZE changed from 74825183 to 74825906 (+0%)
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "37.0.2" to "37.0.3"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.2.dist-info -> /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.3.dist-info, added "/usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__about__.cpython-39.pyc"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 37.0.2 [default] to 37.0.3 [default]
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.2.dist-info moved to /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.3.dist-info
  /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__about__.cpython-39.pyc was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__init__.cpython-39.pyc was added

--===============6486541831065978591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.2.dist-info -> /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.3.dist-info, added "/usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__about__.cpython-39.pyc /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__init__.cpython-39.pyc"
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.2.dist-info moved to /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.3.dist-info
  /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__about__.cpython-39.pyc was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__init__.cpython-39.pyc was added

--===============6486541831065978591==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-37.0.2-37.0.3.patch"

From 4178422fac719212cbb4c487ee6c705fb2bf3607 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 08:28:43 +0000
Subject: [PATCH] python3-cryptography-vectors: upgrade 37.0.2 -> 37.0.3

---
 ...vectors_37.0.2.bb => python3-cryptography-vectors_37.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_37.0.2.bb => python3-cryptography-vectors_37.0.3.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_37.0.3.bb
index 3dbdc8ce3e..8c0a7ee9d3 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "7c65d3de51756f418142df605417ec2c6e961c364f70cc8a103030889d5a3219"
+SRC_URI[sha256sum] = "ac90c1340f73bc29b3bf964120b2db5f8e98e1fcf0074d85ddc871541974a559"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.31.1


--===============6486541831065978591==--

