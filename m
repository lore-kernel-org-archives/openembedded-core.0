Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5205C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 19:52:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.1052.1641325975635875355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 11:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WKK4oRg9;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id i6so21748685pla.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 11:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZMpriM5CuXMKEnTEun+ndP84QvW4vojIeB2tGj7Ix+4=;
        b=WKK4oRg9+PJVkedpeMgfmiFQ4/oI88a8RvVdQ9xBgDyBkZvXTG/eZfbFjFNL2TDvy/
         P2yy06Fh9ozpFGavsMsU3fkOTeKINHcxxEXdMXJkvj5ebJdfT9LY89DQtMCrhBSsxtOq
         2acFCP7GwKpgqPEO3jJRuqitO86LdhXmbT4VhFffkAnlapb5hbF9adzkN/BWRp6LJBH6
         uwC/MADeuMUPG/c1zX8PXptNJAsEvm8eeOFFgoWi6u0Bo0BIi9kX5MN1j1+t/EKLYcjx
         LS5YpCCLJQAXnyn7l3j9Eb2prAvvZ21ylE3TjLUy5twswBg2I0oqPY944T2ADis+HZDH
         JZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZMpriM5CuXMKEnTEun+ndP84QvW4vojIeB2tGj7Ix+4=;
        b=wDx8oQKXdS2Hf65nNVsrtVXh4btp3R9vyLt3o1ZqiytNi88FUJtit+ScDTv8Yw3Wn/
         UbnE5qSBGARnJha6jNELYlq+svZCy6rVVMsBXgXsFOFp+2h/NKn5VJIqNp2Xlfb45YzB
         1jFPFYdHPy57cIkbCk0UoZz79TZiB5/lJbd7+ZT8sUV+mlxyJhrsQHZ1WpwUvaq3zRcN
         tWswCixkUbjwOis819cEiN4xQRYt7byg6L4tCY+F9rnzIFq0QQSdJ9rZtf7tEDcfUFcB
         cEeA1jQRYAO18pki2V/Wup7AV3qyhcZm8jlfMxWXmfmjA9qhRV2R6lS96649ZseLYPtx
         cu8A==
X-Gm-Message-State: AOAM531vw41VlC63GKUqw7Gw+kUBrWXFrJEYj0Z9pMqGTt06iBATv3S6
	IWgpGDASJ/g/jrFXA2PhsbPG0n6jaxQ=
X-Google-Smtp-Source: 
 ABdhPJwyU5OEXvQ4VOlI0krEQWigPjCom+e9ULaJPSKuFR1NW8qPuCFdFqvQWSv3vGPSsncvr1y7RA==
X-Received: by 2002:a17:903:11c9:b0:149:bef4:2d7d with SMTP id
 q9-20020a17090311c900b00149bef42d7dmr9321712plh.48.1641325974726;
        Tue, 04 Jan 2022 11:52:54 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d124:1770:ea70:753c])
        by smtp.gmail.com with ESMTPSA id
 k62sm162057pja.23.2022.01.04.11.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 11:52:54 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] maintainers.inc: update email address
Date: Tue,  4 Jan 2022 11:52:47 -0800
Message-Id: <20220104195247.1749669-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 19:52:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160171

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc | 70 ++++++++++++------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 70d185cab45..0af6974a3d3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -47,9 +47,9 @@ RECIPE_MAINTAINER:pn-argp-standalone = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-aspell = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-at = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-at-spi2-atk = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-at-spi2-core = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-atk = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-at-spi2-atk = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-at-spi2-core = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-atk = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-attr = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-autoconf = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-autoconf-archive = "Robert Yang <liezhi.yang@windriver.com>"
@@ -312,7 +312,7 @@ RECIPE_MAINTAINER:pn-libcap-ng-python = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcgroup = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcomps = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libcroco = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libdaemon = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libdazzle = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -322,7 +322,7 @@ RECIPE_MAINTAINER:pn-libdrm = "Otavio Salvador <otavio.salvador@ossystems.com.br
 RECIPE_MAINTAINER:pn-libedit = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libepoxy = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-liberation-fonts = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-liberror-perl = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-liberror-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libevdev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libevent = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libexif = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -352,7 +352,7 @@ RECIPE_MAINTAINER:pn-libmd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libmicrohttpd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libmnl = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libmpc = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-libmodule-build-perl = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-libmodule-build-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libmodulemd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libnewt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-libnl = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -389,9 +389,9 @@ RECIPE_MAINTAINER:pn-libsoup-2.4 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libssh2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libtasn1 = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-libtest-needs-perl = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-libtest-needs-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtheora = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-libtimedate-perl = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-libtimedate-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtirpc = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libtool = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-libtool-cross = "Robert Yang <liezhi.yang@windriver.com>"
@@ -400,7 +400,7 @@ RECIPE_MAINTAINER:pn-libucontext = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libunistring = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libunwind = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-liburcu = "Wang Mingyu <wangmy@fujitsu.com>"
-RECIPE_MAINTAINER:pn-liburi-perl = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-liburi-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
 RECIPE_MAINTAINER:pn-libuv = "Armin Kuster <akuster@mvista.com>"
@@ -429,12 +429,12 @@ RECIPE_MAINTAINER:pn-libxi = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxinerama = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxkbcommon = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxkbfile = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-libxml-namespacesupport-perl = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-libxml-parser-perl = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-libxml-perl = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-libxml-sax-base-perl = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-libxml-sax-perl = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-libxml-simple-perl = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-libxml-namespacesupport-perl = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-libxml-parser-perl = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-libxml-perl = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-libxml-sax-base-perl = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-libxml-sax-perl = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-libxml-simple-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libxml2 = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-libxmu = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxpm = "Unassigned <unassigned@yoctoproject.org>"
@@ -590,8 +590,8 @@ RECIPE_MAINTAINER:pn-pulseaudio-client-conf-sato = "Unassigned <unassigned@yocto
 RECIPE_MAINTAINER:pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-atomicwrites = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-python3-attrs = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-atomicwrites = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-attrs = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cython = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -604,10 +604,10 @@ RECIPE_MAINTAINER:pn-python3-pyrsistent = "Bruce Ashfield <bruce.ashfield@gmail.
 RECIPE_MAINTAINER:pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-hypothesis = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-hypothesis = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-idna = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-importlib-metadata = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-python3-iniconfig = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-importlib-metadata = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-iniconfig = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-jsonpointer = "Bruce Ashfield <bruce.ashfield@gmail.com>"
@@ -617,44 +617,44 @@ RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-python3-pathlib2 = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-pathlib2 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pbr = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-pip = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
-RECIPE_MAINTAINER:pn-python3-pluggy = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-python3-py = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-python3-pyyaml = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-pluggy = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-py = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-pyyaml = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pycairo = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-pytest = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-pytest = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3339-validator = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3986-validator = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3987 = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-ruamel-yaml = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-python3-scons-native = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-scons-native = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-smartypants = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-strict-rfc3339 = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-toml = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-python3-tomli = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-toml = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-tomli = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-typogrify = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-vcversioner = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-webcolors = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-zipp = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-zipp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-qemu-helper-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-qemu-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.30.2


