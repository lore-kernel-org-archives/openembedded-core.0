Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23786.1794820882152764382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 01:21:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=CP6ocJlj;
 spf=pass (domain: snapchat.com, ip: 209.85.128.44, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so18924425e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 01:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1794820880; x=1795425680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nd8ho+XxGAY5O2b3nYLYSoCBwf4cPdLrFeFr+SIOSps=;
        b=CP6ocJljIWLFBjsAIoExz+75CgWj/X+hq7Cuuhclf0MxNgK0khq8O8LqnL00zFR5Tu
         nNpfysw3tdEusLtO6nEuefwVflmrUsCgvQg7nwjhNJN5ukveAV3RoMW/hVBnVPunGaCS
         0+JawEhvDXBw0eyMfX8diTym/8wqgjFjYyEK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820880; x=1795425680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nd8ho+XxGAY5O2b3nYLYSoCBwf4cPdLrFeFr+SIOSps=;
        b=1qFinh9QOXgwQsb52ZFGyENDGk1ThGq+PRSs+t51Hq+TCMvso/BcZrlnG9Z/fz/akZ
         A7iOE4NoDyrOW2oIbAwRECFjluT0AsXgj7k3ZA5tvAnIy7/JGVHAHtHiCtpniLmGwn4S
         p+t59WlOn/xznQqNmHmfkZrDRDgQRP9v1fnAIJjVr3tTj5CEPk3xw29aUaBlt18blYEQ
         EBMcgggC6xfMgP2KseMzRHtnT8FV36K/rARCx2Unl9so8nOveJH68yVBllkxw2tcw7GZ
         7wqlhEqBD4yWWCAZawv+af4seT7Gz5KvIAsi315OWQl9sKSbdah6Aw6HnQ3WIBX/Dp7O
         3ABQ==
X-Gm-Message-State: APuU4Z8NzUwhrJib31ZSWMZ+raFw/gXHaiAJcU9xhgILUlCTM5sRlLe+
	Kfb8qNr9DKjUk7GWHVgbe7RNx5vkaI56vbsA9gENhhsCr/WNe2Ure+6ofa7UAVHNm6LuyWF39C4
	d3t7M2dM=
X-Gm-Gg: AYBFou2ZDXaKnKhSoLMzAdH5lObJQnXFrWxF8/xNlvdOQoCRQev3rX8k7AdD4cJMiKW
	BMKuBSKypbPZWE47BdRMlXEgF/ztp1oZUmgD81LrCA3zedSQy0Z558jLZcuREsGAM6O1HCb4nky
	ugamD8kGA+DGdiY2g0/FnzT6jJRhbz4ruTGAt5y+DeU7NXapP3gFfD1+HZ7nhdntqGTPtPica9H
	sMbMoFR7tVdG5K61sAA3a0azXNNMuLo9J7E+STS2f5hQpkUJCNqlq9giMKBU60b7ownJk9/ZJYl
	UhD6/o3EtAusM8xlvG6gaDfQ5gJ7rbuCu1bZjc9KvnQVJSRZEKw3SFDOcnjtKwoxxqYtz2x5EtZ
	j6hnudgvEzEN7908y1AUe5/uHb3ummZJm+BqvncxPIPZIYE73gB1XSgWjiUctfOI+I33Iy0D7Dl
	OHJVsXg74+YfT3GxF4FE5BPUq2Rw2pbLlg6zD3GJacmDKtxPP3pz9JItZhLF1HtFqQpzBcQG3I4
	UGe2Tbop7B8oTINefKg2XNrp4+rIBL5HVMwWWyjODaIJnafTjW2aO3O6JNTFNxLYwSJT38jhvFU
	NqjC7Ja4M7udqYJPHrzt3fnN++NGEKqFVSSU0cYzuO6HURyX27qLVeDOdk4Bgbhocm6Ktqj+sS4
	rYKO1uSjG9LgGDyQPq/OwFHR3P69s2uC+mflUvbw=
X-Received: by 2002:a05:600c:3d92:b0:4bb:6c01:de81 with SMTP id 5b1f17b1804b1-4bb6c01e02fmr72537175e9.19.1794820879943;
        Mon, 16 Nov 2026 01:21:19 -0800 (PST)
Return-Path: <ecordonnier@snapchat.com>
Received: from localhost.localdomain (80-108-196-96.cable.dynamic.surfer.at. [80.108.196.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm19930812f8f.34.2026.11.16.01.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:21:19 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH 2/2] systemd-conf: stop forwarding journal to syslog by default
Date: Mon, 16 Nov 2026 10:21:03 +0100
Message-ID: <20261116092104.3160433-2-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116092104.3160433-1-ecordonnier@snap.com>
References: <20261116092104.3160433-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 09:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250325
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

ForwardToSyslog=yes was added in 2014 (67ddca4a55) as a stopgap
because systemd 216 stopped forwarding by default and the oeqa tests
then expected a syslog daemon to receive messages. The tests now fall
back to journalctl, so the override is no longer needed.

On images without a syslog daemon, journald still formats and tries to
forward every message to syslog for nothing, wasting CPU. Images running
a syslog daemon that reads /dev/log must now enable ForwardToSyslog
themselves.

AI-Generated: Uses Claude Code (claude-sonnet-5-5)
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-core/systemd/systemd-conf/journald.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-conf/journald.conf b/meta/recipes-core/systemd/systemd-conf/journald.conf
index fd4d969fa7..750fb2f5e8 100644
--- a/meta/recipes-core/systemd/systemd-conf/journald.conf
+++ b/meta/recipes-core/systemd/systemd-conf/journald.conf
@@ -1,3 +1,2 @@
 [Journal]
-ForwardToSyslog=yes
 RuntimeMaxUse=64M
-- 
2.43.0

