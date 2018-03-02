Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id F293F7855C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 17:53:02 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id i6-v6so6092207plt.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 09:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=M+168zrK+/v2AD6aVz70b4ulSPoaMENDZ2niI8mPeCU=;
	b=fyXZIEw+6OOBmWfYGY7+D2e7aAILDLj0jyJTxzNvT2puTc27FH2g5cnnSrrNdZdnOy
	Pg+3ensJCxd3KQAbeyM/P/AvU3gqHFJGTC5iL0Ck8oZaQ/vt8GSNW9XOoSZMIV9nZ+tC
	WpjA/cRj6VQcW/zlmXMCmOkk4WlI8Isjnq71tz+1JcR7zM3XaQC5kFLwPGMmQMeJeIKo
	5/5gnzHtr798jBc/ZrXZnuyZlE9BzqtbGnI+nvhWpBxwWXCQ2jqR0qQeX2bO8ZfVSVmj
	cjxbp7/arH33z5x743PqCELnlkyxxEonb7OeiVw7pWWY1XMICqmLDSI1FUrAZNd5Cm9S
	WUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M+168zrK+/v2AD6aVz70b4ulSPoaMENDZ2niI8mPeCU=;
	b=nJdsMAgrNl//hXmG4S9sSBvUavsQjTjJtw4/dZwAivaf1lv/6w+dZa9+zC8QWaEKOM
	js+jH1o0fFlRuU3jr07ni0Yh/ikwXcOh1vOzX8sqGupONCss4rpdjvHLRhay/01s6fAD
	+L0Qgv0A2rVhdoM0IRSs1GbRc3/HO6i0slTVZ8XouUQuSDXFMp55ZExXWoEMsYmnGQC6
	z3BKC/IDR2BMIefqp6CNLHrCMms2RAMMjXEMPY5vYknDHLEIvFVxxg54QV7Wf/+1T+PR
	sdzkqf/+vgrvrrYJTqgASqfC0Z7Ru2VC73qZkSSHTtB7/l2lCri9mDk2/TMciGU6PBQx
	GmjA==
X-Gm-Message-State: APf1xPAVGfKEoWWBC0w7wgf+evAnWSWO070xe0LjjxpZDbXacOlf7UOB
	RfW2lTrmVme9tyIKZxRQOSEwlg==
X-Google-Smtp-Source: AG47ELtDDvIANNp6OXeK/QeOGfZcYEyKr2XPPUr92Je+FoyANGtCgZ70yCv9l4o2d+zdRCvXs/dMxg==
X-Received: by 2002:a17:902:3124:: with SMTP id
	w33-v6mr6086260plb.119.1520013183940; 
	Fri, 02 Mar 2018 09:53:03 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a28sm13329196pfe.70.2018.03.02.09.53.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 09:53:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 09:52:53 -0800
Message-Id: <20180302175256.29044-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH 1/4] bsd-headers: Move next to musl recipes
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
X-List-Received-Date: Fri, 02 Mar 2018 17:53:03 -0000

This helps communicate the dependency a bit better

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/{bsd-headers => musl}/bsd-headers.bb          | 0
 meta/recipes-core/{bsd-headers => musl}/bsd-headers/sys-cdefs.h | 0
 meta/recipes-core/{bsd-headers => musl}/bsd-headers/sys-queue.h | 0
 meta/recipes-core/{bsd-headers => musl}/bsd-headers/sys-tree.h  | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/{bsd-headers => musl}/bsd-headers.bb (100%)
 rename meta/recipes-core/{bsd-headers => musl}/bsd-headers/sys-cdefs.h (100%)
 rename meta/recipes-core/{bsd-headers => musl}/bsd-headers/sys-queue.h (100%)
 rename meta/recipes-core/{bsd-headers => musl}/bsd-headers/sys-tree.h (100%)

diff --git a/meta/recipes-core/bsd-headers/bsd-headers.bb b/meta/recipes-core/musl/bsd-headers.bb
similarity index 100%
rename from meta/recipes-core/bsd-headers/bsd-headers.bb
rename to meta/recipes-core/musl/bsd-headers.bb
diff --git a/meta/recipes-core/bsd-headers/bsd-headers/sys-cdefs.h b/meta/recipes-core/musl/bsd-headers/sys-cdefs.h
similarity index 100%
rename from meta/recipes-core/bsd-headers/bsd-headers/sys-cdefs.h
rename to meta/recipes-core/musl/bsd-headers/sys-cdefs.h
diff --git a/meta/recipes-core/bsd-headers/bsd-headers/sys-queue.h b/meta/recipes-core/musl/bsd-headers/sys-queue.h
similarity index 100%
rename from meta/recipes-core/bsd-headers/bsd-headers/sys-queue.h
rename to meta/recipes-core/musl/bsd-headers/sys-queue.h
diff --git a/meta/recipes-core/bsd-headers/bsd-headers/sys-tree.h b/meta/recipes-core/musl/bsd-headers/sys-tree.h
similarity index 100%
rename from meta/recipes-core/bsd-headers/bsd-headers/sys-tree.h
rename to meta/recipes-core/musl/bsd-headers/sys-tree.h
-- 
2.16.2


