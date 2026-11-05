Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30063.1793868230404333567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=g2zTJvyA;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491971ac844so219866f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868229; x=1794473029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fHnT3p8U8W428YwCxWJodQHwOscQ6YLaMCZHkexWJVk=;
        b=g2zTJvyA2fg1k6tzbhfD0m99edszjGr0g7KZTC8LeG7q3Ym/94v1c6DBiMvFjOCWOo
         g1DyWeGqnYtmRhJHqCTtQLr4AYNeYnClY3X86h180uyYITR8/G3GtHhb/am/ZOLYn7Xu
         a8Zk4ebUdlqRMjndH/Ca+VQpmIjs/0SvmaCzkoSQf48NxnsHGWS41MPf3Ii8gWiXJLCB
         WDl112u8LshIY/3EfUHIoOqIUMpqWyGPFG1YUHruClQb05wsOYP/X8oSu79BK4KaKIFO
         u3dT7DRl1jz7XTVkNQzX0UXop4yowWz0fJyXYNntDAKo00O1wBSkprT7u/4EXvWTu6fQ
         aHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868229; x=1794473029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fHnT3p8U8W428YwCxWJodQHwOscQ6YLaMCZHkexWJVk=;
        b=U8nTeiWymJd7gpXTNhXO0W20XsQv/1WXAN3xIti9MvSsi8tDfYSTuCpaz9CJ5IQRZ8
         kq5LbzeoxPBISh0Yh0Kj0PjXmiuTtjJsOp2oXiaZbRrVQtvDXJXmwNHsCG/Tp6ARpG3h
         VuNXnwRNVP+4/fe+kbFOk4Bz4ceKClnJ+7iflCMDWfdZ5eMy+l+psrPqL+aWNTZGYLE/
         5FuTkQyAl0KrYLnh6yf3dsVh7y7DoQKZKI//TiW7oaH8x7NAfiE3JiTuKRSsEntq1EsR
         LF3YfQGwQJiXp02XjJMcMPJApOjtLb3jOwAkVmE6mjFRchwmIjVHk8TY+mQPK9bbK/h1
         uGfw==
X-Gm-Message-State: APuU4Z/PLtEyhZfvFztcu423fy3+u1K5poUuRzBu5RM9OdCAU8f7piz5
	tnpuobDkfFcz/Hph0vB3fjiPOqx4HmrVjDqNhuww+3udG2gSZnpmLI7qvB+Yy6UdGWdkJF/m9gi
	LyuNlkic=
X-Gm-Gg: AYBFou1Gks9rHZ6ShsbF/j4+3k3l+DDrk5QLWAlNTFZyj7oMN70H5HKZnLPo7RSmTHW
	PeXYIUrrWHr8Kq47AWdMARd2/mMF6nTBK+x/PWArQZLQjC4/8K18WE9PY7AEV43GodGq3EUHFFx
	K6SFbshCVwdnXoW08eJCpnPA290Yo36il0uFayg4Xc7y5A9i8H+txw4jJ1VpDGeKLpbE2+e6O6V
	jF6ca3YG7AgVnC2IFo+mpdkOKRpCcGXstpQtVgVLfSPWGxkadehhWkaYG/TFMEfni2J6LeXj+j2
	kC35fdbE8ei8uHfFlKfwmeKfz9AcZ+7EldIN1HnZEPluOOGfxC+Tmi0YZLdIoqp/Xp+uvqVfGLV
	wFEVGL7dsFDoUHRzO+cXkWboGRM9rHDLTm+7LZVmqleo+FRFFGHi7QmuOExXK/isrhLSQMIjtbF
	HADPtL1UlN7Ntp+arj11xAjtiGTvJ/U5+HYIktA5i+HjlhBzm64a7OkzKlWnZsUvBzLc23TGRxm
	HoCVe2mdo/HR31qLLChnALZ8bpX3V2wqXwQEUItl079BB83OmZF+iAKTuHsXlAh4zt/b2eSWLqr
	R5r8myPEI9naU7YbgdTaN0wqS9ykh9+3Clj95wPDN1UUmKvie5gRvPaAR9P8uKXJTWw0tubZTXo
	2gSUXmw+LFxzUKwq+ca7yEoSE7ty7JZ8xbwzYZj234JR0SS474iU=
X-Received: by 2002:a5d:5f82:0:b0:48f:bed6:4d79 with SMTP id ffacd0b85a97d-48fbed64e31mr9198010f8f.48.1793868228613;
        Thu, 05 Nov 2026 00:43:48 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:48 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 21/60] scripts/install-buildtools: Update default to 6.1
Date: Thu,  5 Nov 2026 09:42:40 +0100
Message-ID: <7ae698112de81fb9cc3473e858a3309fb6641964.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249480
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

Update the default to the 6.1 release.

"The last main release" makes a less surprising default than an
arbitrary (now-EoL) stable point release.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 4e6f6e25d72..b92c26c4567 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -58,8 +58,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.3.2'
-DEFAULT_INSTALLER_VERSION = '5.3.2'
+DEFAULT_RELEASE = 'yocto-6.1'
+DEFAULT_INSTALLER_VERSION = '6.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
