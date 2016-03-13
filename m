Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2227316D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:07 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n186so11591370wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ZOQ/Zo77Is3PiN7Q7eBIOYmLAGrjDHXLfqJ6qCd3H2k=;
	b=0BgnAk1JRpqaf3FTumLQGS04JNy+1ZNq1sctW+R/trBgldaeuIFXO+TjIsoatT6FtB
	CkPC8jTnWj0+WO7zxulKTz6FoAAHaRFZVkyDt2b/Wa174/7p9eefKT9P/p8GB1+hSgm5
	PVchrPKqDO6vSXZz32i44Du0BvFw0GOGDXHU6F/YI3aFvnJ4aM5ne+tsQ+ZX591bw/GC
	dmQrrO2zdnSu3zemxDBuDjyKP/RMHNauzkokF+Gc+16tTjLMGA8Kr55rMCqXNRKB52iB
	l1yzVsBZR7IO1mnAMfIMrIrwvoLgTBKc2CfDHX/ooZ4OrFir6iCPTDEy16ijB4VZo8nd
	hmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ZOQ/Zo77Is3PiN7Q7eBIOYmLAGrjDHXLfqJ6qCd3H2k=;
	b=IghxWvEGdV6H8kUWcJB6khX3XMvwwQ9JhZ3grKrqtpu6fuigHPKKgfdpcT6WoGzaUn
	QzIHeACv3SIjNGRT30tJnkz7gv03m7F6F0y5w9xoQe5Y7SKTwVBXOypGP+XUpSEcv+PJ
	1ueFVT0My9c9Hfh8+ZkFsFXVv4UKjpZyz9ERnjTpBlVv8hsqsSKzhQ3miaSaN4tk3Qkd
	dPjMoQsOsQUFC5a+sP5HAiZdqd7kkSV2tV7C50B6RobRUqwi4QlIkxmS6gFAmn7HTs7s
	OITl7MnybWGUE4RAXSKOOYlb0xdpW/oJQ70acUU5l3DlDGF21KHirkNVD5+FHu962yeA
	pgMg==
X-Gm-Message-State: AD7BkJLjEmzN+RwwLPJhsOp99aZNmtDkH+6lIdC/Jp+igx19SmlAkZI0z+v7viaHbyh2CA==
X-Received: by 10.28.184.18 with SMTP id i18mr13311059wmf.96.1457896507661;
	Sun, 13 Mar 2016 12:15:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:06 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:23 +0100
Message-Id: <ca04da9e5ac867cdc1fedf1192de3d6842ccb858.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 25/42] at: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:07 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-extended/at/at_3.1.18.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.1.18.bb b/meta/recipes-extended/at/at_3.1.18.bb
index e83ea32..d7f99c5 100644
--- a/meta/recipes-extended/at/at_3.1.18.bb
+++ b/meta/recipes-extended/at/at_3.1.18.bb
@@ -59,9 +59,9 @@ do_install () {
 	install -m 0755    ${WORKDIR}/atd.init		${D}${sysconfdir}/init.d/atd
 
 	# install systemd unit files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/atd.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/atd.service
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/atd.service ${D}${systemd_system_unitdir}
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/atd.service
 
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
 		install -D -m 0644 ${WORKDIR}/${BP}/pam.conf ${D}${sysconfdir}/pam.d/atd
-- 
2.7.1


