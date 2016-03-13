Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9AB2D73195
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:15 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l68so11566540wml.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=+L6kMVtW5YvK2TpvZEp+7wb0dtQlangsM0YXvTEJnjI=;
	b=FjXCCH55Mm3DoEE63VLkvlENwKRb04VxQWNw2DEKaE608R8nReYAw2BJv7VoUjXq6E
	rQ4qdFBzxpMCnqfbO8xC6mV9mpY7jQVf6GtmvB92QUZTaPHH0gE4WbJF584zGe1nHxbP
	pYw6fnFrStQWx/vA0EShHg3Se5kymlFz5nTQJcqd+4gCex/pmyp5bl6rpbjDMJrpj9Pr
	0wycA4GAUzE8PATwKo0EVz67851W/K2cBfCYh769LnPQ4LAqB6PMZ7snuXkRhwdeZil8
	85G2A8ki/GeX2XlerKT1IdgEklrKcejPiD8abknriDdsui5G2LyT8NxIgCelNezjodTm
	TI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=+L6kMVtW5YvK2TpvZEp+7wb0dtQlangsM0YXvTEJnjI=;
	b=VLXTv8OsXwAtnnsaJdJJhYk4WmB5mYY/UFpA6KTdPcR8FY+88aFEZHuFFqDGDmq3te
	Fx+pL9Lgi5HvMijBeknZ1pU+k9P2PWmveGYIzDhQ8LvSpkhLwjuUt5mvorlXUge6u5h5
	phoUq//mJGl3Qs/eg7Aa4URmAH/fTtQ6s956Kqo3fioST5fLjMVp3JuPMxBdIMy+KReT
	tP8RT3fFKklXTpjN2Kx1iQw/ZDuvtzv0A/FJC35S8CNHJCQq7aYw3qzkfPdZwTePDQcl
	tyPVXLaYsMMlo1ouWOgQIoLf6cQtoO6UKSigLvhGaocDaUlsUWj9bGpK3NdZ+RvMupVs
	0f/Q==
X-Gm-Message-State: AD7BkJIc7liNcVd0nDdnx3CDNSZQxEfRqqeS1mh9beBkSaNQOVF5JVzPzkPw/HSVMIGk0w==
X-Received: by 10.194.22.97 with SMTP id c1mr20503670wjf.19.1457896516228;
	Sun, 13 Mar 2016 12:15:16 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:15 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:30 +0100
Message-Id: <f2e244d12d15f2a2a2ab23fe003e1c83ebb82cce.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 32/42] oprofileui-server: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:16 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-kernel/oprofile/oprofileui-server_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
index cc3477b..e1a153b 100644
--- a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
@@ -19,10 +19,10 @@ do_install_append() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/oprofileui-server
 
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/oprofileui-server.service ${D}${systemd_unitdir}/system/
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/oprofileui-server.service ${D}${systemd_system_unitdir}/
 	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-		-e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/oprofileui-server.service
+		-e 's,@BINDIR@,${bindir},g' ${D}${systemd_system_unitdir}/oprofileui-server.service
 }
 
 inherit update-rc.d systemd
-- 
2.7.1


