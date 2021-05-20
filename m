Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.506.1621543757129875415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZL/CDfbl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id h3-20020a05600c3503b0290176f13c7715so5980770wmq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5+mQZqQevtaGDYH/xhSU3BikBfTgXrEbzDnPR6y1Dhk=;
        b=ZL/CDfblWKGeI06dndonUFH/8kAvV4hNf0chkYZIEiC4ZwyCyW0Jl1Mjao2RzMCWvu
         44HPvQZqgHu47lvlBiHzfjkkwNmzkijOe/PiGS3xRGrspw+eK5aHFasw/io7/CyXXlBu
         IQqBABv9WeXEWk2dGWq3rXg+mYIiva8aHzb2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5+mQZqQevtaGDYH/xhSU3BikBfTgXrEbzDnPR6y1Dhk=;
        b=t0BgrXnvH0ZrJrMwNVyQknYh6OAZWR0zUINTtIfDwIM0vpcoxhVk/UeX5AT+s3zIaO
         G/pj8oqQQgg+nfP3YIljrU7YArtA7uj7rJu1RhMRA8fE6g9K9lX+jaJEtmrYVbh4JARz
         OERfukWscFUHMsoxkwBz39lr4vVqe2qgrAI85eUJyR81ZNYtg4OnIN065SHJotVsWoD2
         94QqIjjT8THDh0ro0lb7LfyKW5XBUOP0gvEdtpGARHabsdqDq54mwUu74/SAl+5B/STv
         82etBFHj1OLn9LvaotCcf9vGbkA+v8aEyqVwbvWgq2iacWSDaXhWVWsW/U8fy/vV6nl/
         XKcA==
X-Gm-Message-State: AOAM531PYV2vadeabZ7QMd2sMP1EOgqd3KBZNbcymxv769SY9k6/kFsi
	O/KDABHjIf7pDD7+8HaDWcZZQaeHIHZr/w==
X-Google-Smtp-Source: ABdhPJxZDSqRVWFUtfj0YQYn6f57csZheyN0BO43NYaTGCNgCEHOjD1yU78TgZQ69I75Vhc4888ESQ==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr5545895wma.173.1621543755595;
        Thu, 20 May 2021 13:49:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:15 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 22/28] bluez: Exclude CVE-2020-12352 CVE-2020-24490 from cve-check
Date: Thu, 20 May 2021 21:48:56 +0100
Message-Id: <20210520204902.2527687-22-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These CVEs are fixed with kernel changes and don't affect the bluez recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/bluez5/bluez5_5.56.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.56.bb b/meta/recipes-connectivity/bluez5/bluez5_5.56.bb
index 676cb2dbb2a..ae0f72b678a 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.56.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.56.bb
@@ -3,6 +3,9 @@ require bluez5.inc
 SRC_URI[md5sum] = "e6c51b2aefa7c56ff072819a78611fa5"
 SRC_URI[sha256sum] = "59c4dba9fc8aae2a6a5f8f12f19bc1b0c2dc27355c7ca3123eed3fe6bd7d0b9d"
 
+# These issues have kernel fixes rather than bluez fixes so exclude here
+CVE_CHECK_WHITELIST += "CVE-2020-12352 CVE-2020-24490"
+
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
 NOINST_TOOLS_READLINE ?= " \
-- 
2.30.2

