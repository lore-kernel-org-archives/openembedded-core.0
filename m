Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8B1DF7FE6A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:55:01 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b6so6106037wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=lSx913HjeUMUu8GQAJbToEJEW6Vn1wYJfFNav+5uxAg=;
	b=EBbui9UNNLeocRhySzQBRPtI40sdLUUJ31Ih6hIgsjCOs42sK9S64XH7SsoCQKQakI
	UlCWMDTko70vdx69Xv5J4qzyrUOUdU7k2WoSEWJ4T3OdO41ypSTZBZxRSb+XzQtNLOPb
	M/dVsBVg1jMioO5bB7EirfH3kicc0o3uW8L0utqLnk0Ykzqtx0O6H+aS7R2aHafRT9NE
	YGUePvPDtCkzcSzKIROV1hB5RI5MXD8dayHMG2vrw7H3LKbDqqPL5zDMm4BIbjpxXJuz
	NNJRxFTrJH9q6B2FCn+/Ef7WTUooV9SE3MZ0NluCWS6ogMa0q/35ujsNVANJOo2kJFV8
	WKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lSx913HjeUMUu8GQAJbToEJEW6Vn1wYJfFNav+5uxAg=;
	b=lba6fl0AT021mKSGJt4ecHD3s2mvRknrtzJcXCxD8cdfK5XFlEcg8c3UyBLKoxmobo
	YCpENxfb0CLV1tX0ox07Ak56tcvmwFVtmNAaJ7zsLHA1SIYX/LmjRWBxYcRJy48vVhSb
	TAlGO6viaBf7yApWYbDSp+Z90jDTGLM3nHRgDZ+suLiU4lFCg06BSq996osROfnc2osH
	fu7dRg5aqHFdTR8Ve6trR5eO0THio6VpoifYKMWiYuHiFIkLKbXwqrWMGDLBp5FMYHIz
	7ECSUSS1BOyvtfCyzA2quAZMizyk6nzlA3XgBAJvhNmuYiXvpZL+uIx8hB0CWp61Y0yJ
	79Ug==
X-Gm-Message-State: APjAAAUPnzTHVxBLL7L+gqGudQGN1CHZR9Q+lPKgrxWA/hTHf3R+lVwN
	dPM45sCCwbYZ8iGgyUDkpowKC+Ndkig=
X-Google-Smtp-Source: APXvYqyiqaVW4UwfEZEg7vfqvxzULUMlvezXDH7bhmObgpAAi4OYaozIWwWoZ3wydMkIh2Z2+vBs5g==
X-Received: by 2002:a5d:4386:: with SMTP id i6mr9586852wrq.63.1576763702088;
	Thu, 19 Dec 2019 05:55:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id m7sm6468809wrr.40.2019.12.19.05.55.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:55:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 13:54:54 +0000
Message-Id: <20191219135454.23080-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191219135454.23080-1-ross.burton@intel.com>
References: <20191219135454.23080-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] piglit: upgrade to latest revision
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
X-List-Received-Date: Thu, 19 Dec 2019 13:55:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index a95bb5ab937..f53098c45de 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "068581c29c95fe2681023e12745007dd17b38ce5"
+SRCREV = "603cfb97542a411e8957a0d689d8b28cf8b9ef4d"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.20.1


