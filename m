Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDE4C001DF
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 15:45:35 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.28333.1690127135177978242
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 08:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=baWv55e6;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-666e5f0d60bso1906285b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 08:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690127134; x=1690731934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxvC6xLPxkmR+xwdFU6BZmitAlvzGtiVUG8AmvAtdIA=;
        b=baWv55e6WsZAQ8RoXIJwDFJEcsVCi196rET1z3oZQocGnX/hVWLE2RujyGOfrWF9Gj
         DQmoNMoJbkJnslay+iTVkh3fHtDtSgPfIrzm5fraprK+wMAzUmC5/mm5rpG+nWaoFoZ0
         Se1GC0uxpQyks391tDUuiDNrQJSXVT5jDcj3WZ/OkCUQUX+XF2IYhUOXGPdzoM9e5ymP
         WG+qFMDXt2muxNEC9ffsf+LkNjaA7qiX+VMUcoSrSgnE7Zlvzl2042Hbiw4KssNahFha
         KFgnwdf57emuZcTEZV1uBbpwQc+Hym3u8PGqKvwZq5Snoa+BNOblWXSDW47/YMv8qBfr
         PSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690127134; x=1690731934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxvC6xLPxkmR+xwdFU6BZmitAlvzGtiVUG8AmvAtdIA=;
        b=Zm0DnkwtKR+Gvhz0OMNVc697FLKyXTYSELqkxjKXb+9mK5Y0NPjdRoXKYOWHnqFqBV
         DGfJE/I6l5Muvb474Hysp8yRmTQARsowxpUE0N7Z50chgIMdZEy9IlRRnCUk0kIGTwaP
         9XnEBrKcGESMqAj+qXPeyb7gOAZDvl5/Qq9t3sGG2EhMbkHzAfyF7Kt/Zxr+KTYhzJND
         +BVeAoNSLbS74he9NJgANCLsd4FRHmN5ihhkYeM/O8rCxAv8D/0ouylbyhVsR+9l+3h2
         eYvujObCpDWAMVSq9AeaBHQ81ErVWgTvc3BpzkK97Oww+bIqdcQL/s87QcXA57hKcVQ2
         Z0BA==
X-Gm-Message-State: ABy/qLZy5cbS1iHJSDAnU7OSOog+URYrr4VXHkdVEfNpV9d8UdVvylY3
	GUJjIEW2aWXITeXOat+xz0As0fM0GCo=
X-Google-Smtp-Source: APBJJlGMHmIxLFyOKXF2aGDsQecLjdFO4vafRxh6mV404KaMr3ifp/GQecQy4Zhj4vcQaNb5avOQGQ==
X-Received: by 2002:a05:6a00:2d10:b0:668:6723:547b with SMTP id fa16-20020a056a002d1000b006686723547bmr4724993pfb.2.1690127133650;
        Sun, 23 Jul 2023 08:45:33 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:9ac3:5615:a7a6:3dfe])
        by smtp.gmail.com with ESMTPSA id ff5-20020a056a002f4500b0067ea048cf83sm6065455pfb.186.2023.07.23.08.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 08:45:33 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-pyyaml: upgrade 6.0 -> 6.0.1
Date: Sun, 23 Jul 2023 08:45:24 -0700
Message-Id: <20230723154524.3967369-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 15:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184759

No changelog provided; new commits are:

c42fa3b (tag: 6.0.1, origin/release/6.0) 6.0.1 release
ae08bdc block Cython 3.0+ as a build dep (#702)
f873cfe Add python 3.11 support (#663)

https://github.com/yaml/pyyaml/compare/6.0...6.0.1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-pyyaml_6.0.bb => python3-pyyaml_6.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyyaml_6.0.bb => python3-pyyaml_6.0.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pyyaml_6.0.bb
rename to meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
index d142a0fc3e..4ab8f038f4 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "PyYAML"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "68fb519c14306fec9720a2a5b45bc9f0c8d1b9c72adf45c37baedfcd949c35a2"
+SRC_URI[sha256sum] = "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
-- 
2.34.1


