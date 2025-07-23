Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984BFC83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 14:55:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16673.1753282517401376007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 07:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F8B522C7
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 07:55:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3DD3D3F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 07:55:16 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] pybootchartgui: mark a regex as a raw string
Date: Wed, 23 Jul 2025 15:55:06 +0100
Message-ID: <20250723145507.584335-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 14:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220806

Otherwise Python tries to unescape the \s and warns that it can't.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybo=
otchartgui/pybootchartgui/draw.py
index 16739a0fa19..09253ea1852 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -844,7 +844,7 @@ def draw_header (ctx, headers, duration):
     toshow =3D [
       ('system.uname', 'uname', lambda s: s),
       ('system.release', 'release', lambda s: s),
-      ('system.cpu', 'CPU', lambda s: re.sub('model name\s*:\s*', '', s,=
 1)),
+      ('system.cpu', 'CPU', lambda s: re.sub(r'model name\s*:\s*', '', s=
, 1)),
       ('system.kernel.options', 'kernel options', lambda s: s),
     ]
=20
--=20
2.43.0


