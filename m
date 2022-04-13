Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CD6C47090
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.4297.1649842559120282294
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 02:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lMRvZWeL;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: abongwabonalais@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id u3so1757240wrg.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 02:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LkUpFt2+czifhhVJC+q4MJH1zvxfqnNt/oBadRaLRXA=;
        b=lMRvZWeLazvCK1O050YDECKG4pHLkd1k8nY/Vk5ZRv3wcWTpkFSQOFJdnOumblGb0G
         VaGYkj6+c9IdeTqJmXo0NlsPabSIm14qGLson0aRNtAgtIvNVOa2sdD+1ZDF9rULxZGm
         SoxPfDcNF/gv6pG1aokJAZEM5wx71WODaqgcYY7YmepowWhUSoQMA7XakLGNcW4xlbtc
         O3iLRvoy8mh7Y64BqvVkO8sWsgJAgtm6K2Z1wBlUtnbfBRD/knnmTz1PsKxcqKcaaP0b
         hiu1tXtaV8qTdRNYHn+go2AhSC3Ffsy3Ed59zuybAKrch+zjGzGnr2ADTE7GXmobOHIX
         VEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LkUpFt2+czifhhVJC+q4MJH1zvxfqnNt/oBadRaLRXA=;
        b=ZSKpARu6oia5yWCrqdvmxsgYzmGj10TnCtlxQWHhVOJIG9QYPkoby6GqeXw6stLRjS
         BY584aCFTEA7lj/Pv49cOFJuZrQ0VTzZbSPKNZ9Xb5IpC3Bhuy9W108Bu4Chh4Twt4G8
         v6F0h+AbE2MX9uHFravr/uNCc+4kpPQnhGLutQMAiGhFzkjnMDWWHkD1PrAYPEKJUa2z
         ICHmHHgtsTprZDN403OzTSNQjGLh58AFMzWgs2l3lJs9wLa+LnK6gihtXrngHbgQ5lvR
         qqT/tjpqVV/8ECKrHk5/TRPKW0NfsvfJl5XKONb3UFMQGtfX3QWHCt8V6V+li6b2T1ZR
         nJhg==
X-Gm-Message-State: AOAM530zG9R399idhYFph/1tSRoNYGnEe0Wr3ks2pCYBrI7gfDltMZv3
	zsVwngaoNC/oIMhhSyLptUnWTqJwS+MFVg==
X-Google-Smtp-Source: 
 ABdhPJwGu/8FkLesw1AC/EQ9Eh+Tlmhu6QhvZWh1T1lcK8ff+G9R06oa0udN15aK27aiFjXgTCq/LQ==
X-Received: by 2002:a05:6000:178c:b0:204:648:b4c4 with SMTP id
 e12-20020a056000178c00b002040648b4c4mr30961723wrg.219.1649842557250;
        Wed, 13 Apr 2022 02:35:57 -0700 (PDT)
Received: from localhost.localdomain ([154.72.153.130])
        by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c4f8800b0038eb596ab10sm2068372wmq.2.2022.04.13.02.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 02:35:56 -0700 (PDT)
From: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
Subject: [PATCH] "bitbake-prserv-tool: Added quotes to variables to prevent
 splitting and gobbling"
Date: Wed, 13 Apr 2022 10:35:44 +0100
Message-Id: <20220413093544.5587-1-abongwabonalais@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164310

Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
---
 scripts/bitbake-prserv-tool | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
index e55d98c72e..68caa9fb66 100755
--- a/scripts/bitbake-prserv-tool
+++ b/scripts/bitbake-prserv-tool
@@ -5,7 +5,7 @@
 
 help ()
 {
-    base=`basename $0`
+    base=`basename "$0"`
     echo -e "Usage: $base command"
     echo "Avaliable commands:"
     echo -e "\texport <file.conf>: export and lock down the AUTOPR values from the PR service into a file for release."
@@ -16,7 +16,7 @@ clean_cache()
 {
     s=`bitbake -e | grep ^CACHE= | cut -f2 -d\"`
     if [ "x${s}" != "x" ]; then
-        rm -rf ${s}
+        rm -rf "${s}"
     fi
 }
 
@@ -24,14 +24,14 @@ do_export ()
 {
     file=$1
     [ "x${file}" == "x" ] && help && exit 1
-    rm -f ${file}
+    rm -f "${file}"
 
     clean_cache
     bitbake -R conf/prexport.conf -p
     s=`bitbake -R conf/prexport.conf -e | grep ^PRSERV_DUMPFILE= | cut -f2 -d\"`
     if [ "x${s}" != "x" ];
     then
-       [ -e $s ] && mv -f $s $file && echo "Exporting to file $file succeeded!"
+       [ -e "$s" ] && mv -f "$s" "$file" && echo "Exporting to file $file succeeded!"
        return 0
     fi
     echo "Exporting to file $file failed!"
@@ -44,7 +44,7 @@ do_import ()
     [ "x${file}" == "x" ] && help && exit 1
 
     clean_cache
-    bitbake -R conf/primport.conf -R $file -p
+    bitbake -R conf/primport.conf -R "$file" -p
     ret=$?
     [ $ret -eq 0 ] && echo "Importing from file $file succeeded!" || echo "Importing from file $file failed!"
     return $ret
@@ -60,13 +60,13 @@ do_migrate_localcount ()
         return 1
     fi
 
-    rm -rf $df
+    rm -rf "$df"
     clean_cache
     echo "Exporting LOCALCOUNT to AUTOINCs..."
     bitbake -R conf/migrate_localcount.conf -p
     [ ! $? -eq 0 ] && echo "Exporting to file $df failed!" && exit 1
 
-    if [ -e $df ];
+    if [ -e "$df" ];
     then
         echo "Exporting to file $df succeeded!"
     else
@@ -75,7 +75,7 @@ do_migrate_localcount ()
     fi
     
     echo "Importing generated AUTOINC entries..."
-    [ -e $df ] && do_import $df
+    [ -e "$df" ] && do_import "$df"
 
     if [ ! $? -eq 0 ]
     then
@@ -93,17 +93,17 @@ case $2 in
 *.conf|*.inc)
     ;;
 *)
-    echo ERROR: $2 must end with .conf or .inc!
+    echo ERROR: "$2" must end with .conf or .inc!
     exit 1
     ;;
 esac
 
 case $1 in
 export)
-    do_export $2
+    do_export "$2"
     ;;
 import)
-    do_import $2
+    do_import "$2"
     ;;
 migrate_localcount)
     do_migrate_localcount
-- 
2.25.1


