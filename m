Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SaeBf-0000HP-97
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jun 2012 04:35:31 +0200
Received: by pbbrq2 with SMTP id rq2so3817023pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 19:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LkHp3yupfBlLjlMlUIQeguMYdH10V/5tH5snZrN/7uY=;
	b=eJByZeUa9UZ8+YN5iynO5ZvgjaO7FsM2WhEfzBuPK+o7UA0wogoY4/W66Xfgou3Nfs
	eEyphB2igto6CHumjzC9k3f6C9wWs5vYCCWFNYGoswRfFO+kHQmzOzm8K8DbZPpKIj2y
	YjkIm8aZpl559Nd4PndGDj5y8iQ5CAsNJ3Da0mSyfhympOsnPBfLarNTkmA0pdsYOBl3
	NYRpuIxLglQnrF/fnKDAMNGndBCo+eTxs8FdANL2iilsdiifOkmZjrB+y/5KNG0vIXNN
	15BDMt0qAOgHVp73DFbS+U9IoT6OerpPdGnkQndZtlBBPTK0lsOus06EnLJGWphPRXCi
	hl3A==
Received: by 10.68.200.193 with SMTP id ju1mr15657416pbc.90.1338603908923;
	Fri, 01 Jun 2012 19:25:08 -0700 (PDT)
Received: from localhost.localdomain (ip68-110-79-242.ph.ph.cox.net.
	[68.110.79.242])
	by mx.google.com with ESMTPS id jv6sm4679509pbc.40.2012.06.01.19.25.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jun 2012 19:25:07 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2012 19:24:54 -0700
Message-Id: <acae76c50ae66d8167038782cc623f5de64e1365.1338603853.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.10.3
In-Reply-To: <cover.1338603853.git.kergoth@gmail.com>
References: <cover.1338603853.git.kergoth@gmail.com>
In-Reply-To: <cover.1338603853.git.kergoth@gmail.com>
References: <cover.1338603853.git.kergoth@gmail.com>
Subject: [PATCH 2/2] task-core-basic: drop portmap
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Jun 2012 02:35:31 -0000

Both rpcbind and portmap are RPC port mappers. Having both is redundant. Chose
rpcbind over portmap as rpcbind supports ipv6, nfs4, and builds without the
glibc rpc headers, which have been obsoleted in glibc 2.14.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-extended/tasks/task-core-basic.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/tasks/task-core-basic.bb b/meta/recipes-extended/tasks/task-core-basic.bb
index 8bab0db..a810d37 100644
--- a/meta/recipes-extended/tasks/task-core-basic.bb
+++ b/meta/recipes-extended/tasks/task-core-basic.bb
@@ -148,7 +148,6 @@ RDEPENDS_task-core-sys-services = "\
     nfs-utils \
     pciutils \
     libpcre \
-    portmap \
     rpcbind \
     sysfsutils \
     tcp-wrappers \
-- 
1.7.10.3



