Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDF9C3A589
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:00 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.97])
 by mx.groups.io with SMTP id smtpd.web08.6014.1650616391924527427
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 01:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=CNqzw5TO;
 spf=pass (domain: extraklein.de, ip: 188.68.63.97,
 mailfrom: matthias@extraklein.de)
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4Kl72r6bgvz4xpr
	for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 10:33:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1650616388;
	bh=rasvXyGMJ/U8kaNp21xO8onXfykdziipcqApj5Rt4Ds=;
	h=From:To:Cc:Subject:Date:From;
	b=CNqzw5TOw8QdwfBX9tiNu5OIQqLk8EmlH6ffW+MkUelQ91XHHHRKkQLx51uD8c09O
	 GcaefFpABPl3NU/RocC1vdn578y5GB8Y1eddWmR95rYQjwP8+Sh9/JDq4pxiNiyTYg
	 JVU5OB3cOMsBPHLJQDTX3Enh60pB/UO2YYT5JkbCkSv0csnPfobtfGIGbaV7QBjxU9
	 dw2j9BXT4lePX57A6qW+f4aPqg0SoMF2+bzWcqJHryVH0whIsm11svfhLF9VqwkWgr
	 mcVnji5xZ0RUC4M71/oCSvIAi/SCwmAu/VqS6cnvVYjEPIWNF23Gnf2C2GhDh0UBdJ
	 sVn0WeXvOS5lQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4Kl72r6C3Bz4xnW
	for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 10:33:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4Kl72r0kdgz8sWQ
	for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 10:33:07 +0200 (CEST)
Received: from localhost (ip-062-143-218-156.um16.pools.vodafone-ip.de
 [62.143.218.156])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id 2D5E0140050;
	Fri, 22 Apr 2022 10:33:07 +0200 (CEST)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 62.143.218.156)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [OE-core][PATCH] gpsd: bugfix: add gps-utils-python to PACKAGES
Date: Fri, 22 Apr 2022 10:32:47 +0200
Message-Id: <20220422083247.1322-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <165061638737.17907.10668993062400711899@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: 06M+jhTRpFCj++zKXCpAvNMidPeioomouVAL3JWOIa0mEsAcA4g=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164777

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/rec=
ipes-navigation/gpsd/gpsd_3.23.1.bb
index 8d270ec58..98f7511b1 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -79,7 +79,7 @@ do_install:append() {
     fi
 }
=20
-PACKAGES =3D+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-=
utils"
+PACKAGES =3D+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-=
utils gps-utils-python"
=20
 RPROVIDES:${PN}-dbg +=3D "python-pygps-dbg"
=20
--=20
2.30.2


