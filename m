Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29821.1793868240131350729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Z0gh1cDf;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so556897f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868238; x=1794473038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O8qUb0z4jZTAIYL9cD+BoSyLcyMs+/ujWlrIml6UjmU=;
        b=Z0gh1cDfhh6Rw50BSjFc0sNfPgG6BJqTzqkD948EDjtFZ72XNVMd3qYGxNmsDomJUH
         Dt3/GBzCcNHbf9IRUgrxQoerXH1UTouWCXclqbprDQktMc2l+6n2P4g7Ez/3fnf7iRTb
         Zxm5tmw+TO4HTUbXKBLNvXFehUQYePzVhyxqq3pw39d6JafA14vAsZwauOsfKuL2sU7u
         cgDLeMlC4M/l3ZLOcPDy77dEW0yjIbYfaLSXQxlCQNfpOuSVtcMkdstqNlQUmXumj01n
         Isulf+G/k3rj/Xu52HK/V8DyRSCOA1VJEnSRWqI74CrZDO0RHJAr6FJvqiQmZ3RTfBr/
         xbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868238; x=1794473038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=O8qUb0z4jZTAIYL9cD+BoSyLcyMs+/ujWlrIml6UjmU=;
        b=s2lYRYqDNtJc/CwD9fco6jsyvSo8LgRRjAttnHRPVZhfKGk+8M3xB7WrDMtsWeyiN0
         DahqieVxBmuvD++S5aWXLPfYpPoTRD0nRI2EQeNQ9UsATDo+wVOxslvOcY9eQGCld4Ya
         iX5U3MUAIH4FSZHvLmAa2N6UWziPplj2wBBzv4iGMgtyURN1q+Dq0V0fiUjrLTxea3hJ
         BYthWyiuVdUJ5ubQ/yhcukyctUqezeGvRqmfC0X+q8To3KgIMU5YiwHWM/HEuDYVXLf2
         WsWj+RfK/4RN+cd9sYOPBrfB9TUbXBe7MH3MquEsiMGi35E5kFzE3hywIlHGCTGmOwl3
         mPbQ==
X-Gm-Message-State: APuU4Z+9pYkATzf5xVMDrhm5a9uARrCi9VZ+d94Suobi9uSdFG9cXwMI
	OYyDrr4/YYRx2JmKafMa5oxlTBF3yXd8QCz7tje/7/iC/tuDI8gKDVC1jswPuv9bWVvHec6W9Ye
	yoVTiX9w=
X-Gm-Gg: AYBFou3YdkcDMCVh57CPDmZ8TF1x+pX/valat2jy+G9JCsx/LdWpnM0lm8cBQSbzUBN
	HzskFk2c1GbgVeokIlHkmmdSu1h+qAWD1pWv5wMBpQpuOPsOTdPl0BPp8tOsRtlUk8q2nSdBJiC
	ZBAHrLiUtK3ih0EVhFMWfShhCBwjHhVdzHVfE7kbif/0HgTyVe+O0ViuOt6AytGl7qwHXp+/6/R
	twrC5vOrxpIUQsOuBhqtQB8m87lO8ACpqTFb9N9qVNR8G887Qsc+lYUILsBjk4ZnnCyll0mfhR0
	gVvcGkgwWt6CWGQYzSn8WxqsaCxpdkvDy/4RWcF+x37qd2qNBKHgV2PIQqvyojBH7rM8aVW9RQi
	gbbUDH6C/MJ9+UzPMbzXDXmCgMDMzVfWscVA2a6bp9J9oa8OLqTfqrGW+WfGp+0p4PhRlEqVqNZ
	tXvFsSOhO7Ohy0IS+ts9DhjhxMwHP6J/OrcxOEfhIkEHK5UWefwZzbKsWBiJ+CkYRcDDF+ySqNZ
	Nunjb4nwSrkvapNiQadEy2f0qv5Ass13mdoLghXphXy5OVP5vD4UpkU+0G6CkKQI0d2K53QHKPR
	LH7GgvaaFFPpT67NzgGXezhzv282xj5IfH+l8FRcpWYGV6x95ncbEdsG2Tp7eVaDP/HJlaf3r0E
	Q4l8NqGpbpOsfxar6o57Eg8WA6MlT
X-Received: by 2002:a5d:5f41:0:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-48e6e2eb83emr43287071f8f.16.1793868238287;
        Thu, 05 Nov 2026 00:43:58 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:58 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 36/60] python3-babel: Add python3-zoneinfo to RDEPENDS
Date: Thu,  5 Nov 2026 09:42:55 +0100
Message-ID: <132c1a4f9ce7555564f0f1b0c0383b3404080920.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249495
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

babel.dates falls back to zoneinfo when pytz is not installed, so
importing it fails on target:

  ModuleNotFoundError: No module named 'zoneinfo'

Seen in python3-breathe ptests.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 80e0a11ebfa1804eaa848e941492914dea5fad42)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-babel_2.18.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-babel_2.18.0.bb b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
index cf2752f6a23..0a4bbb4fa6d 100644
--- a/meta/recipes-devtools/python/python3-babel_2.18.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
@@ -21,6 +21,7 @@ RDEPENDS:${PN} += " \
     python3-setuptools \
     python3-shell \
     python3-threading \
+    python3-zoneinfo \
 "
 
 BBCLASSEXTEND = "native nativesdk"
