Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.8132.1630503939098325765
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sm7vPe9S;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id o16-20020a9d2210000000b0051b1e56c98fso3489868ota.8
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5gUEQpBr3SLTVMzBiNoK6HeS21JtuAjlYowPXINMilo=;
        b=Sm7vPe9SZwkh8wv7eSXRPD1sa3lRCBfBcqMLEifVLpPc/uwdGy6yrcUoGwojgmb7Tn
         +aisOndTaORfU45xQfDEtVqfkegs4msXvgRvrwCtdxYI+XkZWNoUNLBEoQXUTJ+LV0ci
         kyykQcvcO5Zfl3cLOUz7QIaMzKGmZ/oJNyBXbQ7tU3/hEjRo/RAwl2akahXiMD4T+LS3
         PTPpHhFwR6LR/KFDZ4refvO4CPi1NR4rV6EUzE1XzeVhE/SfuHxxJTsneyEMMma18VNJ
         Kky05cxETg/6RgcoLtx2y2FJUqQmY9EBTrjC+7iXbad4MfO1BMoFZ6ImlRBUWs+cTxHZ
         Q2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5gUEQpBr3SLTVMzBiNoK6HeS21JtuAjlYowPXINMilo=;
        b=bjPnLXDc1kqdznBmmq7J++3dmTGmWwD6BxqL8Cs1Jox64M1RJv3U6qB5rB/WP5iO7q
         i1gD0vUsV/PGz7WBskWZclXWiq8TWZeDsHeP6FsNUZiE7fOOvTiSp67Ntb/H26Mtzlqm
         p+i1X9OqQRN6yN9bPKMGFecL4pDyNHqceDI8XHu0ZgqoTgfreWCu7Ew2g36JKI6bX7Ap
         5ooogA0vwev4pacpI02ryoeJeV/qQLFCP9hVlSAowhmbcNLh1DfvAYJSZmoSMUymze98
         MH2opu4p9VHLTcb9lhnaZskXub4wGJQ+wQxkIHoySK/RfRunkgpvKsKMtyGkDc+2E572
         H2ug==
X-Gm-Message-State: AOAM531jnqssUml4Ww5h+7LCKkwqKekH155iZFIVNj5F4nxJOledPamV
	ddwf76GP6Yt3N2gAfPEeq0zdqayQjBc=
X-Google-Smtp-Source: ABdhPJw8vTABDlUewQZCLetTm7Jv9KzJcKM2Jh0XfmPFVyhGCyfRuDY8BlLiumZ3ODPmico8GURrGQ==
X-Received: by 2002:a05:6830:614:: with SMTP id w20mr29438156oti.145.1630503938233;
        Wed, 01 Sep 2021 06:45:38 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:37 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 20/31] glib-2.0: Use specific BSD license variant
Date: Wed,  1 Sep 2021 08:44:59 -0500
Message-Id: <20210901134510.29561-21-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 7528337456..a34776b083 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "https://developer.gnome.org/glib/"
 
 # pcre is under BSD;
 # docs/reference/COPYING is with a 'public domain'-like license!
-LICENSE = "LGPLv2.1+ & BSD & PD"
+LICENSE = "LGPLv2.1+ & BSD-3-Clause & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://glib/glib.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
                     file://gmodule/COPYING;md5=4fbd65380cdd255951079008b364516c \
-- 
2.32.0

