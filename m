Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.12752.1594996698626334002
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=g0Oib/Nd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.193, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f193.google.com with SMTP id k27so6767469pgm.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xKs9Yq42yNXNKjnNiCBT6Mgwe8sqdO3RqNxLF8yHBRo=;
        b=g0Oib/NdQMwEFukQU6h2OrlDDHd22ESZhyn4HejmAex6XLwivty8m/LYA6mbjvo5e4
         yXzpDml7LL5WFk/L8eF7oOEhnVYsE+UInPpkQ5iyYt/QuSGhDOaRbzJN/F2gw0BE3Tme
         7i5FtmEvbcsj7POpSX9e4mPMu78phBfWqerC7Z2CPsxQ5z7jHeunDy3N2sBSoveKO4fl
         0xBewcTUyamppz/5Etq1lN8IpzIPCNO1q8yGiR1ari7k0MuGIBm6dv+v3hmZ1Aj54xql
         CjREQXK23NixqnpjzL2kziR1mLWTDheK06yiEV1vO7t8x4afGqnuhTuocYoyDGPq8pTx
         KxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xKs9Yq42yNXNKjnNiCBT6Mgwe8sqdO3RqNxLF8yHBRo=;
        b=bQFUDgz/l+yQVpQLazwSQTNuCZeqvJA3lvq4xR3FmQBMZotMeW3ed8NpU7VUNNrn/b
         uHqt5iaxLPJ+BjW9oWkoWqQz0TfOdg+C3QnNTrvfEJBCF1NbOul/gfIx6jiJxfC2gygR
         Bm56kJWpwIg33ubFmOHw5Ef7q/DD8D6LHMIdL9epNonFh5xUH91lecI8wQZNk2SC3nEB
         XVx9fGKUPgZKcjbayYIMbpoLuVWsdMWLRMY2WPIQlW9/0ybeZ+9hFue5eLGbPyUBzVsG
         ApTM/YDoLw7FyAfmpUFhY/aKK11igNYg5KIju8yKi/GlZL/BP6Zc/sXVE26VWeaRYj+d
         C+MA==
X-Gm-Message-State: AOAM5323I2cKYBVkI/DZSX63I18sKxOmY0OfGkHa86/BZLX2TCd2vlil
	o7LAuEpcPzS65bE7fJEx18yTttNPt78=
X-Google-Smtp-Source: ABdhPJxQbXTB9lHJoxPZBVprpUgNe+NjhsJCaGvlWc0bBc7Z/f/01ySl3BcA2vlTUBJ4OAoWcyyvSA==
X-Received: by 2002:a65:6119:: with SMTP id z25mr9278023pgu.52.1594996697711;
        Fri, 17 Jul 2020 07:38:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.38.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:38:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/20] serf: extend for nativesdk
Date: Fri, 17 Jul 2020 04:37:13 -1000
Message-Id: <3b78a39535089bbafbeb1ebd854efe180890f375.1594996440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Jens Rehsack <rehsack@gmail.com>

As an unconditionally dependency of subversion, extend serf recipe for
building a nativesdk variant being usable by nativesdk-subversion.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ff731a25a49c768f04a474438efccb3bb505a898)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/serf/serf_1.3.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.9.bb
index dd4133a45c..6a27f12102 100644
--- a/meta/recipes-support/serf/serf_1.3.9.bb
+++ b/meta/recipes-support/serf/serf_1.3.9.bb
@@ -30,4 +30,4 @@ EXTRA_OESCONS = " \
                   OPENSSL="${STAGING_EXECPREFIXDIR}" \
                   "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

