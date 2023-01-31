Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4354C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 11:50:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10210.1675165798142807638
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 03:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3D022F4;
	Tue, 31 Jan 2023 03:50:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 786593F71E;
	Tue, 31 Jan 2023 03:49:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 1/2] sdkext/cases/devtool: pass a logger to HTTPService
Date: Tue, 31 Jan 2023 11:49:53 +0000
Message-Id: <20230131114954.2579029-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 11:50:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176515

Pass our logger to the HTTPService instance so we can see the requests
and any errors.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdkext/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext=
/cases/devtool.py
index a5c6a76e02d..5ffb732556b 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -112,7 +112,7 @@ class SdkUpdateTest(OESDKExtTestCase):
         cmd =3D 'oe-publish-sdk %s %s' % (tcname_new, self.publish_dir)
         subprocess.check_output(cmd, shell=3DTrue)
=20
-        self.http_service =3D HTTPService(self.publish_dir)
+        self.http_service =3D HTTPService(self.publish_dir, logger=3Dsel=
f.logger)
         self.http_service.start()
=20
         self.http_url =3D "http://127.0.0.1:%d" % self.http_service.port
--=20
2.34.1


