Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 267336C0F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:11 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r17so9252405wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fF59nOW48IFrc1mTXYNDiF7OVL2LI01ASY5X958RMpU=;
	b=ulq9C1ToBaVgeUFCVs91hjcleyk2F4bUuK5KBQTXCAk8GrYkbZcd6QplfXP1YXzVVy
	Kk042f+TcWBFvEkYyiwM0XDcEZ1i/5HqSm1CS6KNRTuIaT6QCT9gGreoJYc9wlHgoQGD
	oM/TBVtYaAAc+CLuuMakwqsNQj6Np0qnBGtEPOlMxSCsNN9UFyL4u08W02ntXdBj5zQ1
	mhXRWVs3Xh7t528jelZRuV+IPXvJSHyhWkS6K/IbpWL4joq7iUFkuvgSsWrbaTveNkIT
	rrdEAlonwWSaDvUhjIQG/TpfCT8hc4XARgXDAjeKN9s2rDL58x/FoZQWesx51Y0QXtKE
	KT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fF59nOW48IFrc1mTXYNDiF7OVL2LI01ASY5X958RMpU=;
	b=iVEyQfmhcVIMpqCl+8LvQx5UoFPiCqoYe/Gyw9wpCrk+h3M3Eakx0C5ctSgQeS4pSv
	OsRFPjnhpxPKLzk8FD9UJ4CyGUwjDiMJsCyddxRvZo09J8nb4jw/CPj6OZRLA+XdUfyP
	5Wd8SYdDGAJADlUbEfOo62b5MKYCcFWItj9jXoiQGmlQ/JV1JQD9erhjx0C3n28iyERA
	7DXmhQsh/mY8Zqxwm2gz+JGR/004IkXSAioX+iJtIgEtzkqrqt8uGqVp1KMUCOX5cF4u
	obN7jtCC+oDz1hAaVdASb/N2/jfxfsAdiKBSeqLonr02yk43a7hq3qmTXslGbbzrxmHH
	hDJw==
X-Gm-Message-State: APjAAAVOKthpF/JprJAyY9CJUwdUZvlWq8/O3mrgUfWuX/mB/dkMMD9j
	RtzYVdK6bAYlqVP8r92giPotuZ1N
X-Google-Smtp-Source: APXvYqymaQWScTbyK4HJ44nS1frnxZZNWQDi29ftu2SFcpRHS/nSRWMSq2LpaY04MuOZDzqRKEKb1Q==
X-Received: by 2002:a05:600c:2293:: with SMTP id
	19mr3106862wmf.26.1570794491792; 
	Fri, 11 Oct 2019 04:48:11 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:48 +0200
Message-Id: <20191011114754.91740-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/19] mpg123: upgrade 1.25.11 -> 1.25.12
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:11 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mpg123/{mpg123_1.25.11.bb => mpg123_1.25.12.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.25.11.bb => mpg123_1.25.12.bb} (94%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.25.11.bb b/meta/recipes-multimedia/mpg123/mpg123_1.25.12.bb
similarity index 94%
rename from meta/recipes-multimedia/mpg123/mpg123_1.25.11.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.25.12.bb
index d063ef5c599..a18b2f44174 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.25.11.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.25.12.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2 \
            file://sdl2.patch"
-SRC_URI[md5sum] = "64749512a6fdc117227abe13fee4cc36"
-SRC_URI[sha256sum] = "df063307faa27c7d9efe63d2139b1564cfc7cdbb7c6f449c89ef8faabfa0eab2"
+SRC_URI[md5sum] = "ddb38254966eb38c77f220d456a1839d"
+SRC_URI[sha256sum] = "1ffec7c9683dfb86ea9040d6a53d6ea819ecdda215df347f79def08f1fe731d1"
 
 inherit autotools pkgconfig
 
-- 
2.17.1


