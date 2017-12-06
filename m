Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3B27866F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 01:39:25 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y6so1527631pgp.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 17:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eUpNn4yrdG2d0Bw+HJBXJSLA3T0q//hnOQzKIiimHDo=;
	b=SHy0HHoChEwnv2OjDOtRtMem6iJZ+eK+zwc+5RybPBPVWVgEEZYtLcVVYdFfz76hVt
	0HFMPfY0rQZMlehnAFIyWe7f2u0tyqaTQEbyRkjQxAcKHf+gM3e2FsM48PleG8LDgoCW
	T+bZOLZdGtZ7fVF9YsVdM7BvzX35rdp21QGU4MN0GbxR0uvQvusc797WGgGkEo2gGK1r
	b/2JtzL3kJP3nL31+CdR1T46Q72IoQvvmOvLhU5Ifwy3rJDtaHL65D7m3tG7ROffgDlf
	HCV5jsNOqNEJu0H4WxQHB6NeAfxjsN/FsJj6Iwm3KK6ZR3WqVCgeD/YWfbRlUBG47frE
	HxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eUpNn4yrdG2d0Bw+HJBXJSLA3T0q//hnOQzKIiimHDo=;
	b=X3BCUv94t3WUTElhHIdFmQGYUmKcPtHVDpvxtOJx922jUZDsXjydY2JxWjBSmk/w55
	xcFk2iIcZZttpWp66SnsOmb3jPd8tvXfV4AeDsPjXpuqt2OBbBHh4tG+fbxRKse3aSSC
	3Piwda+JdAs4765n3w2t68tlZfotnH36QwfNhyFTw9Pi4TDXn6rS0qwOR1tvBiRy6xM5
	YmSDrBugQ652ZID1QHzDYNLKPo7Xe+gzQA7REDrjHTRw/ghKU66b54ga2oL3ogNN2+bb
	lMVrEDJHjdX4ErcU1I+qWGYhVLeBBj9F+iiCkaZnO60IkCNjiUIIUV1xlk1WgI8ANV5F
	WadQ==
X-Gm-Message-State: AKGB3mKeOW7sgw6Z03q0OyHvFFNm1kqohLdBQsdm3DBLI6iMdhOy/y01
	eqBCeckDL/kAFfrHI1wnWVUesQ==
X-Google-Smtp-Source: AGs4zMZe7xT0njJBndv9+7Cahz7en31HdQsSQ5lsZV3gHOaaD9jX+JDUWED+AgpY1S7wgK6GPRVRMw==
X-Received: by 10.98.33.203 with SMTP id o72mr941285pfj.163.1512524366189;
	Tue, 05 Dec 2017 17:39:26 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	p126sm1541602pga.58.2017.12.05.17.39.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Dec 2017 17:39:25 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 17:39:19 -0800
Message-Id: <1512524359-16132-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: "andreas.kling@peiker-cee.de" <andreas.kling@peiker-cee.de>
Subject: [rocko][PATCH] bind: move libraries to own package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Dec 2017 01:39:25 -0000

From: "andreas.kling@peiker-cee.de" <andreas.kling@peiker-cee.de>

Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit d74ebc91388941295a2321a295cdb06ee87fc38b)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/bind/bind_9.10.5-P3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
index 13724a8..8309302 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
@@ -67,6 +67,9 @@ FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
 FILES_${PN} += "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_DIR}"
 
+PACKAGE_BEFORE_PN += "${PN}-libs"
+FILES_${PN}-libs = "${libdir}/*.so*"
+
 do_install_prepend() {
 	# clean host path in isc-config.sh before the hardlink created
 	# by "make install":
-- 
1.9.1


