Return-Path: <kergoth@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 788D77713C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:07:58 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id g26-v6so1954109pgn.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BKE9pErR/AXAB7eKyGzAfY9OSW66E8Df+xvncuy/51Q=;
	b=Uq+lFp/dewCzB5C914yXk10myCqA8siz4poMYs2HuQy9c/yJplX3KspkwKUhXfqXcp
	WZHr73BDOBCsFLh/kDPK3ALcWElpKECh5gXcTtaxZQJ+ssRLWTd2VTl+tvCJMOxBtRbV
	hEpFUhaRENaH5jiZMb6OJFrzA3ZgTI6SRPqka1E/gl1wSqUnDe/9dTcas03biA0Doweq
	MUtclDHM79e+B9sOKtNHWI4x3LRg+P2Lgn36DsWYqZw7af/MINICJLJo1tAlGBywulCI
	mshNvtVtSkANXL1XzgbgjeaWOMDAslrvy/qBYj3SiGojCBvzcq6IIAC7Wwuj8ouxHq/k
	TK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BKE9pErR/AXAB7eKyGzAfY9OSW66E8Df+xvncuy/51Q=;
	b=Q6giSilCGd6tHw99gffeKysiMydlulDCB6GvzLkET8o0F0rEswhDNs+xu5zRVk6SGx
	7m59NLAAhk3pFDj2pY3Q+0LfGEFQ1Mdxty6h35te/dh8D+fZg8uEi0JvGq21bcDRidPn
	PPZ8TsZE884IybTsz6MspJT3EpF1LuFqb7F6T8U8mL0/LEUPUwDF/R6cg9f6/olZhISw
	qod1U1ox/uRsiK7uS9d7zaLaWbenStOEV1u01xSu+orfTNeq6u33YnLbFZnFUFaNOCtF
	k/KpGBpBxTddiFuvC4zf/OyT6wGVBCbrg8q8/KmZ3J6yGYJxVI0hswEwIEnGT6vCRELQ
	wEog==
X-Gm-Message-State: APt69E1afRIe0Pbub7z6BtVhUf1F694Ej0fY54fqFa1Ged8GYqqdua08
	6L5A4+qfPRHtIZN9R8WVXfyg93K5
X-Google-Smtp-Source: ADUXVKIkNWMK7e3W+PImUSzBsw8GAjfQ0SROPzhq7EsFSE3xZ2PS9boJlINNhU43vSKVjH3pU5/sNw==
X-Received: by 2002:a65:4b0f:: with SMTP id
	r15-v6mr208765pgq.103.1529615279357; 
	Thu, 21 Jun 2018 14:07:59 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	l62-v6sm8448499pga.21.2018.06.21.14.07.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:07:58 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:07:34 +0500
Message-Id: <cb7ad8b13e852ded07b91006933df73cacb9032a.1529604086.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1529604086.git.chris_larson@mentor.com>
References: <cover.1529604086.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/6] ovmf: set PARALLEL_MAKE for target as well
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
X-List-Received-Date: Thu, 21 Jun 2018 21:07:58 -0000

From: Christopher Larson <chris_larson@mentor.com>

This can fail for target, not just native.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 212530acbf9..e57fa097274 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -39,7 +39,7 @@ SRC_URI[openssl.sha256sum] = "57be8618979d80c910728cfc99369bf97b2a1abd8f366ab6eb
 
 inherit deploy
 
-PARALLEL_MAKE_class-native = ""
+PARALLEL_MAKE = ""
 
 S = "${WORKDIR}/git"
 
-- 
2.11.1


