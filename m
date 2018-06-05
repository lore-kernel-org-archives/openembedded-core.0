Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8FFA27558C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 12:47:23 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id r15-v6so4696458wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 05:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=RdW0xgJngpwzCfp+LMYqbL7zC1tkNAOGF1FPW2a9szY=;
	b=p8LUVCzTM1vOiqwnlNaKatmnif0AmS3bt8JG64fYiBJEq0hYJhdcEPEsehx+pznkTr
	DWT1Uc3ouj5VyZZpyS+bnZ27BCZygaRN7EPU2RwsVNskudgPaQfIMHoWyDopjz9dKjzC
	awrwp8161bCu3HkEEKDsW5BBWCdSZKGZu1NGQMdZi3Y0wJ0kYin8hlUXBdJuItSJWa1M
	pauuukd2YrWuzYd00JBQM7cmxQIfHspP3DAh76s18T5EMChUCqZo7BYwxOeNLHBmds7z
	vXtKrUIXJrK/I+EiZ1p5xbCZvUh1U7M/OQjT4Pufeij1UD3YOo6QHcvER7oSwH5qu3r8
	fnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RdW0xgJngpwzCfp+LMYqbL7zC1tkNAOGF1FPW2a9szY=;
	b=TAddaJwhb9Fyz2lRwebVSLdWEKncDkczSu4+SrNsn2F29reLooqnB9s1GD3AUY1+g/
	/+r6xlwDuZOucfVNXnFJKcT72kohV5nm7grQEtWwKmiTkcyGNuz39UGeF23e7gPwvour
	UO3P5zs01DqshpwHl/kYYGlnCfAMoP7hW9g49y2EVTOAhic8sPE4barXkksVHaaOpE3J
	dGRZY8sg75XXrrIwBhFusCQQz4fOPTIGpbgRnJNJWFsA98MIDbX4Y03aavQZb+8pkWSy
	UemP3/26QrFMVWz5kXM6MSjvVQlirrkbh5hOr9278fEs/iWTfXTdseo+jRJ/qS6kUyKH
	y9Hw==
X-Gm-Message-State: ALKqPwdMNN6rTdXD5xQtXVz2odamXSCJFWmBs4HWYD1IXJwsxpaJuxb8
	o4gX4EbS+uGigRYRoPHolMYGIQGV
X-Google-Smtp-Source: ADUXVKJaLRUHw7bTQLj1x88eYUgftmGszWhKXKZ9VZdx/nbSgvl4s5KBZodXWqcXi0R9zk+FK38Zcw==
X-Received: by 2002:a1c:6fce:: with SMTP id
	c75-v6mr11523717wmi.83.1528202843894; 
	Tue, 05 Jun 2018 05:47:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h4-v6sm7202154wre.89.2018.06.05.05.47.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jun 2018 05:47:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jun 2018 13:47:21 +0100
Message-Id: <20180605124721.14940-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] shared-mime-info: fix license statement
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
X-List-Received-Date: Tue, 05 Jun 2018 12:47:24 -0000

The freedesktop.org.xml data and the update-mime-database tool are both GPLv2 as
per COPYING, so change LICENSE to GPLv2.

test-mime-magic.c is LGPLv2+ but we don't install that so isn't relevant.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
index 1f51225b0ee..344da7ea77c 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
@@ -2,7 +2,7 @@ SUMMARY = "Shared MIME type database and specification"
 HOMEPAGE = "http://freedesktop.org/wiki/Software/shared-mime-info"
 SECTION = "base"
 
-LICENSE = "LGPLv2+"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libxml2 intltool-native glib-2.0 shared-mime-info-native"
-- 
2.11.0


