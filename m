Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2500.1793957566888805027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 01:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bRUvLn+h;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E6179C69168;
	Fri,  6 Nov 2026 09:32:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 617BF5FFBC;
	Fri,  6 Nov 2026 09:32:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C9467103292D0;
	Fri,  6 Nov 2026 10:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957562; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HBlSO7E2l7aTe2sjAWXKZqmsk5moMj96R7HPjL1MFSc=;
	b=bRUvLn+huK1u69p/A3mjiHhiuom3QeSaJikHNvsec/x0/8C4hf2zHIz3iEw1XWQkPnFLDI
	7VE2jWO2SR1MGIvq3aZ0LJXYtJLi7c0jO4ugLEQDP8eeAnMdwZ9WDGY5A4jGTbta+KrPFI
	/aB53HClGRBuKYVgybG5Eas6HbhXfqspk9OK7//jiq59Snm8EwaR/Up9WhhNX3nIIqSHu7
	VMzS53ASq9uOciAmofwYX/2KYPA++PMqOiY/MqqFFIL5LYUpUfBn8DJ7WGSfXXcaIE8Jkz
	nM/CUZ+S06E+iZvFKI2NeFQpDohlozJ5XqZ6L7VX3nBGnBJFn+egP0rciju05Q==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Fri, 06 Nov 2026 10:32:39 +0100
Subject: [wrynose][PATCH] python3-sbom-cve-check: update to version 1.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-sbom-cve-check-update-1-4-0-wrynose-v1-1-c67d4bcb139c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3Nyw6CMBCF4Vchs3aSliBGX4WwoMNRqrElHUAN4
 d2tl+W3OP9ZSZE8lE7FSgmLVx9Dht0VJEMXLmDfZ1NpytpaU7O6eGdZwDJAbjyPfTeBLVds+JF
 eISr4AOMc3F6OFSiXxoSzf35fmvZnnd0VMn3SzX/W0ra9AftqHqqQAAAA
X-Change-ID: 20261106-sbom-cve-check-update-1-4-0-wrynose-7e0bbeb5c94e
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, Peter.Marko@siemens.com, 
 olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249629

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.4.0

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
This release introduces an OpenVEX export type and fixes various issues.
Most importantly, it corrects the CVE assessment for the Linux kernel:
previously, a large number of CVEs were incorrectly marked as fixed when
they should have been marked as affected.
---
 ...{python3-sbom-cve-check_1.3.5.bb => python3-sbom-cve-check_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.4.0.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.4.0.bb
index 83d420835daf..490546559756 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.4.0.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "9ed8b0e9c46015444cd3e30332d9558e0be5f5fec97f6df47c6760166a314167"
+SRC_URI[sha256sum] = "b0dfd6a60c715d7b4694897fdde5dddac0524e9bb25bc6736160712ce1d91e86"
 
 inherit pypi python_hatchling
 

---
base-commit: ae5a301091f5b0574ea7444aab40b309b6d9f3f2
change-id: 20261106-sbom-cve-check-update-1-4-0-wrynose-7e0bbeb5c94e

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

