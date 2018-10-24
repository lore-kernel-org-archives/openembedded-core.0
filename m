Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2204074596
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 11:51:49 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id y15-v6so865518wru.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/ERk2KlVCPB2pSXwuZ9ndaOj32auh66oH8ezKek1EjU=;
	b=S1M/D11FsR817Eipb7x4MJVZGtDsWjhLR8zBUEaVnWKiYSnlN7z0+HN2piwOa61coh
	trCvPqlf5dF3PK8gaaGl45rvYVw7FTUSA/Z30aXKdgXoEtLs2j6/goudAZUQAFwizHgo
	k2E18mq0hKGN49wgntFwHUFfzOvRo2G6quKYbHYXJMyBldNfY8cbozXZqE393CusTBEp
	gae6I7PnL7rK+a0F1iQelt/eofJB41oIIuLPn3IU6xyo5pVgVL1En4mmzBzuPVH9/TLf
	9hxm1s6tvy0LWCcExDIiiu1AVHIjonHx+S3JS5HnqDC1MhppRXMhgLP5ML9Iu/9EUonr
	JOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/ERk2KlVCPB2pSXwuZ9ndaOj32auh66oH8ezKek1EjU=;
	b=CKpMLVdaNS7y+7gR7lLx9fUJ52RRoxmErIqY466yPf+cGFZl9vboXvb3oSC/tPW9xr
	fWRscwWdjy67GqXPRWEwqC5TdIbNfEzdHNJjNeEtuFpf9Om2IFLxlFLc8FYy7OxVLEui
	KCUrNukx+Vd4t1OXX//Nbtb/pjxGnpBFPqlpDKz7Tg3B2MsZGZ+or0IZhfXGV3DSqhXC
	cPDB2RGRh7KgUR8FNs+hwmuU5rdXa5HIrrloQcI7tQgPTWG8/D/HRaG8PN7RQxmCQx2B
	Ti6sMP5eT1ibpAAG9XxxXxQyj9UZ5mLA8Gz/WSbW4TLsMuAlZTFQVfgrc7nK3fAmvfiW
	1UoA==
X-Gm-Message-State: AGRZ1gLqK2ynqJOSwT82KFAiC/HtYaICHAhf6rN+FqgFHOVCqxj8u3QC
	UN0HjaCOYMlD99fJFrdvmL5D6kPV
X-Google-Smtp-Source: AJdET5dSgF4qxsHDjquDl9Q2UfBEX5/55ruxCTbQ8SWLf0qLaRfeyGnfMCmhqqigkjMCiFjBVw/6bQ==
X-Received: by 2002:adf:cd8c:: with SMTP id
	q12-v6mr2561972wrj.171.1540381909395; 
	Wed, 24 Oct 2018 04:51:49 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	u9-v6sm3846077wrr.66.2018.10.24.04.51.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Oct 2018 04:51:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2018 13:51:35 +0200
Message-Id: <20181024115135.10434-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
MIME-Version: 1.0
Subject: [PATCH] systemd-conf: add CLEANBROKEN
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
X-List-Received-Date: Wed, 24 Oct 2018 11:51:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| DEBUG: Executing shell function do_configure
| NOTE: make clean
| make: *** No rule to make target 'clean'.  Stop.
| ERROR: oe_runmake failed

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-core/systemd/systemd-conf.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-conf.bb b/meta/recipes-core/systemd/systemd-conf.bb
index c694efbbf14..111ef2497a3 100644
--- a/meta/recipes-core/systemd/systemd-conf.bb
+++ b/meta/recipes-core/systemd/systemd-conf.bb
@@ -18,6 +18,8 @@ FILES_${PN} = "${sysconfdir}/machine-id ${sysconfdir}/systemd"
 
 do_compile[noexec] = '1'
 
+CLEANBROKEN = "1"
+
 do_install() {
 	install -d ${D}/${sysconfdir}/systemd
 
-- 
2.14.5


