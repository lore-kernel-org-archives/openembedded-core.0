Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4600.1795029485796024323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 11:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UKWYu7kt;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 25082C4F757
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 19:18:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 105975FE9B
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 19:18:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF82311BC2DF1;
	Wed, 18 Nov 2026 20:18:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795029482; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=17/GrLWlXxuSDtGwHjEE43GNwGJ1D7MwDIbpDMOb4w0=;
	b=UKWYu7kt4oLjmKlGp8bOeaZSCkZaaUoBful06Kd1WpO2v0493A/guJLl947y14osw4VU4p
	2tOmJRADK2f9h3pWXw0FLtEg528dxs+JxW4lHYyGWd8rlkuh/p/285Jmz/7+KF14CPLboF
	7VG9FfzdbiUIo9SIAxqoKC6Ds+bnaMFo/IFNckX0ek4WTrmt9o3qP/bcGZeKDUhr/UFQD/
	emVIEoTglQg5U4uf2VymSSJTebjNqkIwT4nDIHExl8pveoTgxpQoDHOkg8qTyjcI07/00M
	N37+mr49woQ5iI48bUS7CklDUBEkihMVzq6MMBK+OHcTpWnUWWnyVAw0+nicDw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 18 Nov 2026 20:17:52 +0100
Subject: [PATCH] oeqa: selftest: bbtests: Fix pollution typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-mathieu-polution-typo-v1-1-086c3a6ce4cc@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOD5/WoC/x2MQQqAIBAAvxJ7bqH1UNJXooPVVguVohaF9Pek4
 8DMJAjshQO0RQLPlwSxRwYqCxhXcyyMMmUGVamaiDTuJq7CJzq7nTHLGB9nkZjUQE2tjRkgt87
 zLPf/7fr3/QCt6F5/ZwAAAA==
X-Change-ID: 20261118-mathieu-polution-typo-1e12b1768aab
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795029481; l=1540;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=sKsWQt52Y8wsoCdw/PcvG6fhadeGcCkWUi9ZxhWwOmA=;
 b=iWejkOV34bFnGx3/HHy/z12E1Kmi15BV/hixwbT+gMmkxaM2aHagIY02yNohJ7m2quZ45RgjV
 pDtxcvZawOhAg6XgTBnXNmS21I3cdkD9dzS1rkZZagFKK4R/GvAMfvV
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 19:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250579

A patch was merged in bitbake to fix the typo, modifying the error
message. The test now needs to be fixed in the same way.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 52fa1819a6fc..7e59136814e2 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -375,7 +375,7 @@ require conf/distro/include/no-gplv3.inc
         self.write_config('PV:pn-gitunpackoffline:append = "+${UNDEFVAL}"')
         result = bitbake('{}'.format(recipe_name), ignore_status=True)
         self.assertGreater(result.status, 0, "Build should have failed if ${ is in the path")
-        self.assertTrue(re.search("ERROR: Directory name /.* contains unexpanded bitbake variable. This may cause build failures and WORKDIR polution",
+        self.assertTrue(re.search("ERROR: Directory name /.* contains unexpanded bitbake variable. This may cause build failures and WORKDIR pollution",
                                   result.output), msg = "mkdirhier with unexpanded variable should have failed: %s" % result.output)
 
     def test_bb_env_bb_getvar_equality(self):

---
base-commit: 9518ce9aa2a6cbce678895ef9a95cd27939dae2a
change-id: 20261118-mathieu-polution-typo-1e12b1768aab

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

