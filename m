Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.9890.1622618733022789195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 00:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CKbhdo+O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id o127so571316wmo.4
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 00:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y0t2ZVLvFVqFIJAJRUDKoeAxjS1rqg6S76nga6a8cx0=;
        b=CKbhdo+O7yyYH4bH5yBqmSM0swMaR1t6gWBnBcxiYuYGFzWoC5eLN17zFKxaRHeFmj
         ti1jmWK+Dz5MkYYqX/nf2i14VZ2jatIGhAPIPKebj+TGnKn2uGpMjX/cSXEsvrfOPeMO
         0RFIzGDzeJh6grwODKBN/9m2Ea7/Gdth67uSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y0t2ZVLvFVqFIJAJRUDKoeAxjS1rqg6S76nga6a8cx0=;
        b=jm1UvtLPiuX49K7JtQRI0XqV0uxU8LKnYsDqH1RvOuZ9L3OevOmCJXDM0sP01nm5z8
         SnWoTRe07dl/PBWR0bGJvd/083m1omCoEM4k50NRnmobtpQ4OmYGdlInpnCFE2uV/7hi
         NjNxX2H8WA6wsKBnNIKw4gBIPwhrnhIMozrxMgE6gDwUsTgLsoE+CVW6B8C9QJeH9jVy
         2oErrJOGIM17VV4i5N25hjlYj7DLYCqDJ3ERuYgQCV86mZOvbO4kn3NG5efW+2VbIAS+
         SrJgOBG8kxzwajVjJDX/dHwILkJBuO4udR9hmYpuH53+uGFU8B1zlThpTErZ5c/a3fK3
         nHdA==
X-Gm-Message-State: AOAM5325FGrZxiSwdoxlZHuEFPc1sLiPRkXkypLRRlvDph3nYR3RpYy0
	AF49KOlr8cGf0EoJKJwii4wPAiJikPbdsg==
X-Google-Smtp-Source: ABdhPJyt9JJElFIPWSisNLlecaWPNxvsyfuTv96nthtSII3D0NkmuM8Fqt+EoHU2d9n0I4xE2q+HgA==
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr3581576wmj.81.1622618731533;
        Wed, 02 Jun 2021 00:25:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:743:408f:2993:133e])
        by smtp.gmail.com with ESMTPSA id q11sm1052916wmq.1.2021.06.02.00.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 00:25:31 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>
Subject: [hardknott] [PATCH 4/7] bind: upgrade 9.16.15 -> 9.16.16
Date: Wed,  2 Jun 2021 08:25:26 +0100
Message-Id: <20210602072529.2896899-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602072529.2896899-1-richard.purdie@linuxfoundation.org>
References: <20210602072529.2896899-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.15 => bind-9.16.16}/bind9                   | 0
 .../bind/{bind-9.16.15 => bind-9.16.16}/conf.patch              | 0
 .../bind/{bind-9.16.15 => bind-9.16.16}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.15 => bind-9.16.16}/named.service           | 0
 .../bind/{bind_9.16.15.bb => bind_9.16.16.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.15 => bind-9.16.16}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.15.bb => bind_9.16.16.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.16/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/bind9 b/meta/recipes-connectivity/bind/bind-9.16.16/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.16/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.16/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.16/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.16/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.16/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.16/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.16/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.15/named.service b/meta/recipes-connectivity/bind/bind-9.16.16/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.15/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.16/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.15.bb b/meta/recipes-connectivity/bind/bind_9.16.16.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.15.bb
rename to meta/recipes-connectivity/bind/bind_9.16.16.bb
index e362b21294d..27aa6221ba1 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.15.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.16.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "98b6f432d878a7bf8f57eb7b3c28be27278cf6b9989154bfe6c81104b38e7839"
+SRC_URI[sha256sum] = "6c913902adf878e7dc5e229cea94faefc9d40f44775a30213edd08860f761d7b"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.30.2

