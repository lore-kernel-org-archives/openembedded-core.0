Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30057.1793868224733648406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=aT3tz72+;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48fd2e38825so1067378f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868223; x=1794473023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ruOLmWom7tdedN/lEdGg5ETvLPa+qpD/wRoG3ocj5EM=;
        b=aT3tz72+3gDxQMllawpXjulP2rWJrCgQ6tu6APwWfeVePUGCkz3xi1pSRTjq+8RWnR
         j0y1Gbp606jr9jxuP0abFcgYJLu7CII60r1DjRiXM0z1RoDFsxEYZoyMBvgKiAiReHiN
         Xld1oFpWQ97F2ZUpqTkWxTDWaokZz72B0n+vufybiVFyUDLatUAVyp64T3cngaGoK+zz
         uZZG+i2idntz/4OnUjyb7b6I+KCSJN23yrGxltZK3ETl2J7yUpQYIo2q6XTMJqGgSt6g
         wDvtxvv2F4ONf6JMTM9pWIlOqGTyGN2B3Bxq/yYo3JECwkpCxBZSqzxdXrjcVjluq0s+
         3kKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868223; x=1794473023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ruOLmWom7tdedN/lEdGg5ETvLPa+qpD/wRoG3ocj5EM=;
        b=dGtWlOzW5Bud8LfzO9rCJ7zxothbsVsDRcvRTzxMnlszGnI8MITYPpWP8DJoLlQpmi
         mVd1XuZSZtD5wELF7PypSRyyUQ+D8OyU2nXy2iF3a8LMrKKu/D8s7PmcbQNxzCjVCh4L
         qRl3xhUB9asfZa6RfT8sjmbQUMYZDpLyPIX0O3offCaBH/n8a0ghVJq7L3y1wLWEUBq/
         EP5HiwobitvbyCHGhysnb2lTzsgkVTOkv72/vx54DcyU/bqE60KYLsKkBh2MXAOi64N3
         FOZyeUpURNkVrLEruPcX1tnqrsNzyriBKS2Nkbr7D+gt8fAlD/21M6uVD16Llfv74hPH
         2vYw==
X-Gm-Message-State: APuU4Z9w8BkIbOEYf7z8ZQmVZlhFIuSM4mhqD0hZ1fkIpFcfVSQMvuES
	Ae5wga2HrZyq8Ene7hHNtgO/q4FUdKIFGtrgys0FHcVgSDB/yyjzQ2DnEGWDdtiwqdL8sU4t7jI
	i+deRh7o=
X-Gm-Gg: AYBFou0iiBoXbi27t3jJ3toUll13kCECCxQ50Ye/GEZYevKWJOHVEgFJNHiJOcA3R6s
	OYYzd+tIlI7Y6+AxBTeLA7CvrHAUloVK/r7tr3NSH23c2UP26dFoEQBjHC07f6IM8uzGQm2guIp
	xyBdZNfvK7XLzYz+kF8TLLk7UNUN4F+uK2n80NJxRnynTa/4uvjAs+oIO39ck+Rfr7aspJ274bi
	6dykqHLvJhwCbMj9tdYwa3VX3YIMXu79Zob9w7ryyC7vQ0jj+DXF69mY3sZyT8b57S0WXX9QK1P
	dQD/YGYaxk7zVbO3tieAbFMbr/AymDMBOmBxDDHje+ALU4BJCDeQ3jIU+A5w6F0TfALl7KqAzf9
	XVe1KFWt+3J+fXNb0U4ggIRaJK1myWj2kJv/6tym0PvI9MUAKRaRYbWUSfBchXfOWAqMc92Szue
	iFQLYorCqUw2jxgZ7eT9GNTGSvAQ+cWuL/dIygovgYaJUBFx9wlUfvkD3XvwIHhV9xKDZeCEinO
	dOOnI7lxUB1Y9bMfUrLp9eB3ArZA+uUYMNFds/QsI+a7pfM5ljGMNvAH7Js4/j8vzedB2CT44Q/
	1llCNYj7j9vgHeQQjPGvN9Lrz4O7ZhHjg0wLvYmHo8A/kzq45qvyynj2alVpmsbFAR7KtLErAOf
	w+n0mS43zhpvW0H4emQKpCKDL0fVf
X-Received: by 2002:a05:600c:a012:b0:4a2:150f:1609 with SMTP id 5b1f17b1804b1-4ac17b2cdffmr399794285e9.8.1793868222976;
        Thu, 05 Nov 2026 00:43:42 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:42 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 10/60] systemd: add iproute2-devlink runtime dependency to udev
Date: Thu,  5 Nov 2026 09:42:29 +0100
Message-ID: <db574e2887bdfbcfd09bc1b96893b60c2cdeb2b1.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249469
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Service file ${nonarch_libdir}/udev/rules.d/81-net-bridge.rules executes
/usr/sbin/devlink which causes errors seen in journal on systems which
don't install this package explicitly.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 69bf564780353d34cfd87bf73960cfadd8b2c6ac)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/systemd/systemd_261.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_261.3.bb b/meta/recipes-core/systemd/systemd_261.3.bb
index 0901736e7c9..1f482d988e8 100644
--- a/meta/recipes-core/systemd/systemd_261.3.bb
+++ b/meta/recipes-core/systemd/systemd_261.3.bb
@@ -764,6 +764,7 @@ FILES:libsystemd-shared = "${libdir}/systemd/libsystemd-shared*.so"
 
 RPROVIDES:udev = "hotplug"
 
+RDEPENDS:udev += "iproute2-devlink"
 RDEPENDS:udev-bash-completion += "bash-completion"
 RDEPENDS:udev-hwdb += "udev"
 
