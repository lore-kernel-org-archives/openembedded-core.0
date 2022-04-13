Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3F1C47091
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.4465.1649844499304444950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 03:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vb5qlWs5;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: abongwabonalais@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 m67-20020a1ca346000000b0038e6a1b218aso844321wme.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ijDo/esx06OLRU/HwsL298dl0PIUtcwpatSLD5/+Fno=;
        b=Vb5qlWs5NkgKQFHJja05WsEJGgVnzB5rjgr1Q4doOLKKAnGhTgPEWoLABhbGLnSrxO
         0ROc119Me2gJlOi0H90TiwjRy2EjCnkcuiGkE+D3FgONTac0kzc75qIghNuWZP2HzBAW
         k3kLGJ+IYlFN4fxrx3kAw+XNGFHzHVOphHInkrfUi/yLCK0I7wzgI5KONO0hiddi0+ef
         QxPYKL7iKWhe7O7lBGRWgPwVYmNK5XGS2tvaDD15Z1N5eyZs2IYlH6Yd5Nem//iU1t8J
         yoMfOimVuq77xWOB8Up2CzceSnOx1AUgocpM55VfnY6uPulEVLzE/Uz8CuyJMCRW8uRV
         XNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ijDo/esx06OLRU/HwsL298dl0PIUtcwpatSLD5/+Fno=;
        b=cQW/cZGrxghRv5bnsgCGa7g1KdX+lpPrpPqieZUkh7tzKG/j3nksn6bOtlH0+yGKAe
         VZjSl1kiDuhmaLGVvU2NQpHkumt6lMTBhAxCoO//k/QLnv2nYT827gS+WJwo2P139kdp
         dBPFCsLXDHP2RX0L7aH0BxfuXe4ktKoqtVy+iyhv6X7IDbqznF1do1MWdkBR1aI9f4Rz
         jDbcybiXRWnKsLfvQNcX7DI6eTrXbI/i2t807m1D+aMpVGLOjlJOG/RMCbg2KQ5wMtqJ
         RfdT6xTDK/FWb9mlUAddbL+Ur/f/cB83EB+A7JG4BvTbk0qbi4kdnGyu0EsSzLioZXj/
         WVMg==
X-Gm-Message-State: AOAM533GOZBoX0mOAOWLKTKn3eexEun1rAvj4OYUU+D+QUmDAtW5GSuX
	fmisdzf0liADKhumg40zCCnCOjiGJMnG+g==
X-Google-Smtp-Source: 
 ABdhPJxyITBM955eUnUuduBrNBcp/glnn0OFzzUs6fgqFdbnIdVQ6KOVHFmefjfPi+R8KK9DiH0PSg==
X-Received: by 2002:a05:600c:1994:b0:38c:48dd:23ba with SMTP id
 t20-20020a05600c199400b0038c48dd23bamr7811841wmq.206.1649844497540;
        Wed, 13 Apr 2022 03:08:17 -0700 (PDT)
Received: from localhost.localdomain ([154.72.153.130])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038ca3500494sm2595774wmq.27.2022.04.13.03.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 03:08:17 -0700 (PDT)
From: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
Subject: [PATCH v2] "bitbake-prserv-tool: Added quotes to variables to prevent
 splitting and gobbling"
Date: Wed, 13 Apr 2022 11:07:46 +0100
Message-Id: <20220413100746.6383-1-abongwabonalais@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164313

Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
---
 scripts/bitbake-prserv-tool | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
index e55d98c72e..c9fe4afca9 100755
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
@@ -16,22 +16,22 @@ clean_cache()
 {
     s=`bitbake -e | grep ^CACHE= | cut -f2 -d\"`
     if [ "x${s}" != "x" ]; then
-        rm -rf ${s}
+        rm -rf "${s}"
     fi
 }
 
 do_export ()
 {
-    file=$1
+    file="$1"
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
@@ -40,11 +40,11 @@ do_export ()
 
 do_import ()
 {
-    file=$1
+    file="$1"
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


