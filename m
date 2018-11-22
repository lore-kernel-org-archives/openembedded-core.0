Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 794D76C616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 16:30:33 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y1so6298841wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 08:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5XKX7UPWTsdJDS74/DzCk/zourYoUbFKi14M9wDsZzQ=;
	b=H5sKCKKeO4WyMDudbqzI6K1zuEUN5PVgnEZtug3CT8usXZtwVnfEdEcd4MQcsDkCtU
	ymmJw2+wm1y4qa8YVnSfHuFwf0UkUAV0hbkICOw58a0PBvJKoJ8JIBlbJBkZXnEeBvFj
	yADR74vbgMcjqsfnqn8c8tZX4AKFCFLIs8GrJNZNI5oJf5k83pPDv9lypcFkH5akVkut
	OWk9Z1BTJXEd832dNK3Crdh3ppopx7SgwzZixGUBoL5nfTNDJll5uZKFUqGKWphrJdjE
	XkHuT/py7wv+rKzKOu8XExNhXpLQ8G5UShIs4118050LgkdFTJ65JB1kDo9QDtqUtM2U
	qFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5XKX7UPWTsdJDS74/DzCk/zourYoUbFKi14M9wDsZzQ=;
	b=acd3XKttPkK/hJw6sqzSoNx/BLgAYdoATBE2bGSXAQQuXI56cgSS3+CbLxiEUvQkFL
	0xi9BeD/bExCGWmEx6K6rHcFCKQ5ruezICEAA32DkthI5KEIsRYS++27ZCJPYs5gNHVL
	DN866vs79RSp4+5o9TQ+SGxrqla26FDbnwdmf3IDCbtzmXzjjx2FC9s8h8Oj3U+vDQRr
	ECIeY/T5n0N5lrr+ZbmBcujzzcWKXAWTZHQFpVBdToWTlxYsmx0fiw7eKG3QMMscTnnz
	FXuNNdmV41b9mv/kDL0eZYr4hGJsWnNmdVZjLBgMH4BNP4S8qU7D8/8gK3ebaHPxU7gB
	/KbQ==
X-Gm-Message-State: AA+aEWZDa9QPgTWFPFAHS/z/KRS4r7pZXxJLvoKgJDdAR5TrXFF6o39k
	G2KWsLYdRapHI0Pd33XcAC3A334s
X-Google-Smtp-Source: AJdET5ezPWL7Y2BhbgDJNMBVdD9IAK8TwVNO1TSqnKQTkRs4xQKGMV7aN7tkR0FylDyclihJ8V37BA==
X-Received: by 2002:a1c:9b84:: with SMTP id d126mr9810719wme.62.1542904233964; 
	Thu, 22 Nov 2018 08:30:33 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c188-v6sm2593682wma.39.2018.11.22.08.30.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 08:30:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 17:30:28 +0100
Message-Id: <20181122163028.122187-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] dmidecode: fix the Upstream-Status in a custom patch
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
X-List-Received-Date: Thu, 22 Nov 2018 16:30:33 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Committing-changes-from-do_unpack_extra.patch          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch b/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch
index c9b19182ddf..ce9d423104b 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch
+++ b/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch
@@ -3,7 +3,7 @@ From: OpenEmbedded <oe.patch@oe>
 Date: Thu, 22 Nov 2018 12:05:04 +0000
 Subject: [PATCH] Do not install to /usr/local
 
-Upstream-Status: Inappropriate
+Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  Makefile | 2 +-
-- 
2.17.1


