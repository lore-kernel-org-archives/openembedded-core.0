Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB9C7D435
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 15:01:26 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z6so2604909wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vHXH9I+rv7dFW+Pn8It3c5Gv4pV6oixDPZICRrFpxj4=;
	b=HQCmNJzzOGqEeV2dFK/6cQa2nEy3491T+ariXHimXsBnygKSRhW2e0sS5AcYsCtiNP
	9NwYl0+M4pGXr/LBuY1YOBDOVfXqjx4g5v0ssLPkF+1pXcwUWrM84xGuoSPlE8ylSylP
	uJ+SAu4Wh2EsoI/HDErpZz04TFF63QVVKeKapCQW/2UfMB0Vy2Hja3GVT4RlRI902R8d
	iR1eLa3aUZsHpFPuJJiF68uX7Tli80z+/oFdidd5Pfac3d6Yv+QOpo1+YzrD2XTsqmBd
	eQQRXJqCGTeFI+qo5wlRa4s/0JalHfPnBaKwg09Tm26TbAIqKBHnezKpbHa83Nujs0Do
	8GOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vHXH9I+rv7dFW+Pn8It3c5Gv4pV6oixDPZICRrFpxj4=;
	b=oMwc9kIm8n/+Ss8+TM+f/R0x0Et8LdMgAYpo5gTmpK4WEKprWzwr3jycGq0EGDZ40Q
	wLybHIfyyiB4bODAcXFaYSsqN1JnjM95zqGgii0k7JPB7nrZWT9rv4qQY94Yl5zgslpM
	q3mMjVigzr/KQVPANLPvDqtSWR2qrTHKwFxNcJVKYHChUxYBMSrcZBm4L2OVQyvC+Ln6
	x0RX7NkPjWPmi2KkWZdtxL5Hk7RM45hRxPH3DLX7Lf4R9T/SJdW2K3yQEQdfwmCgszTG
	3ZD5z485cm5l2YIjg+KOgJpmXmFnDoZEgtD355bIoUWl9PpUPwQU/aRJU5oG65R4nFpQ
	HOsQ==
X-Gm-Message-State: APjAAAUQPi3gUHATPyV6iAH+JjRg8vT94fUpPIIjw9p4XQQcSFjFvEr4
	zrOQOwz8gySBLCoFoFIYNKjG2nCfdSs=
X-Google-Smtp-Source: APXvYqwyqVGX4iYUx+AOeThatmjdjpRYJSM6ISWpDd9FcX2UF88o7SLkdnWsuc2NIzZ+r5ycPWVp3A==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr21268471wmk.133.1554822086734;
	Tue, 09 Apr 2019 08:01:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 4sm16138204wmi.14.2019.04.09.08.01.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 08:01:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2019 16:01:24 +0100
Message-Id: <20190409150124.25842-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] qemurunner: fix typo in variable name
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
X-List-Received-Date: Tue, 09 Apr 2019 15:01:26 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 49020c1e636..1abb2c1b6cb 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -329,7 +329,7 @@ class QemuRunner:
                 self.logger.debug("Target didn't reach login banner in %d seconds (%s)" %
                                   (self.boottime, time.strftime("%D %H:%M:%S")))
             tail = lambda l: "\n".join(l.splitlines()[-25:])
-            bootlog = boolog.decode("utf-8")
+            bootlog = bootlog.decode("utf-8")
             # in case bootlog is empty, use tail qemu log store at self.msg
             lines = tail(bootlog if bootlog else self.msg)
             self.logger.debug("Last 25 lines of text:\n%s" % lines)
-- 
2.11.0


