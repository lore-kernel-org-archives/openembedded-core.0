Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 29B1A7E01C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:22 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id c66so9845926wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=025G51MF9QDvO0idZFPwxclL6HxAGRdn6e8ltjaqy/g=;
	b=Go6mHqtSPrshgVfCi2qscj0RKVzLWj/v0cVh3/PHJc6xbohLxJIElURAK8Y1a4QV9q
	60ZueA3PI1OCqtRw/Mm25unqBPte+qjGJ5INCsky/xuPIQ+JhlpGynKENnC5vbemiBXE
	Z3Q6sahA2bkn1qWy9RR+vEoGryOrArzQ/nroh9fDRbjfzEuxk6EirdsQOqKasAHsj5F5
	+HI67sDsv4X3TLIbMe1rDUr0Da4vZcnfiqACsAgqt6sObMqNWWyR4dOxD/gpunJGlvSa
	X2wntZ18RWde4gjz1AHK6rLOnHv0q3SlD2s0eIVRxPPLPaTkUb5D6l2bONi1zLhPXXZI
	EzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=025G51MF9QDvO0idZFPwxclL6HxAGRdn6e8ltjaqy/g=;
	b=KaxtCtyH58+nldTBUceOeqF4DAZg043w3IAUJQLLMoZVwwph1qF8ulcc31Y+rdLRJI
	iYbH2t4WGDnz+68prnWuY7UxmiYCCUwmSebQ9Xw6my7LmBxiPkkhKHaXGgUR+wfyLPBU
	qMEMZxthpASyJSsCNTmXT2bIeDKZ4zPyTnEbGlJ14VkVkJ1dGiK0/I4HpoVagFxt4ka+
	5V2WTH32JFK7QdFlxRrZsYyA9JC+/MWFFrXq2NfmS5sPoX68VHCGCqvLhS4Hp30kiaTe
	optxnGFPBCVZReJ53A6u3mixf2S1GxNl4O33NDTrQPUZVErIXZ36HFY+Wt3/PybU/Pgc
	/Onw==
X-Gm-Message-State: APjAAAVZ4z2HSusZMrXId0AfNxAv0qtUH5+dii4OX/8RokLh2OB9SI+B
	In4Kl9ngxMhpotVFQ/QAWPvdfyCQ
X-Google-Smtp-Source: APXvYqz1qQ2tWh9OF37dVcQxAGd49LPkvSq+6fq+sXZ+f1LaVwsxk0QpZhql4WjMH+lyvG9uHlTSrQ==
X-Received: by 2002:a1c:c8:: with SMTP id 191mr3019542wma.6.1558116742788;
	Fri, 17 May 2019 11:12:22 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:42 +0200
Message-Id: <20190517181151.44001-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 28/37] x264: upgrade to latest revision
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
X-List-Received-Date: Fri, 17 May 2019 18:12:22 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 34c7dc4f789..f22930a0ee2 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "0a84d986e7020f8344f00752e3600b9769cc1e85"
+SRCREV = "72db437770fd1ce3961f624dd57a8e75ff65ae0b"
 
 PV = "r2917+git${SRCPV}"
 
-- 
2.17.1


