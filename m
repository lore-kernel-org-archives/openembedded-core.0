Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id CDF2F60667
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p65so11584111wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=FY/pjMljfY39+Ko6y0wxc/Kj9BxoQ8WsYHRe8olxcIs=;
	b=LJxawvFPRy06mmNaTieTj6oUHhBZzj4LcS4kLCv1i71/y3+g+TOxx23l1wVFMyoyAw
	Gz+WCUEWQ2+fhcb73OqtMn0sWH7gnZHEa6a+On/4s9LAfkPd1/TJ68rAtTucr5TmudTL
	cKK73qopk8ilHH1+slXOHJ/jbtl/53Cv08HQ9RplKt8CF5mbRf/NaCJfIRt3RvYBUDGz
	ib84vnQSdMDojnKyRpJSt8Jq1pPu3iWnDs76zuviIkkfjV0MK2Tg4q3soGUryOKIvopO
	qZTjN1QG00cgFoP93jvvX07N9pSHQUTL4jsNraenWCDh1dD2PAmqv50LUQEkOZErPcxR
	l9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=FY/pjMljfY39+Ko6y0wxc/Kj9BxoQ8WsYHRe8olxcIs=;
	b=lKBZLP4r6IBZxhA+KSrzgYM4n/1EhnnoaYJ4Zf8kcnXfhgQ/yLhTNVTWzENfyMRqEP
	Zs5HbycE5dX0ysH18Z8ih756zqsA1i3eO7usmw3zAW1Basj5ZJKezLlVJkMrR0ChYkVN
	Syqy4+06B+hRZo3uWdalk6ldgbbncJAd12s1hUUVDbvtvtOCsXQqz6YOC0irZSIRZLd4
	qo9M28oDFiXajgGg5pu4z4CA9Tbhb6FSfeEH/GMJPFMlgdwH3rWaPU4Oy0SdfvPEvFOt
	2oHTUSKMTAhSfEE+4dvRb81ObfleAN4xO+SIkeIYOuQMw2DID1RMYzyqUxIyndDwso9A
	Sg8g==
X-Gm-Message-State: AD7BkJLPzSoTh5R7/GPXBZdQGME8PJ/X9Xu5q183zz3TYvgAhbxBoaQt8U47f5ca1ons7w==
X-Received: by 10.28.10.149 with SMTP id 143mr13207823wmk.38.1457896475084;
	Sun, 13 Mar 2016 12:14:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:34 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:12:59 +0100
Message-Id: <db1183d827372f4ec1ae4b4c1c52f7ca697b285a.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 01/42] rootfs-postcommands: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:35 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index e184667..d65e639 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -153,8 +153,8 @@ postinst_enable_logging () {
 # Modify systemd default target
 #
 set_systemd_default_target () {
-	if [ -d ${IMAGE_ROOTFS}${sysconfdir}/systemd/system -a -e ${IMAGE_ROOTFS}${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET} ]; then
-		ln -sf ${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET} ${IMAGE_ROOTFS}${sysconfdir}/systemd/system/default.target
+	if [ -d ${IMAGE_ROOTFS}${sysconfdir}/systemd/system -a -e ${IMAGE_ROOTFS}${systemd_system_unitdir}/${SYSTEMD_DEFAULT_TARGET} ]; then
+		ln -sf ${systemd_system_unitdir}/${SYSTEMD_DEFAULT_TARGET} ${IMAGE_ROOTFS}${sysconfdir}/systemd/system/default.target
 	fi
 }
 
-- 
2.7.1


