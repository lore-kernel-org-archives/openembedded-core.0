Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3697BC04FFE
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 01:07:01 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by mx.groups.io with SMTP id smtpd.web10.10514.1714956213514666492
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 May 2024 17:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pm.me header.s=protonmail3 header.b=kreSTT1v;
 spf=pass (domain: pm.me, ip: 185.70.43.22, mailfrom: antoningodard@pm.me)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1714956211; x=1715215411;
	bh=bypEnfL5ppt8AI9Vsogwn4EKds9tAPwSNa8rVZSXzSQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kreSTT1v5tOo4tlSihLsdzy/vnDiMZ+yceiyVTtUz+uMDOJjZFudo6GjVztkdCxhK
	 1/YUFlAjlEh/se8560ieghVWKZhsN4D9kPMEOAX1kusrsj2Mum7oBy0qtAJpn1i1iL
	 Y57DxVEO6IPtR2/uFNaKcGvOkcJ286ncMHlilezmhRKA6vDoIBQn7zS/l+A/sk0XM0
	 Z9Qz+xn4uLkCt1iu7KFPe2cCRB8HjOajDgK+AEG01lR5hqSCv+oS5KXJx3JBqe68O4
	 k/sUnUhzhXj+Cmji54XLYLBoNHzhhRFN/whI7GhfAA2Fai4hHKE0iLSJzbZKVnRRwN
	 zDC8FHs9Q7Q5A==
Date: Mon, 06 May 2024 00:43:24 +0000
To: openembedded-core@lists.openembedded.org
From: "Antonin Godard" <antoningodard@pm.me>
Cc: Antonin Godard <antoningodard@pm.me>
Subject: [PATCH] devtool: ide-sdk: correct help typo
Message-ID: <20240506004320.62842-1-antoningodard@pm.me>
Feedback-ID: 17651652:user:proton
X-Pm-Message-ID: 51d9c5c045636a56f03fd2e0ff71788dc92d5c95
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 01:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199031

Signed-off-by: Antonin Godard <antoningodard@pm.me>
---
 scripts/lib/devtool/ide_sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.p=
y
index 7807b322b3..65873b088d 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -1052,7 +1052,7 @@ def register_commands(subparsers, context):
     parser_ide_sdk.add_argument(
         '-I', '--key', help=3D'Specify ssh private key for connection to t=
he target')
     parser_ide_sdk.add_argument(
-        '--skip-bitbake', help=3D'Generate IDE configuration but skip call=
ing bibtake to update the SDK.', action=3D'store_true')
+        '--skip-bitbake', help=3D'Generate IDE configuration but skip call=
ing bitbake to update the SDK', action=3D'store_true')
     parser_ide_sdk.add_argument(
         '-k', '--bitbake-k', help=3D'Pass -k parameter to bitbake', action=
=3D'store_true')
     parser_ide_sdk.add_argument(
--
2.44.0


