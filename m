Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 733BF7316D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:05 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p65so11586151wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=nHkh/KNvF9A2sQ+pzS9UIxse3N3HZkPSSzKlD3ipW08=;
	b=Ru/N5XGEfPecRdCs9cDSaYrlAFr4hyU4RDrA1A9/nsrIHg1GWFv9wZ5RGVmwbllvSy
	nxN3T/vFH4nFfBXsvRanGVEGMDVKheQy55Bc5zZuGGmA4JaIrV7Jef2N4EP2ICDWBQ9O
	1lwp2hYZ2EIObEuyoCo7eC4xUsqaKQNxaTD2/uGUSP97n4XJVXHFqtWh2HDv2tx8U1ck
	aPnkpr/wOAlDQo0ICbS0+lDkjDCv+l4b2NZWSw2axgD2CMqjerRpuda59BxosnEf9Ctq
	/3MYO0k3MUCL4XcDcip2sH38mnVs6eRZMUOxhnYZ5t6a8c7nrpxJOqLKP1+BGOD9Y8SF
	RLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=nHkh/KNvF9A2sQ+pzS9UIxse3N3HZkPSSzKlD3ipW08=;
	b=aqDwDFldUFrYPEuApoSJSFXzRJgIdf4KfAAYm1g1UCqMUadG5yLKCcex9M8/stolwi
	I6fbdfLHk8c7pUAeFZZA+qXgHDefzsRqdPJ/tk0kfeNNiFZxkWo2kZo5FMDOy3kW234W
	RVhhjFFIRDe3WhmqrxX2MSpzwUpANLhZvgs0S7RAbZqiCN4kC+P0VV4IgiDOMQXeHc34
	LMyxDhOEDOMKWWla4VzNQwvTQoUUdkbW/LGSThTjO3Kf8yolh04SQ5CJO+YRiUINdk2c
	jJ/HK56dEl3rRai3TgJymGjviLTQMKWjfggNeXwtFQjvBwZlmqO3ToUR3pYwE2XpvGl2
	eesA==
X-Gm-Message-State: AD7BkJKdUhVWYMHq/3jE7WZZwm5XKhOUK6qgHKp+F4vsc7URbVNw3pwOvDpbomQRCYLcoQ==
X-Received: by 10.194.21.197 with SMTP id x5mr19884688wje.90.1457896506069;
	Sun, 13 Mar 2016 12:15:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:05 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:22 +0100
Message-Id: <0ed36391ff21aa925ca2d4927334672dbc851c84.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 24/42] tcf-agent: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:05 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index ab2fcd7..5438d62 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -45,8 +45,8 @@ do_install() {
 	oe_runmake install INSTALLROOT=${D}
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${WORKDIR}/tcf-agent.init ${D}${sysconfdir}/init.d/tcf-agent
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/tcf-agent.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/tcf-agent.service
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/tcf-agent.service ${D}${systemd_system_unitdir}
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/tcf-agent.service
 }
 
-- 
2.7.1


