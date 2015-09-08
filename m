Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 93C5E60053
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:06 +0000 (UTC)
Received: by qgez77 with SMTP id z77so96997976qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=3Fk/YyFPD2Jl5BPAtk/LsiM+gYaFprm/ntvavH3Sap0=;
	b=ErXw+SWC1FdM7xqumDSAjuz0C8Tl+ZknwI+6x0yuaRIJhqcdEZUEOH7ZrSqRotSDLc
	v30V9LuIf1XFAZ7xJUnKXHKg3Lt0v8UCm1dLztUi9QgGE874scSAFZTI6gyqpg4x28+D
	/+aCfM4AqrKl2diYo4usOA0wuc04JyrYs72fDmpqm9Q4GUIvWIeKl3NU7tFezmwWSzdH
	AbKZ3QXj1QsITG7q67wPjDeSZqY79vUcaDafeC/zfUZi5GUxqkGkmlc6Sjy2eUKxx+TM
	JL7Czdz7TN1H9qsCcq6QVJ12kc/A03nURelKdWXGuNoq7gxg6/JxyxggxQsud5ZiJB6k
	MvLA==
X-Received: by 10.140.151.140 with SMTP id 134mr42489195qhx.31.1441753686413; 
	Tue, 08 Sep 2015 16:08:06 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:47 +0000
Message-Id: <d0edb834ef000ac56b7b9daaf9a00b91260628d5.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
References: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 07/16] ccache: Dont add LDFLAGS to compiler flags
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:06 -0000

This is no longer required, its been carried over for a long time. As a
side effect it helps compiling ccache with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/ccache/ccache.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
index 4790021..69aa64e 100644
--- a/meta/recipes-devtools/ccache/ccache.inc
+++ b/meta/recipes-devtools/ccache/ccache.inc
@@ -16,5 +16,3 @@ S = "${WORKDIR}/git"
 inherit autotools
 
 BBCLASSEXTEND = "native"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.5.1


