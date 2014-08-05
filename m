Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7772B6AC9D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 11:19:13 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so834263wes.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Aug 2014 04:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ErqM6fgpt+BHfG9oRm8GSLtVmpjX14kCFqKXTTofM3A=;
	b=cpC/JGFmxgNxDcMsnh4vs25hTDEcR10yGp8gnGP7OWBMiAENeGpwJ3O+8JpZMV4IMz
	k/cGr2iGB+nysvh+1/t7VHUYch/WRpydodoF/2040UlclJpxunHN9BPCciNCaFnyjE3/
	CxeiyRV3yf/QVW141A0nf2Ax2mpIIZDc6N+pt+IQVhz9nzPXEbkYAWJOeX7LoHvYFDVb
	V6ZrFI6bfcr3Rd8g4UmpA+e1c5QfCipuqxgicBhzR30qKddXif3FSBqZONm5df1pDK+6
	oPCQ09U8T17zK9UujXCywYDwCeWxScN+9rcHUy6Y/WO/VPnSqm0/169nY0hfQfH4IAOC
	7yFA==
X-Received: by 10.194.48.103 with SMTP id k7mr4817373wjn.68.1407237554890;
	Tue, 05 Aug 2014 04:19:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gi15sm3518367wjc.20.2014.08.05.04.19.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Aug 2014 04:19:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Aug 2014 13:19:39 +0200
Message-Id: <1407237580-701-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH 1/2] perf: explicitly disable libunwind
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
X-List-Received-Date: Tue, 05 Aug 2014 11:19:17 -0000

* it's not included in DEPENDS and it's detected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 222ae83..ea8599a 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -76,7 +76,7 @@ EXTRA_OEMAKE = \
 		CC="${CC}" \
 		AR="${AR}" \
 		perfexecdir=${libexecdir} \
-		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
+		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 NO_LIBUNWIND=1 ${SCRIPTING_DEFINES} \
 		'
 
 EXTRA_OEMAKE += "\
-- 
2.0.4


