Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 09AFC7D3E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 21:00:23 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k45so19112657edb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 14:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gFhQHaBbVq05LzjID/UNn4MGjkDiuzrzKk7vJHX2VOI=;
	b=tsEZ4+mpm/v/51ruLnp/pLhlTLhfMjGx/Kpa/1kearHAinAYqiNMXV84tYwMArlI6q
	taHZIFjX+RNQN00Ey2u/ZdVm1ovtyvFI4ODSEbsbbFPrc2w2hGz0sD34BSr9Uz6IuA1K
	W5XCzU09NJA1CcnxlFPskkdMPWjSL6gVziai3lHiMsV4/g+MjVoVgzKOnudnWH5zp0qq
	D+bbq62x0assBVSOeoPFRSO14VGiGBXh+SJUW6WWC0nCXTGf+BmkqYjYNZFjAywI2yqi
	5vgpdJzuasc31NDsN39MOdWRPxXuPvAhkD0EiS7MMS70Pb7eOu4YzqeywA9I390k8qeC
	M5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gFhQHaBbVq05LzjID/UNn4MGjkDiuzrzKk7vJHX2VOI=;
	b=BqLMaUcnVDK0AouujPplgIEVt1r9ET7mZm/JX+raNxc1l0MrOprJUJK1uSE4uxKFwd
	DQfpv6RCf/u8Ggr8Uqzj9BnkbHQQ4eEC03K2Ybb0Ix+cSfmx21v1l2uhuDPCas4az8eL
	YbSAWElkU4NYuw/rvrOvtAC/204FP1dAq3v0sVgEykQkF1sFoY3ZQ5JGeZM3S0e2U4bs
	LeH79dlbT6b8slxI2qLDae8wjGqO1JnvtZgRSlV3irmcHAVkpee/ICW4hwfoZlOj0N0g
	AZiQ5eKD6nKgb5iEdOU00ZDgAxQaJ5GOU8Tm/fz53zGVvvOXNOuEyuj5fx8adVk0Y4qx
	MLIQ==
X-Gm-Message-State: APjAAAXBahCa6zFdoO7CCx3/ju7eETpl97Vd6RUBgAvVOGfGMPwPWJEq
	YqG1zGVDe9/281Oz/qG7eftDwT3GLP4=
X-Google-Smtp-Source: APXvYqwx2J2xS47wA7PQU/GxpvJQs3yOlb1R0060PjWmoXKqkkXypjNGU4O4f/0TNLhRmvA2ZuclXg==
X-Received: by 2002:a17:906:278a:: with SMTP id
	j10mr46380155ejc.12.1555448424307; 
	Tue, 16 Apr 2019 14:00:24 -0700 (PDT)
Received: from wsadrian2.lan97.ffah.ch (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27])
	by smtp.gmail.com with ESMTPSA id x14sm1377480edm.1.2019.04.16.14.00.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 Apr 2019 14:00:22 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2019 22:56:56 +0200
Message-Id: <20190416205658.7310-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 1/3] systemd: remove 2 obsolete useradds
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
X-List-Received-Date: Tue, 16 Apr 2019 21:00:24 -0000
Content-Transfer-Encoding: 8bit

- Users systemd-journal-gateway and systemd-journal-upload are not used by
  systemd anymore. Systemd creates dynamic users for services without
  persistent data.
- Fix start of journal-remote

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta/recipes-core/systemd/systemd_241.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index 3a58f44a3b..8e493d5b55 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -334,9 +334,7 @@ SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfm
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
 USERADD_PACKAGES = "${PN} ${PN}-extra-utils \
-                    ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gateway', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-remote', '', d)} \
-                    ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
 "
 GROUPADD_PARAM_${PN} = "-r systemd-journal"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
@@ -345,9 +343,7 @@ USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--syste
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
 USERADD_PARAM_${PN}-extra-utils = "--system -d / -M --shell /bin/nologin systemd-bus-proxy"
-USERADD_PARAM_${PN}-journal-gateway = "--system -d / -M --shell /bin/nologin systemd-journal-gateway"
 USERADD_PARAM_${PN}-journal-remote = "--system -d / -M --shell /bin/nologin systemd-journal-remote"
-USERADD_PARAM_${PN}-journal-upload = "--system -d / -M --shell /bin/nologin systemd-journal-upload"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 
@@ -401,7 +397,7 @@ FILES_${PN}-journal-remote = "${rootlibexecdir}/systemd/systemd-journal-remote \
                               ${systemd_system_unitdir}/systemd-journal-remote.service \
                               ${systemd_system_unitdir}/systemd-journal-remote.socket \
                              "
-SYSTEMD_SERVICE_${PN}-remote = "systemd-journal-remote.socket"
+SYSTEMD_SERVICE_${PN}-journal-remote = "systemd-journal-remote.socket"
 
 
 FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.conf \
-- 
2.20.1


