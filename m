Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.20665.1599740596278162959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GR1+lD22;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id y15so5607961wmi.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zbkOIvkjaJ8kk7SCRm9traMrXgUkh1SCZwO8RilInck=;
        b=GR1+lD2230Rcvmru9XH0kd9ehwqrWnWbRi4W2hezB4LY4lbzaaRIJSCxf/armM4LSc
         Eg1P+0Xf/jlVgU7KER8K9YcCS5409A/1ZRX22LvFGzUccvmOMO1S7wE1De0FelOVnpWt
         43VuzIHXYbn4rYYEHBxZpj580aXlBqwujnDmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zbkOIvkjaJ8kk7SCRm9traMrXgUkh1SCZwO8RilInck=;
        b=UgiWgSqRWG1pGG5m6BSlACmM/0W+YAZ393ji+0zXTSmy2HznXSoB6f4a7ywA5XTSO/
         e4jCqpuTY9V+QzCeXFQH1/kVM8oOl8hxzxiXTEKQWnW0+TLeWGI3TnueHMN0NbpI8U5D
         FgqWRsgOVQg6ABzp9tLodccl0BWGH6j+UDxo8dB+zARO+kXElzWRFuzdHzbQhe6PcqPO
         LTRLI/USq2lHw8HbZ4w7RWQItVpImAZqSn73AvzxJARa8ikEQWHk7xSRreJFw/4u5IIK
         eyV7Y8zlPoT7lf5OfR7ayzs5iP4mEVOvK9uH4cInHJGWsCl2GFoFEozOk3FGkz3c1V4D
         PHOA==
X-Gm-Message-State: AOAM531kiUbw9UwlCN2/vX6RWX7gTdVKHc/SMpR87n1Hy1kT4CH3xdPz
	PIhMUUpsu9xrSzHHUfcUMBtUfN2QFca+Fw==
X-Google-Smtp-Source: ABdhPJzWmnOWd4pT8s0UkqNT9bVYottHzpyfSjrxUlKFYOpd+QTVE+BgbeI0f7ZWqKL268UXzUQDBQ==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr8592701wmh.71.1599740594522;
        Thu, 10 Sep 2020 05:23:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:14 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Liwei Song <liwei.song@windriver.com>
Subject: [PATCH][warrior 09/22] buildtools-tarball: export OPENSSL_CONF for openssl
Date: Thu, 10 Sep 2020 13:22:53 +0100
Message-Id: <20200910122306.2040194-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liwei Song <liwei.song@windriver.com>

export OPENSSL_CONF to aviod SDK openssl can not find openssl.cnf.

(From OE-Core rev: 0aaf3dd17dcde959e9c0d62543cb91c9b33551b4)

(From OE-Core rev: 63d8569b2c9f66e8123e2672a7f8fb8e7cc1f0b4)

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

