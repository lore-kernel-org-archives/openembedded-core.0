Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 99E6A6093E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 13:13:52 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id f14so8212086wre.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 06:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PE/JAdkkV2jqcWe6X+s57jIKK29n/6pW5aI0V+zy7s8=;
	b=VM+EnWLGEy4EcRR6JfBgPmunAaB5wWBFeCDfqZS7ugkl197Jz0drVNe76AiK8Dui7O
	u9fnoP28QFudDm9yVFS4n3+Qogbae/YRWeRzfiHDxXi9ZrH8JwRPC2YmMEusIf14OqoI
	MJEOOtZK4lPAItMoOvpvPOW3q+G1IYSznEo0kQoiGXTlHonhOWXRKtCCmRQIDnMXSNL5
	bqDKk1X2oINBZO2OcOIa3V/Pn+OAcYNrSC1Czwrz2A9wbiLFCc+HZVeHBdlG36WJsGEs
	jnO/s1uHhaRjvTlh9rP8DxLGp9vxYVBwG4qyqG3EKJNcmYsyTYACeRiDs9xZDZxHOfx9
	fEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PE/JAdkkV2jqcWe6X+s57jIKK29n/6pW5aI0V+zy7s8=;
	b=MKlcq4r9At2EXXlkMwCbIl/DboqapnoImC2RgZ0dQucSWn0s29pgFkxUXeV3Kl8sy9
	anTmrOX35JOOu+xnmdm6chB0tFBC1dcB/HzlBT8PnmZn/aaF77bEwoSF1wz1kkS5Ri9B
	NTPBlNwPflrZRnh0stgAp7WbwwebDDWkFJXalqmj2ETl0JxDBcrZmLGpwWJj/w9eHbvA
	68Klra+wiBWWMwb+lzkxbY3x1BQQIap+fVz7iz12J6aEZYOKzZcKyvAsCve4aSN7K6AB
	dBASkGS9KG/zbdP99Y+bHOaJsMStC1Ik5006ft4ukZCLi5n7AcmpFTjc2TQGXWF9uI/A
	ZNig==
X-Gm-Message-State: AElRT7FpqQ0U3vokAaCBv83lUmYzdk8OMnW6HBDnRHqEl/qRKgXHnOXE
	VZiTvLGg3JZ7BO1VAj3c18WmTrnX
X-Google-Smtp-Source: AG47ELtQgtPHnqcAG5WdX7m4m3ZRjCZ+fXgbtkvvmwRQd8CR97YWMIkKNGyAd6esteD+cGkAX1fiGg==
X-Received: by 10.223.178.228 with SMTP id g91mr7207047wrd.157.1521119633203; 
	Thu, 15 Mar 2018 06:13:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	u89sm3964882wma.10.2018.03.15.06.13.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Mar 2018 06:13:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 13:13:50 +0000
Message-Id: <20180315131350.12270-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] buildperf: measure the size of core-image-sato rootfs
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
X-List-Received-Date: Thu, 15 Mar 2018 13:13:52 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/buildperf/test_basic.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index a19089a6ed2..6d6b01b04b4 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -15,8 +15,7 @@ import shutil
 
 import oe.path
 from oeqa.buildperf import BuildPerfTestCase
-from oeqa.utils.commands import get_bb_vars
-
+from oeqa.utils.commands import get_bb_var, get_bb_vars
 
 class Test1P1(BuildPerfTestCase):
     build_target = 'core-image-sato'
@@ -30,6 +29,7 @@ class Test1P1(BuildPerfTestCase):
         self.measure_cmd_resources(['bitbake', self.build_target], 'build',
                                    'bitbake ' + self.build_target, save_bs=True)
         self.measure_disk_usage(self.bb_vars['TMPDIR'], 'tmpdir', 'tmpdir')
+        self.measure_disk_usage(get_bb_var("IMAGE_ROOTFS", self.build_target), 'rootfs', 'rootfs', True)
 
 
 class Test1P2(BuildPerfTestCase):
-- 
2.11.0


