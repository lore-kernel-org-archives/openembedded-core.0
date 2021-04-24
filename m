Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.6770.1619272267686084829
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 06:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MizrTiMs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id e7so42203919wrs.11
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i1+vPUvHxVX7CorMT16dwDnGoZC3GVefyvnD8I6Z658=;
        b=MizrTiMscoWkoC7i+pBNU0/Y/VsdnRy1I8ReesdvWrQRdabjZah2dSVmjwNZ1j9DVe
         SBWt0O6zzW77N4ILQ7OK7fxTN+Ftrrult4mbKrqR62wiMMj4BWaqbjTS7+giTNSFF69c
         CTVANYussNVX8MNKUA7RnGJK+WVcNqsKRncpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i1+vPUvHxVX7CorMT16dwDnGoZC3GVefyvnD8I6Z658=;
        b=R+e0D++nCndzjxENo1x8mxB3jJI5Rq7fnPIFnDhK5XsmYM0M2zPrVxYWBETyg+/aBw
         ZSOnsR4UIsncaK8dhdgE61cPebBbddRMUdu4tHL3qRyNOpa4Ch4t7ZX8hqWmpf0zPp5q
         dcecMRpsJoE1CaR4yoW2Pr/WW+pHY+Jc/1u5IzU8J4x1fSziSXKaE453qRffzxZ87fy5
         baslB894QJw+vLV6SxOe8fzD2rtkB5WPYRWBSn47kP51tWIWsZImp9N0luIVOxczqpBK
         PYw4sdaJgc/drlw4YE2P8IH9qZPHT8hjksPtA3wxPu3TAel1X234SMPVsP1qHDJ/VzyM
         3jPw==
X-Gm-Message-State: AOAM53188gxfqouYi96efB/ofOQiBW+y5aPiQYihKkQ3RjvsSNpJcWMn
	QXqMGKghHuRWNsnCGESx3a4mCbXkanl3jA==
X-Google-Smtp-Source: ABdhPJyge6mwE2WkBW5+RdjjaQdvF7IUf6JC2fjkNfVyf+mtmgFikufUKeiEsCj0F3H7NY4PiqFSXg==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr11288381wrs.154.1619272266073;
        Sat, 24 Apr 2021 06:51:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5c62:6d9d:139d:d68c])
        by smtp.gmail.com with ESMTPSA id u17sm12584554wmq.30.2021.04.24.06.51.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 06:51:05 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pyyaml: Add missing HOMEPAGE
Date: Sat, 24 Apr 2021 14:51:05 +0100
Message-Id: <20210424135105.1645522-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb b/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb
index c3025fdc662..db8325f90b9 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_5.4.1.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Python support for YAML"
 DEPENDS += "libyaml ${PYTHON_PN}-cython-native"
+HOMEPAHE = "https://pyyaml.org/"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
-- 
2.30.2

