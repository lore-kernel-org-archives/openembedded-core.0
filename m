Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q0ILO-0003fb-9e
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 19:54:49 +0100
Received: by mail-pw0-f47.google.com with SMTP id 9so445341pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=L8xnvy18SIpWRTzTQ3jy799Oz27cjSxiz8mkmNtbRCU=;
	b=hP0Ijo4Qg3tI8YY3GCbGQh0Zs2nqFdjFC1/WQJNKXSOEbWzlp/e0+WObQIy8+D6el3
	0n2MdamkHqslw9hBlLlauzxhvMBGIKA1YxWzsRnQtbzs1vymxzS7+mUedYajNUIkjT+j
	CgzfcjCkrylkURobEwvNKdVLCtaQfvZ5NXUT0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=MZjRPMLmOwV6Nqh+jS/m+dXH70KKJDoM5AWHP43PjibrDyHdCHG6vBAJfSZuVMgBNM
	FQwPAi4i9Hvqm+xqXVgVB69xRNRGQ7C3TtUJBBjhoigG+ImnybVbUNDAHZQY8cW4Nhfo
	paLB0ggGAhKprxZh5JHrU8cX0OM3KoJAiV+MM=
Received: by 10.142.12.19 with SMTP id 19mr77257wfl.142.1300387971877;
	Thu, 17 Mar 2011 11:52:51 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n4sm2830382wfl.2.2011.03.17.11.52.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 11:52:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Mar 2011 11:52:47 -0700
Message-Id: <d934c1815d68ec5d837d7daa9d068f53ff1c60e7.1300387701.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300387701.git.raj.khem@gmail.com>
References: <cover.1300387701.git.raj.khem@gmail.com>
Subject: [PATCH 3/5] lib/oe/patch.py: Cosmetic change to avoid bitbake warning
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
X-List-Received-Date: Thu, 17 Mar 2011 18:54:50 -0000

bb.mkdirhier should be bb.utils.mkdirhier

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/patch.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index c8eeb8b..a4980ed 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -356,7 +356,7 @@ class UserResolver(Resolver):
             t = bb.data.getVar('T', self.patchset.d, 1)
             if not t:
                 bb.msg.fatal(bb.msg.domain.Build, "T not set")
-            bb.mkdirhier(t)
+            bb.utils.mkdirhier(t)
             import random
             rcfile = "%s/bashrc.%s.%s" % (t, str(os.getpid()), random.random())
             f = open(rcfile, "w")
-- 
1.7.4.1



