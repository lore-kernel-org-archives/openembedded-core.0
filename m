Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F14FA776BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 07:46:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2D7knHc021826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 00:46:49 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Mar 2017 00:46:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Mar 2017 00:46:46 -0700
Message-ID: <4ae06894c190997f459b4d50aa09d5011b80fb7f.1489391139.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1489391139.git.liezhi.yang@windriver.com>
References: <cover.1489391139.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] devshell.bbclass: add editors for devshell
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
X-List-Received-Date: Mon, 13 Mar 2017 07:46:49 -0000
Content-Type: text/plain

* The vi, vim, emacs and nano can be used in devshell.

* The groups, lesspipe and dircolors are required by /etc/skel/.bashrc on
  Ubuntu 14.04, otherwise, there would be warnings when start devshell:
    bash: groups: command not found
    bash: lesspipe: command not found
    bash: dircolors: command not found

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/devshell.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 4de7ea6fce..055d21ba50 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -2,6 +2,12 @@ inherit terminal
 
 DEVSHELL = "${SHELL}"
 
+# Tools used in devshell
+HOSTTOOLS_NONFATAL += "vi vim emacs nano"
+
+# Tools needed by bash
+HOSTTOOLS_NONFATAL += "groups lesspipe dircolors"
+
 python do_devshell () {
     if d.getVarFlag("do_devshell", "manualfakeroot"):
        d.prependVar("DEVSHELL", "pseudo ")
-- 
2.11.0.rc2.dirty


