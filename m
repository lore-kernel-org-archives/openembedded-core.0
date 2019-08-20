Return-Path: <ja.kaisrlik@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id D5BF76D9B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 15:04:33 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id g17so12791382wrr.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 08:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4kj/olVtaJAWYAyorZF5yBzjaCu0bfpVfx/SjsKZ/xA=;
	b=BFHPk2WxzX+ouI0NvJMizEL5KHO4on9dn0oFXLTSaJYnHB6nNapFdj87F8cmOLiqpp
	b30sUFXk+FnDYOvlK9aaYY5DQbgiiX4fqHCJ+8EFCZb99gzEVsMo00Ra2eTepipkPirz
	OnO+wlBif7z+d9RksDxc5/Lu1aB/5P4q8vsuih4VytrpMUEtOnCGVDHqfe6X+KCW4Hkk
	OFlvmdPD9OCKCF2yMg2vtJ+XtjJculDRi60aqN+gflTaG9QOOLlKFVzo/pjWIVekltLy
	PuG0a3yEsp0iHwcWT9/XWScu777pcI6yPWAcVzVTTARexLp4U0MPgCm61CtI+t5OO7LO
	trSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4kj/olVtaJAWYAyorZF5yBzjaCu0bfpVfx/SjsKZ/xA=;
	b=eoV2I2RXoFgSu2tr/zOcy1MxqGajsylIQWzieoh2El/QSGKfODGS4Bk9ZETOgG4puB
	wt8apfM12KEoFruIAUjOfLW/cI172Sg4zVtNZ3P0hQ9RIctV8cVUOWvY4Elelrsn8/uq
	FvoYn0kP5pfOPA3T/XvBlec2jqX9QijnBpQFxxD7s6377+nsIb8QapxNNu3HTnPhaOYt
	9jurd5kcNc4St7dbWKS3gi3kV/0NeBiXGzhvilV7OLotSJdrHy6nWeO289jIGOx7Dimq
	rYGFk1AlnrX1A19BopANynB6Spe/AfcpJXjxng3hmI2S6Z0PvA4WmqCzNkXA2ZACfeFo
	VaXg==
X-Gm-Message-State: APjAAAVEeHiAcFI5EBhqvdkKO8gMQQTWdGpyRPPRw+A/cefciosNxyJ1
	anNQsWmrCpAn6vvrEEa8qR5VV36xyck=
X-Google-Smtp-Source: APXvYqwl2WEdiiSfmrvvJcsHwl+ggf6FFT7U2OWv0pONxSWEz/jplX838whf22dhOlViQUwuh8rZVg==
X-Received: by 2002:adf:fe08:: with SMTP id n8mr33716413wrr.60.1566313474303; 
	Tue, 20 Aug 2019 08:04:34 -0700 (PDT)
Received: from xeri-steel.it.int.avast.com
	([2001:67c:284:64:5646:bb87:150a:dd53])
	by smtp.gmail.com with ESMTPSA id
	j20sm43425703wre.65.2019.08.20.08.04.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 20 Aug 2019 08:04:33 -0700 (PDT)
From: ja.kaisrlik@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 17:04:30 +0200
Message-Id: <20190820150430.18179-1-ja.kaisrlik@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] networkd-dispatcher: service file is using different binary location
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
X-List-Received-Date: Tue, 20 Aug 2019 15:04:34 -0000
Content-Transfer-Encoding: 8bit

From: Jan Kaisrlik <ja.kaisrlik@gmail.com>

Signed-off-by: Jan Kaisrlik <ja.kaisrlik@gmail.com>
---
 .../recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
index 050a938..20731ff 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
@@ -26,7 +26,7 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
 do_install() {
-    install -D -m 0755 ${S}/networkd-dispatcher ${D}${sbindir}/networkd-dispatcher
+    install -D -m 0755 ${S}/networkd-dispatcher ${D}${bindir}/networkd-dispatcher
     install -D -m 0644 ${S}/networkd-dispatcher.service ${D}/${systemd_system_unitdir}/networkd-dispatcher.service
     install -D -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfdir}/conf.d/networkd-dispatcher.conf
 }
-- 
1.8.3.1


