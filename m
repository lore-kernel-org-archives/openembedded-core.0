Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CE0C05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 22:17:01 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.126.1675289812281421267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 14:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=QimJkeRQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id v23so19947809plo.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zMJTWPrcMBSYPKp1aKm4+SMFImrC6no6oA1Ohxu59k=;
        b=QimJkeRQfPWse/vsaGdop3R9ha7D4wOUsxeIqITrumHEgPbFIT0xYrH0FzaNzQRkIZ
         ckcE3gzKqUkeQ6MOw4xHUpHZLsgvCtbxTC5LBC1PK78qBU7OIjndIz9pUanaTjDD4JWr
         7V25PMXlpmQ3gUFIdzQgIQm6pFzT40tfxpGMkwBsAKJczjz8iaQejpdU4aGtEYslvwIo
         RQMeZrpIfkd5CHYBUo+TzE4E8nvgzWBccDtnowYJ8DNpsZ7gqNMTGcOpo6vS1VuqKBJA
         EITeXZsFTPjokbcxTMu6pnpUGsETRjXf+oDqgH/MrNLo8z7PKhlHK0yHdSxYnprppHLe
         z+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zMJTWPrcMBSYPKp1aKm4+SMFImrC6no6oA1Ohxu59k=;
        b=0gkF/WazMlhDr9mTX+D2s8cl7pxv3lhWhtUtDCQeiHY7HbZNAHflsFsM8NpD076nfm
         j61KrwjS/Y1UiOzO78u6nRi+v3u7uvmmHOqdroZd8d8gmtUK6e3iY6IZOwHSZ1Jz/Ohm
         tKkBhTbq43B+YaVb6JplzBMwqrTqomqz92T7j4rMMGxhZjG+0WkTlNmy8PHT7nDmXIle
         NhYtMA3rHPl8T6cc6mlPRRgZW0sROI1aZ0D59xLIEp746o5fex7J+XzZHVbtlP+8Ehau
         4BA7FZZ/AVmlWrNDkymb4aL1M6XFh4+XYy3wJ5g7ZXiESZZ1Mw5QkwZox4tGfMOaXp77
         JVAQ==
X-Gm-Message-State: AO0yUKXwNLy2kfag/HUY2ZTfpaVGPS6eXk0UWYQfeFUjkga0aSyiPNud
	7xDEYmD8ne50OVga5QJyE4xHJ4J8xAzHbA2EpkI=
X-Google-Smtp-Source: AK7set8eCDmGXOM57BhyoxiwUqWEypQMMFsLlH/KsUMmi3HQ9IEZGYlTDr6mllmBmhZ0l6XVuk2tig==
X-Received: by 2002:a05:6a20:6994:b0:bf:2a24:b9fd with SMTP id t20-20020a056a20699400b000bf2a24b9fdmr4888327pzk.38.1675289811345;
        Wed, 01 Feb 2023 14:16:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11904810pfv.193.2023.02.01.14.16.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 14:16:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/13] Fix missing leading whitespace with ':append'
Date: Wed,  1 Feb 2023 12:16:09 -1000
Message-Id: <cb64ace13db85e143d99627c8803fbb13ba18617.1675289652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675289652.git.steve@sakoman.com>
References: <cover.1675289652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 22:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176675

From: Niko Mauno <niko.mauno@vaisala.com>

Mitigate occurences where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

(From OE-Core rev: fcd340ec53ff8352b8cae0eb351810072b025a08)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/core-image.bbclass                 | 2 +-
 meta/classes/populate_sdk_ext.bbclass           | 2 +-
 meta/conf/distro/include/ptest-packagelists.inc | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 740a6c1d3d..803727da0e 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -62,7 +62,7 @@ IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
 # Do not install openssh complementary packages if either packagegroup-core-ssh-dropbear or dropbear
 # is installed # to avoid openssh-dropbear conflict
 # see [Yocto #14858] for more information
-PACKAGE_EXCLUDE_COMPLEMENTARY:append = "${@bb.utils.contains_any('PACKAGE_INSTALL', 'packagegroup-core-ssh-dropbear dropbear', 'openssh', '' , d)}"
+PACKAGE_EXCLUDE_COMPLEMENTARY:append = "${@bb.utils.contains_any('PACKAGE_INSTALL', 'packagegroup-core-ssh-dropbear dropbear', ' openssh', '' , d)}"
 
 # IMAGE_FEATURES_CONFLICTS_foo = 'bar1 bar2'
 # An error exception would be raised if both image features foo and bar1(or bar2) are included
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index e2019f9bbf..0fd30478dc 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -114,7 +114,7 @@ python write_host_sdk_ext_manifest () {
                 f.write("%s %s %s\n" % (info[1], info[2], info[3]))
 }
 
-SDK_POSTPROCESS_COMMAND:append:task-populate-sdk-ext = "write_target_sdk_ext_manifest; write_host_sdk_ext_manifest; "    
+SDK_POSTPROCESS_COMMAND:append:task-populate-sdk-ext = " write_target_sdk_ext_manifest; write_host_sdk_ext_manifest; "    
 
 SDK_TITLE:task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} Extensible SDK"
 
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index b51cce4d9e..a65c048984 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -99,7 +99,7 @@ PTESTS_SLOW = "\
 "
 
 PTESTS_SLOW:remove:riscv64 = "valgrind-ptest"
-PTESTS_PROBLEMS:append:riscv64 = "valgrind-ptest"
+PTESTS_PROBLEMS:append:riscv64 = " valgrind-ptest"
 
 #    ruby-ptest \ # Timeout
 #    lz4-ptest \ # Needs a rewrite
-- 
2.25.1


