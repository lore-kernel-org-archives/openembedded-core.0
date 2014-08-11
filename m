Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id BE1E565D5E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 20:22:10 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id b6so6706783yha.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 13:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=67NEuLCMjCOiWKyMVYlsaEExLgRxJWx/iZmRxcGnEnY=;
	b=I0F8MFC6KChyZQ951aTvUhXCXbQBGf1/lGVF9JD24QpnR3FcD16xaV+U5/94d/7X8V
	/f8wP/fEnk9JunbSHnTF4yk9mI7dwMywg6yFF/73IStByfK2gd9LyUSY9ZaQpIk2wJc3
	Q9jTD5dpuwdzYOuA4VmASDM5O3pmFAdNzXntm35BaCM/JAC98u5HJPUp0I3T6wMXV3IO
	996WoKVeANTWhD6IZc5c+72GsfJYaVQgyOi5CQKrpZxtLVFrsSZ5Uply+4dinjtRbtg6
	nqTZ2UMyuEtTn4wbKeo3y+eNbOaR+puK40V5Jrc5kjopknz7EytvE/o5r+CyaRIrcWw3
	pWJg==
X-Received: by 10.236.140.231 with SMTP id e67mr44663716yhj.69.1407788531553; 
	Mon, 11 Aug 2014 13:22:11 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	k29sm25642983yha.33.2014.08.11.13.22.09 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 13:22:10 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 17:21:43 -0300
Message-Id: <1407788504-27417-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1407788504-27417-1-git-send-email-otavio@ossystems.com.br>
References: <1407788504-27417-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] attr: Allow use during build and SDK
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
X-List-Received-Date: Mon, 11 Aug 2014 20:22:14 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-support/attr/attr.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index c37d34f..28c750f 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -35,3 +35,5 @@ do_install_ptest() {
 }
 
 RDEPENDS_${PN}-ptest = "coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix"
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
-- 
1.7.10.4


