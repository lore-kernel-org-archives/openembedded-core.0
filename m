Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 441727DFE4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:11 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id n25so7198231wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ftRfGxdBJT+99sQO8E6+WQFGCCkvx6E+Shf3kld6pYk=;
	b=lMLH9f5Epn7xgxfLVWYUbcPuimQLzasqPO4gB3+wTIgUtWu4X08HgdllatnsOHQsWO
	L5H0U9RfbPeaXajenKJPF82otTeUPDY57fy0FZo3dwpNIA5d9S4P66YGQ75wyRsOkyHY
	a1RbzJky3sTr2jy84iepg/llJ4w0+y5gJDfnMBcUm1t9ENF8UhcXZTzo2ACc6qb6eS0k
	IdofNLPjWUSult/mR7ijbmgwm+qWa3kvPabwQXGY64PiLiSvHSk3pxeyGPJrFbR4jHoR
	9iFGP1biFz3iEOHPn5Jv8ve1Uhw6wEmyT3L6uBmdn4HZmSSfexE9i4AaH71rPaOeliSr
	UUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ftRfGxdBJT+99sQO8E6+WQFGCCkvx6E+Shf3kld6pYk=;
	b=AkBngUmo7DepSsko6d6N/vhl1flqdkX+Ok5eYIMPTtNXpSJ5PNY6M2ouNgamrEIpod
	DjzxxbqyM1Cz1IdJ7J+sSkWd/f/BKq/XSzjlWGHQQgHL29+dR06yQ07mhxt9vPKT0G7z
	sXrkZCvBKd8a2Ysg0GaIc/vj2XVqmW5izlWwdrsCKyHqfc4vy+n0rirEUV0wuI1stZmN
	me1WQ6v2+5Rz2FFs5R5gHOpECrldvBEoTXaicxpPsPKG8q/BcklcY0MB0rWuDrj/TNKM
	D9ksMc6y4oOh9sQSCIxMRYiLFy5QYW7Enwopol/qqK7woSzxQNcB/7E5qWoiLp+Gzbj3
	SL+A==
X-Gm-Message-State: APjAAAW6z02HUM7E5db1PTlf6L+8sARp6drRE4Bz7vR513j2eU+FuwGW
	KoC57QBDf/AYbrpuwdYx+FcHSJTk
X-Google-Smtp-Source: APXvYqzxM9dNu8dzV/xFwhHM/A4SnhPapGf6qa5m5z9tYiBn+VeOEGm5/eMIMEvRf5NaNEcjHCJh6w==
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr3124646wmj.41.1558116731783;
	Fri, 17 May 2019 11:12:11 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:29 +0200
Message-Id: <20190517181151.44001-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 15/37] alsa-utils: upgrade 1.1.8 -> 1.1.9
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
X-List-Received-Date: Fri, 17 May 2019 18:12:11 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...lsa-utils-scripts_1.1.8.bb => alsa-utils-scripts_1.1.9.bb} | 0
 .../alsa/{alsa-utils_1.1.8.bb => alsa-utils_1.1.9.bb}         | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.8.bb => alsa-utils-scripts_1.1.9.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.8.bb => alsa-utils_1.1.9.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.8.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.9.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.8.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.9.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
index 96d54e593ad..03b5c8de30e 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
@@ -21,8 +21,8 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[md5sum] = "54d6f9b483144823d0fc0c26e8cea028"
-SRC_URI[sha256sum] = "fd9bf528922b3829a91913b89a1858c58a0b24271a7b5f529923aa9ea12fa4cf"
+SRC_URI[md5sum] = "5ed21c3e296c06046cc986e732f625f6"
+SRC_URI[sha256sum] = "5ddf2cbddb4bd1a4a2a6492a09c25898b08c3ad64893c3655be14194cf0a213a"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.17.1


