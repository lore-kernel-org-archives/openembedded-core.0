Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.5833.1622797841712670682
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sCbm92tA;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id jt22so13410828ejb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3xXnU/zGSg+nE312qY15ygDweNfA2XGW3ZRA/7s+0W0=;
        b=sCbm92tAPYbl1WKX1Gifd8dL5NveVLl8YrkLag9bwhcmKtHDh1XMTrL03nMcahomuP
         gOdROUqaLdV9INlZfcQJRO9mmasZMQBsIKHyd2eYxJuzJVvNbRahQiPdeNkuT7fmQB5T
         STn88/aa3jEIyQ+DBvc82j+0H8kCX89+ZM/TdSrk3ws8eqUGS2H+W8ewQcPzL4nzMT3w
         KiLIbfP3Aq3n9THduyp4yqo1yyHaYlQ6GFtKwAK3QCBOXYmib0ZFetMaeABqo4+o8e4G
         fxOIf0ILthvEY6TDK/01QIcE9V/MLgImNEu9menRM9gc4s97H7un2HPfXX9gf6hIZnk3
         fhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3xXnU/zGSg+nE312qY15ygDweNfA2XGW3ZRA/7s+0W0=;
        b=OEu5r+5pdGcFhS1kxaNW6NyN5sjgUyb1bWoBM+lBhqxmWRmpp5mkZnqRKTDXSQ2N0m
         PW39/5A/M5Fr1gI8uujnQDKRezpQTT10OgDud5uEatTfUk1FQe4lNAjPrUjCyOgtNFsZ
         UecE5t9PphB8yfCiA6d8t46OHmtF64HjmYmnDdh67nUWQrPW/R8w2+xjhpy2J31obWeg
         zrjVkKQ1u601T7XShTIdRDRB7yqvG0Ys5z09RNyn794GFcVI4ohqKUF212hTYjJjQnXT
         hQIKYjpevnpLC1GuKobZ6qEJqDgYriKI3gQvb7O2FshCtZZkCArQwTVjzdu7UYoTN73q
         lvhA==
X-Gm-Message-State: AOAM530LpQXSC6uQJ2e19D0nAuI6GArFvaLE5DJGdZhDdLbvU0IGVXqn
	yiXweW4NDRtDaB+1uBfDrGrt1aQhSm+fhg==
X-Google-Smtp-Source: ABdhPJzBpDLIHmg+ceLaRii9zJWwXXrK1KIwnyyt5sCtz8krYYLhHjh5QIyOjpqMlxfSKgwuKBQIGQ==
X-Received: by 2002:a17:906:6c88:: with SMTP id s8mr3261254ejr.129.1622797840362;
        Fri, 04 Jun 2021 02:10:40 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id f7sm2525152ejz.95.2021.06.04.02.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:10:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/11] perl: update 5.32.1 -> 5.34.0
Date: Fri,  4 Jun 2021 11:10:26 +0200
Message-Id: <20210604091030.1380877-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091030.1380877-1-alex.kanavin@gmail.com>
References: <20210604091030.1380877-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/perl/{perl_5.32.1.bb => perl_5.34.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{perl_5.32.1.bb => perl_5.34.0.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl_5.32.1.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.32.1.bb
rename to meta/recipes-devtools/perl/perl_5.34.0.bb
index 01db924a73..7935a58723 100644
--- a/meta/recipes-devtools/perl/perl_5.32.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -25,7 +25,7 @@ SRC_URI_append_class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "03b693901cd8ae807231b1787798cf1f2e0b8a56218d07b7da44f784a7caeb2c"
+SRC_URI[perl.sha256sum] = "551efc818b968b05216024fb0b727ef2ad4c100f8cb6b43fab615fa78ae5be9a"
 
 S = "${WORKDIR}/perl-${PV}"
 
-- 
2.31.1

