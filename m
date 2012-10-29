Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TSlpc-00077L-Sx
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 10:40:29 +0100
Received: from localhost ([127.0.0.1]:53677 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TSlcV-0006oo-8a; Mon, 29 Oct 2012 09:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=default; bh=W
	URsAI/2x0w5dkJ7YT/8QGKF4dQ=; b=Gsba7b+S5ly7HaBL0ZnPSnqcYlEBsUBsU
	YtBMgi/I3wMLBzNxDVv3geqW4ZV6TExEJg9gqtdVxuOZGeqSzKgTK+J8BUY1K9AP
	XYeovlI3utcaGxP/dq1N1vDtlib7aaN+Smsz3pRaE6x9+e06UMiMV2ON45lsSF0Y
	0N9KrZlXqE=
Received: from [195.171.99.130] (port=2554 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TSlcV-0006o4-3z; Mon, 29 Oct 2012 09:26:55 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2012 09:28:50 +0000
Message-Id: <1351502930-2348-4-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1351502930-2348-1-git-send-email-ml@communistcode.co.uk>
References: <1351502930-2348-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH 3/3] babeltrace: fix depends
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2012 09:40:29 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb b/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
index 95d65f5..e699712 100644
--- a/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
+++ b/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d1a03b3c17bdd158b3cbb34813b1423"
 
 inherit autotools
 
-DEPENDS = "gtk+ util-linux"
+DEPENDS = "glib-2.0 util-linux popt"
 
 SRCREV = "0d8f8c2ea27df096269aa76b4baeab26b68b95d4"
 PV = "0.12+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git;protocol=git"
 
-- 
1.8.0



