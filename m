Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.526.1621543750154218327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NYzNfBQx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id d11so18938676wrw.8
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dsaq4UA6/pXKNtanlhqQ4rzo5Pe8KL9TZYmdIqL4U4U=;
        b=NYzNfBQxF4gD6trzZ1achYpikq2aE79nSIOKbSwYNyOLWCB1vAOt4WikSvFSJFgH1L
         AI4whe04rvPXCq5Iv5D3Fr1Y+hjGWjILQZioiOCcQVrgJJ0+hwZaTxeUjXp0jursP/5S
         Sf+6kQKFVevUG+DTY/6YJwgmmKcsg1E/XLQ8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dsaq4UA6/pXKNtanlhqQ4rzo5Pe8KL9TZYmdIqL4U4U=;
        b=DNzhHt2IAN/jrxYXyhyNUSoeOlxwYzKwIXhz3wJCAd9GOWFpcdLdkVsAPFBr2jZpKQ
         uZ4MBGGwmaHEzS7HcMZvp2ftSLLafZaiyBiUoZtTeJHrkYTzfj1UJgfb3tE/tXfm44ME
         XW0ufKBdkEyRl9aJzjf0rJ7dT/ssKJqpP+6yDNaFt9GpW5KeWuY5+WMiUtKf6dtloYaH
         foKX8dWpqUGgBV4ummWHDg8FGCYFUlxKqXqst5HQMd0Nw1I2cvf25gJm15CS4nqoXwSj
         bKHnkMshuhvdAkY275LNcqpRWMl8LghpVX8DDSYd1JE7Jh7yvaqWpbzeFLzR7dVGKnlW
         UcmA==
X-Gm-Message-State: AOAM532fvSxGd/IVXBcfVuYzTnbvjTvv86TmyzUsBXRSXZKd1atGB3rN
	E+uQH9QyqgUSYqAUvmoPfn67bO0mC8BROw==
X-Google-Smtp-Source: ABdhPJx1W4s3rl7Uz96GRkv/LsMlnU8TuuZH405Lgac2dpmPZnmLAgvIpF/ExPC24rrdEVPb5EJjbQ==
X-Received: by 2002:a5d:694f:: with SMTP id r15mr5842695wrw.371.1621543748624;
        Thu, 20 May 2021 13:49:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:08 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [hardknott] [PATCH 11/28] builder: whitelist CVE-2008-4178 (a different builder)
Date: Thu, 20 May 2021 21:48:45 +0100
Message-Id: <20210520204902.2527687-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/builder/builder_0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 0a64c31ab3c..9d5cd8cde6c 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -29,3 +29,5 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session.sh
 }
 
+# -4178 is an unrelated 'builder'
+CVE_CHECK_WHITELIST = "CVE-2008-4178"
-- 
2.30.2

