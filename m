Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 891B56BB34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:16:13 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id lf1so5074606pab.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7JIUz7fkA20MnJnVGw1hBA3XPcx8JBn4VhxD9pufWPg=;
	b=GKaS6FSokdlOv6Sxzla7+gMKRYK7FNJvfSnOZyRjNuMCxg66z+YRw/g0b4xdV/1Dyh
	okKwhOykumJxw435BwrLplGAK4aa5dw1fNqpFNISDCdrJaPD6TAMAyFh9Hxed+MTfu/3
	KSm6PFaRk4NqM/jSaU2ATUKNtwKIeh5SjpONqt3FXvmcT9qI/gAuABn4eYDOeM/4JL8T
	7oN0q0XaFqor9tB4i5uYDHHaowZhcABo5mLY5EnZJmRKxpgUkoOpKJv5YGGtLSymq+wq
	nZ5WsYrWZVjKqBIwiPdBHxKHeUdlf6Je+K7Z3YSkQMdpJrBZDTb7MJDwWx0AA7YSk6z/
	PFAg==
X-Received: by 10.66.155.36 with SMTP id vt4mr21833788pab.93.1377623774571;
	Tue, 27 Aug 2013 10:16:14 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:16:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:10 -0700
Message-Id: <32d476d08eb974de8c95778be4f0aa32b9fdb6a4.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 11/20] python_2.7.3.bb: Inherit python-dir
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
X-List-Received-Date: Tue, 27 Aug 2013 17:16:13 -0000

So it can get the correct python direcotries for python2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 2e35da6..62f78dc 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -34,7 +34,7 @@ SRC_URI += "\
 
 S = "${WORKDIR}/Python-${PV}"
 
-inherit autotools multilib_header pythonnative
+inherit autotools multilib_header python-dir pythonnative
 
 # The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
 #Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
-- 
1.8.3.4


