Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5FBC636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:42 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.24078.1675260875841278440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=s03hV9Tr;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id v3so12587731pgh.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ksj/7SZ5sGrT2/NMbI9Px1XfGdg8eINP9HXmmVdqhA=;
        b=s03hV9TrF2Z/HpmKM7yN14aXU/oPN3w8NZ7cVlB9Ug7LBG50cA8dyGC8Tj7lMTMb4R
         SbsOD7Y3qQhJeFBEqpFVc/rwXY6Xm/3gLC34rl4GuHRL4Cf0AexXXqNq0TnV4Uxu2laz
         dTSmPZE80wdXJ8gGPmzdRA1dLvHGbYfQ0h9jJ5aiahdQdEFkHFsAQx5LCXbl6Ex/9yeJ
         b6xccDRhwL3z7jBXpQe6GmGZMkuVDIl65Qpb5i+vK8BMkB+lnjjkJjMHx0aENVRhRNLJ
         RnZ+gtSe2XMqPPFZjWfLNWDyv4nuoK4zjZ0BZwPA9hAemYTdqOXQt02mMy+/rZ7Rsk7u
         fwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Ksj/7SZ5sGrT2/NMbI9Px1XfGdg8eINP9HXmmVdqhA=;
        b=4JtfjcnXJu5uoKR2Zf3mx+BiXHABkn8dT6eCeaGEydoImUPBS0p2NXRtkwsbU41vLY
         5zQ5fEoJGSQ01yLyflVpN3GARmnIn8luIc9u2yglOsnTDeJHCoumVvYb7fG6Rh+q+O0b
         oHxwJUCSYFShbS7zAeIV1ncDoJkVvOVRp95rJDGnLpGGtwpJSBEqMA+yGI4eIfm4vUAM
         U2hqg4+KwfE+mn8AqXGbaSo2/8E+MfsHKOpsoGAeXqfMSLV5O2zJxDcQHs0Jt+nEk5zS
         zYwWOXI/j097+4hY+ynG0szFvUyNuyZbrfw6FdiSyGZU3cGPlv1jEUqHRzIH5njDfIJK
         AWbw==
X-Gm-Message-State: AO0yUKUAwji7aGrzaUcNE6XuRNCR1J4W3OpaVoHDhVNsyFdpo/5lkoDK
	8KUy6Bz6THEcoQrj/jlgbx7wsn+EucSaoUrX1j0=
X-Google-Smtp-Source: AK7set8iNqhHvuNr2u14PHEPvVBJmBiRQ8XhmMNratBZSeH/8Ome9yx+0nlqjgwf7TYJe2UOObaMlA==
X-Received: by 2002:aa7:8745:0:b0:592:de72:4ce8 with SMTP id g5-20020aa78745000000b00592de724ce8mr2185147pfo.30.1675260874899;
        Wed, 01 Feb 2023 06:14:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/17] Fix missing leading whitespace with ':append'
Date: Wed,  1 Feb 2023 04:13:55 -1000
Message-Id: <ab39d244cb844c9d183296945a095c17fdfef29e.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176552

From: Niko Mauno <niko.mauno@vaisala.com>

Mitigate occurences where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fcd340ec53ff8352b8cae0eb351810072b025a08)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/core-image.bbclass          | 2 +-
 meta/classes-recipe/populate_sdk_ext.bbclass    | 2 +-
 meta/conf/distro/include/ptest-packagelists.inc | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/core-image.bbclass
index 90d9eb9d3f..40fc15cb04 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -65,7 +65,7 @@ IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
 # Do not install openssh complementary packages if either packagegroup-core-ssh-dropbear or dropbear
 # is installed # to avoid openssh-dropbear conflict
 # see [Yocto #14858] for more information
-PACKAGE_EXCLUDE_COMPLEMENTARY:append = "${@bb.utils.contains_any('PACKAGE_INSTALL', 'packagegroup-core-ssh-dropbear dropbear', 'openssh', '' , d)}"
+PACKAGE_EXCLUDE_COMPLEMENTARY:append = "${@bb.utils.contains_any('PACKAGE_INSTALL', 'packagegroup-core-ssh-dropbear dropbear', ' openssh', '' , d)}"
 
 # IMAGE_FEATURES_CONFLICTS_foo = 'bar1 bar2'
 # An error exception would be raised if both image features foo and bar1(or bar2) are included
diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 925cb313fc..80f4f0be05 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -120,7 +120,7 @@ python write_host_sdk_ext_manifest () {
                 f.write("%s %s %s\n" % (info[1], info[2], info[3]))
 }
 
-SDK_POSTPROCESS_COMMAND:append:task-populate-sdk-ext = "write_target_sdk_ext_manifest; write_host_sdk_ext_manifest; "    
+SDK_POSTPROCESS_COMMAND:append:task-populate-sdk-ext = " write_target_sdk_ext_manifest; write_host_sdk_ext_manifest; "    
 
 SDK_TITLE:task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} Extensible SDK"
 
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 56088e4e66..99929accce 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -103,7 +103,7 @@ PTESTS_SLOW = "\
 "
 
 PTESTS_SLOW:remove:riscv64 = "valgrind-ptest"
-PTESTS_PROBLEMS:append:riscv64 = "valgrind-ptest"
+PTESTS_PROBLEMS:append:riscv64 = " valgrind-ptest"
 
 #    ruby-ptest \ # Timeout
 #    lz4-ptest \ # Needs a rewrite
-- 
2.25.1


