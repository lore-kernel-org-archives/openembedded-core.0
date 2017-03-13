Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DADA60102
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 07:46:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2D7kmo8014046
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 00:46:48 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Mar 2017 00:46:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Mar 2017 00:46:45 -0700
Message-ID: <16e826372adf1760d2f8b884e913451a7ab23b33.1489391139.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1489391139.git.liezhi.yang@windriver.com>
References: <cover.1489391139.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] terminal.bbclass: add tools for terminal
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
X-List-Received-Date: Mon, 13 Mar 2017 07:46:47 -0000
Content-Type: text/plain

Otherwise the -cdevshell doesn't work.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/terminal.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 62409c0815..b68e5733c7 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -9,6 +9,11 @@ OE_TERMINAL_EXPORTS[type] = 'list'
 XAUTHORITY ?= "${HOME}/.Xauthority"
 SHELL ?= "bash"
 
+# Tools needed by terminal
+HOSTTOOLS_NONFATAL += "tmux tmux xfce4-terminal konsole gnome-terminal \
+    terminology mate-terminal rxvt xterm tmux screen \
+"
+
 def oe_terminal_prioritized():
     import oe.terminal
     return " ".join(o.name for o in oe.terminal.prioritized())
-- 
2.11.0.rc2.dirty


