Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3637E1FC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 22:59:41 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id q5so3985467pfg.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 15:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CzkvTx96Lp5+ZbLD3VXUHOMiXP/W9UHfhE9zSSAJSAo=;
	b=n9uQKd9IqyUKfBx0ndEDt23CAIQGrqMRBdlxEnpVUrfH8aRhXNywyted91YM4wpc0L
	pZQv3A0lerjnLVubxoyV1t6j0r4CXBxl4113EZk7M9k92iDPDjCjo55kI7KbM0PvhIjI
	RPYWjC0Q3s319YSqKN+BnSJNk/V2sIezsv+UPYBptqDXI9JlmAl4kwVPja0A5z4JDomI
	6JY21YH5Zif2RBQnxguh/JGWQUUxUNdn4jE1cjWu+cRc8a6Te/hjQD+v5umIf/+KWQfI
	Rg6JQNxPC25hygiuZS16kx6GqsPJRwrUDYXdbvkRrCcmS9qRod3yIrvstL0fSmmHznGa
	CkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CzkvTx96Lp5+ZbLD3VXUHOMiXP/W9UHfhE9zSSAJSAo=;
	b=OkFfzIp4axw2mMnY9Fh44uTSRYKIVrFU0V5KHsIQBEoeJz0eZMPk/vqS+GaUBl5/h3
	tpAIlcszIIwzWoQRHuebk6ZsNtlnHBD06OrEnmXmx+lQjElXe7mw0p1MxA0zi2Rr2/D9
	OgG8aVcCj1RdMd1K8Qnn46fECjON9Oagbfs864yS2pRJriGcIfXxJr2pZ4z0RboYKarx
	FEnk2jKMfVtrYEY6cybcxw55LCtxjxkaEwVhq6zDmujGGRBdOvy8/FMOgPM9ugS2ZpYb
	6z7gLQwgsmNRvOcz4FR5Nuq/sasyw1SQjA9kxJcGy3UzCqCm7lRmODpa8Z49dRMqEEQH
	6a1Q==
X-Gm-Message-State: APjAAAUqPEA2nFbElZHDXWhZ98J1Hz9YWyDNlJPVkDsLIeOK2zGnuq75
	3HNmsx4J9SandPzAq3U61Ph57iIpqlE=
X-Google-Smtp-Source: APXvYqzcX29FrcYMu1ybNFPcFc/1aLZhe0AtoXLmpJIa4mLGbnOMXCpZj3fMd0QsvKxjFd7/dAJoNQ==
X-Received: by 2002:a17:90a:b013:: with SMTP id
	x19mr1873135pjq.58.1567551581977; 
	Tue, 03 Sep 2019 15:59:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	e189sm21655883pgc.15.2019.09.03.15.59.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 15:59:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 15:59:32 -0700
Message-Id: <20190903225932.36646-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] musl: Update to latest master
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
X-List-Received-Date: Tue, 03 Sep 2019 22:59:41 -0000
Content-Transfer-Encoding: 8bit

sys/user.h related API fixed on ppc/ppc64

Detailed log [1]

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=29e8737f81ccc9fbadcf61a75318aa3d0516aafa..6ad514e4e278f0c3b18eb2db1d45638c9af1c07f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 64aee6c448..9341bf5d58 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "29e8737f81ccc9fbadcf61a75318aa3d0516aafa"
+SRCREV = "6ad514e4e278f0c3b18eb2db1d45638c9af1c07f"
 
 BASEVER = "1.1.23"
 
-- 
2.23.0


