Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D31C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:04 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.3440.1647298143160473348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FbCVM8Tx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so411278wmp.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3TXMpQadogQeZDkK43Meg1WLN8aILQ6AL+3NswAzE5E=;
        b=FbCVM8Tx7miCW8H5lSNS32kTy44ievBHZiKTwM99EZ2zYV+44U1ERrAsI39Bj7jOxl
         b6/A2q8AmIlTuD3fimtxfiDH6JamMUIyI5b/L/xnrG068NZuOCUCeg/rvEbZVFVwqUwE
         YCW/QKdVEsRa/Tm5jeiwT+Bw10PZGLoMVw4TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3TXMpQadogQeZDkK43Meg1WLN8aILQ6AL+3NswAzE5E=;
        b=7m3ZI5YaL/ezP4bqHlkmlJPxxZbALyXo8itmzs3cPsar6ZGIfNnvJwo+B4XGL07S+l
         czPZwEIFdFxise/i47CfIFPHgWc19nmzBkl0bKYTvW6UkKh6TcWZg3Q+KVHOK+8LNVtw
         gj0EbpJwWWtkvXXxVM+yaBNpHuFR0317r8JSjoTlIcM1t59YDmLzVaDnjJkoQMbvEhCD
         auvJwqRVGbhey1jzLKXcGi2WnLU+3lO8kOOyT0Zn0CDc0hgO9YIUKaGGKa2c1f2A9DnS
         NkMr8koTut+8PGPcZCR5N4RINrkUdzPwDGl+t5RNmw9YOuzvzB5KsMAcY7zk+gvPFDoZ
         T+Qw==
X-Gm-Message-State: AOAM531wAfP7rv5614oetnWNF5WEMDARMqUCOgwHSG59QeLTdKBXYfve
	Xi0Xv37CXZoh6inYDY+d+GMs2raskHcAc19p
X-Google-Smtp-Source: 
 ABdhPJxJMdu/XeIk27I0j4eI1zUV3J5RLNiIE6xwJoYb4qG+7WN8SiSbd/fjlwoZbs702XGzXsxApA==
X-Received: by 2002:a1c:6a01:0:b0:37f:1b18:6b17 with SMTP id
 f1-20020a1c6a01000000b0037f1b186b17mr984821wmc.146.1647298141465;
        Mon, 14 Mar 2022 15:49:01 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:49:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 22/33] maintainers.inc: add python3-crypto and friends
Date: Mon, 14 Mar 2022 22:48:26 +0000
Message-Id: <20220314224837.834776-22-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163188

From: Tim Orling <tim.orling@konsulko.com>

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3fceb6701bb..f149db81cde 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -587,8 +587,13 @@ RECIPE_MAINTAINER:pn-pulseaudio-client-conf-sato = "Unassigned <unassigned@yocto
 RECIPE_MAINTAINER:pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-asn1crypto = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-atomicwrites = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-attrs = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-bcrypt = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-cffi = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-cryptography = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-cryptography-vectors = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cython = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -607,6 +612,7 @@ RECIPE_MAINTAINER:pn-python3-idna = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-importlib-metadata = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-iniconfig = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-iso8601 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-jsonpointer = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-jsonschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
@@ -622,20 +628,29 @@ RECIPE_MAINTAINER:pn-python3-pathlib2 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pbr = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-pip = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-pluggy = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-ply = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-poetry-core = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-pretend = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-psutil = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-py = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyyaml = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pycairo = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-pycparser = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-pytest = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-pytest-subtests = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-pytz = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3339-validator = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3986-validator = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3987 = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-ruamel-yaml = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-setuptools-rust-native = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-smartypants = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -646,6 +661,7 @@ RECIPE_MAINTAINER:pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksand
 RECIPE_MAINTAINER:pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-toml = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-tomli = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-typing-extensions = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-typogrify = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-vcversioner = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.32.0


