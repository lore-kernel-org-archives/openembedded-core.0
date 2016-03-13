Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4E60E7316B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:04 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p65so11586069wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=GEUxSgvtleaUxqtxz/zyVhQ1gFhvFT7iFt/dYpzyzdY=;
	b=jYUEThSPPAXCC1BJZA6pvADrxGsTv3hfKXIHL2kXwE8zH1Gi7fjZppa9HQe1kcLBuL
	ZOvyZrn9YiOozdTB6XWFiE2IKk3N51lAbhVVCGSeSUgKyb4JzFDP6wBx2F9mMNvasubV
	U/Xbb6HlpdNEk4MKg8JzzsxNZKH5DQlwmyafH7iMrtA2WZcdzgPgdxMBphpgHr4Zffvr
	vUxnmcP+hSnDByvQ60MJe8YvsjkuWV+NIBX/Ks+75vgBnWO4jPzntOkiuBIxWNGM3Rc+
	K0KYVQuy61AZD61d35//Yb3zjru0xOfNoFAOpa6Q0u4rYX/vh0NWJ8POw4xASOXwVdCB
	LzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=GEUxSgvtleaUxqtxz/zyVhQ1gFhvFT7iFt/dYpzyzdY=;
	b=mg/xdz+TxXJL95NRC9uCjfGbDkQbh+dfbVmYFocQd1YwDkdTgprjCnEtSyifqsZkUL
	XZrg6GakBFEeM9+6flBx+NZ+uNCy0XHZpl0ibrkIVBBLV8B8c4S8Hq5gvoXhJZhoWu2X
	eMu1EbmA2i7BkhiAJcgpK+WFmp5+C1o5wHp2ShsssD+M967tTWFUSOWLvs8vN/hBrRKp
	BkE3q00b73yKbJKhp5P0Tivx7aCFjwuOBkiQOlII/YLq9hAaBpeGeo/m0Zmkmd+qhQe5
	fjqBeJlUzr3IWDOntoD3D5M0fS8gxIdKWcDBbqV5iYPdFKr1Ieam7aDyRK45/oZUbftA
	sniA==
X-Gm-Message-State: AD7BkJKqWpHQnGHcTDsaYFOQ31vC7RUGIS0aqSqviezCu1HqGmoXjdE+cLHMOoEXAlJkjQ==
X-Received: by 10.28.147.72 with SMTP id v69mr13130206wmd.79.1457896504921;
	Sun, 13 Mar 2016 12:15:04 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:03 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:21 +0100
Message-Id: <7ec0fedfa28fddf37ceff1488eeb0eadd57d4887.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 23/42] run-postints: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:04 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index 11c94e5..4860d9c 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -33,13 +33,13 @@ do_install() {
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${WORKDIR}/run-postinsts.init ${D}${sysconfdir}/init.d/run-postinsts
 
-	install -d ${D}${systemd_unitdir}/system/
-	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${systemd_unitdir}/system/
+	install -d ${D}${systemd_system_unitdir}/
+	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${systemd_system_unitdir}/
 
 	sed -i -e 's:#SYSCONFDIR#:${sysconfdir}:g' \
                -e 's:#SBINDIR#:${sbindir}:g' \
                -e 's:#BASE_BINDIR#:${base_bindir}:g' \
                -e 's:#LOCALSTATEDIR#:${localstatedir}:g' \
                ${D}${sbindir}/run-postinsts \
-               ${D}${systemd_unitdir}/system/run-postinsts.service
+               ${D}${systemd_system_unitdir}/run-postinsts.service
 }
-- 
2.7.1


