Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4E4A46072C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:49 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n186so11590263wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ro+EYBl2nkWFy1bK9WHELWeSpMrn6lHmATZPEfw8O8c=;
	b=QdVEaNiOojrgtZS1haksaUdLmPFVaJiqjFIDyP38K4O2HC8uZopuIgA5SZ5rUPm7Zj
	oTgJrLM2MG8djW1WLxQ5CudXXxkmiQX1ThkNg5NxDJQiylLP9xUxeGkNspj22eEdkV50
	BC7Xv1tC6TWervmwUyyGBsqSxvfI2TunThUwKVjy9zyW7nUbjHx7CBYwk+QgcndSVFQ9
	iQDxiWsuVIslyM+IfO1NXS7FlTfo7nqqbJNl15eNGiJ3PNfbw5XWkjJzdJwKhT6LhaFg
	yWGVq8ykWlsVdFkYy1/M0jzFuk8j6t/lgaqoQOlV8nAO+O+jUFglTN7wBsSCkFYczwyg
	HXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ro+EYBl2nkWFy1bK9WHELWeSpMrn6lHmATZPEfw8O8c=;
	b=MEYLzGN9p47K9vPpDFaVjWKH/8/8+DuxWEWWenYqH8z9M1+GQDyOMSefz5vQT9bMmF
	PedReWRE8NuGV+l9secfNsxEyG1ivOBovtUCSwTtGBtezulFxH7y+1lFEGK7rKtF7JSN
	TB73Sfq8xuLefmfMxJjL1/vOft2PZ3A15vD/+EJBmhGp4Vi6lWCrIWHT8FlTRXszBsLI
	+hAehQMwW+3yoWHNV8PW2Qrw1glKPS6amUc3snmBquqNmdufAFnYyhR9JM0LH9qO9TGo
	v4urmTwdsJ4+RdXHYpw+Ky7fYlKxEUEBw07TmKKQMs9C2iGQko9ktJKXpO2fjvVmhgnS
	DgZQ==
X-Gm-Message-State: AD7BkJLZEroSws6YxGRQcY4H15oiQUI4TK9BqH5Z977xd8JBEYsxFlKBdVK7IpoKQCbS/A==
X-Received: by 10.194.83.101 with SMTP id p5mr20414343wjy.141.1457896489906;
	Sun, 13 Mar 2016 12:14:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:49 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:10 +0100
Message-Id: <dcecd477cdc1efdb82b6d3e328982db7e4aec0c5.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 12/42] ppp: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:49 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index 4437b5c..5dab247 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -70,17 +70,17 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/pap ${D}${sysconfdir}/chatscripts
 	install -m 0755 ${WORKDIR}/ppp_on_boot ${D}${sysconfdir}/ppp/ppp_on_boot
 	install -m 0755 ${WORKDIR}/provider ${D}${sysconfdir}/ppp/peers/provider
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/ppp@.service ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/ppp@.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
-	       ${D}${systemd_unitdir}/system/ppp@.service
+	       ${D}${systemd_system_unitdir}/ppp@.service
 	rm -rf ${D}/${mandir}/man8/man8
 	chmod u+s ${D}${sbindir}/pppd
 }
 
 CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
 PACKAGES =+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-minconn ${PN}-password ${PN}-l2tp ${PN}-tools"
-FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${systemd_unitdir}/system/ppp@.service"
+FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${systemd_system_unitdir}/ppp@.service"
 FILES_${PN}-oa       = "${libdir}/pppd/${PV}/pppoatm.so"
 FILES_${PN}-oe       = "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV}/rp-pppoe.so"
 FILES_${PN}-radius   = "${libdir}/pppd/${PV}/radius.so ${libdir}/pppd/${PV}/radattr.so ${libdir}/pppd/${PV}/radrealms.so"
-- 
2.7.1


