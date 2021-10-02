Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF12CC433F5
	for <webhook@archiver.kernel.org>; Sat,  2 Oct 2021 22:18:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.16204.1633213088654199814
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Oct 2021 15:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xel/12GO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so3207452wmg.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Oct 2021 15:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BDZDjTU0ZA0I9+HoZ4hhGe97bR441dFEi6YniCtYKrQ=;
        b=Xel/12GOjVM57vE3EQ0IvpJazLa0v909jRWsimrw8j9a7VCNyO6SQ1b6fA8tJh+8mO
         A/Ha2U8g7kjygUJkF4OZcCcyZW3Fgd/L0I8tviQOhnXvUtSBCXRXuI7kpnCXn8Vpy449
         fn39QEsh25fBgTCU9g+z95K0J1k6lrlinKqNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BDZDjTU0ZA0I9+HoZ4hhGe97bR441dFEi6YniCtYKrQ=;
        b=0ewdiXKukaU5jEVxQWMSuSKDZp6gv/9CiTPbLUpZpBb6WvKQ1LGR5W7PVy5+vVjZxo
         t2pvIttTW5ED14PA2iCHB1GTagQLQhP9quCSiOJ5+JVG+f48JSF2IQtzdeqo+NFONzbO
         eN1JQw8CInrLlQmtyNjj0/54VwLTb0ngcF8XdhKNuUgdJFseuP7UKxoO+Uqh6kueQzoi
         4aYfErpTJ584qSBtCPX0mXxI8Pm491vG5Tqx8nLYNg/AWMJHOOXUPRr94FU227AD3lee
         XXxwsrx6f47HW3+WBKH//zIxHBJ6F5YUsk2Xp9P2Bvf/jZdW3qchCbc00FjPFoI5y0I/
         XHZw==
X-Gm-Message-State: AOAM5326YUtXxpQbn7xOgyhpQJcqg2ZyTjo/AK3POUcTUtV2glh4nXvW
	/P2syvc8Qc/46f30/7DnxM+aYG18vSv9E+Mh
X-Google-Smtp-Source: 
 ABdhPJyF5+Lk1m7bt676G9cLjCUHOkn36fjJWIECLsm4fCqpyjNjqhJNFNfYO/JUl0pVux5Atkvx2Q==
X-Received: by 2002:a05:600c:4e93:: with SMTP id
 f19mr10952796wmq.185.1633213087116;
        Sat, 02 Oct 2021 15:18:07 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8657:7fac:b2bf:59a6])
        by smtp.gmail.com with ESMTPSA id
 z8sm11172777wrm.63.2021.10.02.15.18.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 15:18:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] python3: Drop broken pyc files
Date: Sat,  2 Oct 2021 23:18:03 +0100
Message-Id: <20211002221803.2283254-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211002221803.2283254-1-richard.purdie@linuxfoundation.org>
References: <20211002221803.2283254-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Oct 2021 22:18:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156543

The underlying py files are editted so delete the now incorrect pyc files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.9.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.9.6.bb b/meta/recipes-devtools/python/python3_3.9.6.bb
index d09943f891b..8a638b142b5 100644
--- a/meta/recipes-devtools/python/python3_3.9.6.bb
+++ b/meta/recipes-devtools/python/python3_3.9.6.bb
@@ -164,6 +164,7 @@ do_install:append() {
         for c in ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
             python3 ${WORKDIR}/reformat_sysconfig.py $c
         done
+        rm ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata*.cpython*
 
         mkdir -p ${D}${libdir}/python-sysconfigdata
         sysconfigfile=`find ${D} -name _sysconfig*.py`
-- 
2.32.0


