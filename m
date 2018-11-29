Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id EDD526D75A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 17:52:30 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id v28so1248077pgk.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 09:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bUW4hvdQfeAHvwEUBtJkDluWPPz+5c5OWMBaYow5D8Y=;
	b=bSOCVX2cAEIosTjyh7P35FwsYR1EbZaPAhbz3gNc5hyfeSP0Foi13uJC2we6ruLOAw
	+nxtrGljEKrhng47IM8qQ/u9gzF8VCLx0rE1CwbTZ+X6mhIYzYxU9fiCDkbvGILjB2Km
	S4z03iAmLBB7D6Oq3ds8e3ztgkPoYxm7wAXTvp0EYyBt+CHD4Y29OaXJ09eMF/mHhxLJ
	8P/CmifP5nsIgmIPxDq7iaOXP2H5CGEPEHATgKfWkGxb+msdj3NSR73wIMP392reFbDw
	ceUoshvCc/zvXskx72RoSgsd6KCYNXe6VBtVO5j5XNrObf5nbeptkFtn74D464QxuDxC
	qdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bUW4hvdQfeAHvwEUBtJkDluWPPz+5c5OWMBaYow5D8Y=;
	b=IQAEzS6LtQyusOoBobUqwCtXnvFn4aEYOzS1dxmIBqTPGOZ0gp4IW+hU973khQhRtt
	6d6re4sjAIb1QHrSb/lWaLboaRLninVfFIy/CBNp5w0eLMSI1zTUlwW4DHn8MeKtv+ru
	IxNizaZi02xpuokeks59251N77rGMy/kY42pH1YTYxEtanBMFjcmZ2dA8WMJeX7Rgq/m
	jM6vasqL9igI+wGE1avCd4T96yZ6R4IwuEeUtDRS/LcAe8gqxK4EQgev4BUkSowXat4Z
	LVx+fNFQwxhaa2WOJutAoilzjzt1Z/E7bUjaMBKszp+0OQmCeg9ZwPyrwvx21vFA60Eo
	0e7w==
X-Gm-Message-State: AA+aEWbGo8N6TCkMEv1n2z1SC3dFiqXKVH6klZFTP9ib+z/khggP+wzQ
	kjf8n//tLKsrXzJOxeYzLOgrLL+GtxQ=
X-Google-Smtp-Source: AFSGD/Uc6O1KNqdnhaSUfwggdpLASR82O2tW7qHD+8yACnv5HAWIXevS8YXBa7KCOw/QTjuiKyAJCw==
X-Received: by 2002:a62:32c4:: with SMTP id y187mr2389981pfy.195.1543513951178;
	Thu, 29 Nov 2018 09:52:31 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	f13sm3568866pfa.132.2018.11.29.09.52.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 09:52:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 09:52:14 -0800
Message-Id: <20181129175214.3041-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH V2] musl: Update to latest trunk
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
X-List-Received-Date: Thu, 29 Nov 2018 17:52:31 -0000
Content-Transfer-Encoding: 8bit

Complete changelogs are here
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=c50985d5c8e316c5c464f352e79eeebfed1121a9..39ef612aa193cc6e954ac5a01574300ccd4b7ef9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: move to latest master ( 3 more commits for regressions )

 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 0d8f8eb2a4..b416ec45bf 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "c50985d5c8e316c5c464f352e79eeebfed1121a9"
+SRCREV = "39ef612aa193cc6e954ac5a01574300ccd4b7ef9"
 
 PV = "1.1.20+git${SRCPV}"
 
-- 
2.19.2


