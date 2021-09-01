Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web09.8189.1630503941185589847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ezv62B6H;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id s20so3801398oiw.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oe05p5gjARYe88vGDe/nnVsBlIZ2gU5qHUtBQywzEd4=;
        b=ezv62B6HQ/8X4HfOKvK12Y2Lo+x9REbwz9NKVKY2XFg+GfEBfXund6IQqDSF2MK5MU
         ncBqSCfIw+xVBU8StooGkrkf0In7JUgjt8o1JpfzuKJXwxalRkJaermfmoX3jN8UBj7x
         fTitvIVPJoGBqVvs1QNYYrTBWGjrEEAS745Db/Yc36G/M0cFH8jZ0tjfrjIJJAnb6Ms/
         uCuUiYVATfWbvB8SIhYkT0slr5aArxng/b+0s8HBA3WLCLqEmINoO8bIhvjinn2m8kG/
         80WgOAnv/JcHHg4mvDDBo49WGi2iZbPRv9aSUx8g+QeVd/RErZq2dHLgPxlm9iz99FbG
         jxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oe05p5gjARYe88vGDe/nnVsBlIZ2gU5qHUtBQywzEd4=;
        b=TWlS79Ks2wUymo5X0Ts2WJIARMShuZ/f08ZNXWkuukQwzDIR5EXZcnIjvfeop0gJ3j
         cUs3lfKnInlWmFECMCkzRMMgQI5fNLMOwhv79YfIXt1wpW7gTNER7/MGHdRdN/faNgIQ
         Vi0COM3FAUotPCN4Yd7NQrdv3cxuTN4FmYp8gE7a5JnGS1A781CH3WrEEWht4EDdqa7D
         nMiUe+yN8Pqco9i6aGjyBJciFskqylQ9uMTgaL5rIjCw9KzFtm857bnDOf4i3583ThH7
         CtSgtM/P0xkVo9CyCffcjPFPqf8v4DcLi2y3TAhongu/pCCLXTma8golAMYU0AN0mL8t
         03Kg==
X-Gm-Message-State: AOAM53303VgJe/WuGhZmwGmdjd2lsB0+Ly4vSrhxVU7cKpASbMX+9l1o
	m21Q6PABdWiAqCYL0uLkcLCqRJSAZOM=
X-Google-Smtp-Source: ABdhPJw4VdMr7VA1DPxkUHDLQKpOydBcv7Eq2eKIUkSIFI3Tryt8npU7IIVY4l33ejAYsTgY3ohItA==
X-Received: by 2002:a05:6808:2116:: with SMTP id r22mr7516293oiw.128.1630503940318;
        Wed, 01 Sep 2021 06:45:40 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:39 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 22/31] shadow: Use specific BSD license variant
Date: Wed,  1 Sep 2021 08:45:01 -0500
Message-Id: <20210901134510.29561-23-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-extended/shadow/shadow.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index c35cc8396d..c91f2739cf 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/shadow-maint/shadow"
 DESCRIPTION = "${SUMMARY}"
 BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base/utils"
-LICENSE = "BSD | Artistic-1.0"
+LICENSE = "BSD-3-Clause | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5 \
                     file://src/passwd.c;beginline=2;endline=30;md5=5720ff729a6ff39ecc9f64555d75f4af"
 
-- 
2.32.0

