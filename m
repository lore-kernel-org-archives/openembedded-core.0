Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 47DE57F290
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 14:02:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id e8so3772435wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 07:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qeLOOp00N7M2Fh9z+goXPGhLkEb+66fw3TxZa/oWmus=;
	b=HlBSZvY/PfgBUO/bHw1NtzkGIt848HkfQuoiTzs1qwaZFpPl2NtOLm7qif3g5XT0K2
	bOr6z7t5oFOpdsMisRAP3iXktNSUwV1crxsDt99CAKCaCuDwXQBwnYe0bjWePuboPMGm
	eyy+I45CQ1mdXki+568erAwXzac2XxHvd6EFnnqapiohMTszoYsFM5SiVyc3iV/xhDss
	8H0LiJYgWp7VdNmTvyBXWivgCxGloSk0NrnVxLn1CH3oPHBCVtsWYlpwPIxfVb+C4eIm
	956bQ7fCGxy7GDbffQmY2daj+qH7OxJlGdgvk7FZGldKWCMFKn8ioLtG0YDNyGGbIVGd
	uYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qeLOOp00N7M2Fh9z+goXPGhLkEb+66fw3TxZa/oWmus=;
	b=PDNcUZp9Nr7JAgt44oeog7EV2UsNId4AGwU9Wb5lyjkwJcX87gIWj7IdanVs4425cQ
	amHohNR3+XeKLQ9WcgS5lM7XuEELm3O4yBtsmSDCb/tApfbRSiuQaMCcmf6E2zXRtVY1
	pyPEHrzdDN8Cr9P/EbpQ43bla8Ill0c5180muGAAXQviuohogM81Q9CJr2rH5NFkxjGR
	1KqPS+IGSooOqjIk/c4k27m4cmpySBZd5yP3E8vEwxvItn5peG0KK8uuxis/zM4XYICQ
	m56uqLf5f/UhCGXWecPyV++044ZYsL7HvQi2k538CK8UzECfPDgM9TUduE3v9mlC9b6a
	XeAA==
X-Gm-Message-State: APjAAAUavoCDShWINYrunEy6ZFX1mT1eeOEzdcfGEeZ5ch5EeNBW1XNR
	gMOaYtIADfQA5LNvuEgbnvaSAwKi
X-Google-Smtp-Source: APXvYqz9Lb4Fr4+sJApwgn4nJtJ6JeNez+Y78pP4BYp3YuSePpKGvDk3K3BfCWvlVhX0pvnqt4Eycg==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr4680098wmk.170.1565272949470; 
	Thu, 08 Aug 2019 07:02:29 -0700 (PDT)
Received: from localhost ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
	by smtp.gmail.com with ESMTPSA id
	p13sm22159065wrw.90.2019.08.08.07.02.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 07:02:28 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 15:02:27 +0100
Message-Id: <20190808140227.5155-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805105232.16148-1-luca.boccassi@gmail.com>
References: <20190805105232.16148-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v4] python3-pygobject: remove python3-setuptools from RDEPENDS
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
X-List-Received-Date: Thu, 08 Aug 2019 14:02:29 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

python3-setuptools is an optional build-dependency of pygobject but
it is not necessary to run it, as also documented by the upstream
packaging guide:

https://gitlab.gnome.org/GNOME/pygobject/blob/master/docs/packagingguide.rst

Remove it from RDEPENDS to shrink the runtime dependency chain, as
setuptools includes scripts to download other packages, which might not
be desired on a minimal image.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: use -native suffix as requested during the code review
v3: do not add setuptools to DEPENDS - it is optional and it builds without it
v4: fix commit message to reflect latest changes

 meta/recipes-devtools/python/python3-pygobject_3.32.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
index 05688be603..453fdac2c8 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
@@ -27,7 +27,5 @@ PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wa
 # we don't link against python3-pycairo -> RDEPENDS
 PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo python3-pycairo, python3-pycairo"
 
-RDEPENDS_${PN} += "python3-setuptools"
-
 BBCLASSEXTEND = "native"
 PACKAGECONFIG_class-native = ""
-- 
2.20.1


