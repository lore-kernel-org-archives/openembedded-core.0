Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 823547F284
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 20:25:59 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id w22so5314310pfi.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 13:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2sD8QkTwVODnztVOeb6wrUxwXz3La9J8IuUOxATSKto=;
	b=onlVMfP93Rb/4g3KuFHowtxHOusMqTAlxjlq7E+F3hy3GZlgTM9aRJteEEOTsPFlDV
	qGTQiU+cRrH+2w7nPaV5xpM8e9RTs1WukPpQ76Sio7C37VBeOrf1D0glsIvkdoNln9qp
	7PfksMK7pJJfcvvPHYhHDbPusjWZb95w3t7DMdfFkZ6ZgEcPmSR1yEtLK0ILHvPuT5qv
	tkUksMZqJma65jfitFnkcdtY/NrjcNZJM/mWu+ywKSsrJGP1LbKyDwSfA3peWEuTDcXk
	Z+aOc4KHHJ+Syr6JpQ7qp/firgFEcf2khzNt7Q8Y8R3/jo8vzTI76BjR2K75at+oy2ra
	uxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2sD8QkTwVODnztVOeb6wrUxwXz3La9J8IuUOxATSKto=;
	b=sTFZQrkaD8iyk8x4hAfIoEO2ZE1g9s7s4UnEfkIFy0we8+QkblrgFDOcxaZ/Vc6X19
	hpy8l50KEUfE7wppNkKHFAKX7u1Tv443p0xS5R0V6agwXLwG1WjOATE6Mg6VJ+UCjz8C
	ifSmtep10hJdvUmyvXZWqkmAs+5rXLJPT2B3kkmwbYpcLVmXxlVkEyIh0zbGdtmltW8T
	eEEsQi5E4a/JLXWKY1y4uIGlu/bs2jClohIyFWMme3uovtZTbxWVPChuAyaAZUoW7ZUD
	x7hhau0SpM2YZDe837Q2kwgG1sqmHd2r3cExVyNPLON8Elz97nycfdOGMK+k4szQnPvM
	DL7Q==
X-Gm-Message-State: APjAAAVvlj82E8O6ozfSG2CnbkNHx5PFibEryIcwP1Uh0N7POIK0+BnT
	AqaV/hKrdNwq6Iopd2u20/9qy5hJge4=
X-Google-Smtp-Source: APXvYqycVwGolBoI9auTfSeF3nRzyNFngbyKSLKanIt1OrxMbOB72K6ms377m/GerXU0QfpEct6hWQ==
X-Received: by 2002:a62:3c1:: with SMTP id 184mr6936624pfd.209.1567801559813; 
	Fri, 06 Sep 2019 13:25:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	a186sm5945889pge.0.2019.09.06.13.25.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 13:25:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2019 13:25:51 -0700
Message-Id: <20190906202551.10981-1-raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 06 Sep 2019 20:25:59 -0000
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


