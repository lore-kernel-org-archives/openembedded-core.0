Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.19125.1608974885005379802
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MMAf2Pyd;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id cm17so5579363edb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gWgBV87oBvZoJVils9kgn3yUDvTqwIiqbu65o5MhTyQ=;
        b=MMAf2PydJbRkjjg7Q3zhX13YyS2XaXd2FAQ+UYZhKAXnk2oiUSfFRYOKzFQG3M7TOf
         gW7r/51ZVgXrjbmTxz4SQr8IlnkwaitsbnftNKGRWblrO652iH8KbM3oqTgbQ3PFyAD+
         k4pbZXyn5ZzQTiFFOUouTyfMCX6+FEd5t9wPL4zQxdLS52/zN75U3BeKUnEtw6fKn2JE
         5VyCX03RDtOn2VCAMGxwRNx/lOMaUmt9qXck8UP3nokSA1pB/0UhzTwbXg2L/oPuqAoK
         4CqXkjKhDJtPNfnD1fm8RkgQW9xugMlNEgKBLBjF9hWhfsE5wGdGnWbU0Fpb49ihEOsN
         gX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gWgBV87oBvZoJVils9kgn3yUDvTqwIiqbu65o5MhTyQ=;
        b=e9B9uddCeQXckh/HBuucLiloLVwsS627o9mU1PhBYeHgyE9g1bvj8a8P04KILjT+Rj
         KTsEdxsOp27K48h14HJY1FUJM3gOmDNgILRO3A6wR8nE24/6ohNJ0uZiccHSjyfx+8AT
         8CEz3HuqFrfhKUj4NSr852ql4HuM3VUuYepHumpzlIJXIrdDKXIBnsuAgHdGAQVXypxN
         qj9ToCHWZr28iFoz3KkSRpfwo78tCwuKdE6g4rjAWXXvwjNOjCVbQgh2kENcAQFdpY2m
         YmlLnEF6pav7z1UPtAV9Ufq1JoTTN6qj4j4lp1XHpGng76/abiwmxJXdkLH3nCflEMti
         7Ogg==
X-Gm-Message-State: AOAM532lZeRHbuaki4VQyfP+RHAAgT3u0Pu91Guq9zqdYx4n+nDVHVOk
	DoS8zCf6WATOk779C7s8ogzKx04umAA=
X-Google-Smtp-Source: ABdhPJzjjsDKSkL15lCoArZn/7HIPpNbyiNik/3TRY68RkP9ipI7YqggYNuQAHo3olWqGqZYTrKCZQ==
X-Received: by 2002:a50:bb44:: with SMTP id y62mr34703066ede.103.1608974883636;
        Sat, 26 Dec 2020 01:28:03 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:03 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 27/48] sudo: upgrade 1.9.3p1 -> 1.9.4p1
Date: Sat, 26 Dec 2020 10:27:11 +0100
Message-Id: <20201226092732.52323-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/sudo/{sudo_1.9.3p1.bb => sudo_1.9.4p1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.3p1.bb => sudo_1.9.4p1.bb} (95%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb b/meta/recipes-extended/sudo/sudo_1.9.4p1.bb
similarity index 95%
rename from meta/recipes-extended/sudo/sudo_1.9.3p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.4p1.bb
index ba61a7f247..040130b49a 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.4p1.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "dcb9de53e45e1c39042074b847f5e0d8ae1890725dd6a9d9101a81569e6eb49e"
+SRC_URI[sha256sum] = "1172099dfcdd2fa497e13a3c274a9f5920abd36ae7d2f7aaacd6bc6bc92fd677"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.29.2

