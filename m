Return-Path: <>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id B577D7FA71
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 14:04:43 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 6so4379601wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+XuDKFsQZK7CLhLNwn+62FnsA4HPIY9MD2F7O83DGzA=;
	b=IHC/lGyYsHqjIPlyRKDSs/TzpsUEeRncwQTLLphi2/jOCgOkuw1cT8+90SpfsG/JTS
	YFc8WiQTqyAXIa0YeXjp1cgZ39EdKZsRGtPoZajLmaoyzbjph9Qbw5NgB+DBd72yNg1V
	dA2RKzIMBmpCpIzWdHuIzGguALTF1V/dkWz3PIkC2dMzDEJktjsSikpd94K4jRkCHsoD
	HGFYfZ24gl9mVNDFqKGwiBZc5qI/j77XTdxGAv76CJ5JN8BhT83uAk6ze09Ag48eb7DF
	mo/KirKY2sW+K0aXl1ATZXv2fV265Af3nGhrVssFOxlDKH7gtUffRZvdEzRhIW5DUlnG
	2vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+XuDKFsQZK7CLhLNwn+62FnsA4HPIY9MD2F7O83DGzA=;
	b=SYObF8fthC6nlIqSCEK/fvZ2wiOBWWOReS29Vxx23ljuyGSQ8q9EBjVk2HJ6kmWJcc
	0bP2sAMUhPhoK2NBo/DDjVYzgsMxrUjkXTCivejyf9fQJackawIUdFJc0ly8RZ7sE+ZR
	Wqt3HAQNhGaCwEIAlHD4vtztJeZ5GFSjYDovWaBRqJHGF1T5e2lloxPogZ3bJnwSI4H3
	KSfJviIviDM2X9HqCLHPBx44owDLnY03Cw2Gqtorey8MS2VXQbDW1+m2Sx2dLmxKEx6J
	uditl3IkzkjgIvydKN5EqHdjGofsNMxUlk1+0AqcTfvfluM3IU1F9v7k/fuyzuXFn231
	sqcw==
X-Gm-Message-State: APjAAAXNi+KrJXtMJsjaOSIvRisONPOQWJlNe7mm6Jc6A9qKmucqt9bg
	NGN5paN0G+xyKbdL/IHmRzczv/rW
X-Google-Smtp-Source: APXvYqwD+jKmBB013UYH2EDHpd1fVW9sxm43atalO4IqQVA4Sx+V0I9zr4Hei7uOLvry3GZCs1UMpw==
X-Received: by 2002:a7b:c10f:: with SMTP id w15mr3681500wmi.171.1572012284187; 
	Fri, 25 Oct 2019 07:04:44 -0700 (PDT)
Received: from localhost.localdomain ([117.55.204.18])
	by smtp.gmail.com with ESMTPSA id l6sm2185417wmg.2.2019.10.25.07.04.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 07:04:43 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 18:34:28 +0430
Message-Id: <20191025140430.77773-3-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
In-Reply-To: <20191025140430.77773-1-alexander.j.kube@gmail.com>
References: <20191025140430.77773-1-alexander.j.kube@gmail.com>
Subject: [PATCH v5 3/4] go: Change default GOVERSION to 1.13
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
X-List-Received-Date: Fri, 25 Oct 2019 14:04:44 -0000

From: Alex Kube <alexander.j.kube@gmail.com>

Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4a23c50631..c6c4cf7ce0 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= "8.3%"
 GLIBCVERSION ?= "2.30%"
 LINUXLIBCVERSION ?= "5.2%"
 QEMUVERSION ?= "4.1%"
-GOVERSION ?= "1.12%"
+GOVERSION ?= "1.13%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "9.0.0"
-- 
2.17.1 (Apple Git-112)


