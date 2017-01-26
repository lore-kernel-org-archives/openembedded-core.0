Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id EAA4D71E43
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:03:08 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r126so50294723wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Biz6w0T6SP7L/4QMLDnc6zav374cpUFCowDBHcW16n4=;
	b=RarMj/8zaJaFPd1zkNcPPqzgIZXyc5iQIEU9IaS18nRVrjeMQeM5COPvNMvo3SrE//
	bs5h5JkGeUsWcAbLjTb+Ryy4IKHaGLAnkTjy8aPjpWSr8UQakzEkdMkRx6wF4FhLWh36
	swudEwkCI4WYXBKy1QHpNvfoDCQ9NZ9R559aqD5Ta2TN1nOvY0T6DDkpakoJf4wSjROD
	37fqgQVn4qU4KjW/7qDysnM+jQl5YkJow9VHPWpa39jd080ST0rTJAC2XzTRapCZ0cb6
	/5pcknFEaSwNJibaEXjmzgVrFvKnxHjh0sBku1IaSCr6+cEYZQCkANzfD77YFXHdqcJp
	Zr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Biz6w0T6SP7L/4QMLDnc6zav374cpUFCowDBHcW16n4=;
	b=JSJ/c/O2060UyiAkvprkV1K61cphjfXXbxp4JiLSJ6/2fskaGI5gLu+Uz/6RdCHrF/
	ZQdY1N4x3OAKqdF+UobLmkPylwprJ0m04rosxr47apEYr2OD2SBiX7ePrYsh3Pqr9kSl
	Md+L3l9OG9H9OVafdlDRB4BOsRfknKA1gvucjCcri/kOHUHTZsPp81eaY5/YRA2cfk+L
	CcWcOw8nyro6sT2VZqeV8x68kY9w38Ws4vWtx7tehV+rJS4ir6/c7Rk7pJLbUYhObKys
	gMeopiTuju3LFwfbSN7dJyGSOE8LTxleuy5WTX7J592mYa/uzIHLEIYuwLICpTO8z40M
	YTSw==
X-Gm-Message-State: AIkVDXJRjmgRy/uz3ssqZd/qtXcAXAxR6G3B6G2mOsWX9zjrZW7EXzBVv69Ne1TScDdvKQ==
X-Received: by 10.28.16.70 with SMTP id 67mr2835170wmq.142.1485435788589;
	Thu, 26 Jan 2017 05:03:08 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.150]) by smtp.gmail.com with ESMTPSA id
	v67sm2455016wrc.45.2017.01.26.05.03.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 05:03:08 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 14:03:00 +0100
Message-Id: <1485435780-1230-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: =?UTF-8?B?W1BBVENI44CAVjJdIG1ldGE6IHJlbW92ZSByZW1haW5pbmcgVHJ1ZSBvcHRpb24gdG8gZ2V0VmFyRmxhZyBjYWxscw==?=
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
X-List-Received-Date: Thu, 26 Jan 2017 13:03:09 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Ming Liu <peter.x.liu@external.atlascopco.com>

This is a complementary fix to commit 2dea9e49:
[ meta: remove True option to getVarFlag calls ]

it intended to remove all True option to getVarFlag calls, but there are
still some remaining.

Search made with the following regex: getVarFlag ?\((.*), True\)

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/lib/oe/data.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 3956733..80bba2b 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -30,7 +30,7 @@ def export2json(d, json_file, expand=True):
             continue
         elif key.startswith("do_"):
             continue
-        elif d.getVarFlag(key, "func", True):
+        elif d.getVarFlag(key, "func"):
             continue
 
         keys2export.append(key)
-- 
1.9.1


