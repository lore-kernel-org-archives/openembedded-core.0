Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.11117.1632141986102844764
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KRBDqbvh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id x6so29279977wrv.13
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bPxToHsKAQkkBvSbYR3nCAUM0IjZaWfgsHE+8fR5GOY=;
        b=KRBDqbvhE7uaRpxTPMjIARqFeUMshA99ceqGcC13j0UW/66WS8G4WgqbULdZgQ+T/h
         LI2rs7Nrr5MS5Dn2oUsB5lmUnPTEARANW0YWizAPjr8b1nscH8BgEuDux3SO5IFCnpz7
         ujuAM3+UsLdGxoaEXoNXl+RYSmZsHfVHnD5hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bPxToHsKAQkkBvSbYR3nCAUM0IjZaWfgsHE+8fR5GOY=;
        b=u9aSevGeizHGmmlMAr354JXMPZ8zTBgBtqWfi/PGjAC8ukAQ/aT1YOfmEfW9f17pf3
         fYGyEMQ92V+K2HxqPJGLSF2Wpw5W2zlaHCQGaLmd0LBcfmGALwbhDFgl/Vd9WMN0aRsr
         aAHJjUfKCfqHHsnFq4zOZF9Ddf1NL55YBJR3tqEZeoY3Lv2f56MQKLcAijr8wlraCvpn
         OHBqAakkIXhiZlVbT4DC4z0nNDKQG3d1kMitpw0Lemx396JJJoPBD8FXvNTW4/5rij6g
         rZM7v62A9kmtvbfoDiakYKcGK6UqNyOjlE+lFiCM4CBNITOcOLex5duZw7LMfVIfR6pP
         H7HQ==
X-Gm-Message-State: AOAM530OnucE/uOyuz2fFnFQxOg+LaNQl6Eq3bZ6v+GNgsOqbt3ILB0z
	rZ89zRzJvbiqnlGLU4jCptyLvSX5c+no9vMM
X-Google-Smtp-Source: ABdhPJwhjVBNqpR3fmdB5ISgiNsQEL8sUAevdh8/1kSIpCzkZT2tIpuTHJOqJUkIxP4hkJd1F+uYZw==
X-Received: by 2002:a1c:7310:: with SMTP id d16mr24410600wmb.30.1632141984554;
        Mon, 20 Sep 2021 05:46:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id j21sm15773514wrd.48.2021.09.20.05.46.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:46:23 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/14] sqlite3: Exclude CVE-2021-36690 from cve checks
Date: Mon, 20 Sep 2021 13:46:10 +0100
Message-Id: <20210920124621.1576702-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issue is in an experimental extension we don't have/use. Could also
be windows only.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/sqlite/sqlite3_3.36.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.36.0.bb b/meta/recipes-support/sqlite/sqlite3_3.36.0.bb
index f5d75e8e4c2..30c9445be1a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.36.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.36.0.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "bd90c3eb96bee996206b83be7065c9ce19aef38c3f4fb53073ada0d0b6
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
 # This is believed to be iOS specific (https://groups.google.com/g/sqlite-dev/c/U7OjAbZO6LA)
 CVE_CHECK_WHITELIST += "CVE-2015-3717"
+# Issue in an experimental extension we don't have/use. Fixed by https://sqlite.org/src/info/b1e0c22ec981cf5f
+CVE_CHECK_WHITELIST += "CVE-2021-36690"
-- 
2.32.0

