Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30084.1793868247472795971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=CAdDAZ4v;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1043974f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868246; x=1794473046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NThVzb3jjGdkxmNO2pPTdKmz2NMuKu6m6sJyHwD1Pjg=;
        b=CAdDAZ4vbVcenJEiy0Lb1UQMsPjauGnwVINeYzjVCvOj7FUpGeMCTC+3R2lre9ZLqE
         29YXmWv16kyNr4ookKo7UQUZa0/tXVxDAYxK8y3JeNlyXxD74x7kv6ChyoqrTkBJknXz
         y9hsLVOaB//i4n9FXNjTqEvTaGSaig5n4Z6miADiXNF8m9BIOhXMSImK3nloNrtLrBCo
         YdL1q5vHYg1jXhQdo68WI7YHGa6mYMzMBPDOKtZ7ZUXuvE/2SZSsN+mrTvVV8lkRMcj4
         IdvawzKYCHPs4slhnpMkDtKf+BuR3I9sSaaXBKYMNoCFKP1rLSN9c/KCcOMFFeYwUVdy
         ERwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868246; x=1794473046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NThVzb3jjGdkxmNO2pPTdKmz2NMuKu6m6sJyHwD1Pjg=;
        b=JC0bw8jHuj8cSVSAZJhagPuAU2ztNzfDtuyEeX+UHeCVukhiddBO0Vj1coGM1fikZA
         /RcjpBb/jvYuMt0ecIcFm/jZ+7rebvRTGzSOS6P2uWDffKRuQt03WrS8lfeZlnxlxE3d
         E9OFgUi5qtSa/PrgGc0TkKVoKuUYHvmIgfz8kl1R9FlyYTzN9kkgV2FGFRVzNXgjRHel
         4XBlLVQQSqhm00cf/cKFnf1Y0X+enLvVldQf+SVFDdnW1iSmYg6n8zQv0X9yKz2aSNTR
         lSplfGUQpVdEm0qQc40sTiigfutJJRrsPlAsbcdIVQyygzFDx7bwpMQ2i4d6dCxcFRBi
         pPyg==
X-Gm-Message-State: APuU4Z8vozPkoBnXAHriDJnpqWoPVgsU/Hkb2JvN8RYSfLogpUGo1Nse
	NuGFIy99AEryfUSuQnbkQ4PXqm5978EF+zgQ0mlbhhSYRIb+/PWlR5FR2ngpADuQV60RKUk6xkA
	7jMfREnE=
X-Gm-Gg: AYBFou0dS72t9P+tzilH+FNwiEs5p+Y0Qvg0s7JNAbSDcYqUk0xGLoiSt5XIo8g/k7n
	D40En8oG7A1ZVZ6nMmGKmhzDXZoT0RwxUw+Tw48rp+CIKuaAbP2JDNp2/SdyOfuPY8aZBGOCFd3
	iR22bF4+BgTojRRbyFmY4ygA6jafxnw51ON5yWx5ZAGkc045Vo8zZsCz4NMFN0ujXdRccBpuc9p
	/xnOjFzvF/QyAf+hj+ENa4R7jsQTmRIJ85bsp5pYsfwWhhttZk6N6NYhAvqfD0b+92//6ws+0eM
	aLBi1sOE4oSlvysdlqNX6XPqkUEE4GZK7+pfalyvFxC43X+PoEAn1m+y3XLROLvPnjR5iXima2P
	Mm+lQsCQ/NeFDfiKIh1LqK348QkHsc9fQbpGyWlZ/C3OQpyGQmwP3iKshsHaBC+GyBLrC4CCwl5
	4rIbmmzTuPfI3DDRdgVkIloHaNoyopG0Y5WYVWzbuzqybfgzu//fzp+XQoT8HVfEheFpXqdzSjC
	RxzQPnJnzCpA0ynDARfu0ac+o628JeROFFjX19Cv9ziFkuAtqFUzLMVVhE0ci0Vkt5hWQqIld0/
	JJFBC7lt3CRMIjaUdLxA/pZvcNmox/HtsNqR4GXg/vb+RlMhSdNrYEmOHu7/4KjQGIdDqWO35Ps
	U2osECm/XYeJzWmy3y1R3WaJUcqkC
X-Received: by 2002:a05:6000:388:b0:491:4e13:fde5 with SMTP id ffacd0b85a97d-4914e1406demr2313027f8f.8.1793868245693;
        Thu, 05 Nov 2026 00:44:05 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:05 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 52/60] systemd: create the clock group for udev
Date: Thu,  5 Nov 2026 09:43:11 +0100
Message-ID: <db1895237c899b67a454d97f2797703b06a14a29.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249511
Content-Type: text/plain; charset="utf-8"

From: Luca Boccassi <luca.boccassi@gmail.com>

Since systemd v258 the default udev rules assign RTC and PTP devices
to the "clock" group. Create it alongside "render" to avoid errors like:
"Failed to resolve group 'clock', ignoring: Unknown group".

Signed-off-by: Luca Boccassi <luca.boccassi@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8615063bc14a8a3088d9d30fc4ac9b05928a7565)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/systemd/systemd_261.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_261.3.bb b/meta/recipes-core/systemd/systemd_261.3.bb
index f7e588a1968..b555cb8701b 100644
--- a/meta/recipes-core/systemd/systemd_261.3.bb
+++ b/meta/recipes-core/systemd/systemd_261.3.bb
@@ -440,7 +440,8 @@ USERADD_PACKAGES = "${PN} \
 "
 GROUPADD_PARAM:${PN} = "-r systemd-journal;"
 GROUPADD_PARAM:${PN} += "-r empower;"
-GROUPADD_PARAM:udev = "-r render"
+GROUPADD_PARAM:udev = "-r render;"
+GROUPADD_PARAM:udev += "-r clock;"
 GROUPADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
 USERADD_PARAM:${PN}-networkd = "--system -d / -M --shell /sbin/nologin systemd-network"
