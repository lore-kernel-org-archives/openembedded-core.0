Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.638.1605296944680773585
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 11:49:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BShgpYL3;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id v4so12123121edi.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 11:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZarnkX/sNXnWrKwx5GQF225/UzXVhCFldsOwKzf0T8E=;
        b=BShgpYL3PIEu8l7RBleXm8XQOR93gWoCFzj+RC6l2wvq9huJrIIo3+nox6WIeZxQZD
         mv/8tuPwPWqjUnWDHRWiiCR201UzVGYOr1bVUnmKoyIkuqynsNtINyfIsT8515rDMVFi
         2y+Jshn7RHAYU79uN9celZRmDEOsZ9VoUvu+Ckz613ATkShIeD3h7gppBdqeZWyJkuV7
         gxbcImGVBjTWRw44Su4EqoZKvuJVg2jRu0DmtfwqrG1/Ea0yEkAjjWL2HnaWIZ4s5uan
         0489sifyfh26T0eAfdGgCJgMe0AIc7JHaVlZY+Bkq7KJg0ZUP3I+21aGmIsrWQU72QBh
         G7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZarnkX/sNXnWrKwx5GQF225/UzXVhCFldsOwKzf0T8E=;
        b=WcrSZn2WLQH2uV11YJt0n2axXM+mUKpcC9kK1Ng31wJ2IKhw3wtjgS4DwiMITXmUow
         zeWmR9PpEMocSqUzCGX9Au0/DEZe+XcHij+MjQwGf8+OpxiLkr124CT6mdfhhYfuvP5P
         o2CZ9WVDlo3J3oR8F5CYDqx14rKh2zkm61DkvKKRuzroTlovyV6zc2ApeO+ZX0HDnFSX
         VCkd3oZA8o/yyB4NzoVXuRv0GvPHs++wrQIEdkzUvMY5Be0yFSY/xdpIOTDqn9mPEuh/
         6YG8BWg2NNAMNb1HWWIcjqwnmg7ygzh3RgELSynW7I+wnpEhCcHRcnFW9hCB5vBgpGYA
         dxCw==
X-Gm-Message-State: AOAM533ke8h8KORSLe4+Zq1OrBfl+dEyQnC1zcPSOUb5jUMyy4v6Qy9l
	xb5gFTnfj+dtlOMbp6mzovhONAg7yCP7aw==
X-Google-Smtp-Source: ABdhPJwir4AvunbjGyZZj7oUJ+SmfItL2odqlEhkH4/n1qj2lEgC+tHsgYi8SjazAnRvv5+HCPotGg==
X-Received: by 2002:a50:99d6:: with SMTP id n22mr4260685edb.261.1605296943024;
        Fri, 13 Nov 2020 11:49:03 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id lz27sm4499287ejb.39.2020.11.13.11.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 11:49:02 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/5] distutils3-base.bbclass: use python3targetconfig
Date: Fri, 13 Nov 2020 20:48:52 +0100
Message-Id: <20201113194854.21266-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113194854.21266-1-alex.kanavin@gmail.com>
References: <20201113194854.21266-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/distutils3-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
index 7dbf07ac4b..a277d1c7bc 100644
--- a/meta/classes/distutils3-base.bbclass
+++ b/meta/classes/distutils3-base.bbclass
@@ -1,5 +1,5 @@
 DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES') == '')]}"
 RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
-inherit distutils-common-base python3native
+inherit distutils-common-base python3native python3targetconfig
 
-- 
2.29.2

