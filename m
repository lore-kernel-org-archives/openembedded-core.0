Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Swyhh-0005pI-5n
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 18:56:53 +0200
Received: by wgbdr1 with SMTP id dr1so7312695wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=oZstj6OpoqSgafCybkck8PSY/NhvwI0V8A0zpbE2onM=;
	b=LmCBUIyE39NCx+PP6IazoScP9KnJc5G+iFuky1TOX3yN/kPu2efcJ+dtr/o060IuGw
	QWDyJ5NVXEVNlI8IjNuG56Li1GA2DVxipOkZ3LG8uxvJMQ5z/XMxPClr+lP0oHDVpzyu
	GZo9vfec/GPYwGzhQvT56ISWWGbDPThJmx8Z+qCIvtwft0AKGOFqpqdRdgMcMtnmsa8G
	axtnhbd3TB6OXg8uh5xDGYGBzOyOZ9Di/zQbbdPbHrMY2cA2Z0+q5+x/zcPpp66ayHMv
	/RmW10PPRZy/nwMHvcYWu30UYmAFPJPfX/zDW3yIUlvmSS+Yc7sXtZml3LUdLDcgfpmf
	7qbw==
Received: by 10.180.81.193 with SMTP id c1mr6120447wiy.12.1343925913591;
	Thu, 02 Aug 2012 09:45:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm34447858wib.5.2012.08.02.09.45.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:45:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 18:45:09 +0200
Message-Id: <1343925909-7363-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <CABcZANmT9RqSX=sBfzoBtVFcU5B+5wxA=FOVDP_rOVgE39YEvw@mail.gmail.com>
References: <CABcZANmT9RqSX=sBfzoBtVFcU5B+5wxA=FOVDP_rOVgE39YEvw@mail.gmail.com>
Subject: [RFCv3] bitbake.conf: store cooker logs in subdirectory of LOG_DIR
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
X-List-Received-Date: Thu, 02 Aug 2012 16:56:53 -0000

* we should probably wait until
  http://git.openembedded.org/bitbake/commit/?id=1e06d8012868ba5a31503dc99cbf18570be629d9
  is in next required bitbake version, but error message if the directory doesn't exist is quite clear
* people with new enough bitbake could just change this in their local.conf

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d5a43e9..8074684 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -753,8 +753,8 @@ DISTRO[unexport] = "1"
 # Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
 TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
 
-# Complete output from bitbake, if you're changing it, make sure to use existing directory
-BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
+# Complete output from bitbake
+BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasicHash"
-- 
1.7.8.6



