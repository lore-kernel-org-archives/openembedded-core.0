Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7096DC16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 21:57:14 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id er20so4005025lab.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 13:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nNWgmdVrajBbmsd9x38ojwhapw4U+YRKaHDCyJ9zJTA=;
	b=JUwQ3kc7EQWsnqt0mZFMgZB3BDtH2vde/ReiDGN9j6R60cxwVynzSbqx4Hz9oQNPKc
	exkGXU6bcDKJ/mjAjLZ9N5RCKTmk1GwfpIF250y+QhuCnyy+2VhbnxmODF/qJc8+vDal
	ZpZghAyYnwaE9IYvG9Pevr6eWJI8qrq7veqbCBTBF7I6xA85VOTJemoeN5a/VZEXkqW/
	LAeEaYv0bTUuZvK2MA7gnJ77QxgZ0JciFWaORZRbxxDD8qUeNQN+lGS2Kh1xcfkCJxfp
	5+BJCST2J09d8mDTafWwsGxp3Mb3ZePoYX7IOU0mR9cUFweUTJM4o5xUfRxbaZuVks3Y
	Jxag==
X-Gm-Message-State: ALoCoQkqv9NAI32Oj3PocM5DMwuG+pcqdVmZyXc3WcqVmQrTGFU20SnAhJmq9gC2y/2UmcWQTiKm
X-Received: by 10.152.3.10 with SMTP id 10mr2247490lay.35.1389995835498;
	Fri, 17 Jan 2014 13:57:15 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id bl6sm7612764lbb.5.2014.01.17.13.57.14
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 Jan 2014 13:57:15 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2014 23:57:01 +0200
Message-Id: <1389995824-9066-5-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1389995824-9066-1-git-send-email-fathi.boudra@linaro.org>
References: <1389995824-9066-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCH 4/7] Update SRC_REV to LTP 20140115 release
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
X-List-Received-Date: Fri, 17 Jan 2014 21:57:15 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-extended/ltp/ltp_20140115.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140115.bb
index 73bd808..287f73d 100644
--- a/meta/recipes-extended/ltp/ltp_20140115.bb
+++ b/meta/recipes-extended/ltp/ltp_20140115.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "attr libaio libcap acl openssl"
-SRCREV = "a8c42db5f9314211811c36275a21f83902830dc5"
+SRCREV = "c8b3e28097e7d3208df9daceaf92c25eae87ebf0"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
-- 
1.8.1.2


