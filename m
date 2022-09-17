Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CC2C54EE9
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 13:49:20 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.5820.1663422559188452318
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 06:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rq5lrToM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 r133-20020a1c448b000000b003b494ffc00bso1006148wma.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 06:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=13wZTAc/D3Wre232pfOgIp7q2JrhvmjqF780E8y+FMM=;
        b=Rq5lrToMxoPWB6YjikBkFWdDl99pMbM5gsD/JVr6R85R3QXIsA/Ndh/IQ4UXQKvL9U
         krlgKIgqWN+FZxAY/kdvcdUYmaj3pPMqEoSxmK4oivhHh6gYQL8zv36LknEOVjcudmtk
         8Yw4xayFbzYhKIIRN63PavngI2Y2X08joSXDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=13wZTAc/D3Wre232pfOgIp7q2JrhvmjqF780E8y+FMM=;
        b=UjpE7ZfxCdsGjx9jKlUoIqWGl1zTVr5HG1IEeW4laa5Ujq043ed7LEz6Yty23TLFG4
         79xE2pwKnlydM9B7zNo+anN82RntA0PaOo8uJ0ib/iImnXzGyebrmOacs8Ar61NW3zeA
         rvqRZMOekakXseiEBElHUciY9cR0hE2WiCANcHbjmvkDZscAOB0xnACcg35QIlbFFMio
         PHq7NQhe/ynBhC6t84gA6zsVwVeTThYCknYIbaIqo7Uleh12ptuLeC1UOH7OVhPdfqJe
         /ncEueUCSoJj0VepcawRdMAgFjizhNFfsrixw/FFCWybSY/HGw5fpdU4/qpIWnrUZW8e
         11Uw==
X-Gm-Message-State: ACrzQf0AqnxvM33vXwoVe1ixr3bq5Z4XFJx8QjEN2HpbCJYhOKNQO69/
	cR3CG1KmTF4GxbiUIlVUHEnnBadDy7NehA==
X-Google-Smtp-Source: 
 AMsMyM7nzvRszhUn+fDZ1w1yLEwcHzXYxuDOkvRfW1zS9Sfxd+6h8wepkjnUvNLzh45Tf1bxcVcZXA==
X-Received: by 2002:a05:600c:35c5:b0:3b4:bf50:f84a with SMTP id
 r5-20020a05600c35c500b003b4bf50f84amr4469523wmq.22.1663422557201;
        Sat, 17 Sep 2022 06:49:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 k24-20020adfd238000000b0022ad393ba3csm7426679wrh.107.2022.09.17.06.49.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 06:49:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] python3-certifi: upgrade 2022.6.15 -> 2022.9.14
Date: Sat, 17 Sep 2022 14:49:11 +0100
Message-Id: <20220917134914.1299532-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 13:49:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170830

License checksum change due to a url change, license itself unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...hon3-certifi_2022.6.15.bb => python3-certifi_2022.9.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-certifi_2022.6.15.bb => python3-certifi_2022.9.14.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb b/meta/recipes-devtools/python/python3-certifi_2022.9.14.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-certifi_2022.6.15.bb
rename to meta/recipes-devtools/python/python3-certifi_2022.9.14.bb
index f78409b1772..117a32b1d45 100644
--- a/meta/recipes-devtools/python/python3-certifi_2022.6.15.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2022.9.14.bb
@@ -5,9 +5,9 @@ which ships with the Requests codebase, and is derived from Mozilla Firefox's ca
 HOMEPAGE = " http://certifi.io/"
 
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=67da0714c3f9471067b729eca6c9fbe8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3c2b7404369c587c3559afb604fce2f2"
 
-SRC_URI[sha256sum] = "84c85a9078b11105f04f3036a9482ae10e4621616db313fe045dd24743a0820d"
+SRC_URI[sha256sum] = "36973885b9542e6bd01dea287b2b4b3b21236307c56324fcc3f1160f2d655ed5"
 
 inherit pypi setuptools3
 
-- 
2.34.1


