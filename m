Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4725CF483DE
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 17:46:19 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1235.1774287970129690505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 10:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=DrrwB8oF;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alhe-dev-ub.waqitnwczulubdoacjva2kqlvd.phxx.internal.cloudapp.net (unknown [134.33.52.9])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6DCB920B6F01
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 10:46:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6DCB920B6F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1774287969;
	bh=l4Yw+UCoAohZUjKpFA/aSGxAMguWE/eQzgb2hHN+680=;
	h=From:To:Subject:Date:From;
	b=DrrwB8oF31biWAtWYuqvbuJ89TddGhKfoYNjG8pz/MrXBRltvbnvU2xPcXRglUVVf
	 ZDYB5IkUd4xztXdoJIanqSey6vf4M10wFF1k4YyR7yGBwVCy2yngLiZbJs85bAxUCj
	 1bYr69p556DQckuxOhP5yFQWYNXI7w2ujv1GtjUQ=
From: Alejandro Hernandez <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libffi: remove disable-exec-static-tramp from EXTRA_OECONF
Date: Mon, 23 Mar 2026 17:46:03 +0000
Message-ID: <20260323174603.3262707-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 17:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233753

disable-exec-static-tramp is no longer necessary, since such behavior has=
 been
fixed upstream.

Debian/Ubuntu also dropped this flag on version 3.5.2:
https://changelogs.ubuntu.com/changelogs/pool/main/libf/libffi/libffi_3.5=
.2-3/changelog

Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
---
 meta/recipes-support/libffi/libffi_3.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libffi/libffi_3.5.2.bb b/meta/recipes-s=
upport/libffi/libffi_3.5.2.bb
index f648a33a46..d3aa90d429 100644
--- a/meta/recipes-support/libffi/libffi_3.5.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.5.2.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-=
${PV}.tar.gz \
            "
 SRC_URI[sha256sum] =3D "f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a=
52e335676bac82dc"
=20
-EXTRA_OECONF +=3D "--disable-builddir --disable-exec-static-tramp"
+EXTRA_OECONF =3D "--disable-builddir"
 EXTRA_OECONF:class-native +=3D "--with-gcc-arch=3Dgeneric"
 EXTRA_OEMAKE:class-target =3D "LIBTOOLFLAGS=3D'--tag=3DCC'"
=20
--=20
2.43.0


