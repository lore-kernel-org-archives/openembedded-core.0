Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TRigH-00056Z-6e
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 14:06:29 +0200
Received: from localhost ([127.0.0.1]:39411 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TRiTD-0001tJ-El; Fri, 26 Oct 2012 11:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=default; bh=e
	hoE3LazLoPsUu08lXKX1BUH+Eo=; b=HzQgaVIY0K/vAHSZgt9xt7tHAy+WYV7si
	GA8/Aq6xe//4knj8HPLvFUw8rH5K1CLFwoy1IukLZqQ6uLQerLsWa2TKIxtkhfAM
	fFas9WJ4QpwmCvlNDAqngsJAU1WpMy2jp6V6JwxUctm4hBfJ3oGHTU0tNeRDD2yk
	U/f7HPCgWo=
Received: from [195.171.99.130] (port=57894 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TRiTD-0001sE-AA; Fri, 26 Oct 2012 11:52:59 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2012 12:54:20 +0100
Message-Id: <1351252460-19953-3-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1351252460-19953-1-git-send-email-ml@communistcode.co.uk>
References: <1351252460-19953-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [oe][PATCH 3/3] babeltrace: fix depends
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
X-List-Received-Date: Fri, 26 Oct 2012 12:06:29 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb b/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
index 95d65f5..fb2d799 100644
--- a/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
+++ b/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d1a03b3c17bdd158b3cbb34813b1423"
 
 inherit autotools
 
-DEPENDS = "gtk+ util-linux"
+DEPENDS = "glib-2.0 util-linux popt"
 
 SRCREV = "0d8f8c2ea27df096269aa76b4baeab26b68b95d4"
 PV = "0.12+git${SRCPV}"
-- 
1.7.12.4



