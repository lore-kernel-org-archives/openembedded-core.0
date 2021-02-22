Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.34446.1613997402002212320
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 04:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AgMqY/pD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id n8so18862796wrm.10
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 04:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QyuI1sGtOvNjKqewz4gnvmX0LA8VTQ/ZQ4nnEXyOXh4=;
        b=AgMqY/pDDNcrDVE1/UdW7ZZvnb9OzF/KOQaoHvpnH5uHtjgjQluuf14bx3T1e4RC5p
         cSvMCrmPpwBA1Wefql6bToHPjeUChYo/CQkYYUe7T42XYyijVlBJH+zvCQZiRveIu7aI
         cP9L3YzhRUEdnfAjhTaueD93tErx2CuC5l1Vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QyuI1sGtOvNjKqewz4gnvmX0LA8VTQ/ZQ4nnEXyOXh4=;
        b=kwvA1vwx8ReWLpOle2j3/aOtsp3Srv7TNK5gxhxamRz2U7PTG6/wQBy+ZYhZ52R7h/
         RZ9CBSZ1ZjWndzCGF46H09z9Hjh3e5yUiTMZPuvLYAaeMd8skGMc3NS46izOxjViUDHl
         x4hFgvAoesRyElQajhDkoovn8MVqbHo3sd9pBJSMN+kSLBUhNoR1o+eSfuppexG4pHTw
         d6JDFDkS6gR8Jv7Aips5MQtbsD+Dp+/ibH/5kn8FeHal1jJBS70IBAUpIaM11GDySctN
         48sBXP/nH2ZRbK9VU3gvBL6Uarwal32K3em4U0HpwiJcpGicGum6uE5MyD9thknYP8jT
         SmeA==
X-Gm-Message-State: AOAM530Hbjf923I8+JO0HYYZZ5HL3JYMhDhs376VfkVA+RfPuR3UbeVD
	ScRjt+RXjBFwBrfkbJijZ2NvpNs7ESoR5Q==
X-Google-Smtp-Source: ABdhPJwWjpDYpVfbqPZfSKrJnFChtXistJtTXpCnuLr19G7EL/Ntn1yLCwSmACCdkG2QmXXLK3oOzw==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr6343105wrd.126.1613997400247;
        Mon, 22 Feb 2021 04:36:40 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id c12sm17432526wru.71.2021.02.22.04.36.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 04:36:39 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] python3-magic: upgrade 0.4.18 -> 0.4.20
Date: Mon, 22 Feb 2021 12:36:36 +0000
Message-Id: <20210222123638.3754068-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210222123638.3754068-1-richard.purdie@linuxfoundation.org>
References: <20210222123638.3754068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License changed as there was additional copyright information added
but the underlying license did not change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-magic_0.4.18.bb => python3-magic_0.4.20.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-magic_0.4.18.bb => python3-magic_0.4.20.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.18.bb b/meta/recipes-devtools/python/python3-magic_0.4.20.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-magic_0.4.18.bb
rename to meta/recipes-devtools/python/python3-magic_0.4.20.bb
index 101b96d31cd..be3458a792f 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.18.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.20.bb
@@ -5,14 +5,13 @@ DESCRIPTION = "This module uses ctypes to access the libmagic file type \
 HOMEPAGE = "http://github.com/ahupp/python-magic"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=61495c152d794e6be5799a9edca149e3"
 
 PYPI_PACKAGE = "python-magic"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "5edc6caa39cc62641850f6b1b6f284ba"
-SRC_URI[sha256sum] = "b757db2a5289ea3f1ced9e60f072965243ea43a2221430048fd8cacab17be0ce"
+SRC_URI[sha256sum] = "0cc52ccad086c377b9194014e3dbf98d94b194344630172510a6a3e716b47801"
 
 RDEPENDS_${PN} += "file \
                    ${PYTHON_PN}-ctypes \
-- 
2.27.0

