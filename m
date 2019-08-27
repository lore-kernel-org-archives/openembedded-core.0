Return-Path: <janklare@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id AFDDD79B57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 14:35:18 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id k2so19079749wrq.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 07:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yD0fxtGgr8UdEUTyMIe96KSKOrkS6XpJgkeaBQoe6Tk=;
	b=Kga8f70Yl5DHR7DVxfOJowm+G6crmunkDbgxpJEQqxAuThUlzVw2a5AtGe+Q0mzF0s
	bLkME2eAyZCdnysohOIztUZMb9O6mjJsRaf/MPeNb/qPxfYRs+z1EZXhUN7ZgsmmPjye
	p+HKXFzibYYkLIePzIjqjFvSTFXIRPv8B4vh4gy8sFx2p1+0uRrYhSOiD53L2z3XbPQm
	FKyubga1Cfqz1BvcLF9x5ItAp8j1LvWB5vk6lFw+/YtP5e0WRZsWBTyqo8bEOY7vFysd
	R+lLaCckQDlWxzkGKvo+0HhMWroP6K3WJSyQ+uHMCQWqvZ61EAuy1hvDup04C9f9pLk0
	qbCg==
X-Gm-Message-State: APjAAAVKqTz47SHDCgo3i+P86OVC1vApilD09NnIRrEU9E/VRXKZGMI1
	49Z82FaYNC/IbLfnof0+2MCqcLlq
X-Google-Smtp-Source: APXvYqxa0nV/31hFwUOpgGAIQn066Xvq59fm47f/qK/XKY9z6si5u11m3iYBRQiw9qC2dqT35TRUiQ==
X-Received: by 2002:a5d:42c1:: with SMTP id t1mr29301082wrr.344.1566916519169; 
	Tue, 27 Aug 2019 07:35:19 -0700 (PDT)
Received: from localhost.localdomain ([185.27.182.30])
	by smtp.gmail.com with ESMTPSA id
	g14sm26799465wrb.38.2019.08.27.07.35.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Aug 2019 07:35:18 -0700 (PDT)
From: Jan Klare <jan.klare@bisdn.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 16:35:04 +0200
Message-Id: <20190827143504.32479-1-jan.klare@bisdn.de>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [warrior][PATCH v2] update SRCREV for systemd v241-stable branch to latest
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
X-List-Received-Date: Tue, 27 Aug 2019 14:35:19 -0000
Content-Transfer-Encoding: 8bit

This update allows to pull in the latest backports that have been
applied to systemd v241-stable

Signed-off-by: Jan Klare <jan.klare@bisdn.de>
---
 meta/recipes-core/systemd/systemd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 5bd88ed6ed..2b9c291959 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "c1f8ff8d0de7e303b8004b02a0a47d4cc103a7f8"
+SRCREV = "511646b8ac5c82f210b16920044465756913d238"
 SRCBRANCH = "v241-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
-- 
2.20.1 (Apple Git-117)


