Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.5465.1620859765842409717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 15:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ro+Jubyg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id s82so13699704wmf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 15:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jPN6wVL6Jho7I+i/0NEHGFa7J7QByPwJsIlo+W91uqI=;
        b=Ro+JubygersWAapT5i+9pmTK6KUtz0l9vzdWgtezVGnMYg+PKQJLKLAPgRQBLSKrqp
         H9sBNw1ve77zUmsgWZcXeKUNQCYEeY2FUN9cca7nJVkdbNbAnxijEKmaxQhqv5+Ufu5e
         LyjlvgEgMUAh5O+pgMFxYryv8kh0Ed7+fQvU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jPN6wVL6Jho7I+i/0NEHGFa7J7QByPwJsIlo+W91uqI=;
        b=eElTHFwfLxFQHgOKIj4TipCZiQLlRio52tFVscNrbAHs4RWCwbr82LGz3+NYPm6rYU
         SuYs69uSx6T1fs4Y46sYORJNFXWzFaiXFftIJYXND1PzPuf7gIj9EuBoqdwJQLk5ECvD
         2JlTzFjtumbN51oac80bZUlB0pcZbBiizLnGALwUsbeFMUXrfdGyHzSPhjqE7AZktJWz
         UjZBYbt9Pw9L47MBPpwcBfALL1mCJEmDoEygcf/7UbwSAf0mxZefjUaywTkzrpQHqMj9
         qvN6wto4mTLUhYNYVSvd8rNDioCWsYTyZpe5nQKCG3QEtqiI9iWdKGmk9VHpSFBtOfa9
         7fyw==
X-Gm-Message-State: AOAM530+E3IgyynyPdv+XwP/7TkuY0eQUo7jcL/ycOM7pCJTDLn3idYq
	6zr/FaNw+OORbxvV137qCuvQao1xdcih6g==
X-Google-Smtp-Source: ABdhPJxvcYLSOd1RnWArD1D7ZaQmZC6Oqm5Fa/nZerdMNPqwjE4+kkiZs/K26uN0CYwUaQFWGIATmQ==
X-Received: by 2002:a05:600c:154f:: with SMTP id f15mr434603wmg.81.1620859764342;
        Wed, 12 May 2021 15:49:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f649:3481:d239:bb03])
        by smtp.gmail.com with ESMTPSA id o13sm791887wmh.34.2021.05.12.15.49.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 15:49:24 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] coreutils: Exclude CVE-2016-2781 from cve-check
Date: Wed, 12 May 2021 23:49:21 +0100
Message-Id: <20210512224922.2286380-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210512224922.2286380-1-richard.purdie@linuxfoundation.org>
References: <20210512224922.2286380-1-richard.purdie@linuxfoundation.org>
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

