Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id E84FE79652
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 21:30:05 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 6C58310C077B;
	Mon, 17 Sep 2018 14:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537219807; bh=Xgi6vzQQ6Cly8xmcOeSnoVdWP5QnavgIkMPqD79LjKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cxNQN6yeekmfs1bn0a1I/4FuRbs1EXMfRSHlHWf7gjgNoKNAvqYb8BiZbnbNfQXhf
	LT3Sso0aaMVtRpuQzJdm/wazNzBg7vVRIdB6y1xuqe8ul/e1cCtxEHIYguKcOSMVGz
	go88lq0/Vb3u5brumkV/vORUhjDqnA7ySGHYOOhwQoODaGGgFaPgAkQN39LCoGN6nc
	j/RwQWO+OQB39oBfNXnqDl81+Vx9CUgyvcVp6wul8AJlHo40qDehFCZu3FhdNwN/Ay
	xjdVBbuWWgx3NBRXqCsEKSD/tTe+Pg/Za+Tgyh7Kp1+0falStdIoCXKsFt7zPyPMlr
	/CaGApAoeSbfw==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 323BA55BF;
	Mon, 17 Sep 2018 14:30:06 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 00:29:41 +0300
Message-Id: <20180917212943.27237-9-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180917212943.27237-1-abrodkin@synopsys.com>
References: <20180917212943.27237-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 08/10] gcc: Disable libitm for ARC
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
X-List-Received-Date: Mon, 17 Sep 2018 21:30:06 -0000

The libitm is not supported on ARC, so disable it

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 72b8081..9e7e7c5 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -17,6 +17,7 @@ EXTRA_OECONF_PATHS = "\
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
 RUNTIMELIBITM = "libitm"
+RUNTIMELIBITM_arc = ""
 RUNTIMELIBITM_mipsarch = ""
 RUNTIMELIBITM_nios2 = ""
 RUNTIMELIBITM_microblaze = ""
-- 
1.8.3.1


