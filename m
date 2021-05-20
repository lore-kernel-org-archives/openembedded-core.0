Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.522.1621543758487397879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AbUDWoME;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id f19-20020a05600c1553b02901794fafcfefso5548637wmg.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jPN6wVL6Jho7I+i/0NEHGFa7J7QByPwJsIlo+W91uqI=;
        b=AbUDWoMEW2Oq+aQa2/DRNFQaqGaePPpQVYyI6lxndWiLGvvPA4vlE2renFcfU6306g
         DJLEKJ8Twbsh2secIUiJmwr4T2HNH8PWKnfJQEie/xI/AosEmMN5X/AvLzCrg08OvHL1
         IZ3d5F17WpHh1u5pEFQ75JGhVzl0nYwPw0Gic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jPN6wVL6Jho7I+i/0NEHGFa7J7QByPwJsIlo+W91uqI=;
        b=eQUoVwS62Rt2lbx0Fpkd9UTdRE4ytY6iLEYWxz/3h7vrqHspy1Yq8EjXQsTxsX1hz5
         S3tzu9dWPU4MRHBj76ytireWVWjJBmVE3eDXEDYviIKxQ52Z2S+mUnJ1GRJjm9OACtOV
         m2dgNHjeXaHdy6ZP1/PigdDTJuMd3J93h9x6MHnxA08KVFGJOT4SViL54zPlCHWCWcFu
         /8F8TOs7PQzaRxBfgxUfuSwXTM5fEUUAlucKxcGmnmjTlzbXL6Yzoxw1H4L/GVLe0X4U
         00SNUvHYE2KrR8aeL0wfPhtBPcSSBtSzKNNCcf1LNZYimgelKnlnM4bLWQ4/DzyUmJSv
         //fA==
X-Gm-Message-State: AOAM533Orr0nPtapV/Fi9SVdKSHsVa8oymoLdQE0VMTCasfFLq3hVLxU
	qpKiQFVY8OjxNfRpDQGb5KXJ1pe4NruRrQ==
X-Google-Smtp-Source: ABdhPJz2IetaRgtdctjAwOSzjcuLqnBKIKmQulAohjHLCBMsn/rbzWEkgJ0hkp9WZSN6Sx63XBQu+w==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr5401108wmh.130.1621543756966;
        Thu, 20 May 2021 13:49:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:16 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 24/28] coreutils: Exclude CVE-2016-2781 from cve-check
Date: Thu, 20 May 2021 21:48:58 +0100
Message-Id: <20210520204902.2527687-24-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842

"Given runcon is not really a sandbox command, the advice is to use
`runcon ... setsid ...` to avoid this particular issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/coreutils/coreutils_8.32.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes-core/coreutils/coreutils_8.32.bb
index c1962ccb909..f3fe31fd3bd 100644
--- a/meta/recipes-core/coreutils/coreutils_8.32.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
@@ -26,6 +26,10 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
 SRC_URI[md5sum] = "022042695b7d5bcf1a93559a9735e668"
 SRC_URI[sha256sum] = "4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa"
 
+# http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
+# runcon is not really a sandbox command, use `runcon ... setsid ...` to avoid this particular issue.
+CVE_CHECK_WHITELIST += "CVE-2016-2781"
+
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}"
 EXTRA_OECONF_class-nativesdk = "--enable-install-program=arch,hostname"
-- 
2.30.2

