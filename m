Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5537D90B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:05 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id z24so2544167wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FZq4e2RnJMXU5ltqerhp8qfCVj2LUP8Fdf+4WAuGWV8=;
	b=hsPx+nwOyRLtuYRr0bWCWUFG6b4KFbcks99imm+9xvP+2C0CAOyGZ300F6xct7O2Aa
	1rCRJDT+9m3ox5J3SB+dnqPJawTn74QRLPFktRZFuXmXQ5YZ2OqDpCJV/iIgFwq1uhah
	7dEXDJMTaoWNTBSo8WkWFG2N7DaZFG5UffiCCY+WCvJfT99dPprS2u9GBFbOatDkgtTu
	bp5XxeALgAyzHijXB9S/UDjoiLcJqsIYKB3nS82GtLlsEMfuuNvGY2CxVNe1m8ydyc0T
	nOCPEpQtVSIrpqTVWeJf5onDgS1AOEqhXBZi5fWNEj61QTkzMt7RsYtaFuzngFbaYAq7
	Ww3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FZq4e2RnJMXU5ltqerhp8qfCVj2LUP8Fdf+4WAuGWV8=;
	b=WH85i9kD5jwSo1ltWstFy5Aey5skIVjsh/xYXGV0nvFjBGVJnbw5x5J4UK/MTNnGgS
	QsE0M8f94nPoJO4AwbCqWY5joezuMEPCRgT+Y9QNr430wRr+zQZTAXPkvtis2BXr36B2
	Ugxms2qbVLf6+BC0+82Gb8sWuZbqSIMXmZoGPhW+KCvpkccplj15mV8T3WmkYo2CMioH
	ZYNmfUeciz4DZMVNkFc1IZcH3+wt6VP6U41i5bHxbEGMMuiTIUzoXi3ido20L4PoQ7NH
	pssVQaDGlGmRrttXTJbnNekxc8ARrL6eMe4nVfO+RyseB1dVfw2+xGsevzZb/7hEQRmh
	pTjg==
X-Gm-Message-State: APjAAAVXGvN1NrNRcSUnl5PzYMRD9hQcsqFNP8pkhpzwIjfOwvUdt2lv
	Qm00zYk0ws3iR5njYefjTb63a7lJ0kQ=
X-Google-Smtp-Source: APXvYqxrDn7Rng64+j2Amsj2T6YTVrpov3VQ+tiLIY01amBFGwsz/Tz9lpUEy488tNKnPK+aM3fIeA==
X-Received: by 2002:a1c:9d8f:: with SMTP id g137mr2936583wme.26.1554901925775; 
	Wed, 10 Apr 2019 06:12:05 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:23 +0530
Message-Id: <cd3c467b9419238494e8c525e86be0cf85321c4e.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 04/33] oeqa/manual/bsp-qemu.json: Update for QEMU_USE_KVM
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:05 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Now QEMU_USE_KVM can only be boolean, can not contain MACHINE any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-qemu.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-qemu.json b/meta/lib/oeqa/manual/bsp-qemu.json
index 1260af4..cf51b6a 100644
--- a/meta/lib/oeqa/manual/bsp-qemu.json
+++ b/meta/lib/oeqa/manual/bsp-qemu.json
@@ -10,7 +10,7 @@
       ],
       "execution": {
         "1": {
-          "action": "Build a kernel with KVM enabled  \n\nIn Local.conf add  \n\nQEMU_USE_KVM = \"${@ 'intel-corei7-64 intel-core2-32 qemux86 qemux86-64' if os.access('/dev/kvm', os.R_OK|os.W_OK) else '' }\"  \n\n ",
+          "action": "Build a kernel with KVM enabled  \n\nIn Local.conf add  \n\nQEMU_USE_KVM = \"${@ '1' if os.access('/dev/kvm', os.R_OK|os.W_OK) else '0' }\"  \n\n ",
           "expected_results": ""
         },
         "2": {
@@ -219,4 +219,4 @@
       "summary": "check_bash_in_image"
     }
   }
-]
\ No newline at end of file
+]
-- 
2.7.4


