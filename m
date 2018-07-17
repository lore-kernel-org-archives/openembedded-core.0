Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9B71678998
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:22 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id j5-v6so1884875wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=f0NjTiDIOAt0+BVxUFAJMgJuB/bij5rFAV5FBhMkHzs=;
	b=1gUF7hxQzW9FHyt4GrbxjYTh3sgv5sn24DSqVSYfFH51Gx7qZ0IPWQpw/0Kirw3aPO
	6YBd7D5aZdt5ZEIpoJpxor7VIfcw0jhWKw8dO3s0/b3XJdxGG4pdtm5/i8fiKrNaa1S8
	K/jYYnx+4FXj/c1+fGohk+OySnKymgJMBWGBr/fwAobAy+uSMd+YMlFT9Q0ouT1ZgI9t
	ktMgcZHH1KDznMCHmCoSUFkQ3Jkq/5dpz6KbHoNpx4nOqXdTBhVvKQfrk4dRfCeEADcl
	wspevWCN7eQ7Re8mifIlvTQ6j0qp6D+r+W+qrTlv91naa/nlWHVD35pJf6dD687K1WQ6
	QUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=f0NjTiDIOAt0+BVxUFAJMgJuB/bij5rFAV5FBhMkHzs=;
	b=R3DIso1XQt6FlRyQUt4F6E69niUuiQfSe0kud7mpJTkqfcwr1Syw2hSEPIRFGx9Qwj
	ocW6VC3MI7AVi7+PlEdIk/L5K4JJTUk7n6WjHQuyy2zXoi/fHnPaGOz9/2be8aj7+YlV
	nuag8MQ3xwfol2Hp/oMivsp+3sgAo5skWbdx5eAy8ooSeUTXjeR96Y1Fjzq/7dbslqQR
	RD4RtGp+AuovqBkcfwLx7nlZH8Ns3Q/gjWQnrSl2CmOe+vMSnTdFRGuhtapFg4SQct85
	2GyVbz9C7htx4q6r3oQGQozPy1uwseLfLlUtvfP7gjLWKcL6jz5mYjeBFuO2C3GLA0rr
	FQ+w==
X-Gm-Message-State: AOUpUlG1IiKc390XZ1ZNHyyLV91USQPs+EsoP1wwonai+g/afhNdczrR
	g2aTgPmZnWDkXNfVR8/2XkkLZQYj
X-Google-Smtp-Source: AAOMgpcQ4mbxr+dEpNB2Xwu9kqEXNhxZc7SqdgCLhJfib1WnZZuSli6m7hHo/qO0aMWMN0rTf/qLag==
X-Received: by 2002:adf:9546:: with SMTP id
	64-v6mr1875515wrs.257.1531845563059; 
	Tue, 17 Jul 2018 09:39:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:39:02 +0100
Message-Id: <20180717163910.3196-7-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717163910.3196-1-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
Subject: [PATCH 07/15] sysstat: upgrade 11.7.3 -> 11.7.4
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
X-List-Received-Date: Tue, 17 Jul 2018 16:39:22 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-extended/sysstat/{sysstat_11.7.3.bb => sysstat_11.7.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.7.3.bb => sysstat_11.7.4.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.7.3.bb b/meta/recipes-extended/sysstat/sysstat_11.7.4.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_11.7.3.bb
rename to meta/recipes-extended/sysstat/sysstat_11.7.4.bb
index 8c8974827b7..c9b9130e9ff 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.7.3.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.7.4.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "c40cefdc7649c7554ecf1d56bf485d09"
-SRC_URI[sha256sum] = "8ea4ffcce8dae68a1cbb6acaa131ae7e3e6c5765134e670aa9baa38c1bcc66ea"
+SRC_URI[md5sum] = "421f958db80e67a27eda1ff6b8ebcdeb"
+SRC_URI[sha256sum] = "a96265a22784c29888669f961a0896841d177853f8f057efe063e891962b9090"
-- 
2.11.0


