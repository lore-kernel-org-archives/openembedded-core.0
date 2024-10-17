Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B450D3748A
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 13:31:15 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.48380.1729171874653329869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 06:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MYx3iTBN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3510C0003;
	Thu, 17 Oct 2024 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729171872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4kO105qkMjnABrK4GRFBL1xDLPb3jl9jjHM7sdKzukw=;
	b=MYx3iTBNMgXdJ0GCiFIoTHXoOsvLO3Iz3NMs7763BLQDuaN1Qzhof3xJLz56OUxN4dVcr6
	ZQQnr4ggdfxADygCKuvaUoWVQ4sF3JNOqMnBLdeJg2q6Q3u3yS//KM46SWkendolBz2ElH
	I1NOTPoitkPwvntn49qSOpxBhGk6oBuU+llKHILU9LfEHeqOC0LyjcRJDbOaoAHm7LCv+D
	wn+sU3khAFLXUGObECCRulpWnHtQ/ESV6S9kFZ54oEAwtvF/eJctCu+Qbjs3U+dC+bvhQF
	9D9x3ayU5ein/oDXRmVXx7hmMrASviC9NvS7g+miByRxKDMP7/aNFgFoAVdi7w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 17 Oct 2024 15:30:55 +0200
Subject: [PATCH] devtool: ide-sdk: fix help typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-devtool-ide-sdk-typo-v1-1-10535900085a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAI4REWcC/x2MQQqAIBAAvxJ7bkHLMvpKdAjdaikyNKIQ/550n
 IGZCIE8U4C+iODp5sDuyCDLAsw6HQsh28xQiUpJITVaui/n9qwJg93wek+HRjVSt7rWXWcgp6e
 nmZ9/O4wpfZDA1wBmAAAA
X-Change-ID: 20241017-devtool-ide-sdk-typo-c4517673788c
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1316;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=zsZ4Rylu5ZhlrPAYErrdNc+9M7M5WMoiItPxcWaAfk4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnERGgvXMvZsHa8NVFy7rYTAHzCDtXslY/yuWbd
 KqECH6+8LCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZxERoAAKCRDRgEFAKaOo
 NqOFEACLnno8lLpSEir0n3fHrfaz5RN9gAPhppu3GfvimXuun7LM6OUYxbnmrRVvV7Q8DjgWXMG
 YQpRHnf54C7RAfkoLDtCgJMFYgLUF2RKF0qCV3tDMX/xhANOygnsrX1Nqn25G50CUjsfxwlRI/Y
 wt52iU4bexOUp16SMuXRH3THHmgF7th8z9JkLf82Nhw4F51YeAUOr/YudmZpZjtBcB0ZvhAIJHl
 EUrvMGuHkALPpXJXeA5427u+7AZ+KLecl7uB6k87fejyIHP0jwnlR4Eea0kvEqPCS3++CcO2o/W
 pNSvlJSofz+fa6xqJdWlwZMgfdbvYUybnZ+DF6ejF3q5I+6iIP/OkD+vMnQkqBIoAWohr6WU+3X
 Nr9geOb17V7wQ8TcnirCgMw0ZCHsLork5wQ/F+RtltZhoeUyJhFBrAPkpDvDPiE2n/xfkyRsSRy
 EN770PDrHh6kP8SBNfgYmWzOD9Vnl3V+ch5gWiyUHEZFVV/c+9Agc/mBsVLD1XqTDU8ac4HpHBW
 4WKBIa4uK8cgmHWN6jP0tAaorIMMSlqmvVloxitbBQT+pMtWQYBmBwqvtZ7EKjf0jeWA2hqJOgk
 Y+Pj16a5gbdvHbhyXOBuqq+7CZfRG/MWaTHbko5kJQo478vQy3+eUGOt2UDFe/rc/DOpBSJEIWN
 M6kRtFx1ajvboZA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 13:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206019

Change "paramter" -> "parameter".

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 scripts/lib/devtool/ide_sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 350a8b02ca2d52ec527c2c05af00f3ba48920233..2f6eddec2a0786300b79206f3320eef9d275e350 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -977,7 +977,7 @@ def register_commands(subparsers, context):
                                            help='Setup the SDK and configure the IDE')
     parser_ide_sdk.add_argument(
         'recipenames', nargs='+', help='Generate an IDE configuration suitable to work on the given recipes.\n'
-        'Depending on the --mode paramter different types of SDKs and IDE configurations are generated.')
+        'Depending on the --mode parameter different types of SDKs and IDE configurations are generated.')
     parser_ide_sdk.add_argument(
         '-m', '--mode', type=DevtoolIdeMode, default=DevtoolIdeMode.modified,
         help='Different SDK types are supported:\n'

---
base-commit: c6b8cbb838229526afbbac90396d8d983ad380de
change-id: 20241017-devtool-ide-sdk-typo-c4517673788c

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


