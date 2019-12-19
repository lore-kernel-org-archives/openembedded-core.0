Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2E09B7FE6E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:35 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id b19so5406895wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tlbejCXSCo+UIKcioGQ6C0ahIJUxeO0WECNkeFEXHxM=;
	b=OTL/Sq4p5wbPksdBytnIdDrrVw3925c62uqcvsoiRHkmgvMhyMgUu6TIt0dnoGrXa4
	Z351i7N8vRgkuxNNScyLyEO6HlcNVgy0NIK+UZyVd/eUbW0fk91mAtD0Ud2VByRa0zkp
	gIjhcI4099S6ZMFcmon/NUb1S76oBat64PuImPP/PkmcRnDDWhMdQGPk2A9poebYWRIr
	qaFlqt2I4HMW7rZjm9UqYs8KtoEudb8MD71I2Vv34y4ctBCd/RaL5yxJSI2h24pCKaLc
	clCqZLsuYeA0f2BN8A2IYviInCLcKmRYZDYm4ANF6Ruu2yc6VW9XJMpVPmHQQB6AMTGf
	91LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tlbejCXSCo+UIKcioGQ6C0ahIJUxeO0WECNkeFEXHxM=;
	b=mlGl60/HMTHxdThFYxenh/BHZYwLFTopD7dceR+O7CN/v0hrt+DP7pP5BoGEX/RaFg
	A1YqLGAEfx9gw4iP236SjWsHUDVOUNYBCYccpJxdudfzb0+tA8LobrZOFYVhtT2jzaW1
	tse4P/ctnEtjm1TrAtQZkZpvnPGD+2m1TRsUCsZfo2YfGYCGR5RkZj028IwE2hiZrFHt
	hfOFzstXWypRDgY664Xu2RcYaTp6bKZRPefwi0CU2xisgC9hHX3ixNZuZdGHprwtA40r
	1F+dKY0MYpGXq0c7iCLRE+qOvwcHJnS+3vyE752VK9s9zC8gmNoibL1GHjwy9zfPrfSm
	fWEg==
X-Gm-Message-State: APjAAAWuGwViZCEk4b6gT7ElpKaXDF6n5NfejRgLa2XfLEBk74WPaeI7
	/paN4EJJVWwnDtzNENW+6Uxti3SXKm0=
X-Google-Smtp-Source: APXvYqyqSqT2g7K8tReiHUc0dcULPSBRgdD1x/zyPNDFgA5pgEpf4E4HWuWDie6Jx+c974e5JPYjxQ==
X-Received: by 2002:a05:600c:2503:: with SMTP id
	d3mr9833381wma.84.1576761815765; 
	Thu, 19 Dec 2019 05:23:35 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:23:01 +0100
Message-Id: <20191219132301.80034-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 16/16] python3-pygments: update to 2.5.2
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:35 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-pygments_2.4.2.bb => python3-pygments_2.5.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.4.2.bb => python3-pygments_2.5.2.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.4.2.bb b/meta/recipes-devtools/python/python3-pygments_2.5.2.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-pygments_2.4.2.bb
rename to meta/recipes-devtools/python/python3-pygments_2.5.2.bb
index 35c0ac6a578..474b95494a2 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.4.2.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.5.2.bb
@@ -5,8 +5,8 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e1d7b7bffbfeaa14083fd2bd3236aea8"
 
 inherit setuptools3
-SRC_URI[md5sum] = "5ecc3fbb2a783e917b369271fc0e6cd1"
-SRC_URI[sha256sum] = "881c4c157e45f30af185c1ffe8d549d48ac9127433f2c380c24b84572ad66297"
+SRC_URI[md5sum] = "465a35559863089d959d783a69f79b9f"
+SRC_URI[sha256sum] = "98c8aa5a9f778fcd1026a17361ddaf7330d1b7c62ae97c3bb0ae73e0b9b6b0fe"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.17.1


