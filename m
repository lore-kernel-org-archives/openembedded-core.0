Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 710647D1E0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 22:28:42 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id r24so9736075ljg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 15:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=TUYxiw/PcoUylQ2dCbZ39VjUuOHwYQMPgnBkDls7TwU=;
	b=GFYzvbXru3jMGB1dcQZ4nEbqm14kGdhUn02bJfy0UYVgVg4pL/3TsLQd7yeTJ3jXli
	RMAGcxcvNRy+iEzYgoc9P29razzGOI3xehkiBQDXpwlRRVxKOQrpKd0j2s7DMgnCcZQs
	gmcPRfXoDvcsgFoRgaiA3bncedq0MG9uXycZR4xqxUVC31E+NyENuTjxo5LQfipZjrP4
	xoaOiw+nMNi5cyYs1X/v3WfNCG+Sf93/FXf3H/FDB88M9/l3xAVB5xqKoEuUA4xJemDS
	OIupjWcLlVSVrB/rXI9lW8TcxwIY6D/rPKSVdqId/cgpR7RF87afWCpK7ekGFK3P5U4n
	lLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TUYxiw/PcoUylQ2dCbZ39VjUuOHwYQMPgnBkDls7TwU=;
	b=cHijY8o+Q2Ipwp5MGpfBAVe8vvWG7H4zPzB2t6eKvDYBsjsE2NdmA9Ea8d92q6VdlW
	yinr6IQiAVOTeTUBYPOZsAk6n/mg7CvqlyWxV6YS69Ur6bVrnxNpKD+lLNHHdF5rrpU6
	hkIVLBteFOQ5G31RubibsJZmePAUqAG61TEDOIrbaUvMbF/snoTXWSpqfyo8f70buUZc
	nOx/GNkPvgnBnuQe4dzMuYdn4mU9qbDzoqd0wpADOkfottyuaTA6CJIZF31cJVItEnEB
	0tJoiS8KerdExFP5MBbeAbdtieTb8lRGYTfQ5AGs9R4ln7zJzlhgjZ6P1wBK8M3xChoS
	50WA==
X-Gm-Message-State: APjAAAV0qTUaBnGox9lXJbpP1c7nqGkgpbCJY2aOYScDPfBR+N2ZEcM2
	wAmSGRVC/uOeHfen5reW6utdL4nR6J0=
X-Google-Smtp-Source: APXvYqwlWKPjFDL6b6W5dPLVOFqg/U+zrHzleUikSLQumKFhBNQQpbXRhBVAPwdA5YMB+lJCnntmFA==
X-Received: by 2002:a2e:3506:: with SMTP id z6mr36218358ljz.72.1554157722786; 
	Mon, 01 Apr 2019 15:28:42 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	e20sm2400222ljl.95.2019.04.01.15.28.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 15:28:42 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 00:28:40 +0200
Message-Id: <20190401222840.27534-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] createrepo-c: update to 0.12.2
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
X-List-Received-Date: Mon, 01 Apr 2019 22:28:42 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{createrepo-c_git.bb => createrepo-c_0.12.2.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_git.bb => createrepo-c_0.12.2.bb} (94%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.12.2.bb
similarity index 94%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.12.2.bb
index 9aa8d2ae73..c70523dca6 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.12.2.bb
@@ -8,8 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-PV = "0.12.1"
-SRCREV = "7744554ddef7c5be2cd7fbcac49c8b24ce60ef88"
+SRCREV = "5b4c06f6af24633f667da37455281f24a4abd461"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


