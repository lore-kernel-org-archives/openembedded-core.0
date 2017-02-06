Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id AE3ED719B0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:46:28 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 75so9989234pgf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 12:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZC9nRdGo+WZbY9SaMKZYWE8MVrdMLBM+ttZjuwjSG/8=;
	b=NOkWdCUvQfCVLw2tlReT4vdLcFJqYhVccbmW1Vecf+b1jogf3B2LaHdGeqCRmJL6Ro
	DUHbhfQ6Kvvqcs9ZfOkQMMdKFAi/vtrvQhTQoJPg1olVB2G/H49hPkiP/VNTp3RiNR3m
	1a9NBTwd0ywkBqbjfsGIomm+Mns/R6goru6g8XlImSOuL2xtAmS7E6RIPHhw25J+B86S
	eki4PRNnhyCz3IFDinN8CgPWub3WiHAN7Oiz4lOeyWYLcqkcE+G2atn+sFnuId2TFTVd
	Gm8erD8s7s8+xMEYnLTZjTSo6wYsuQwOWnOtVqoMwe63btPWzUgqCePXnuxlU8v9okzs
	/X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZC9nRdGo+WZbY9SaMKZYWE8MVrdMLBM+ttZjuwjSG/8=;
	b=UbJbFKZlSEo1HhgCpH/RvGNrn/GyxwH3cWdU5vRk5XExKVi9KQKIjyb6dOqaAxLA3I
	m5kddGq+da1TZjNeh09pLZClKT7srfmB/Y7li3VTkOVPTehKa+u65sTHFIO2U/QEDwrQ
	rhlVzJTAJ+FXZap/N7AywkaHmmL2/yhtRuaYJr4clwHuIUcMyPv5JPLh0bDz9+DXAhZm
	r7D2mpK3CMsYHf7unxpThgCoa6E7ANIZtX/NVK3XRg1x1NXpPBZ2XX2lw1sgb3Z4iIIk
	u6sjDUPhuIdcGjElHUpTAQRJvRNXL055WvmMPm4nx2GW8LEx1CTnObyD/w9tsoIzsK2P
	m73A==
X-Gm-Message-State: AIkVDXJTAtTjDFT7lcikEfKKqlD1UWz2VZM5hSmVhh7v0TjJoXcSCytd8d7zVA7v2kirWQ==
X-Received: by 10.99.170.70 with SMTP id x6mr15634589pgo.14.1486413989067;
	Mon, 06 Feb 2017 12:46:29 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	l12sm4868386pfj.37.2017.02.06.12.46.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 12:46:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 12:46:13 -0800
Message-Id: <20170206204616.26245-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20170206204616.26245-1-raj.khem@gmail.com>
References: <20170206204616.26245-1-raj.khem@gmail.com>
Subject: [PATCH 2/5] latencytop: Inherit pkgconfig
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
X-List-Received-Date: Mon, 06 Feb 2017 20:46:28 -0000

When pkg-config is not installed on buildhost errors like below pop up

| /bin/sh: 1: pkg-config: not found
| latencytop.c:34:18: fatal error: glib.h: No such file or directory
|  #include <glib.h>
|                   ^
| compilation terminated.
| make: *** [latencytop.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/latencytop/latencytop_0.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
index f31f1bb7ab..bad27b5d6a 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "http://www.latencytop.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://latencytop.c;endline=23;md5=ee9ea9b1415356e5734adad4a87dc7fa"
 
-DEPENDS = "virtual/libintl ncurses glib-2.0"
+inherit pkgconfig
+DEPENDS += "virtual/libintl ncurses glib-2.0"
 
 PR = "r3"
 
-- 
2.11.1


