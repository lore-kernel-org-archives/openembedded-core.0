Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1E142600E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 14:55:04 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id b5so19710836iti.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 06:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LWP8bCPFM6nTXeZYvybPkVdOxihs29BGdo82RpO5tPQ=;
	b=dyYAqmbLiKGdYQz/7D+I8D2iZI5jIAHmYFfvlWvAOxyX/hLF32eqh9aOw28mUb9iHq
	MZxQOy14mQSCFBW0gTbbMxv3Rvy9Kddjbp1STIJldjycz+aOU3O8X5dRe33J+pRwqNqy
	I8dpgOlNt8Y+TKhoAreWnbIwVsp0X7hQm5gzqEE4S+obz4XVnAZegAE7QEra7EH4ztn8
	pL8cAbAH/QWRhdot5FW/1DBERQiceLjyrwJrUfC52lhBgbBOxCUqSDLz2FNbsRbSG+Uh
	IwmKpAFIqO91CkOyEDhkV1niiLBTeVuV1NYBlPpvP0vbkEelNWlWNc7K+Trjq2dfo0Eh
	3cEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LWP8bCPFM6nTXeZYvybPkVdOxihs29BGdo82RpO5tPQ=;
	b=lWuHMYYjdOcDJk3gcxYDTNg0cxGoW2KYROiD7IKPrfNSq1DYX4NRldF8CCDYPS6hRm
	yHgO+Ajva2gB6IWoQtnw5zzqB4ZcQgMwENydPd2hvQ2oOI6DaXDSNC7pgzFKnU3TwuyH
	lm/Z5C12AtvxKJOomK2wUyjpZ+hYAJZhXUxz6NVYBgwl0q75t4YdQjhLTYMgr3EYHJHn
	4cFPTbL9G3Hn/qqPMuqfX8U9dUYMoC2/YuRVFx8uqa8xAMQBNksM5D55Zu6Bwnm1XSmq
	FHCA8SUaf0hnG/+IAYa7eU7j45iio08XWWKbZmgGsVYcsPTQtQVATS1Mwuy0KeqnyOmB
	Vu4Q==
X-Gm-Message-State: AHQUAuaUTvgEqUPep0XiYWj8kZJ0sNTIKMoDlRAI7EVVBh6Pfn82329Q
	6ZU2F0WcZPooy5xdi2xNQtJyKi2DZj4=
X-Google-Smtp-Source: ALg8bN6YpSpxVsVV7QrtS2+7KtXlvD3yf1lY8GvF8CPmhoH7BwfRZH6lGxqEGA9fWxgl2R0HXg3Rgw==
X-Received: by 2002:a24:d902:: with SMTP id p2mr4835890itg.112.1548687304216; 
	Mon, 28 Jan 2019 06:55:04 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	u9sm13219320iol.77.2019.01.28.06.55.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 Jan 2019 06:55:03 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 08:55:00 -0600
Message-Id: <20190128145500.31004-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] classes/icecc: Add ICECC_REMOTE_CPP variable
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
X-List-Received-Date: Mon, 28 Jan 2019 14:55:04 -0000
Content-Transfer-Encoding: 8bit

Newer versions of Icecream (1.2) add support for remotely pre-processing
files, controllable with the ICECC_REMOTE_CPP environment variable.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 0d6ee55c15c..aebcc446679 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -34,6 +34,7 @@ BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_USER_PACKAGE_
     ICECC_DEBUG ICECC_LOGFILE ICECC_REPEAT_RATE ICECC_PREFERRED_HOST \
     ICECC_CLANG_REMOTE_CPP ICECC_IGNORE_UNVERIFIED ICECC_TEST_SOCKET \
     ICECC_ENV_DEBUG ICECC_SYSTEM_PACKAGE_BL ICECC_SYSTEM_CLASS_BL \
+    ICECC_REMOTE_CPP \
     "
 
 ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
@@ -56,6 +57,8 @@ ICECC_ENV_VERSION = "2"
 # See: https://github.com/icecc/icecream/issues/190
 export ICECC_CARET_WORKAROUND ??= "0"
 
+export ICECC_REMOTE_CPP ??= "1"
+
 ICECC_CFLAGS = ""
 CFLAGS += "${ICECC_CFLAGS}"
 CXXFLAGS += "${ICECC_CFLAGS}"
-- 
2.20.1


