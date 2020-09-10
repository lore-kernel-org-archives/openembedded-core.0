Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.20451.1599740690896168169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X6CHieWF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id a65so5424266wme.5
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Df6Nf632Twjl8d3AbHwCHUCtcC/CR8LQ8AsnhU2WkeA=;
        b=X6CHieWFvuzqEsBJihd1gQwSE4vj0NGhzD8JYJVa2gWNxTvp/OpEiyOi0Ad3S2BQpA
         wVOFmgGuh2WvJFmfHeEl260ftU2ioQOFr9tbjHuku++Sn9XPN8oGsAsKpIexSrcK6iIf
         7jh7la3I2RkaxFzbbUcQXtqg/suRODZLL/+/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Df6Nf632Twjl8d3AbHwCHUCtcC/CR8LQ8AsnhU2WkeA=;
        b=dBAe4IhpoSyY9nyJGtiahGU+i4K4Ni9N7bpNn+j1A0LfMm2LrTOVbviBpjN78D7gXI
         N/HP0D7L48ajdCEIP6CJ9F7Q3o74SD2WUhnX7EAZiRztxE9ongsh4ztJJ4DcLA5SBj6b
         DOXM/ECfNvhSg2xH+y/BY/5tyH0NHNkT8J0uyQMpXlm+guGxeaS2RA+d95lAZLuJgVaw
         AmjkiJC60VRu2VaQ+kEaLdtXZMCmWV9/vjC95OpnaEJTWQO3OYdJYgicdPVaNqw+v3e/
         I1h++eu4pul+JH7McRzXhntdTdTok580ZLzj+t+kNaFPZp/rk2oZ3aIhpoe2/A31tD/M
         uGCw==
X-Gm-Message-State: AOAM531VieiLpTK6PHcaBS188eA3sJNfEs+xO7sL6LuiTXGFUNSJbC5e
	vOPbIvkBcfZJsVwb2w0ZA/uGsL8ENavFrg==
X-Google-Smtp-Source: ABdhPJwG3XHun5OU82ztuFp6cBTESw3PIiH9Nakan6GfOSBg5f0cHPEH+NF3alifA0Y26OYwfEWDwQ==
X-Received: by 2002:a1c:a90a:: with SMTP id s10mr8232163wme.11.1599740689133;
        Thu, 10 Sep 2020 05:24:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:48 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Liwei Song <liwei.song@windriver.com>
Subject: [PATCH][thud 16/29] buildtools-tarball: export OPENSSL_CONF for openssl
Date: Thu, 10 Sep 2020 13:24:20 +0100
Message-Id: <20200910122433.2040293-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liwei Song <liwei.song@windriver.com>

export OPENSSL_CONF to aviod SDK openssl can not find openssl.cnf.

(From OE-Core rev: 0aaf3dd17dcde959e9c0d62543cb91c9b33551b4)

(From OE-Core rev: 63d8569b2c9f66e8123e2672a7f8fb8e7cc1f0b4)

(From OE-Core rev: e733a5f3b0e3c3b8a830db5ae99b3fc6b7e56921)

Signed-off-by: Liwei Song <liwei.song@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index eca9f1c0e1f..95ebda7fa15 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -72,6 +72,7 @@ create_sdk_files_append () {
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
 
 	mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
 	echo '${SDKPATHNATIVE}${libdir}
-- 
2.25.1

