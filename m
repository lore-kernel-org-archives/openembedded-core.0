Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1356C7C75E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 16:04:05 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id v13so10884761wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 08:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hddMQ5OQevFpitr2rrU43WSOIVWPSTc7QMfwj8GzuXw=;
	b=MS6wNT5lm98/Ze0PTCW/Mun+2EOn8OkJg6tu9tihI/1B3Si+JW2rD5hGzII78UJ0NC
	CgKm9lAlr3LMIlQVhxVsYLrS2Keu6I3fxeG8Gbm2cTuzJF4BLDMR1ZX071g2oMsZeg9q
	bCsma2+bDvhp+L/Wdd9IQlK7++iINK+oSvwNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hddMQ5OQevFpitr2rrU43WSOIVWPSTc7QMfwj8GzuXw=;
	b=VU0Cba2MhDap8vY0ZFX5FS3HJPOY19NYtQdZR+Z3NzPo3IodRhB3rRCJ7LDyjx24dK
	RLMtU36yUxR2/yEZ87JclgtEriebebJ+Pw5fQuBgthnfPbjJh7qYGWVEaYLVt7C68VMf
	fSV+UiG7HmLfsiprkasDDX+mY3aPVNLH+EuGkhTjFzCTbadsNWuxIlpbX1vRZ5kENnxR
	h7nGyHP1BTQhhgT8oCDc3ZS7mH4ApcRwtT2e2hE/hOO0xtjxVzWiFz/cqUKPTblJiJnc
	8hR053UJRgsHxN3oki/JDvqffQ+NYCNAugx+mQHfi1hEFuZEZzWvip0LLsfMuengt73V
	hIwg==
X-Gm-Message-State: AHQUAubpMVlWrrwQs9JOFag8zM/v9sPS34Mok2Pg00kGcCmO8llp56wZ
	oiLJFvP+Pyu5FyHc3b7T9hR/vwN/NJU=
X-Google-Smtp-Source: AHgI3Ib8jv96TXJbHHoPYv1h3lZbAW8zv8z3fnHhh+KOmS+596R6jtk7brZ1ps9nFm70bm7uiqIu0A==
X-Received: by 2002:adf:9e0c:: with SMTP id u12mr7265844wre.216.1550246645473; 
	Fri, 15 Feb 2019 08:04:05 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e17sm3810424wrs.79.2019.02.15.08.04.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 08:04:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2019 16:03:53 +0000
Message-Id: <20190215160356.9764-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190215160356.9764-1-richard.purdie@linuxfoundation.org>
References: <20190215160356.9764-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/5] lttng-tools: Upgrade 2.10.5 -> 2.10.6
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
X-List-Received-Date: Fri, 15 Feb 2019 16:04:05 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/{lttng-tools_2.10.5.bb => lttng-tools_2.10.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.10.5.bb => lttng-tools_2.10.6.bb} (97%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
similarity index 97%
rename from meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
index 85ed3c691ba..13bab9068eb 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
@@ -34,8 +34,8 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            "
 
-SRC_URI[md5sum] = "50e07676d5eb5d6cf4ece804863a6f74"
-SRC_URI[sha256sum] = "a4868078ef961e83dc236c4f24fd848161bfa755344b064dece62c4c81a07411"
+SRC_URI[md5sum] = "e88c521b5da6bb48a8187af633336ecc"
+SRC_URI[sha256sum] = "f05df52bbebf8ce88d1b29e9e98cfc957d2ed738a345118018237ebdb581537c"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.20.1


