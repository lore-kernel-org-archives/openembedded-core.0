Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2B2837316B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:08 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l68so11566053wml.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=X9LO0uE3IwBX06zVMRC2qZyQXQXXKZJCMx4Fei+85q0=;
	b=Ohp4kII1JNFsvc63/GfbdHAg/kW24Fab71TenZsnrecZNCEefZ31G8iBAoPSMxfPx6
	ERKQ1WMWBLgvG7LtB2s7LIKihiAxd5r/DLaDxlyksuZgb4VYUdHS64QFeDM+AcJEm0Bh
	senP/fuchXyuEPGVZ2Rca2aCBY88UUvYAz88tngY0SjdEsjhA0oD3sywP3YosfqRVGZp
	PdDW146DcGZ27Hid8hczlo3B5SlBsel2Izt6ligSsy0aD9+g3l9K672CqYToYjolh93k
	zeugagmLfwRctD+Kh5PgcIDYGnethdJAPxWYDXQCgXzmI5mpYV1Ek20VYZc2bW+eUSJu
	Ke4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=X9LO0uE3IwBX06zVMRC2qZyQXQXXKZJCMx4Fei+85q0=;
	b=g6pGgmUh6mJoqB4Tge05hPS7tkncrQMd4ekD40slJI1fAwsUiMlKKArp70mKC/+wvm
	9TQUrkH0wcMKYXR5HSONS2qreFpmuMGPPWNh/CjGYT+CV12Jen6Gc9F5oj8ENXNbmKcA
	xaccOlnqLcV7H/XuH+o8D+Uo4yuBoTRMnKRbnfGhc+vobONH56kuiLO0IQMZpmz8W7JT
	VulZmK+tPKk0MITJ/BWejwM4n7hWF7tg6UfFj5TzYKMyWTf9tmbF6ZOIz4W9Mc9ToE4q
	cLoyGxdYOzQLyNLvurnVNkkNY3DizYehAgWxrtOp+aq0MSLn3oyMrFxwMflA70hUToKR
	3/Xw==
X-Gm-Message-State: AD7BkJKHBxqw8lgZCY3n8fXC6ESV40XKSaOoZTTDvB/HfC+TUP7I//6J8O8INtr/bXoApw==
X-Received: by 10.194.91.205 with SMTP id cg13mr20063057wjb.166.1457896508785; 
	Sun, 13 Mar 2016 12:15:08 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:07 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:24 +0100
Message-Id: <6ccce981c69f2c9524897e1f2045bc91928b1bb7.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 26/42] cronie: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:08 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-extended/cronie/cronie_1.5.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/cronie/cronie_1.5.0.bb b/meta/recipes-extended/cronie/cronie_1.5.0.bb
index 697501a..54eabf3 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.0.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.0.bb
@@ -48,11 +48,11 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/crond.init ${D}${sysconfdir}/init.d/crond
 
 	# install systemd unit files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/crond.service ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/crond.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 	       -e 's,@SBINDIR@,${sbindir},g' \
-	       ${D}${systemd_unitdir}/system/crond.service
+	       ${D}${systemd_system_unitdir}/crond.service
 
 	# below are necessary for a complete cron environment
 	install -d ${D}${localstatedir}/spool/cron
-- 
2.7.1


