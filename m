Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.6320.1623744773951475463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GRDLndY9;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id i13so49903679edb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZjzPlCjMNceaEoff20lKYzGr4+lIqKdQQoXZGhpOycU=;
        b=GRDLndY9dWfsF1bRPKJvbYQtrkgJ2qVzDwwCCg6zwzrUXMVbkETPRtsJqQCqqtjwd3
         nAj0oUTBgP2em3TVAK8SN6/HPPWhhmEM28gmCIT22kspCSu3pWNBUF5fta+/wZSbYjYr
         LrXjnDJRbOAPOFKHlBB/rDJ81GS5ncsWtXHn+Axi3tozo110yBfCQF0+8Rz9HZ2g0Fkc
         2WdMS0fJAy0V9+pv67rxwx+gKjHUTq8hu+++GzmxQe47Y6h9wl78VghOv2vppz3iUnQ4
         bqFVBsjySkqLSUkI/a1M3cN0yBERYthCh8sjXsvPTJpmRMpRu8IIzCx/B5w0hU+zxq5t
         G1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZjzPlCjMNceaEoff20lKYzGr4+lIqKdQQoXZGhpOycU=;
        b=QiYAKFmWO5O86iubyGiPBYqOwKSssy16UdZzU73o7BoVFr1Koi0P2cGvCWTRDXdj7h
         kREVuLzSfgE5uXXF03gUVlJ2xdIwKIRSMlEZFSZhpgait1F9OjPFeGF3U0C4sHOBVVJk
         +fQ64/mfdYvyoRDvV5Sh/7FMlee+QMONhmkWa4keaXFFEC0TZqyS6KpbZC455Q0u6C/y
         OSdv17JMX/T6iADtyQn3XZhyQWhQA0jTxtxWK4lT6BbA/qugn4//sHF58Gx1HvOA+5FI
         jPOXNlk1gCaKleMMo9DVzDxj0WCwY2ipfZfnp6XvPtlgmKBZUwlMK1lrAQScEuqiZ4pP
         di4w==
X-Gm-Message-State: AOAM531RPryXaJyD7htIistdbv96ZV5GzrURGWf+BMxXzEFaMETE7abb
	K4ZSojj4iSxOGfSIYvkqyTTbnK86xzoH0Q==
X-Google-Smtp-Source: ABdhPJzgewu3uOzET1RuL9kWBVqynJGebcg30N30FbCJATBZmGNpA7KHvYRwjAhVsoyQcu04YMERJw==
X-Received: by 2002:aa7:cd9a:: with SMTP id x26mr21655552edv.185.1623744772641;
        Tue, 15 Jun 2021 01:12:52 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:52 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/31] nettle: update 3.7.2 -> 3.7.3
Date: Tue, 15 Jun 2021 10:12:20 +0200
Message-Id: <20210615081240.1734087-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-support/nettle/{nettle_3.7.2.bb => nettle_3.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nettle/{nettle_3.7.2.bb => nettle_3.7.3.bb} (96%)

diff --git a/meta/recipes-support/nettle/nettle_3.7.2.bb b/meta/recipes-support/nettle/nettle_3.7.3.bb
similarity index 96%
rename from meta/recipes-support/nettle/nettle_3.7.2.bb
rename to meta/recipes-support/nettle/nettle_3.7.3.bb
index f8f3360086..031500d741 100644
--- a/meta/recipes-support/nettle/nettle_3.7.2.bb
+++ b/meta/recipes-support/nettle/nettle_3.7.3.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-target = "\
             file://dlopen-test.patch \
             "
 
-SRC_URI[sha256sum] = "8d2a604ef1cde4cd5fb77e422531ea25ad064679ff0adf956e78b3352e0ef162"
+SRC_URI[sha256sum] = "661f5eb03f048a3b924c3a8ad2515d4068e40f67e774e8a26827658007e3bcf0"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.31.1

