Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 037487623F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:05:47 +0000 (UTC)
Received: by wicgb10 with SMTP id gb10so3364753wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kkhcCUSA/7gXJVcmpem6DJwKjj+vwNsKCRRXvoPgsjc=;
	b=cvhwmX45llJ2b8VBOOAASWgcNuhKHwLZCPmBRIhbRi508gKenEypAIKGLgJxbvyj/D
	ffA0qxJ8Dr0a7gjlucQ8XAat/Yn4jDQKYYJDPPTBSax3XG8q7dhntGbjTuuVtSqU3H22
	2nr9NwtNRfyA1rdZLStadgUzHeohb2PVU+9RkmnCtCBpWzoYkhl7rVi8IkKqnfNdcG/1
	Ah2y/GBA2umqWF5CkeJcCp6GC3p08B4PYqcO7xsp7eMkhaAT++PFnV3ECprcfWqilQy3
	G8RLjdBtMvkAzR6tMJoASjG7GtHEkyQHVkPXFdAq2ZVQN4BV9nbkumC5gw5Djg885XDA
	V32Q==
X-Gm-Message-State: ALoCoQm8FklPhJjg6rovCVW1FU0GvFGgT0FuH/gZINfb9cYGO+xDtu8q8s7T+4yIMp3JqFjN/wHu
X-Received: by 10.194.203.3 with SMTP id km3mr19164396wjc.114.1437689147677;
	Thu, 23 Jul 2015 15:05:47 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w8sm9479436wja.15.2015.07.23.15.05.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jul 2015 15:05:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 22:59:50 +0100
Message-Id: <1437688790-31620-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437688790-31620-1-git-send-email-ross.burton@intel.com>
References: <1437688790-31620-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/5] oeqa/qemurunner: don't assume hostname starts with qemu
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
X-List-Received-Date: Thu, 23 Jul 2015 22:05:49 -0000

It's possible to customise the hostname trivially so don't assume that the
hostname hasn't been configured.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index a15990e..59c9934 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -137,7 +137,7 @@ class QemuRunner:
                         if data:
                             self.log(data)
                             self.bootlog += data
-                            if re.search("qemu.* login:", self.bootlog):
+                            if re.search(".* login:", self.bootlog):
                                 stopread = True
                                 reachedlogin = True
                                 logging.info("Reached login banner")
-- 
2.1.4


