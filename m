Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 37C497C4DB
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:34:57 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id q127so27764370pga.4
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=j1zQy3N/aKB07eXNIb7TfqE2gNTIT2AHseKItqLruz8=;
	b=eHoHI5hnOBSWHLP8liBp6jQH2wex3NUOCMNSSewgnFXggQfup+9YDCIUZGXg9bocBT
	qV77Ru112jj55jtU2f4VR32SnTw46plxZdP+SCr4w1xNymDoqH4tCFF3kG6OvZDK7Hr/
	V4RxfcTjMY65tYjr7qB9jt59juaTbsniZKR0pur5V1eIu1G2yjDY6ZQgsHrKZhKw3q1a
	1y31YdKxM9srAAvYsKI9xTJ86pJYV9//qi/TxiP3f5t98PNLBp7+sLQvN94oMyR+FTbs
	3sYHu9jW934OWxfWBs5YkoayrdsM8OGk5oF+e3dq2dCDp4h/bz1+xxEAmrd8PACUCHyu
	h94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=j1zQy3N/aKB07eXNIb7TfqE2gNTIT2AHseKItqLruz8=;
	b=icNQ/bR333sXcaWQZaSGjSn1b/NCLsUOOGgyLWdMEVR6SMn851NCerodJPoXQiMSxV
	KfQ+iO7PWpfhIk9uY7IfbE1U3yEjqpAAfkek4UBr5Eq2qYBNOW9tG/TKuQjbotTmgsq6
	lNI4fqogjdIXmLvqXjThq/pSF97qztS+LsMpXbgKlCp3hw1DNDamdkzS23kbI51n0ROe
	Umr2njdK+G8NwxRdqJIHK7wA/COMhaR16zOWhvqJfc15peKDRkYF8b6g6X0jEkCDqJ/p
	+F4uJ0duN/flWcYmnhOdC0EksrjtJ3xUEw8r6BSpxsoIw4FrHCy+fjji8BD0HMnqP5pK
	AFEw==
X-Gm-Message-State: APjAAAWbPioyKVTQTvlnDCU2laKnlrJ8EsHFcvP39F6vevAOyt7PKdhg
	BOb/T4UANc5dCfaiaCkOkmBtMQoj
X-Google-Smtp-Source: APXvYqyi6+aN3dfB/VkX9k7KmFQWnCWpwbDHDRpGPsJZY++wfbOpGsrdy9GfxqRz/6PfPgfMC8k67A==
X-Received: by 2002:a65:5788:: with SMTP id b8mr113597593pgr.324.1578364498324;
	Mon, 06 Jan 2020 18:34:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.34.57
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:34:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:25 -0800
Message-Id: <bc187434886b918b216b344c5a80d69383dc6773.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 20/28] reproducible_build_simple: inherit podfix
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
X-List-Received-Date: Tue, 07 Jan 2020 02:34:57 -0000

From: Ross Burton <ross.burton@intel.com>

When doing reproducible builds inherit podfix to remove the possibility
of differing Perl versions causing manpages to change.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5dc43edab4787906f2c9f51e51bf78d1dc966286)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/reproducible_build_simple.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/reproducible_build_simple.bbclass b/meta/classes/reproducible_build_simple.bbclass
index 8a60deef3d..d0842f0f90 100644
--- a/meta/classes/reproducible_build_simple.bbclass
+++ b/meta/classes/reproducible_build_simple.bbclass
@@ -8,3 +8,4 @@ export SOURCE_DATE_EPOCH ??= "1520598896"
 
 REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
 
+inherit podfix
-- 
2.17.1


