Return-Path: <matt@madison.systems>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id BA90F788BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 11:29:22 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id d9-v6so9128532plo.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 04:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1AfrPUmB+Vgm1JywqSWkK72B8zfslCjDzDaoIorThB0=;
	b=g2hjXHMejShkUQpaQ4VRiLMirPQq0ndeFsXJ7S4ARFRoqItMDw+/tVRKn6GzTTPz4p
	kmLlWcpaDAFDvOAXV/DQNwhJLJyLPM5OAiP+5J6a4Z2G8ObaaaDMnu4HkU/zJm6QqHXl
	2RKkPDu5M4srxPCDiZbPJ8O7VT4tI2yLBjlwgpY2+Sqd7ASOok2teLTMyScHa4tq5Iji
	uhLJwHHf5EUdTNENMD1TcoxqjSXzz6LC4piqPEMP+I4ehj6q1jPy7n0Q8sFc3ppKHnH0
	D+SKDYQy3tnNrcl+NetFJ8oWByBT+/6FIZFAn5H2LYBp0iZoketZZBCr+sBMZGN9GmAI
	0jnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1AfrPUmB+Vgm1JywqSWkK72B8zfslCjDzDaoIorThB0=;
	b=HPEf2iGc3y42bQ+11HzOCBwrk621iIcOUQEppc8KPyixjWoSX2rb9FOTU3R++jc1R+
	mvhvIMhEL5UHRUc2jMEAz4GbIy4ulzP6RvKKMRdtkClAMO1TWLxT6tSeab1Lyn5Xo6sZ
	YZAm4AU3hQSJ5IQEZeHdXpeWaQxqStaLfAUn2XruMpgrLEGyMhvhXEoMragGJPttQvqC
	gEbIefMrr44+u9BXi+289RmiRtiGahzZcC7rLmKBE9vg03ODeG5ly+ftSCTU4aG3W7W3
	St3B8lECSciS9cCJFISA5pr/fmuIrIEWTVcOAHuwpGriG7J0OFdNRADMM/8AfHg37/tZ
	jTvA==
X-Gm-Message-State: AElRT7GOKy0H4Zp7bjELwwIprQucyvxsuaX5FHejrgqM1AugCRexUFde
	45K039Rbm9KUnAROC9sOl26fBPbP
X-Google-Smtp-Source: AG47ELuTk2TsJdtTI9i+Jxuq5+0oyAvHGcMUGgjJ8pC+j/EhNsG3Yq8loeB1Utj1k82F8CLCSTKAoA==
X-Received: by 2002:a17:902:8349:: with SMTP id
	z9-v6mr7842041pln.163.1520854163620; 
	Mon, 12 Mar 2018 04:29:23 -0700 (PDT)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	t20sm15340573pfh.182.2018.03.12.04.29.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Mar 2018 04:29:22 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2018 04:29:01 -0700
Message-Id: <20180312112901.9844-2-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180312112901.9844-1-matt@madison.systems>
References: <20180312112901.9844-1-matt@madison.systems>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [rocko][PATCH 1/1] go: Upgrade 1.9 to 1.9.4 stable release
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
X-List-Received-Date: Mon, 12 Mar 2018 11:29:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Otavio Salvador <otavio@ossystems.com.br>

The 1.9.4 fixes a number of issues in the Go compiler and is important
to get in before we start working on 1.10 inclusion.

 - go1.9.1 (released 2017/10/04) includes two security fixes.

 - go1.9.2 (released 2017/10/25) includes fixes to the compiler,
   linker, runtime, documentation, go command, and the crypto/x509,
   database/sql, log, and net/smtp packages. It includes a fix to a
   bug introduced in Go 1.9.1 that broke go get of non-Git
   repositories under certain conditions.

 - go1.9.3 (released 2018/01/22) includes fixes to the compiler,
   runtime, and the database/sql, math/big, net/http, and net/url
   packages.

 - go1.9.4 (released 2018/02/07) includes a security fix to “go get”.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-1.9.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index 7f12241dc1..2823304b7c 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -1,6 +1,9 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.9"
+GO_MINOR = ".4"
+PV .= "${GO_MINOR}"
+
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -19,5 +22,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://set-external-linker.patch"
 
-SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
-SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
+SRC_URI[main.md5sum] = "6816441fd6680c63865cdd5cb8bc1960"
+SRC_URI[main.sha256sum] = "0573a8df33168977185aa44173305e5a0450f55213600e94541604b75d46dc06"
-- 
2.14.1


