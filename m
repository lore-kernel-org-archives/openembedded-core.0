Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id E9E567D265
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 23:47:48 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z3so27761822wru.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 15:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E6waJ70iNY7e9Z2TBhpUqM6Z9bkVN2MrAaPVxwxXnqQ=;
	b=PWHOIuRRDLMj0L97/Wrqw48U9j5xhwpq2zOmuOEPFT+UFv6pc58b6lYiFtzvsH7wbT
	eazL1MQWkc73f2EYMTyamPBw48uJxc1m6+eYwBHiq2d15Jc0H1JohQ+Pwfk6dS/OPbYQ
	Ja30n8zCwxd/KrBHcfZtKX/rbvAtbJWC5A+Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E6waJ70iNY7e9Z2TBhpUqM6Z9bkVN2MrAaPVxwxXnqQ=;
	b=LF6byPA3DQB1+JJZyyG+0sIMHmGVafOHq/ih9IPA1Yd3CB8O7THy6gnTnucYi2PYCl
	DoFlv5ayMWm4B4Dg60WuiQGb0ARnbLS7eveH9viTgdEtIC8CS3OuhlTsYU5X5pRR7U+1
	ejhxh9zJA2BaQudcQZoEGfLpt5YGm2iscMimHA+0iXLkwlQvB6GKjRZRjJ7VlcNN67UQ
	SrG1TPsZMfO9+5iDfuH/yeGx2jFYoO5Po1bl/iWQD/F/0ySbE3flCI+mgD1HknCvVwCI
	J5LVlSoF5Io+wdox8f9FDLpF1Zgs2H2d+l58yMN4vfsa9JC6FVasdyt8rWqxaxGlYnXQ
	ycPA==
X-Gm-Message-State: APjAAAVJ0/4Pjys3jG+v6VM0Y/gwktfVyR+RetkFmHVIAg9NwAtpJ96t
	OKYtj0dVRNPDUX3KWO2zxv/mijllatU=
X-Google-Smtp-Source: APXvYqznwZcn/9BNJte9OpxmbHw2q6l5YxK6a8Su9ZvYzuCSy6Z534QDRL3na1Wa9/eeTBKXJsZ2OQ==
X-Received: by 2002:a5d:53d1:: with SMTP id a17mr14337606wrw.327.1579477669317;
	Sun, 19 Jan 2020 15:47:49 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b16sm46941859wrj.23.2020.01.19.15.47.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 15:47:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2020 23:47:46 +0000
Message-Id: <20200119234747.3060-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] vim: Add missing xgd-mime inherit
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
X-List-Received-Date: Sun, 19 Jan 2020 23:47:49 -0000
Content-Transfer-Encoding: 8bit

Resolves:
WARNING: vim-8.2-r0 do_package_qa: QA Issue: package contains desktop
file with key 'MimeType' but does not inhert mime-xdg: vim path
'/work/core2-32-poky-linux/vim/8.2-r0/packages-split/vim/usr/share/applications/vim.desktop'

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e0673a7810e..78e3f9528d2 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
 
-inherit autotools-brokensep update-alternatives
+inherit autotools-brokensep update-alternatives mime-xdg
 
 CLEANBROKEN = "1"
 
-- 
2.20.1


