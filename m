Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 98487731E3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:14 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n186so11591849wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=HtSXQC8D3n0k0Nq87WjnnDSVGOEepfg2fH/l5yGcZtc=;
	b=gYJi7fbeIZCg579+z6JjzXOJqFwilXAFn6xTQOzu8XOZyTisI3OJ9ZvNIXZtsmD7XO
	S9lJrFQDgNvFTnVMtRf/O+NhPfamhOl4b1HZmI8wqXFi4Fwa6rff93vgdgEIuDPWNKdg
	+x712597TfB2Z/Od7iTwpswHR70tmoQOsrX5n/wQ6/YhY8StrDg4gnnrm4ucwu0p98TS
	tE/QV5id8EQkZfauwjOithcDpy185j7hN8W7AowrzDfNERI9CYwGOGm4C7gowk7PF/GQ
	Kj7Oe20Nrgmt7UmjLVD67Me2bblQN4EYyOqIuWxwzoakyxQ/OlXP2cyrGY1A0F1tO2LQ
	94sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HtSXQC8D3n0k0Nq87WjnnDSVGOEepfg2fH/l5yGcZtc=;
	b=BMLmBlEThY0WYHKbfMo8L1cvPCufdzlr7r2dLSWxEze7ozIl9s394Zog+gjYweO+P1
	pLOqrG1jcwbcaI0ZFJZ46b3XKtCfSzZUnfucz//bQjYaZQFm9VWh9QqBLDWe+3EYgVrA
	odN9ZqKzPCj+AwbH1TrsAjESicLrWwjnN9kEKqCEETMfCbwm4Ikt2Bf1NuMzTmlDOA1M
	b+FmoCTz/dMZwU52+6m0BkrPXx1OfyjGNDFEiSb0+LuXrr2vU9dJyDlwStnjfomQ3TI4
	6yQelQ7z34k5XtZVwauo6dGD07fu+UnRHzNhClRADZ+hbH0fPBYot5N1gqNt6dEXz9Jc
	lbhQ==
X-Gm-Message-State: AD7BkJJYinbm9wePPalRXz78aEq1Y4wuGGtrzjR3Hql8xrIviUwnJfI6u2AAGGKAH++BOQ==
X-Received: by 10.194.172.3 with SMTP id ay3mr20621838wjc.155.1457896515080;
	Sun, 13 Mar 2016 12:15:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:14 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:29 +0100
Message-Id: <61810c50a0b7aa6bbb9c84bc04d93ffb355b4038.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 31/42] xserver-nodm-init: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:15 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-graphics/x11-common/xserver-nodm-init.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index b68d40e..650ebe0 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -25,14 +25,14 @@ do_install() {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${sysconfdir}/default
         install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${systemd_unitdir}/system
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${systemd_system_unitdir}
         if [ "${ROOTLESS_X}" = "1" ] ; then
             sed -i 's!^HOME=.*!HOME=/home/xuser!' ${D}${sysconfdir}/default/xserver-nodm
-            sed -i 's!^User=.*!User=xuser!' ${D}${systemd_unitdir}/system/xserver-nodm.service
+            sed -i 's!^User=.*!User=xuser!' ${D}${systemd_system_unitdir}/xserver-nodm.service
         else
             sed -i 's!^HOME=.*!HOME=${ROOT_HOME}!' ${D}${sysconfdir}/default/xserver-nodm
-            sed -i '/^User=/d' ${D}${systemd_unitdir}/system/xserver-nodm.service
+            sed -i '/^User=/d' ${D}${systemd_system_unitdir}/xserver-nodm.service
         fi
     fi
 
-- 
2.7.1


