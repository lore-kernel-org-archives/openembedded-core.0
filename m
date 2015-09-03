Return-Path: <mario.goulart@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA9C76FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 18:08:06 +0000 (UTC)
Received: by qkcj187 with SMTP id j187so24820808qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 11:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=T82BYEucQKZ4hz4GfPHH+KrESnVF5L/Mi3WnXVHWIuM=;
	b=qMMxnep2qL1we2OXY+6hwQ4p3T20ocGs+jgv3cpgypASU13FAkk2QueH0Q0kwh9guP
	fswL/01drRrc/x3AzL7iz8fNrK5xrJ0amAnKRFzx5dDkeEMLXVD6Cu1fcpnER0fhWNpM
	rFOER7d4Xq+PupUPwBOKpWFxLkOgJQ57kKK8a6HfqMN2BIsUMWZjzvVG09iia4DVaVxQ
	MZHB+i/Rjx3sBRxSFqqb4VmcjmrN2X85Tmu2Sk5wsPNeJ5LhjKIGFmbKy3Ts86wT/8Xc
	FepIm1uO79VIa9ejpAJ/39d6WJPAIYrSiLXQJN9Nd2z4T7IBThJkGHpfwaT7fSiKo1/i
	Cbfg==
X-Received: by 10.55.217.197 with SMTP id q66mr39306542qkl.14.1441303686578;
	Thu, 03 Sep 2015 11:08:06 -0700 (PDT)
Received: from mario.lab.ossystems.com.br ([177.100.224.236])
	by smtp.gmail.com with ESMTPSA id
	q21sm15320044qki.35.2015.09.03.11.08.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Sep 2015 11:08:05 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 15:06:35 -0300
Message-Id: <1441303595-5042-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [PATCH] cross-canadian.bbclass: typo fix in comments (s/repsonsible/responsible/)
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
X-List-Received-Date: Thu, 03 Sep 2015 18:08:08 -0000

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta/classes/cross-canadian.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 65ba457..d30a168 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -1,5 +1,5 @@
 #
-# NOTE - When using this class the user is repsonsible for ensuring that
+# NOTE - When using this class the user is responsible for ensuring that
 # TRANSLATED_TARGET_ARCH is added into PN. This ensures that if the TARGET_ARCH
 # is changed, another nativesdk xxx-canadian-cross can be installed
 #
-- 
1.7.10.4


