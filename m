Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id A000F7D2E6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2019 18:30:29 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id w11so4713792plp.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Sep 2019 11:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2sD8QkTwVODnztVOeb6wrUxwXz3La9J8IuUOxATSKto=;
	b=rFIpH6XLYVy3mxO3wO9P7YEv6Qjo6TianbxGAp7+xr55VBDjcZru4FS8yxMjRelNVu
	ApcEhG/fSYsjcaThVJhfBT6z2xf4U8O6AmlU//WPAkfilrIiUs2/qRAc9JjRcHFMao3l
	EyLAgvcAwqiJnB/tRbluZEE/1ROmjjF/h9pKJRY22OmgwAknvUb+d2+9So68swXeJsbj
	IAkVZ1UQcw6xGfvtxPxjvP+n1t4sJ5YBYuido/dAtgpUa86e+kkbnNUATq9MfJlAct+E
	/ZZMEVGrm/icARngKZH513CmPcE9DN+zZ051YxkolhQpMSLey9cyEp8XIOuo/JbwmDTd
	4RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2sD8QkTwVODnztVOeb6wrUxwXz3La9J8IuUOxATSKto=;
	b=KaLWW1/vg5siX4pAmjp6eays47hpoJRrsDQMSJHHevsmUTY03SkiOLw2DgZeLQOm4r
	+aQnCriKisntCxEhar9ZtJ8S3vGw+Y5bImnqdvkh7XLKaS11exsAEdPAPMlO4z7J8anZ
	RjwqR4Yn6J2s2YAiqLFEoGrDmex4uaJlh0SO+k9jhuTKNREpEphsoIOKlLMXHfSETtgB
	a303Cm7yFjfhKhAAAwBIkgTYgHt4y3Xmm8zN2GS7dXsLbGmi+TWW5V+2z4V0C96kh4ho
	DhgpDrM8Bnw66iTI0oYQzM0XzWOyFUUTn3IVekngaxX4qjVEJS9a5NFCf1BDCQOOvA6P
	Dm8Q==
X-Gm-Message-State: APjAAAU15b8Jh+zwH9HgA5rICSYMofstuoL9ZU+SSUz1MToP/sHmTyrA
	tcIUJuFs3Bislib+S4xqJpf3Utv8epY=
X-Google-Smtp-Source: APXvYqwR9J3V2Z/DMerCgzG/tDYyy5mu53lLy9YKrRT20/XKGqlqzoTOlRGfXPi/+b0q6qTj/XdQVQ==
X-Received: by 2002:a17:902:581:: with SMTP id
	f1mr15536435plf.246.1567881030370; 
	Sat, 07 Sep 2019 11:30:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	f23sm9807085pfn.22.2019.09.07.11.30.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 11:30:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Sep 2019 11:30:21 -0700
Message-Id: <20190907183022.6811-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] oeqa: Recognise svlogd as another logger
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
X-List-Received-Date: Sat, 07 Sep 2019 18:30:30 -0000
Content-Transfer-Encoding: 8bit

This is provided by runit which another init system like systemd,
sysvinit, this lets oeqa run on systems which are using runit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/oe_syslog.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index 3a8271a53a..f3c2bedbaf 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -17,7 +17,7 @@ class SyslogTest(OERuntimeTestCase):
         msg = "Failed to execute %s" % self.tc.target_cmds['ps']
         self.assertEqual(status, 0, msg=msg)
         msg = "No syslog daemon process; %s output:\n%s" % (self.tc.target_cmds['ps'], output)
-        hasdaemon = "syslogd" in output or "syslog-ng" in output
+        hasdaemon = "syslogd" in output or "syslog-ng" in output or "svlogd" in output
         self.assertTrue(hasdaemon, msg=msg)
 
 class SyslogTestConfig(OERuntimeTestCase):
-- 
2.23.0


