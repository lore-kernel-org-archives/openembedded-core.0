Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.204.23])
 by mx.groups.io with SMTP id smtpd.web12.6436.1628067230540909713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 01:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de header.s=key2 header.b=Gsa5aDny;
 spf=pass (domain: extraklein.de, ip: 194.59.204.23, mailfrom: matthias@extraklein.de)
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4Gfls8495Jz44yh
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Aug 2021 10:53:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1628067228;
	bh=U6O4y59w05IZBT4KscwAv5IOHSmxLL6x+pylDSIg5ks=;
	h=From:To:Cc:Subject:Date:From;
	b=Gsa5aDnyu7eSEO/gKQfZfUIlVdPE0gfDU/EVeR+K9U5WDmzPqUFjP0WVoVBRll1Bp
	 gdIUp/H7Ew09acOo1BoXOntPhHiLXlgmSwjc1P31y7fuWptL8A2gyNrbaoTA028GRU
	 4oVIweQoJOCffUUt97aqwcWjJrfwS2XJmpYoGbb1goPwunFl1u2ydqlkaDw15ummII
	 Kspl4mNgUwEP6/VTztwFDJEReNgSOqPfP58Q3P3T+3YXZw5XhdYSA0Hu27myz45rmt
	 90q2iCZ12DmUxktBq/JK/BN1OeeXgGTzou4ctKcmGk5cF4FOo9UKLxtZ0lTx/+RopO
	 ADj/vE7CCNZsA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4Gfls83n83z7tGF
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Aug 2021 10:53:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=6.31 tests=[ALL_TRUSTED=-1,
	BAYES_00=-1.9, SPF_PASS=-0.001, URIBL_BLOCKED=0.001]
	autolearn=ham autolearn_force=no
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4Gfls801kJz8sgY
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Aug 2021 10:53:47 +0200 (CEST)
Received: from localhost (ip-88-152-245-240.hsi03.unitymediagroup.de [88.152.245.240])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id 2E88D140050;
	Wed,  4 Aug 2021 10:53:45 +0200 (CEST)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 88.152.245.240) smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: "Matthias Klein" <matthias@extraklein.de>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [OE-core][PATCH] runqemu: Fix typo in error message
Date: Wed,  4 Aug 2021 10:53:39 +0200
Message-Id: <20210804085339.1894-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <162806722539.14932.5289392345488791117@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: F6km8zIutzKNoB//OhjNam455HTtqDBQtKowO0EU8pBuLRG3eRE=
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2914f15d06..9c92eec030 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -776,7 +776,7 @@ class BaseConfig(object):
                 raise RunQemuError('BIOS not found: %s' % bios_match_nam=
e)
=20
         if not os.path.exists(self.bios):
-            raise RunQemuError("KERNEL %s not found" % self.bios)
+            raise RunQemuError("BIOS %s not found" % self.bios)
=20
=20
     def check_mem(self):
--=20
2.30.2

