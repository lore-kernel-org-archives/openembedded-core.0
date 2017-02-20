Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B9FF760766
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 08:45:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1K8jU5c020917
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 00:45:30 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Feb 2017 00:45:29 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Feb 2017 00:45:27 -0800
Message-ID: <258d70a8ff8319da6f9ac375295263e8a3a4dd5a.1487579833.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1487579833.git.liezhi.yang@windriver.com>
References: <cover.1487579833.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] terminal.bbclass: export configure vars
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
X-List-Received-Date: Mon, 20 Feb 2017 08:45:30 -0000
Content-Type: text/plain

So that we can easily reproduce configure by:

$ $CACHED_CONFIGUREVARS ./configure $CONFIGUREOPTS $EXTRA_OECONF

[YOCTO #9423]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/terminal.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 5db013f4dc9..62409c08158 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -3,7 +3,7 @@ OE_TERMINAL[type] = 'choice'
 OE_TERMINAL[choices] = 'auto none \
                         ${@oe_terminal_prioritized()}'
 
-OE_TERMINAL_EXPORTS += 'EXTRA_OEMAKE'
+OE_TERMINAL_EXPORTS += 'EXTRA_OEMAKE CACHED_CONFIGUREVARS CONFIGUREOPTS EXTRA_OECONF'
 OE_TERMINAL_EXPORTS[type] = 'list'
 
 XAUTHORITY ?= "${HOME}/.Xauthority"
-- 
2.11.0.rc2.dirty


