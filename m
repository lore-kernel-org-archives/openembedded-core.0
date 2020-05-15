Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.15876.1589556737582295403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 08:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VCSnaPhk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id g14so17095901wme.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 08:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aUti9KsSDyuJ4G0dYpkQQX5BmRMCtixvBnWZiXIshkw=;
        b=VCSnaPhk5ujuQeF074dpWNfYyOpjjb+WgbDYIB2o7KdHV5aB7EGZy7hKtqtlDKQmrh
         9FMNuNuCe8u4eJH9RN8BHqcFr1OsS4129ID9SbvIaFCXAlDLRIgEXZhbBw4YLV8SviO6
         DwmnxKZkA8dWDijYMt90nt17TQ1X0O5Kpcpm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aUti9KsSDyuJ4G0dYpkQQX5BmRMCtixvBnWZiXIshkw=;
        b=Pqp48IbGKxJN75pFy1D+83u77p9WFjFuuSfNdTyQHIP9bw4/fVOLUc9X0CQO8NkA/b
         Ry7y/MLhK8VJPGKizh9HQ0lSr7I4Cp+RFCBfBbwh9xUR+p2Ls2i+hT6D7PxdftNjPZ8C
         y513hQI3+v6bNc3paAuOPC37S4F7g8amzJRC3H3cZ3t7BMZHL9qS7rV1zeEkMozBH7KG
         Cgzsvk3DGFsDYjzSgCcIStTExzc04W13+U4TT9dLcXAl167DfEiWDFQ/7SxUNZIho7fG
         TkK1SIqJjqJ/JiTXIZqqQ/erevtSOCXmlJIWPv9wQBkiTl036CvDDPWXFH2DyIJ8HFt0
         hnhw==
X-Gm-Message-State: AOAM530ttcVPB32GEY0IW5LG5B2mG90qUovAa0u9HDluCMQx8RY10hOj
	SqZVAURUrP6U6tYU29QQlbOOK8UAA5I=
X-Google-Smtp-Source: ABdhPJyyEtOllwHZKlrXP20Oq7BsdCe3RiHke4FnsJTqW7ctpN5BwvOReYnQcIO/o8goBlSw5Zy0UA==
X-Received: by 2002:a1c:790b:: with SMTP id l11mr4426950wme.2.1589556735909;
        Fri, 15 May 2020 08:32:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id p10sm4495443wra.78.2020.05.15.08.32.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 08:32:15 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] layer.conf: Move to gatesgarth naming
Date: Fri, 15 May 2020 16:32:12 +0100
Message-Id: <20200515153212.3171648-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515153212.3171648-1-richard.purdie@linuxfoundation.org>
References: <20200515153212.3171648-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're still compatible with dunfell from the core perspective so
that is left for compatibility (probably for the next week or two).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/conf/layer.conf | 2 +-
 meta-skeleton/conf/layer.conf | 2 +-
 meta/conf/layer.conf          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
index a4bd461c3e4..37570aa833e 100644
--- a/meta-selftest/conf/layer.conf
+++ b/meta-selftest/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_COLLECTIONS += "selftest"
 BBFILE_PATTERN_selftest = "^${LAYERDIR}/"
 BBFILE_PRIORITY_selftest = "5"
 
-LAYERSERIES_COMPAT_selftest = "dunfell"
+LAYERSERIES_COMPAT_selftest = "gatesgarth"
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index 5e449a4e4af..cea5c74f8b6 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -14,4 +14,4 @@ LAYERVERSION_skeleton = "1"
 
 LAYERDEPENDS_skeleton = "core"
 
-LAYERSERIES_COMPAT_skeleton = "dunfell"
+LAYERSERIES_COMPAT_skeleton = "gatesgarth"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index f03eb485a38..da93d64e0ab 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,12 +7,12 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "dunfell"
+LAYERSERIES_CORENAMES = "dunfell gatesgarth"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_core = "11"
-LAYERSERIES_COMPAT_core = "dunfell"
+LAYERSERIES_COMPAT_core = "gatesgarth"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 
-- 
2.25.1

