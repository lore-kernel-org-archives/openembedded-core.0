Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D588378CA0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 14:04:57 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 193-v6so8425485wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 07:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ranWPw1nT4ryMbvH4KkS4oyX/GRrkd00KSn0kRR+flk=;
	b=yjnOJInrHbaDgkMBOjty7Sfm/fnXmIPX9Hs8qwtuTfh7Yr8mTls3AaOmC7ONuc4HEB
	Df/2gyBDRkqRkPNy/CU4cmmv4/cgc0/7vHhGh9gVtv6ekQL2Empel0DWxLMgd9Os6/aa
	WVwaUQuIXHfJYC5QvtNgkk/oCIKyuwNEAJK9tC7cAy8yOIToA065ZiGHR75UtdwM2nGR
	PdycQ0l/MQm+hYwMAebsAqR1a4oo0UH0yieWlDeMZRFpliqMN0/XQ+yMHPRzHFCLeLBp
	9usU7hJzhfTJMRYz0nK2HpXYoXAFo/r0AgxTabaNY9qz4eSB/0+KXXHyHqqIQjsZ5A7d
	QJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ranWPw1nT4ryMbvH4KkS4oyX/GRrkd00KSn0kRR+flk=;
	b=c2zy0Hbz6zipnIWE5x2U/uLhOepTpjdMLMzbFyn6LVHSg9Tr8zm+rArgEoo/qvGVpx
	U88BHuIM1AUVQTSQrkK8jAXkf/y1rBhbugrXhvI355tXJxHblhD4SFP0ivAWucX74lFL
	OVPIbtttklId7uMeXS/yAoL4dwV8ANKei0L3SZGYnnXqqBh3Ff53hfQZ3cvJDMMCeC2L
	iiES/x3WMQ9bUj/O222TIniMax7pmAa6zzfkHemNJ9j+PQhanfwPZUFl+PNsTh2zNfFu
	rfrekZCldZzic4ruOiVcPSpiH9KZc0bxp8hG6uVA/LR9hWcG9Kbux2fTORzyq39pf/Dw
	/vrw==
X-Gm-Message-State: ABuFfohsIlx5ygCacElo+6suxGXkjqewalLJY1DPMOaMw9YDVcYwFk7q
	KqKmgHzIXyDA1H5fWYrczO3dQls1LX4=
X-Google-Smtp-Source: ACcGV60OAFhk2gN58XlLXmDvYBiVbEwTQ/yGM9AVLmKXraZ0zY4izO90c0QRmnLuW7Rj3w4ks2q/XA==
X-Received: by 2002:a1c:e157:: with SMTP id
	y84-v6mr6119119wmg.104.1539007498065; 
	Mon, 08 Oct 2018 07:04:58 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o201-v6sm13027023wmg.16.2018.10.08.07.04.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Oct 2018 07:04:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2018 15:04:52 +0100
Message-Id: <20181008140455.8990-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] gdb: fix patch headers
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
X-List-Received-Date: Mon, 08 Oct 2018 14:04:58 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gdb/gdb/gdbserver-ctrl-c-handling.patch        | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb/gdbserver-ctrl-c-handling.patch b/meta/recipes-devtools/gdb/gdb/gdbserver-ctrl-c-handling.patch
index dffb0dd81fc..71fe7f83b65 100644
--- a/meta/recipes-devtools/gdb/gdb/gdbserver-ctrl-c-handling.patch
+++ b/meta/recipes-devtools/gdb/gdb/gdbserver-ctrl-c-handling.patch
@@ -1,14 +1,14 @@
-+This problem was created by the upstream commit 78708b7c8c
-+After applying the commit, it will send SIGINT to the process group(-signal_pid).
-+But if we use gdbserver send SIGINT, and the attached process is not a process
-+group leader, then the "kill (-signal_pid, SIGINT)" returns error and fails  to
-+interrupt the attached process.
-+
-+Upstream-Status: Submitted
-+[https://sourceware.org/bugzilla/show_bug.cgi?id=18945]
-+
-+Author: Josh Gao
-+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+This problem was created by the upstream commit 78708b7c8c
+After applying the commit, it will send SIGINT to the process group(-signal_pid).
+But if we use gdbserver send SIGINT, and the attached process is not a process
+group leader, then the "kill (-signal_pid, SIGINT)" returns error and fails  to
+interrupt the attached process.
+
+Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?id=18945]
+
+Author: Josh Gao
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+
 Index: gdb-8.2/gdb/gdbserver/linux-low.c
 ===================================================================
 --- gdb-8.2.orig/gdb/gdbserver/linux-low.c
-- 
2.11.0


