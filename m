Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA62CD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 13:04:27 +0000 (UTC)
Received: from 3.mo561.mail-out.ovh.net (3.mo561.mail-out.ovh.net [46.105.44.175])
 by mx.groups.io with SMTP id smtpd.web11.10371.1712149457834312921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 06:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 46.105.44.175, mailfrom: jonathan@joggee.fr)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.9.153])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4V8lM34vJ3z1NcD
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Apr 2024 13:04:15 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-cw6pd (unknown [10.110.178.33])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3BD171FD97;
	Wed,  3 Apr 2024 13:04:15 +0000 (UTC)
Received: from joggee.fr ([37.59.142.102])
	by ghost-submission-6684bf9d7b-cw6pd with ESMTPSA
	id ch9/AM9TDWZyHwAAj8P9yg
	(envelope-from <jonathan@joggee.fr>); Wed, 03 Apr 2024 13:04:15 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R004da71d838-9db2-42f0-8ba8-4bd01ae50ec5,
                    66B310B8792E23492B854578E3BAB7C693FD2ED8) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
From: Jonathan GUILLOT <jonathan@joggee.fr>
To: openembedded-core@lists.openembedded.org
Cc: Jonathan GUILLOT <jonathan@joggee.fr>
Subject: [kirkstone][PATCH] cups: fix typo in CVE-2023-32360 backport patch
Date: Wed,  3 Apr 2024 15:04:11 +0200
Message-ID: <20240403130411.96831-1-jonathan@joggee.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6039045625855413260
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudefiedgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflohhnrghthhgrnhcuifgfkffnnffqvfcuoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqnecuggftrfgrthhtvghrnhepledtffejjedtudfhfeejudevuddvhfeugeehudeugfejhedtkeelffehueeiffdvnecuffhomhgrihhnpegtohhnfhdruhhnkhhnohifnhenucfkphepuddvjedrtddrtddruddpkeegrddugedrudekhedrfeegpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehjohhnrghthhgrnhesjhhoghhgvggvrdhfrhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 13:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197918

Typo prevents cupsd to start correctly with following error:
Unable to read "/etc/cups/cupsd.conf" due to errors.

Using `/usr/sbin/cupsd -t` to check the configuration:
Unknown authorization type Defaul on line 77 of /etc/cups/cupsd.conf.
Unknown Policy Limit directive AuthType on line 77 of /etc/cups/cupsd.con=
f.

Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
---
 meta/recipes-extended/cups/cups/CVE-2023-32360.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32360.patch b/meta/=
recipes-extended/cups/cups/CVE-2023-32360.patch
index f1b0f9f918..c3db722f1f 100644
--- a/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
+++ b/meta/recipes-extended/cups/cups/CVE-2023-32360.patch
@@ -27,7 +27,7 @@ index b258849..08f5070 100644
 +  </Limit>
 +
 +  <Limit CUPS-Get-Document>
-+    AuthType Defaul
++    AuthType Default
      Require user @OWNER @SYSTEM
      Order deny,allow
    </Limit>
--=20
2.43.2


