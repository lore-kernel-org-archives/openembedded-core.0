Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F0F256176F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 17:32:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QXM535hBz6L;
	Sun, 23 Feb 2020 18:32:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582479137;
	bh=G7FSxnVETuRbf1eztSrxzuL6oIuN40mXECnXag+FsTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=orjWbAKJ/riz/27+s098Y0ZnQZHELQCfePCOLCRNFGngLcl/2ER6J0hU96nC9UIVG
	Y7nZZs/B2toccP8bpvHngI+ID/WAr1j3G6RkAzBk+qHqolh5fPcbpxjNnLP5CRWrgP
	JARf81CSxYVzw6HF0zXOFWIbODTA0Ha42q2RGpdYKRLMDm6RA5nsvwlTtCPQLh1y3d
	hpJyNHHJADH1S0j+5tIbbqDsmN/uoKf5vJNkQonlrIHOWBnbXwyCrNJz0f3qBhS11t
	PbWevmt8Yyf5b/z0uslmqj9k6H3Fl+mEqpbKIlMzB9mHUmCcQIyXbD9BFfULMYntNf
	xwgcyjeg+zf57hk9mqRxkN+ZqLYnAJ0PJAi7Oqya+3GwUWGkqP/024Ps/Y02zIRMGo
	zNztuEElAIVt1qka0ZGcFd7fmt+El3qXtI0sA9u512qqo7uEnOCshUXVKjPaHUncJP
	jYjxZ7uZd/oxHhitXogFVfzG/0s5PSRGfljk/ygkgh+jl8GrqBVuSmJttbWNuaQBGd
	9c1pVn8lXE+QD2CaRsbXXs6a2hH09j1BiqJHbd7eskUnuEJNChGW+E3NIV4BMd/dRk
	+fyPR7VrXf4VVz+Kb5w6cBfLqgwb0A+gF89KbajpQhckLrLI9PhFT/+H8lmY5E09Ew
	qIqq1/uJfDRAWjy07IWPf67s=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 19:32:13 +0200
Message-Id: <20200223173214.9487-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200223173214.9487-1-bunk@stusta.de>
References: <20200223173214.9487-1-bunk@stusta.de>
Subject: [PATCH 5/6] systemd: Add a PACKAGECONFIG for libidn2
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
X-List-Received-Date: Sun, 23 Feb 2020 17:32:18 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/systemd/systemd_244.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index b686519482..5d863410b8 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -138,6 +138,7 @@ PACKAGECONFIG[journal-upload] = "-Dlibcurl=true,-Dlibcurl=false,curl"
 PACKAGECONFIG[kmod] = "-Dkmod=true,-Dkmod=false,kmod"
 PACKAGECONFIG[ldconfig] = "-Dldconfig=true,-Dldconfig=false,,ldconfig"
 PACKAGECONFIG[libidn] = "-Dlibidn=true,-Dlibidn=false,libidn"
+PACKAGECONFIG[libidn2] = "-Dlibidn2=true,-Dlibidn2=false,libidn2"
 PACKAGECONFIG[localed] = "-Dlocaled=true,-Dlocaled=false"
 PACKAGECONFIG[logind] = "-Dlogind=true,-Dlogind=false"
 PACKAGECONFIG[lz4] = "-Dlz4=true,-Dlz4=false,lz4"
-- 
2.17.1


