Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 31C9260234
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 12:06:05 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id l15-v6so23472767lja.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 04:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6/MBcXs0xQZKrSbNRyHYQ5uHwlEVMLeVcp/4XmcupEQ=;
	b=GIBUmBMUPRKU7vrdNLNGNY4CyB/Jt7f+PNBEddx1yWdlToT49gvTi/wh49twCFAL6G
	HeZ0+EQ+h22xvs7gRp79UbTxbDngB0RFv8jZrUX0FzV4ARYCsI98KN0fPum61dR5TbiC
	wfIBmYsv833tumcx250MBMazll/Ns0RUiaN0/Ca/PWi9vsym2zHM1uZFgjneRYJlygnH
	eb/SMS86y/vH3SdGcS2KvIC/zEpLp603gqVvh+4AUwRcnyAp/wJu/4ZX1PGgxV3tFZZL
	cshSRQx88f6r6X4rP3YZl1gq4ZfcJuds67fnkiKm20WxBtrFH7/DoThAX6NwCcHcDk/5
	51Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6/MBcXs0xQZKrSbNRyHYQ5uHwlEVMLeVcp/4XmcupEQ=;
	b=dwrt/5wp2ld6Gt2D2MAifquGfr3RWjyZj7mZ5Ig3ARmaES8Ma8yfow124nqfkPvObY
	Olo9KYZlIVs2qo3CA0u1cmrQs7DAgEZ5R2RJgnXPJvQQJQudxe9nd5hDyAznSORRt1Nr
	ATrf/tIvN1rCxvWjiEK0I/IBOYyWuFcyHrjVS6VHxLLEpuJ3jNiCjP0Ep75MOUdSTcDQ
	QF3C6o3h1YLBS/16Z567nDp/afMk+cDSKiL2cnJg4IVmseTXQr+5Jjbfanz+m1X1XaU6
	7eCZtNVMUFFbDORMZ6h/jzp5uAM4ctudHDCZXz546ozLLvBxyak7hn2Ndfo7oLX5SLBG
	8spA==
X-Gm-Message-State: AJcUukcv7Vir66Mys2qprdhvA9SQFS5OtnK/N1FiUmdCf0Rj2TY/ohdw
	OFznQokiW0MbTotxtvbg1J5OTs2pLRg=
X-Google-Smtp-Source: ALg8bN6Rt72g69gI4dv+zZbFLmgQe6Cgm2xAzeWxdsZebvV6aSBMOzZO8otejlkBmv54ix/DyVs/XQ==
X-Received: by 2002:a2e:2416:: with SMTP id
	k22-v6mr23407990ljk.80.1546257965450; 
	Mon, 31 Dec 2018 04:06:05 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	r76-v6sm10246379ljr.83.2018.12.31.04.06.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Dec 2018 04:06:04 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Dec 2018 13:05:55 +0100
Message-Id: <20181231120559.25470-4-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181231120559.25470-1-jonas@norrbonn.se>
References: <20181231120559.25470-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH 3/7] systemd: move additional conffiles to systemd-conf
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
X-List-Received-Date: Mon, 31 Dec 2018 12:06:05 -0000
Content-Transfer-Encoding: 8bit

---
 meta/recipes-core/systemd/systemd-conf.bb | 4 +++-
 meta/recipes-core/systemd/systemd_239.bb  | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-conf.bb b/meta/recipes-core/systemd/systemd-conf.bb
index a504afe3e7..ea99166a2e 100644
--- a/meta/recipes-core/systemd/systemd-conf.bb
+++ b/meta/recipes-core/systemd/systemd-conf.bb
@@ -10,7 +10,9 @@ CONFFILES_${PN} = "${sysconfdir}/systemd/coredump.conf \
 ${sysconfdir}/systemd/journald.conf \
 ${sysconfdir}/systemd/logind.conf \
 ${sysconfdir}/systemd/system.conf \
-${sysconfdir}/systemd/user.conf"
+${sysconfdir}/systemd/user.conf \
+${sysconfdir}/systemd/resolved.conf \
+${sysconfdir}/systemd/timesyncd.conf"
 
 FILES_${PN} = "/usr/lib/journald.conf.d/* \
 /usr/lib/logind.conf.d/* \
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 03acce25b7..70e687c92e 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -292,6 +292,8 @@ do_install() {
 	rm -f ${D}${sysconfdir}/systemd/logind.conf
 	rm -f ${D}${sysconfdir}/systemd/system.conf
 	rm -f ${D}${sysconfdir}/systemd/user.conf
+	rm -f ${D}${sysconfdir}/systemd/resolved.conf
+	rm -f ${D}${sysconfdir}/systemd/timesyncd.conf
 
 	# duplicate udevadm for postinst script
 	install -d ${D}${libexecdir}
-- 
2.19.1


