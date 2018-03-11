Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2442778893
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 22:18:26 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id n12so16902595qtl.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 15:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=53VEscGNA5fXtFz70sSQiZ/jSzZNp9XA/+IQcSJaIMQ=;
	b=G8DAS+FGGoh0q2vcfzFBlYfVlHkIKwbbgqVcf+53NYuD6zEuKV6RECr/GGXnplsSSs
	QCSBvsbiM7X8QEGg9l5kt5C4Me81KtXgIMDsKF0DYbi77KBSYIfe5xXX7jXKlYpPXr+6
	fVxNkDjx9rugwnK3wMFD/gwAC11Z2xBaYcXZUWuXkvdem4xmFY1cM5trwW0e2/VIuO2h
	SWoFadvhvzpRhI87ozRqY60D/u69YifKdWo+WmTH1bCYdy1VvWs6b7kRjwS7tj9O8A67
	fmBksDoFE84laHm1jxE90ypBORhfMzc8L5PpN8UcS51WNV3k2maYbC5mWOZF+Imbf+CL
	w+9w==
X-Gm-Message-State: AElRT7Exe0QlZAiVXWIK4FgekTKGp3esBUm3CywdEq7wvWpW+L04t82Z
	xmAD0HNH7fkCvE094WcFrGZfLJMf
X-Google-Smtp-Source: AG47ELu6NrVCVAKSduPwskMFHqG1Ffg6bjHM0pUArYPC+cUX3Jcq2UhK08V97gLJDZT6Vng53Jt9IQ==
X-Received: by 10.200.51.193 with SMTP id d1mr6351422qtb.338.1520806707839;
	Sun, 11 Mar 2018 15:18:27 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n187sm4139402qke.48.2018.03.11.15.18.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Mar 2018 15:18:27 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 18:18:22 -0400
Message-Id: <1520806702-5879-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv2] python3: update to version 3.5.5 to fix security issues
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
X-List-Received-Date: Sun, 11 Mar 2018 22:18:27 -0000

License-Update: checksum change is due to bump in copyright year

Resolves CVE-2017-1000158 and other potential security issues

See https://docs.python.org/3.5/whatsnew/changelog.html#python-3-5-5-final

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/{python3_3.5.4.bb => python3_3.5.5.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.5.4.bb => python3_3.5.5.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3_3.5.4.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.5.4.bb
rename to meta/recipes-devtools/python/python3_3.5.5.bb
index a94d009..8150dd6 100644
--- a/meta/recipes-devtools/python/python3_3.5.4.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -38,10 +38,10 @@ SRC_URI += "\
             file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
             file://pass-missing-libraries-to-Extension-for-mul.patch \
            "
-SRC_URI[md5sum] = "fb2780baa260b4e51cbea814f111f303"
-SRC_URI[sha256sum] = "94d93bfabb3b109f8a10365a325f920f9ec98c6e2380bf228f9700a14054c84c"
+SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
+SRC_URI[sha256sum] = "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f741e51de91d4eeea5930b9c3c7fa69d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b6ec515b22618f55fa07276b897bacea"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.7.4


