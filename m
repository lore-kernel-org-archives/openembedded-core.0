Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id AC0DE7F9F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:14:58 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p17so3626298wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=leGr8EPJCmpVL3HJ/RD4VBIHT1SzOWJjQYbQvtwVu94=;
	b=V6Q4tgBdiwTbWRdDhnKxIimDq+ENz/6Q1QkInWhoMuoy1EKFQrtnk9dzpCG2LTlEnZ
	5kFbotO6jDlbEK+3rx3Co3gwjLra0qGQNdokDMeuBm6DiKbnHag+oIGhIKQZ/k4F+jQ6
	/soZ6739GFfvkGgRHEbzf6EH0D1DSionie2bnV3OVwzghZ9oiF3ElCsPyDtbXaceyf6J
	ewyFFdZRyvH2k4WBUIB9XezWudRg55nBhU/fyB72xqfntT2lWs+XRdzCFNXwnsGDJs2t
	yHj1R9f0d5Bu1gra/0x7KrcutOpS7HBUF1XSex4QoC6GO5jhN6RYAVLcZI/AVVlmYHJ5
	lR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=leGr8EPJCmpVL3HJ/RD4VBIHT1SzOWJjQYbQvtwVu94=;
	b=TmG7Z/PTAMEo9vDhYPH4pYBizYiOjhRCF0vKIv3FoubdeZL09kzlu8z+t97BpkApC9
	rIZzgQKMXWUEyPs6zbhWSFzvhOmIQQNcHwdZqda1+BO8VmRTrxkULww+FMYTuh/vJVQ7
	9VNVEUZFDGisCFddqkzn4hDDhbvg3JJCM/W+5BC6xiVpkac7SdHtoAZqqfOZqruePcY6
	Y6CH12W31ZULOHasxHVOi+zwwaf+xR8+FLUSIjQgz1/RxlZFowjCkZHptYt443+K91Oz
	X3DdQE4WXdOv+sx6lv5htzKhsCtr0P4L3SCHQBtPcpQs91en9KKa7M6bqTkJ2ptLdRcj
	l+QA==
X-Gm-Message-State: APjAAAXLFD8l6sHN/LFUu3CMoh6LW0jocAtjdRsnLvnrMtKX+XWP2UAP
	8bRFhc1o0X/c/aCCTH77ZpFPP5Z2
X-Google-Smtp-Source: APXvYqzmLZvqUnn5k/+J1L/ypxOxd2EcZKbircM4kwmokdcH7y71j8psnmBHfEq6vplu2lHXiV+BVw==
X-Received: by 2002:a1c:5401:: with SMTP id i1mr7760671wmb.99.1576174499128;
	Thu, 12 Dec 2019 10:14:59 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.14.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:14:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:22 +0100
Message-Id: <20191212181436.1322-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 16/30] bluez5: disable debug output in ptests
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
X-List-Received-Date: Thu, 12 Dec 2019 18:14:58 -0000

This makes the log very large and breaks the ptest result
parser.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/run-ptest b/meta/recipes-connectivity/bluez5/bluez5/run-ptest
index 21df00c3277..0335e68e489 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/run-ptest
+++ b/meta/recipes-connectivity/bluez5/bluez5/run-ptest
@@ -6,7 +6,7 @@ failed=0
 all=0
 
 for f in test-*; do
-    "./$f"
+    "./$f" -q
     case "$?" in
         0)
             echo "PASS: $f"
-- 
2.17.1


