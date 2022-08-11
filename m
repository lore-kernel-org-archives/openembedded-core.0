Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C54C25B06
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 19:58:21 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.2533.1660247893703813052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 12:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KPwf3frS;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a7so35352988ejp.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 12:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=tSkLGyWwnwnJjAK/6ziFuT0O/BZNUrTE6g3ZgDdXFSk=;
        b=KPwf3frS1yY/B1rzwtgmosIT+5aZVC1MP0g9jJ6vud8gzSwRR28/jhOyrrRz7SjIe6
         daXrnXfpSCnMpjg2+aRLp5scambQdsbjHMln/2sHYEftFvscu5i/8a4pzbNW/KrYoO7Y
         N3CqWa2yG437tIgQCeuo7+maqe6NcI5hXeUkA3V/sNiKONWuqQMSkOgzPvhavPnRcrKC
         s1/zHg6QHNfNa74R6ohuuk+liCCTaoOBWn6A3Dh8Ri4vAMvMorLAtWD8/XnZWnVg0xIo
         WjRkdL3HVIn1irgE8OqyFGkSTzVJfzPhU57ib2dcVvLVN2a1VRln2do5iimjRRA6bn0Z
         xkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=tSkLGyWwnwnJjAK/6ziFuT0O/BZNUrTE6g3ZgDdXFSk=;
        b=7QxEuS+jU8EQf2ihvmUVTl8kc9r27zPTlOyDnNtO/N6Yq/cTGXxwhiZZpWB81KXuv7
         0xqnYrM3rzzNbw1DqBDZ0TrcyWnWmTdx/Spn+QzFxK6947lS3V3Z9Ca8nOM03kLnfDWB
         /4fdIsDRr40BeX8h/icFGUUa6OV50Al23x+5VSTUuekA7cLSxjLGJ6CoElhqjdAyiyFC
         VOytzdKkIFRYQ7batP+IXZgavegEzub9Bwc2XyYyoBm2v0z85PZ5M0EhLGJ9Ux+xefr9
         qmv4i91yjH1hE7KrLqbgzQAmiUToB9ifFV5jZNpE7jJQu3BthbIVrqFbOFvpo39rHXiB
         9RkA==
X-Gm-Message-State: ACgBeo0wIUJap4QMDwHw3wrn0oDs58v9YdR09JgC5J7Nh3743O1gQy9K
	EEkbXzv64wDclfIqyoODYVueSkpWMTY=
X-Google-Smtp-Source: 
 AA6agR4Pp7V7CidZpCIYmySsz2LBfU+/1+6WDdtMiG4ycvukoLrGKPTsRT21ajUdAdTTwpP5CQ1muQ==
X-Received: by 2002:a17:907:3e21:b0:730:92bb:7fcd with SMTP id
 hp33-20020a1709073e2100b0073092bb7fcdmr453688ejc.170.1660247892216;
        Thu, 11 Aug 2022 12:58:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 fu18-20020a170907b01200b007308bdef04bsm22010ejc.103.2022.08.11.12.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 12:58:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/7] cmake: update 3.23.2 -> 3.24.0
Date: Thu, 11 Aug 2022 21:58:02 +0200
Message-Id: <20220811195806.1571221-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811195806.1571221-1-alex@linutronix.de>
References: <20220811195806.1571221-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 19:58:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169265

License-Update: additional copyright holders

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_3.23.2.bb => cmake-native_3.24.0.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                         | 4 ++--
 .../cmake/{cmake_3.23.2.bb => cmake_3.24.0.bb}                | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.23.2.bb => cmake-native_3.24.0.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.23.2.bb => cmake_3.24.0.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.23.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.24.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.23.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.24.0.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 4a6884e871..d64afffdc1 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=f2102a52df7aa592cf072180e7ebc8c7 \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=45025187a129339459b6f1a24f7fac6e \
                     file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
                     "
 
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "f316b40053466f9a416adf981efda41b160ca859e97f6a484b447ea299ff26aa"
+SRC_URI[sha256sum] = "c2b61f7cdecb1576cad25f918a8f42b8685d88a832fd4b62b9e0fa32e915a658"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.23.2.bb b/meta/recipes-devtools/cmake/cmake_3.24.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.23.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.24.0.bb
-- 
2.30.2


