Return-Path: <cjp256@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id BD3AF77188
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 16:36:09 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id z75-v6so4830539qkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 09:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GpfZDazREjUPI6UUsONSTqbkgxesFuK+kJ/StU9sW74=;
	b=VO9PHsNxhGhhY117KqRgnoenwYcdFXkLSFVAyeZmcaj2YRUmXSrX+HMN83ERuUgZsf
	OcvXVvQF+H3MQPq8LkouCr9ozJeEricN0xL1dRcvwc1PkVOtyGSsw9HFP7V+jeLmqaeT
	zIXd8ZqOGCdhI3lMQ97+C+U8Ay+2Z8teUkR3SLD7AKezp/YsohoZuBRjZ71GDxGF+lnG
	b4Eow3e+Mjs7PJKRTqJLbV1sfAuLUVVAfngDqqcwUoulD+aI8ooj4YI0gilSR5AjRwRJ
	8C8Ws3lfSEMIvz2b4j81xONfeLv1VF4zCioHeCZdzdmFXG/2jWL828B492RFEvesTW3v
	wAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GpfZDazREjUPI6UUsONSTqbkgxesFuK+kJ/StU9sW74=;
	b=KEhxUpYSI8ypzMHRTWjkIkTngNIx7cyqrThMQavdtwWXs2BB7v+eAwLpm/lP1JFGGg
	zp0GcZS/KsfOpx5cgM5Y60Hzu9w5DOUUen82KBt5MpULBCyydh172HK45k97uy99q6iA
	ZkX2LEukh/4Lck1g5JL95sAATUzxS0hfAbCbiUG8fVASpu1GVlneWISwVWH5n9zDAErp
	qnezEp1Asq+6z1TlvrfAJncrpZQO8H6+1RJPAMi2Mg8oIOfHWDZX8rXkofNL8GnNClFl
	rVBj3CssSIzFsYNSEssP2IbFlZ0QGo0zPXRS4Ov8BHbfhbqzFGyN69sij1JO9MsEoFO8
	i5Rg==
X-Gm-Message-State: ALKqPwf2G6n5fHjxV+qFdvfbz/lbtocHElCkXtIDgiqaruR4xyt/HIPB
	Eb5zzwo7KmkXzOWw1eJ1yIZPidNu
X-Google-Smtp-Source: AB8JxZrZEhUy0V+q6Jk52x3Yyo4emVE65mqjP84ngtqAD4lV5yedjQRj21TFKZXcQa87jLz1WLKUgg==
X-Received: by 2002:a37:8b87:: with SMTP id
	n129-v6mr5367408qkd.430.1526056570324; 
	Fri, 11 May 2018 09:36:10 -0700 (PDT)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	c4-v6sm2470753qtj.49.2018.05.11.09.36.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 May 2018 09:36:09 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 12:35:53 -0400
Message-Id: <1526056553-31049-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [PATCH] qemu: add gettext to DEPENDS
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
X-List-Received-Date: Fri, 11 May 2018 16:36:10 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

Otherwise QEMU build may fail with missing `msgfmt` command.

| make -C po install
|   GEN     bg.mo
|   GEN     tr.mo
|   GEN     de_DE.mo
| /bin/sh: msgfmt: command not found
| /bin/sh: msgfmt: command not found

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index dc73df8..ba1b9b2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Fast open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
-DEPENDS = "glib-2.0 zlib pixman"
+DEPENDS = "glib-2.0 zlib pixman gettext"
 RDEPENDS_${PN}_class-target += "bash"
 
 require qemu-targets.inc
-- 
2.1.4


