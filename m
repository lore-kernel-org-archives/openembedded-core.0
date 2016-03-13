Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C5D507316B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:21 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l68so11566927wml.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=t7RxP3DqGsoefuPt4FyQ5yuXh1OX292tqtG/7q02vsM=;
	b=lmoDpP+2frA+Qze1TAwzRCHwXu7si90bkpzY0CDoMIlCDVA7OmZtPahoeybALmLcjC
	ceIg6FVw84sSEC5oe2pwDH/0KLTu6mW7NkJvqshW4fHsv34eP+sDzmHS8wYjBNAN60rI
	MO6+RDFN3zV4hyMRZShtKjQDzuoBwXDflop/nb6TEmAqU9jpeskrbGGNdHToq3Tk1mAd
	QF8KwQKSCPqtxfhLwa3++LgH5MI+jiHyPNYAy5biDAUuTXzh2BCFTDmkBoZF9nC/E1O9
	3hMArY7nEIDk5i7E7vQFCfhWXDtHgwlQt0B9xw0pz96+2QbXFe0/VUIHvXg5qEQ3Fy1j
	0Emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=t7RxP3DqGsoefuPt4FyQ5yuXh1OX292tqtG/7q02vsM=;
	b=bsciQ80OSVywMWlSIf/AXua0KaqLeNsFX0ju1sDhK+jRspBF82G7RuClS4iNUJSCjb
	2yN0FP1AslB4k5JTOvjoLmE3lukY66tUXh7AE4xCLKbUB/MCjpnsIlbPUi7jx6kNUXI1
	HjBDQ6T21HjFIprfQLAxQFC4gQjhmFCA1KkQyd+NetuWKigYnL4uQ+daIWI8TbF8CMei
	+/vAc4qgJkGw4dJOquAQHItRBofDj13agQ3iZKES7coL3QUfyJJun67PjV96oYS/7C4p
	79+pqv/fFZSLfypDdlpHofVJRC+r37aP4JBy1tHTzM11jVGBZbiQ7CWYDeRQXyLNZyUL
	dCHQ==
X-Gm-Message-State: AD7BkJIQsZyj1dlM6IRkSmLTWcci2c/8wMlKS72ZfW+mjub7408bCU8NW7n9Gx4QUjCalw==
X-Received: by 10.194.7.201 with SMTP id l9mr20698645wja.16.1457896522429;
	Sun, 13 Mar 2016 12:15:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:21 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:35 +0100
Message-Id: <5571da5bb37995b6dec56117e9b6a2c9e200fb2e.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 37/42] avahi-ui: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:22 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
index 3966b4c..0ab1e38 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
@@ -41,11 +41,9 @@ RDEPENDS_python-avahi = "python-core python-dbus"
 do_install_append () {
 	rm ${D}${sysconfdir} -rf
 	rm ${D}${base_libdir} -rf
-	rm ${D}${systemd_unitdir} -rf
-	# The ${systemd_unitdir} is /lib/systemd, so we need rmdir /lib,
-	# but not ${base_libdir} here. And the /lib may not exist
-	# whithout systemd.
-	[ ! -d ${D}/lib ] || rmdir ${D}/lib --ignore-fail-on-non-empty
+	rm ${D}${systemd_system_unitdir} -rf
+	rm ${D}${nonarch_base_libdir}/systemd -rf
+	[ ! -d ${D}${nonarch_base_libdir} ] || rmdir ${D}${nonarch_base_libdir} --ignore-fail-on-non-empty
 	rm ${D}${bindir}/avahi-b*
 	rm ${D}${bindir}/avahi-p*
 	rm ${D}${bindir}/avahi-r*
-- 
2.7.1


