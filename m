Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.4376.1612602261726844914
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 01:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MEfwhlAb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id r7so827901wrq.9
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 01:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v02n8dlas7QnJaTrPZ+WwRVFZzVbk/shhsgFzvq03L0=;
        b=MEfwhlAbYJ9pA9sIiIeSmf8Xwu83cLHxUr5WHaiE18Pn+Pqb8ik2VO1ENVAFsQW3JE
         Lv6YxBD+xMgV+uIjC9bJGrJ9T/1gp1zBqdumtRZ3xtHuy9nMCxelLlrMU6rWJ/AGYefL
         DqQBrAdwvfPLpelkULooJo+esj3iZUGe3SQ3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v02n8dlas7QnJaTrPZ+WwRVFZzVbk/shhsgFzvq03L0=;
        b=EEIHSIA7VSp/8nbp2F7w+2o87po88kEVYANITqP9OeQ8tQUERO5wNO6VWjkLqdIL18
         pfT6588c29prdBtyzVc+rhpxzgUWWJKD4clSGBe/z7rxlEopIrRSmmDcKddhTHIVOMLq
         BjSTgAqCE5/pf0mwO6CFtcXDjVW+NOnU0jYPcxfuEJqzbugfVVvy8R0xo3hoLSnxSohe
         3DhtbpNVm7SpeXWuQFuuukeMp/7ZPcMVkDDRND1ygyn0sB5oXQ46teH7pV016Ma/ZzhW
         z+NMfoi6AY/c3PO+0KyPnBlIZMPhKW0X169iT8cWYUPmVIqelu8OUt8XbvgUmAYW+fg+
         8U0w==
X-Gm-Message-State: AOAM532ofm8azAVjH0I7+lx01RPZY458r2hN/2nkVjKryXIeWwv83fBH
	F3u4Ag3qEP/uSWl6I0oUIJRVx5uG4cyvBg==
X-Google-Smtp-Source: ABdhPJzdVnxOU9+JIXyRqoy1LpaSyOLCP2huTCHk52WSxw1954SNmg65JKHKTACnGaEgiVvJXG7zvA==
X-Received: by 2002:a5d:4a50:: with SMTP id v16mr9386255wrs.241.1612602260332;
        Sat, 06 Feb 2021 01:04:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:be75:a088:9c76:71df])
        by smtp.gmail.com with ESMTPSA id o124sm11332678wmb.5.2021.02.06.01.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 01:04:20 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 08/10] autotools: disable gtkdocize for now
Date: Sat,  6 Feb 2021 09:04:13 +0000
Message-Id: <20210206090415.1707868-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
References: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

This breaks kmod, so for now we can continue to do it ourselves.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 36eb56c70d9..9a328c22800 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -30,7 +30,7 @@ inherit siteinfo
 export CONFIG_SITE
 
 acpaths ?= "default"
-EXTRA_AUTORECONF = "--exclude=autopoint"
+EXTRA_AUTORECONF = "--exclude=autopoint --exclude=gtkdocize"
 
 export lt_cv_sys_lib_dlsearch_path_spec = "${libdir} ${base_libdir}"
 
-- 
2.27.0

