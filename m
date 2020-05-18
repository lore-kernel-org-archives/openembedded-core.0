Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web11.785.1589820542481397856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=S1Sc1he3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id z26so5088836pfk.12
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Mt1KxnoGd7gCXrttLggQQFtFRWuefCeb6UrIDqNzaSU=;
        b=S1Sc1he3hb9gBM+6zPzIEa2PRqojCZ4yoUEaEzDrO6WrI5oYlodVw6eqqj2ArSLcrc
         XULmwUlFZ0wN9xzNEeak22F5b8evm+FdDN3dDXikOhQr9MJvpbEPgyHszCpBAeEhLnkt
         BVERSr2C2vsdiX3vQpnM7m8CF+tZZsh3mwdCfD6r7dzvzeKirO7+UyFYuo/GPsw5tuIg
         caFFISpw2oFhTicuzKe49EbErs+EHKITOwawwVKwtqOQWbaIgMgCvfHP3Ve6hVMfTB6s
         WMjctNylnVBMv/GHt3qnC6gHWw+N7J3ArH7JvSWE61gPiiip4eSX55zYlWIhpFDGnzxE
         85OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Mt1KxnoGd7gCXrttLggQQFtFRWuefCeb6UrIDqNzaSU=;
        b=kLLLfFbByYZHDGtmbTGelrXb56ylL9jjcI98sc2m23CxWS2yny7Rb2WKnRziDQkd5j
         ss0/Cyh9g8X16tkGN+6iJlNWMwauMteNmTB33sBCMDHeC0MKTrKj32QaA0XK2gsiL7lX
         3BdHck/cFowAWbJLIkuDoJWPAGX/OT3QfERYlin0vi7y9ismeDNHUotRH+WawoM4G63X
         50vuf6VphQMee0ajphnAjo6tsHvaKS/6ScVkcGDruD5FsOrUAvvye2rE43DZnUSuheD6
         v/wShnFwImm7aQY2RjOzTuxCqKI7etvOYBh0CdRB24VhMEJdkZKobF1l9FPBWds15Mug
         CXNg==
X-Gm-Message-State: AOAM530yDKXvkEowdN19EikaIMK72oXbm1DK4fthQBk6OEF3jC40JCO6
	7fOZ/F4VsGg41/suZWj3EDoLGFSqttgI3w==
X-Google-Smtp-Source: ABdhPJyukvgZmcH6Ft6tg0KtnJjs4tdsQVRhRuZCAvQ/7bBrm6qBOMIv/H3Pp0i+mgeJ+/7ZqSoy0A==
X-Received: by 2002:aa7:99c6:: with SMTP id v6mr7423880pfi.260.1589820541603;
        Mon, 18 May 2020 09:49:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/19] cdrtools-native: fix upstream version check
Date: Mon, 18 May 2020 06:48:21 -1000
Message-Id: <aecd1239123d6fd94fbae10b162cf8a57eeaf18d.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index b568bb39f6..c08da6cdca 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -11,7 +11,6 @@ SRC_URI = " \
 	${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${PV}.tar.bz2 \
 	file://0001-Don-t-set-uid-gid-during-install.patch \
 	"
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRC_URI[md5sum] = "7d45c5b7e1f78d85d1583b361aee6e8b"
 SRC_URI[sha256sum] = "ed282eb6276c4154ce6a0b5dee0bdb81940d0cbbfc7d03f769c4735ef5f5860f"
-- 
2.17.1

