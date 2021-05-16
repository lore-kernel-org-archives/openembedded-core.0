Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.3499.1621149670821052336
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 00:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FdwteSrd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so3365232wmk.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 00:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7zgBcdUuoeCwTq/Rv93y/OtcKstVdxMGvlEKGzUrgAE=;
        b=FdwteSrdN/u5E+YGY8MI4FLbyhHEjKJ+9prsutaY7Csn5wP4itkzt9lhzuqNHsXVDa
         ohmT9zTiyj0FkajdsfB1rjPj1NFQvzGA9BFg/gPFMFx8e2hMptFo+hv73Ly/R5O2wMbB
         aRkGTQbG/6pL/2ZMLe2ohiB6zUUTHROsjg5AE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7zgBcdUuoeCwTq/Rv93y/OtcKstVdxMGvlEKGzUrgAE=;
        b=ScvrTFreJzqumbWSkKJPo8MozKQL7rPxzttNTmpX/KllVZLEv6BYpW4o6PZOO4CIle
         Df+DW9z99FyXRFcapBxe2YRI/swEgrPVpylgVS+tDvGa7hOE+Mz5ugVXBE+gj8TGZU3h
         R7i2k/6Qqs1s5u80D2Wicc8SjI/ht370G3mIeBqGxvdaWVGaiJxfM1FAGrFNsjnEK88z
         jUDNjPkL8DbM73hp1P4WfV7EIGZXFmjHwsCPQejmISqVnfRhys0hb+/CN5GdWuWliSMG
         vjTMykHOHy2LqY6YR830ufbiXjc+p8G5uH7cXQwsDHLXVwxXLdp0tNJv6pSQcMQudODe
         /Qqg==
X-Gm-Message-State: AOAM530hi+ZGUL0srmVGOhNC9Fn7owsthbTDQByj0PI5uQhadkyFhc2r
	a35wbzrmMVAT7Dn8DUVWc4rFB+y6AOUTFA==
X-Google-Smtp-Source: ABdhPJyS9P252LmpXTnAuy3V9XdwbezE0Vl/duY10EhfmzCxEz+pmcRzWmTAlmYJc/VF5tA3dPpkZg==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id l15mr17370324wmq.143.1621149669368;
        Sun, 16 May 2021 00:21:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:22d7:8af4:80b5:c062])
        by smtp.gmail.com with ESMTPSA id t7sm5718810wrs.87.2021.05.16.00.21.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 00:21:09 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] lttng-ust: Upgrade 2.12.1 -> 2.12.2
Date: Sun, 16 May 2021 08:21:06 +0100
Message-Id: <20210516072106.2379894-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516072106.2379894-1-richard.purdie@linuxfoundation.org>
References: <20210516072106.2379894-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/{lttng-ust_2.12.1.bb => lttng-ust_2.12.2.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.12.1.bb => lttng-ust_2.12.2.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb
index 67b53cbbba7..e340ff34600 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb
@@ -33,8 +33,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
            "
 
-SRC_URI[md5sum] = "11787d1df69b04dd7431614ab43b2e12"
-SRC_URI[sha256sum] = "48a3948b168195123a749d22818809bd25127bb5f1a66458c3c012b210d2a051"
+SRC_URI[sha256sum] = "bcd0f064b6ca88c72d84e760eac3472ae5c828411c634435922bee9fce359fc7"
 
 CVE_PRODUCT = "ust"
 
-- 
2.30.2

