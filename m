Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7B29C6EABB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 04:11:55 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id jt11so2653363pbb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 20:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=upcfkNcW1Jvdmt2TTp/e2jOATUGfUgEVY//6hBpzG0o=;
	b=txl5vPNJtL7vX43b0C/NCrANB+fKETmYzX3ahE3363gXaqXOEiuAbaEa8wHOe6k1Rl
	G2h9C5ZMGxLHCiPbNTz+3KMHSfUvc7Kgv0xOTomL1cI0jYESS0b81oVB6ynNiWvQsvWK
	euWLRja7PKxibflvo9SG9L44PaYwRtinQoqsjLJ4eleYOREIh87JMMovbZvtlh6M7g27
	j7+YHYmO6VT34f3ahycc6TYGImcuj+7G+As70LbfgmkjT6VANA9Hsc6XaVd9YKAp7+0T
	IflcGk3ZqBHAiCDuGhJYOYKzQiwNzrpUsVAh+Xk1ry2b9KP96hDcuKxZfLen+YALbfWJ
	u3uQ==
X-Received: by 10.68.172.196 with SMTP id be4mr12169166pbc.12.1391055116896;
	Wed, 29 Jan 2014 20:11:56 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	iu7sm12388951pbc.45.2014.01.29.20.11.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jan 2014 20:11:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 20:12:32 -0800
Message-Id: <4f2d39c759a704dc50aca4ae77c9048a9a2aa57c.1391054829.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
References: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
In-Reply-To: <cover.1391054829.git.raj.khem@gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
Subject: [PATCH 10/15] python_2.7.3.bb: Inherit python-dir
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
X-List-Received-Date: Thu, 30 Jan 2014 04:11:55 -0000

So it can get the correct python direcotries for python2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 340f5f3..ae4a1a6 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -37,7 +37,7 @@ SRC_URI += "\
 
 S = "${WORKDIR}/Python-${PV}"
 
-inherit autotools multilib_header pythonnative
+inherit autotools multilib_header python-dir pythonnative
 
 # The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
 #Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
-- 
1.7.10.4


