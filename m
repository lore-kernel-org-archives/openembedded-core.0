Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76222C001DE
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 18:30:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.42733.1691433027278490038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 11:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A03251FB;
	Mon,  7 Aug 2023 11:31:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3CDE13F64C;
	Mon,  7 Aug 2023 11:30:26 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] openssh: upgrade to 9.3p2
Date: Mon,  7 Aug 2023 19:30:22 +0100
Message-Id: <20230807183022.4132087-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 18:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185618

From: Ross Burton <ross.burton@arm.com>

9795c401 (tag: V_9_3_P2) OpenSSH 9.3p2
bde3635f update version in README
f673f2f3 update RPM spec versions
d7790cdc disallow remote addition of FIDO/PKCS11 keys
b23fe83f terminate pkcs11 process for bad libraries

This includes the fix for CVE-2023-38408.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../openssh/{openssh_9.3p1.bb =3D> openssh_9.3p2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.3p1.bb =3D> openssh_=
9.3p2.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.3p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.3p2.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_9.3p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.3p2.bb
index 3edc123b9a3..5fb2dccdfc8 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.3p2.bb
@@ -26,7 +26,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
            file://add-test-support-for-busybox.patch \
            file://7280401bdd77ca54be6867a154cc01e0d72612e0.patch \
            "
-SRC_URI[sha256sum] =3D "e9baba7701a76a51f3d85a62c383a3c9dcd97fa900b859bc=
7db114c1868af8a8"
+SRC_URI[sha256sum] =3D "200ebe147f6cb3f101fd0cdf9e02442af7ddca298dffd9f4=
56878e7ccac676e8"
=20
 CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE is specif=
ic to OpenSSH with the pam opie which we don't build/use here."
=20
--=20
2.34.1


