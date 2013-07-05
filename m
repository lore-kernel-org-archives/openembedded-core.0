Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 56BAB6B046
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:29:09 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id m14so1135955eaj.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Bb4r2+1Fas6fFprTVlPFg+N798g9R6qgoCIa+T7xlos=;
	b=SqozPqjY7t900LRXcB9URfq3oSgViQ3rXhO02mqXEjooxbp6yuWdj6I4iv01m/Pq2J
	ZfcNH0NyJmBstHpaREwIGiIDNt5mqeuTw4ICctW+SuqWUMt9kA2wDSmwrKf6ErJRO+Ng
	/Jnyo7yGcl4N/MIUJBGK9r72nR8Fq6lqPsWuAEztqSpLvApHcAVC/XVbG1a6Gdfjiwtw
	vgiNmBoaFIjiUqRVI8anAnhTOQAWpjBCj9fY8EqMd7LjVC+3w4oqCVhlHWqb1dTmBQ1+
	RpIpFYdAtvROdnQzytvYEzkfkH2Osmb1eoSiWW0pLMbqper8qa5q6m6bdYXSkUHiRHs8
	x4bg==
X-Received: by 10.14.100.2 with SMTP id y2mr9448433eef.75.1372987750006;
	Thu, 04 Jul 2013 18:29:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c44sm9696420eeb.8.2013.07.04.18.29.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:29:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:28:59 +0200
Message-Id: <0d3edd636b75d8348d7c59334a0afdce5efe13fd.1372987648.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
References: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987648.git.Martin.Jansa@gmail.com>
References: <cover.1372987648.git.Martin.Jansa@gmail.com>
Subject: [PATCH 7/8] systemtap: inherit pkgconfig
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
X-List-Received-Date: Fri, 05 Jul 2013 01:29:09 -0000

* systemtap-native was failing with undefined AC_DEFINE
  configure.ac:56: error: possibly undefined macro: AC_DEFINE
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 22f8959..9bba5a9 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -20,7 +20,7 @@ STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
 
 EXTRA_OECONF += "${STAP_DOCS} "
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.8.2.1


