Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832AACA0EFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 04:34:49 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.7700.1756269284089431765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 21:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lwPHs7EN;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-32326e20aadso7419054a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 21:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756269283; x=1756874083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Bu2vCfWRKDr+bwwadbmH/iF7HLmu68d9OAZPxlEuBU=;
        b=lwPHs7ENcnC8M8Mx4AYZRYxxMgYgLVhD9u9M7yicn6sic0SIFC/g3DRBtYeulhu//I
         L4r/Cw+rJ2a+xIWrFBQ10hitT2O4RHzYGDThlat6PveOIr177wR1EnkOjGoAbUIzrBUQ
         YseUp0tLOje4E0nMU3EMb5C7F7ZTTEwFQB7zk/AOJfX7r6F2rOmdTS6Xtxz597nKr7f7
         qAKm1O9kvNoD3NrR+foID5Z9vqJI0RPKk/i9QI/dgTyUI62UhP85TbGf1dqBxpYnHFXr
         Nyvtwxi8iow2Kkx2Q6HM02pclgqEt1tECYdhs57892Ia0tzHfvu+EiFU0VDeUM4rXbk6
         Mx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756269283; x=1756874083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Bu2vCfWRKDr+bwwadbmH/iF7HLmu68d9OAZPxlEuBU=;
        b=aHArn8PLTN7DpUC9XKXztmOT/ExQucESV2cIssxbJvlfSaKmKXdhlBp/9T9hLhpfsO
         rbbr1mhSPrCGbnEwNYXTjVseS6v4ezdSkcADtVn+rhUQN8KvH50BhD1xiPG7I9+ggZbQ
         OTsId0t10aTMHf4SF85e9iis5BOFL6ajMA6xAigFNtsZcbVVA3sxg1HZ+9xBG28omw5b
         H7Wgm305VvShjd0eOXd86uGSKmHcd5Z+7rw3fTG9oIyLDsofX95Pu0jmaUbYmQbF4aIl
         cUgORsdWnI5yNyvnaabbMgWM0IieMq6++P5ZFIOVqMJHphsWhTjeE7DsUvtzwdgGpouh
         2VsQ==
X-Gm-Message-State: AOJu0YwQPtmh9ikHCT2DecZErlLvq/4Gyy2407ZRGQ4TlPuDzDDKoPQE
	MVNJnPBhF5Ps5WeWQdf0J27gE5FvkHtJFt+4c0q02QngzIAq3hkcmYF/uROVcV+A
X-Gm-Gg: ASbGncsAk3/xQ7W8Q0dK5WWdFxsrHzIzHOrYsuA3/Xz719aKIY7z8LzVhf3OZkxP1GG
	Q2TooHlsGBB76roeFauXDd71oR/LB+nzot56E52r1eQz9xJsqKj/kRSnpebpz1LK7dKDUj+ucqy
	x346VFxUcp7/NeekwvhXDNI+QsAlLIdNywdgdZ7xMqIBEpFzLeK22o5mnm8yQzd9cAQr/+gCpty
	qJQ3DfaMYEl2cpYPJXjux745FQfn+c/ZmVYSp5mDnrNT0mQdAPTl+71+ltzBPiNmOvlkXr3LdIU
	UM2JvcoZLEnswCw6H+9qiwYF05gIpq10ai2KCJw5rBYUHVQW4p4iSGUIBJ777dwj9/fV2hbwSmc
	WFgm5Ipy3qIWdXOAUXWu39Ufeqh1pZqovuGVZiwanWFH+SKm/SozkiGwOnTpsBcChMlAUYexsRz
	75ya+3pdSaXXjA/N/upHjTFupKl91FEI7ql+OWq/di
X-Google-Smtp-Source: AGHT+IEDLzPtLvO44TYVHE4jPxrQ8xwfHaF7+PkGKjNkZxaTvVD7AzaC+n/fX+sdhHC9B/DVD49coQ==
X-Received: by 2002:a17:903:2351:b0:246:f89e:969a with SMTP id d9443c01a7336-246f8addbf1mr100174165ad.16.1756269283030;
        Tue, 26 Aug 2025 21:34:43 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-248787e1bb2sm27174055ad.96.2025.08.26.21.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 21:34:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] babeltrace2: Define LDCXXSHARED
Date: Tue, 26 Aug 2025 21:34:40 -0700
Message-ID: <20250827043440.2791498-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 04:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222488

python plugins use setuptools/distutils to build and it tries to compute
LDCXXSHARED as described in [1] in /src/bindings/python/bt2/setup.py.in
It gets confused and ends up specifying compiler twice and the result is
that linker fails with cryptic errors e.g.

| /mnt/b/yoe/master/sources/poky/build/tmp/work/x86-64-v3-poky-linux-musl/babeltrace2/2.1.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld: cannot find x86_64-poky-linux-musl-g++: No such file or directory
| collect2: error: ld returned 1 exit status
| error: command '/mnt/b/yoe/master/sources/poky/build/tmp/hosttools/ccache' failed with exit code 1
| make[3]: *** [Makefile:741: build-python-bindings.stamp] Error 1
| make[3]: Leaving directory '/mnt/b/yoe/master/sources/poky/build/tmp/work/x86-64-v3-poky-linux-musl/babeltrace2/2.1.1/build/src/bindings/python/bt2'

This is because first occurance of linker is encountering second linker on its
cmdline and tries to treat it as an input object to linker

Define LDCXXSHARED like it is in setuptools-base class

[1] https://github.com/pypa/setuptools/commit/2c937116cc0dcd9b26b6070e89a3dc5dcbedc2ae

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
index 1dc8cd8a498..ad6b7e8f057 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
@@ -23,6 +23,8 @@ inherit autotools pkgconfig ptest python3targetconfig
 
 EXTRA_OECONF = "--disable-debug-info --disable-Werror --enable-python-plugins --enable-python-bindings"
 
+export LDCXXSHARED = "{CXX} -shared"
+
 export DISTSETUPOPTS = " --install-lib=${PYTHON_SITEPACKAGES_DIR}"
 
 PACKAGECONFIG ??= "manpages"

