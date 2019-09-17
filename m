Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 199757E712
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 11:40:21 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l11so2789559wrx.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 04:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z81yhXs5JNsfWOdFKdllNO39a/Qi8hNWppFwbLdrABw=;
	b=Ep2DzP/ZqZwHSE3FXkq0Dp/EvssyRHlcDYOGc8xhmXRWS4lY2oOn2lbngpFr25+kZ5
	7a7pZk1xXqpQkuGpVxgbrXwgZG1FZ0boVyM3EW7oHiWFIUhjio2LZVqwm6spReDnl4mz
	Y2NtodvPaC6ZCOiqCDSJ51P6Kf+IscoS4NE/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z81yhXs5JNsfWOdFKdllNO39a/Qi8hNWppFwbLdrABw=;
	b=mtqrlW+rOljeq2ej7gFtFF6wrzVDXY1Vlh9sqC51ps1kwzkFBdhKJlKMAj+Aq2F86R
	5+5I4aVLn/YvddAzB2XSisAy0cbiPXerUY41WNinQa/pgZkhl0jupj0+bYHd9wpEam8K
	33EvC6v2v+/FPZm2TnNIjkfeBPVMIdiCkRwFWaW05PMzNrL2+nQvJ6Gqpm7dCBl4nRLI
	hvhIelz/6bJoHGFqsAbEEWMtFF0mRS0aNumMBHuU9Hpen6c13soxTFFKqA2bVZtWjGGQ
	86m06v4fP7KJ3j8fNICpiIGDv4RPJp4TrNxPhEVQvH/wMfJXoYan+bVIOy1azIuYR24+
	HRVw==
X-Gm-Message-State: APjAAAWmySR0pdVb8OwFIUpvhVYwuyzwWiRzMTbJKZZT9lT+CwyMhSw0
	SkYpm9GJH2+cGMt3VcMfG9t77hczdRd4FA==
X-Google-Smtp-Source: APXvYqz0QZLy2iZm6WqnsS4qMTbKyl7EiEDElBkpEc5Y/Fj+bVsuMHLg8ddFZh1F/8M5iVlUnat5xg==
X-Received: by 2002:adf:e548:: with SMTP id z8mr2598481wrm.324.1568720421356; 
	Tue, 17 Sep 2019 04:40:21 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	33sm3814305wra.41.2019.09.17.04.40.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 04:40:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 12:40:18 +0100
Message-Id: <20190917114018.25921-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] runqemu: Mention snapshot in the help output
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
X-List-Received-Date: Tue, 17 Sep 2019 11:40:22 -0000
Content-Transfer-Encoding: 8bit

This is a useful option but not documented in the help text.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 68ba7dcfb94..1a5aca98ac7 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -73,6 +73,7 @@ of the following environment variables (in any order):
     serial - enable a serial console on /dev/ttyS0
     serialstdio - enable a serial console on the console (regardless of graphics mode)
     slirp - enable user networking, no root privileges is required
+    snapshot - don't write changes to back to images
     kvm - enable KVM when running x86/x86_64 (VT-capable CPU required)
     kvm-vhost - enable KVM with vhost when running x86/x86_64 (VT-capable CPU required)
     publicvnc - enable a VNC server open to all hosts
-- 
2.20.1


