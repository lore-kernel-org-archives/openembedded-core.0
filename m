Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.12801.1614955677880270283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:47:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YEt8rhid;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d11so1514222plo.8
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GdStOt95QT+pkEKlNDItUr9f95QPzMx81n6mrreq4sM=;
        b=YEt8rhid+s/f6hgWadCTDTniZuVGj37hZcSKdaAX8kbuaAkjZvCDEYnhSRQMOisw1H
         IoP68Ghgo0pNFzSO4qwlY5NVqEuK5G5W0wTNjM+jChfKWOTBhtomQUrYz0ybZBvl+ejY
         ft9wGd2RdRMYSl9Xcn8l0cmKKi+AtG+cytzUDdjUISJN0Q5UUUyRbktkiA/gykNKcQ3s
         M89RcNThEmNuJ9ofeMweJImOJ+8s8vOYJ5SPy6z+Ewaek6/6//v5AJCVf110nhBosBjc
         OPnUhGk23bpQpQVfQHvG99vwwHdXt7cuWoCO0VpfZvBUYSMM/gjUeA612ZMZaLWCteP9
         jQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GdStOt95QT+pkEKlNDItUr9f95QPzMx81n6mrreq4sM=;
        b=F9NUlQbrj0GwSAL9qlC7zZbJptZOBsnEnqmTQbQpVtrX8ATUAGty12WNe0t86+5cRS
         WWqS2/eOkbV9+ZH1eqvnGndFfFTy6KS+WHfcLki2NRoP8fvzikXyJi8vL0dKcahqt2bC
         Fnly5GwxYPkkPLAz22n8RARAlEP7jjNNMcNgiO5VB0UlruogoVEApB+5AWYP3j0KUus7
         cta8Kx9ESDfOUBHHw7KzbLsXQrqePa5mNQZ+MYXeoDwYPdAOXEqU+w54N2RN9XJwvKgZ
         YTEPDd2vb0BmLjdoYVgneUQGZFNbBJlF8QQk7gwagK13sGrscWtB3j4v9jBGILsA97m3
         zKxA==
X-Gm-Message-State: AOAM532nNlRIBxcVcjP0nzHA0JnbRYqYQ8/dAbGNB9ym/mbsLRtDmYwe
	ubkbWE0kLIONP4NJJJWIH5uJvOF/4yXoj8I+
X-Google-Smtp-Source: ABdhPJxAZlQ6pNSePe99rtOODqLfgsWu8LZDOqqmkX/9R9pAisX/+oyczNEYqRqnlyPoiRqQzO9aGw==
X-Received: by 2002:a17:90a:e2cb:: with SMTP id fr11mr10925601pjb.2.1614955676885;
        Fri, 05 Mar 2021 06:47:56 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.47.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:47:56 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/27] populate_sdk: Add directories to PSEUDO_IGNORE_PATHS
Date: Fri,  5 Mar 2021 04:46:20 -1000
Message-Id: <c820176245e76e8df384f96c3d4ad5bdf596f5ae.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Some paths used in sdk construction shouldn't be tracked under pseudo
so list these.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 21621e09162ff9e8014a1cfba78d0f2c3746202a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index dea272c441..6954237596 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -178,7 +178,7 @@ do_populate_sdk[sstate-inputdirs] = "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-outputdirs] = "${SDK_DEPLOY}"
 do_populate_sdk[stamp-extra-info] = "${MACHINE_ARCH}${SDKMACHINE}"
 
-PSEUDO_IGNORE_PATHS .= ",${SDKDEPLOYDIR}"
+PSEUDO_IGNORE_PATHS .= ",${SDKDEPLOYDIR},${WORKDIR}/oe-sdk-repo,${WORKDIR}/sstate-build-populate_sdk"
 
 fakeroot create_sdk_files() {
 	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
-- 
2.25.1

