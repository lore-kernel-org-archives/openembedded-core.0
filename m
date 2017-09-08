Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7677378259
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:13 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id g13so6591062pfm.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RgwR8WjZ3l+Q/ep7jQx8CqMZb1X6rjcEfw9ysysRNwI=;
	b=I2Q2RTJXYjGvADO0F0pojrjfB3tp2CdJL/2v4kpcSEeulQbJ9jH1bxRrDeMreobyqj
	7dsu/QYpzd3WoyvoRkBabzArTqjyG76zxNnMruFcC/9T/waHPdLxf8j3MQAwT7NHQllA
	wDHDDWhntqJRcwdGbrJxDUJ7oB3Ly2F5w3KwNJPmMh8LYHAckxEU2kvEaLEB95GPSBB0
	gtKGr7yNbY8Mf5Ti9wBgWLQXYyZl5xTZv3IDmW4zt4OsW5iapkTAo93UxHTfnnNCy4oR
	bkFagOSGKdm8/70vAf8P5/FDL3PtFYfkf70fUdqY6CADHhr/Pr7ohSjT3JbWkGA04rqn
	C+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RgwR8WjZ3l+Q/ep7jQx8CqMZb1X6rjcEfw9ysysRNwI=;
	b=BlK4G0I8XaGYQfKywBq9Gdxft18zPbo5wGo7N2gEN6iPmW0ufiCVhK1iidUWWAFiEo
	RPGgBYNPHmmSsMJKR8QTTF0ZrapiTH2An1saSUqGsLgFe8mDgfRPbQFfvxR3X7fJR0ak
	5FLFf4GgCKztiGcP5lvlpcgRWtyliYs8AVztOIoyx1QO72+Cbby08vpo77n0DkvOjEv+
	Yr0qBBxBXSGwhwnSgofA4splpZ6FXyp0YT/xRmRWix1920JxOkDTyUESspegONQBbPRt
	BNtfwD51bY8gOhd9wvO/QMJZC5pcUkz+wMs4kWDYZIEHv6jGk/QUpAOu6rKDk3wswELg
	e7AQ==
X-Gm-Message-State: AHPjjUhDjS1bd3kQE4WzfpRZTNiSCx+qSmEzrHHRBBkLoX1u8kRZ8oTB
	NV4TXuaKgTo6B4E0
X-Google-Smtp-Source: ADKCNb7+r2zPTiwgN88zSbD3Ec4Nnokqcwn/8AxpYD4mtS7QkT5P0QBAX6ehlmbMDno1dNqwJTnFmg==
X-Received: by 10.84.164.199 with SMTP id l7mr931075plg.361.1504912935314;
	Fri, 08 Sep 2017 16:22:15 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:14 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:40 -0700
Message-Id: <1504912911-23120-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 04/15] dosfstools: fix SRC_URI
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:14 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
WARNING: Failed to fetch URL ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-2.11.src.tar.gz, attempting MIRRORS if available

And add a HOMEPAGE for it, there is no dosfstools 2.11 on its official
page (but 3.x).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
(cherry picked from commit cba73a598abc396fae4fb582be98fc04cb2a580f)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/dosfstools/dosfstools_2.11.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
index a6a7ddc..c797c2a 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
@@ -2,13 +2,14 @@
 # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 SUMMARY = "DOS FAT Filesystem Utilities"
+HOMEPAGE = "http://daniel-baumann.ch/software/dosfstools/"
 
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mkdosfs/COPYING;md5=cbe67f08d6883bff587f615f0cc81aa8"
 PR = "r5"
 
-SRC_URI = "ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.src.tar.gz/407d405ade410f7597d364ab5dc8c9f6/${BP}.src.tar.gz \
            file://mkdosfs-bootcode.patch \
            file://mkdosfs-dir.patch \
            file://alignment_hack.patch \
-- 
1.9.1


