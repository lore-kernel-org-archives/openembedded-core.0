Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 35F3E6AF4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:39 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro2so2763334pbb.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vrz+Mq3PSY1IrBMdkvJv0hUi2UsNlS887OT9yj+KTP4=;
	b=kqVRo8FNF2C7YNncHugI9e5hW7p4YtqnYkgLD6I4CdwhBYuJ/674TRxd8dysCtfKZL
	idWEcU+cQC17HBN49ie3Awxv7PvV7TKHa4LdLNv2Rs5rbcyrYcNgmwwVQ8UzU+5bakv0
	Fw/ojoyzSHhubLEYS7PX4SrhaeV+/QsA1+/AJps9axCETjpoUKG/etNylIF8X1u8xNg6
	Y1999ncwGrTjoLPhUwjJ0rY+40nt0JYKevmw4ipvoKQ4pgR41HVM59bCoFmg9aaDXmiS
	IFYg1nYt7zJ5c0saJ/9aZ4fN4fG3LB6iapv4/G8AJxQV436Uc5wl5XJGAHNDpb7fxq3z
	A+jA==
X-Received: by 10.68.212.72 with SMTP id ni8mr13464892pbc.114.1372457080579;
	Fri, 28 Jun 2013 15:04:40 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.39 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:03:59 -0700
Message-Id: <59d6c00575d45facd830c724436d6d9e2c78292b.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 14/24] python_2.7.3.bb: Inherit python-dir
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:39 -0000

So it can get the correct python direcotries for python2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 59d189d..94d3917 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -32,7 +32,7 @@ SRC_URI += "\
 
 S = "${WORKDIR}/Python-${PV}"
 
-inherit autotools multilib_header pythonnative
+inherit autotools multilib_header python-dir pythonnative
 
 # The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
 #Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
-- 
1.7.9.5


