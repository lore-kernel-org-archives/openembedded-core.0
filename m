Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F5AC001B3
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:54 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.3855.1688092190633927308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=YgNNNbz6;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.180, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-765a1690003so122830685a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092189; x=1690684189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nwrLQ1QFkOV6Fo7J04Cf13WLopJmvLnAEP1Zmf8UR8=;
        b=YgNNNbz6URvges6pcADZAFDMCZTQoU7MOFmNlU7XBcpU4gBr0FKt3O2ChvPEfBI/pG
         RchtaBMLvDqnHro72N2c6TjmYQhkTkNktU2wWCvc3p7vFYSZjUf4jLL5kBTu+5L+DvI/
         GFdtvh5QTDQvYCT7fvJbeW8RYVjk5GeUAfub5B6iuJO/yE5x3vhvcTz8PvPYe8ypqmFi
         c7sc/wfNpwh47rUCCawwiBcOmm5miGfQ/miAfPtt8p4kTzdKA70g7urNwJsIJptgfRx3
         ocDqmwoLKW6v/M5cV/itckEz/xMJRg2+rgMhIm6eYQfXnB3Ane4VHD7JzHhThiQkuRY+
         bTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092189; x=1690684189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nwrLQ1QFkOV6Fo7J04Cf13WLopJmvLnAEP1Zmf8UR8=;
        b=JwyEAg9EyakFvH5a9D0d/lvQZf77hxW05Yald+1UsqnJculFIkrztOWoMmhwShEEXc
         Y6fFh/mbpySenmG/8yIxUlY+ADokBcMsNkqZdBGVime7OiwnLmQ+uSe8PE9rwHluxgjI
         1fPunp8b+lzk0ykEj8LsnimckLevkl1uXtHuhawIsf8YUJphllFumC13C+DVedD5nS3S
         6vGeWf3/TgXFI/26fgozrJItwljkDTr8+FhEKfLkB4oAWLp++c0xk2REV4hZ6XJUFLi7
         0/Kex7SMmj7jH/UYvQsAl5mUe5Bi9PzDQpfRnRKJMoe7nO/ps0cZqb/gMcrhng0492Cp
         I3jw==
X-Gm-Message-State: AC+VfDwnLxby6bRoNMmbpdXTgsnKpiohDqQf3LU6jaVcQzvfcCerDrf4
	md3fSqptWGM4H/TTZ2bZ9SyFnc1n+UJ8nlJVbPbIOA==
X-Google-Smtp-Source: ACHHUZ6OTT+4CbjdB5nz5dv3h1CQr5gotW5HadCKLaOLpfFWyp0Z/MH8N02ce5HDdY73HzN7Gu0kxQ==
X-Received: by 2002:a05:620a:2a15:b0:764:ff39:9021 with SMTP id o21-20020a05620a2a1500b00764ff399021mr1559927qkp.5.1688092189106;
        Thu, 29 Jun 2023 19:29:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 23/30] maintainers.inc: unassign Oleksandr Kravchuk from python3 and all other items
Date: Thu, 29 Jun 2023 16:28:59 -1000
Message-Id: <66dfaff6bdf9c02a2cc6b1e8829c86e38908b195.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183663

From: Alexander Kanavin <alex.kanavin@gmail.com>

We were not able to get a response about availability over email, and so the recipes
have to be unassigned.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2d2c75530fe336eda72e8ce72f994725b3a77ea0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 34 ++++++++++++------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2319c4c5f1..865c09852a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -426,7 +426,7 @@ RECIPE_MAINTAINER:pn-libx11 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libx11-compose-data = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxau = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxcb = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-libxcvt = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-libxcvt = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxcomposite = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxcursor = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxcrypt = "Khem Raj <raj.khem@gmail.com>"
@@ -599,7 +599,7 @@ RECIPE_MAINTAINER:pn-ptest-runner = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pulseaudio = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-pulseaudio-client-conf-sato = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-alabaster = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-asn1crypto = "Tim Orling <tim.orling@konsulko.com>"
@@ -613,20 +613,20 @@ RECIPE_MAINTAINER:pn-python3-cffi = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-chardet = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography-vectors = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-cython = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-cython = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangruochen@loongson.cn>"
-RECIPE_MAINTAINER:pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-dbusmock = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-docutils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-dtschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-dtschema-wrapper = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-editables = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pyrsistent = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-extras = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-flit-core = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-git = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-gitdb = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-hatchling = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-hatch-fancy-pypi-readme = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-hatch-vcs = "Ross Burton <ross.burton@arm.com>"
@@ -635,7 +635,7 @@ RECIPE_MAINTAINER:pn-python3-idna = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-imagesize = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-importlib-metadata = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-iniconfig = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-iniparse = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-iso8601 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-installer = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -644,12 +644,12 @@ RECIPE_MAINTAINER:pn-python3-jsonschema = "Bruce Ashfield <bruce.ashfield@gmail.
 RECIPE_MAINTAINER:pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-lxml = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-mako = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ndg-httpsclient = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-numpy = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathlib2 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathspec = "Ross Burton <ross.burton@arm.com>"
@@ -665,10 +665,10 @@ RECIPE_MAINTAINER:pn-python3-pyasn1 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pycairo = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pycparser = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-pygments = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-pyparsing = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-pyproject-hooks = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-pysocks = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pytest = "Tim Orling <tim.orling@konsulko.com>"
@@ -683,12 +683,12 @@ RECIPE_MAINTAINER:pn-python3-rfc3987 = "Bruce Ashfield <bruce.ashfield@gmail.com
 RECIPE_MAINTAINER:pn-python3-ruamel-yaml = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-setuptools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-setuptools-rust = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-smartypants = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-smmap = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx = "Tim Orling <tim.orling@konsulko.com>"
@@ -699,8 +699,8 @@ RECIPE_MAINTAINER:pn-python3-sphinxcontrib-serializinghtml = "Tim Orling <tim.or
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jsmath = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-applehelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx-rtd-theme = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-subunit = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-testtools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-toml = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-tomli = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-typing-extensions = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.34.1


