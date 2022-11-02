Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2093CC43219
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:18:52 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.2237.1667359128408914540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oolc2M/I;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so738598pjk.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KV38Hm/8NfqByv/8z+FDc2+HpcEQSey2/ciiH5NXl0=;
        b=oolc2M/IBS2TcLuvbmDFMc9mqWYqhBwHMtHufmNQfjfBY9gzNTwKtU9YfmtA9FOK2I
         1BgjjSJF/LHsBbWz6gNnLL7Mga0TYmpUpGbuHMCwK1MP5w4calAEqCLIYxecKcLoO5F/
         Jwt80EYBoSbkua2TgHQseMpPz+xj3uFpN8dDpup0Nx01smJlZ/jjB/voYh+wqgKRf+zS
         +Vzs0DgBnQh4R4Aoe1TROg7gpPSd/APFWeAVKZ7874782opJieBO/K9VeV4TdKDdMgOJ
         GTA4mr3L+cIIQUGGVj5tSa2j5yRs99p2+FoxUu5IjqrPYeSIDgc3BsKXU6p6mGIFVnxf
         Yqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KV38Hm/8NfqByv/8z+FDc2+HpcEQSey2/ciiH5NXl0=;
        b=X3EaAzuTX0wjtzgI4/Vn83LBR3lw8tCHVEeqNHMB154wy3VbXrhmb/T+2BH/NjcP9W
         oTBlsv21TxMe/FiZPtxcDC1FSnMnvc1jMsAtPzZo/mlFSLfCSbwij7Nn6q189/bpg3Bt
         uVvZTCELX4byDho5Iqa9bfEp3GS9CRHmCecdCdCMqkQhK8vwYEEBsjL5+sFd9uP41M4m
         9pLcTaN4J+ZiCLzyJVHujVWgUDWJxQgYcyD85UwHLq95MBtwI3+5o10mycbO2Oi/6NsP
         ++QmYVIdsVTtKjbeK+l1Znxbi3eo7Q1zzy3SN639dxMLOqVFfMSp514NCDfkyZGKMCfG
         EndQ==
X-Gm-Message-State: ACrzQf27KBOamSWsMYKMdKdLqRSCjp3IgpCVwbyzlubuc9yzrZ/2F1aW
	qmWvrs8urXPTrrJcDLKxt64zVh+T+IxcXQ==
X-Google-Smtp-Source: AMsMyM6CBqzo+TmeP+rgOY5/cUBxCYYpwfusx7a3BOuZM69uGDJuiPiV2paT1HwESp51znktGDN7lw==
X-Received: by 2002:a17:90b:3b4c:b0:213:f05:6a8 with SMTP id ot12-20020a17090b3b4c00b002130f0506a8mr39669155pjb.108.1667359127394;
        Tue, 01 Nov 2022 20:18:47 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090a16d600b002139459e121sm269644pje.27.2022.11.01.20.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:18:46 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 04/11] python3-pytest: upgrade 7.1.3 -> 7.2.0
Date: Tue,  1 Nov 2022 20:18:23 -0700
Message-Id: <20221102031830.3606777-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102031830.3606777-1-tim.orling@konsulko.com>
References: <20221102031830.3606777-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 03:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172566

https://docs.pytest.org/en/stable/changelog.html#pytest-7-2-0-2022-10-23

Excerpt from upstream release notes:

Deprecations

* #10012: Update pytest.PytestUnhandledCoroutineWarning to a
	  deprecation; it will raise an error in pytest 8.

* #10396: pytest no longer depends on the py library. pytest provides
	  a vendored copy of py.error and py.path modules but will use
          the py library if it is installed. If you need other py.* modules,
          continue to install the deprecated py library separately, otherwise it
          can usually be removed as a dependency.

* #4562: Deprecate configuring hook specs/impls using
	 attributes/marks.

         Instead use pytest.hookimpl() and pytest.hookspec(). For more
         details, see the docs.

* #9886: The functionality for running tests written for nose has been
	 officially deprecated.

        This includes:

        Plain setup and teardown functions and methods: this might catch
        users by surprise, as setup() and teardown() are not pytest idioms, but
        part of the nose support.

        Setup/teardown using the @with_setup decorator.

        For more details, consult the deprecation docs.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-pytest_7.1.3.bb => python3-pytest_7.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.1.3.bb => python3-pytest_7.2.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.1.3.bb b/meta/recipes-devtools/python/python3-pytest_7.2.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.1.3.bb
rename to meta/recipes-devtools/python/python3-pytest_7.2.0.bb
index 373f7f35fa6..02fc55fdb0b 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.1.3.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.2.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "4f365fec2dff9c1162f834d9f18af1ba13062db0c708bf7b946f8a5c76180c39"
+SRC_URI[sha256sum] = "c4014eb40e10f11f355ad4e3c2fb2c6c6d1919c73f3b5a433de4708202cade59"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


