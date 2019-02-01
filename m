Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9488560800
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 06:12:31 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id u18so2654125plq.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 22:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G2J7wMvW8by+SWfdRqktgyNCQ/XpyyrhXIjWLsnhjBc=;
	b=WlEE2CtNqesLynk3MdGm0Z+qWGCoEFWFqbyTwA5y3IseIqm46XrZSD2khQnXgMgVXo
	XnRC0OuRDySvYu29/SVeb9wRVwX1AiF2LVID8nedfWj+/KRkAncrL791EYejv3GOQuWv
	h+yh4AgpYZjv3uNYUcm2y1avpWZZJAHqSmvBEwJxY2FtVPexPo9zrln8W0uo9oAwIrki
	kC4ufHyIS3MaV0vDf+fyWX8H/vJGQO5BjZiKt75knh84llVCcAjJAfccKfo4TB0VMy3k
	LmcUjy17Jw/RXajW/SigdusM0M0gClrPng2TsLNKbc9tqAdzc1Le5Vi9Z0inQJn6SgHS
	0Pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G2J7wMvW8by+SWfdRqktgyNCQ/XpyyrhXIjWLsnhjBc=;
	b=q4EMmAJ+WSisdt60vuNlJRZkXE8DbDfERcqD2ckR2XMBP5zNAFBs6dCqFtEiaWvwLX
	oGSqth95zuudA4MK9VrMy8cBjsCEaung9olCEy8Dj61CozWi9iXeTGvZkQoho5GU15AO
	WoQZgnMxAO3X9U4GOs297L7AmGQ2add6d+VB5EnaAFrh6rrkr/3wHwWXI2+Fh8DXdQrh
	Et3ZuRB95xPPyGeyCJtaUeLmOZDGV0UZSUXsyxKMyox51mEusyqIVM/SvzagnvWAm58i
	3k4ruoijsmNAJUAc7yCZNvghefGTNMpE4nvwKw9K3zEj9gRaMIe9ru+ZXpC1hp19Ak2l
	znvg==
X-Gm-Message-State: AJcUukecXzaNp12VERbPe6S1YxxeHUew3lpj7sNpNwTXrNozVHcdjDTF
	wAETKoILQwiDlHT5WCwKvHNFiqZ8
X-Google-Smtp-Source: ALg8bN6K37Fn8dmY3JoF7U647CKq4WFw8T278Eswc2+sZHa1pay+FVwOhMxaiOh+qigRqKUfDwAwrA==
X-Received: by 2002:a17:902:b20e:: with SMTP id
	t14mr38242028plr.128.1549001551913; 
	Thu, 31 Jan 2019 22:12:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5276])
	by smtp.gmail.com with ESMTPSA id
	24sm13018213pfr.75.2019.01.31.22.12.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 22:12:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2019 22:12:22 -0800
Message-Id: <20190201061222.28993-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] glibc-collateral: Update PV to 2.29
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
X-List-Received-Date: Fri, 01 Feb 2019 06:12:31 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-collateral.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index b370df314f..3379270566 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -21,4 +21,4 @@ do_install[depends] += "virtual/${MLPREFIX}libc:do_stash_locale"
 
 COMPATIBLE_HOST_libc-musl_class-target = "null"
 
-PV = "2.28.9000"
+PV = "2.29"
-- 
2.20.1


