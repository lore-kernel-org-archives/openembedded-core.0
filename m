Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.350.1592848774198040204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 10:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DTA8l/gf;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id d67so16405818oig.6
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 10:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=d06Gc6mytfSmrFYXXB45fx3ZdhJGv5ctHISLxUF47zk=;
        b=DTA8l/gfPQrFlmq2862PwOdLg5R937afuLTuOe1QyXb91SyMnn1q2avHVMEiIkW5Bj
         klpv4JbC+i5ueGYAv/6AbmbStuzGOww/hJCk+tHqkoar7v6zyoIGz3hEvVv5nVB0lrRA
         kj0gYx/lFfoKx1tHWEz4xSddk/1A1sSIkHQ/tfsvNt3H6NzsnW6Jy8yTRfDZihj5OpSt
         cCzWj8oZf4QpCNTle+M7sDORrHFa6vncM+X/3AwRELB4gXYubPd6uBkbkWg4DVnJ1mr1
         rTVxIbYGhUtWUGCj4eXYmgmeTBRsjnb7InuiFUrLfepvzJ8ARVEveS4SNmilMDZ0Ptag
         NlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=d06Gc6mytfSmrFYXXB45fx3ZdhJGv5ctHISLxUF47zk=;
        b=tGIN9WhHZr25kG3LoVKFi8zD93FRrxePcGUKosB/ZONZtMBxm8zYHDtp2BWysMRTZ/
         swUxErFEI88CH5ealTBWCqp6S/iLSfcYqb2BfRxaCdDvH/58D2kfT7qXKoKjvpO3NJT+
         DXFiPndVbwcC4YE+QH5rMACy7Emh/S1MV36ag7mh9StRCHVOxcpbkki0a5FbruwIaiFQ
         IEw6ApJyhzm44HBGalnirVduQSv/OOKL3VOUqNE+DsIBOX2vHPGOrmaUm0itzorEGQ5K
         18JcgImJ6PvmT6j6KSBbvUp0GOln+5ZdgmqlPz1uC4vxGOdoNUcpIjRsSD0nU0JVkeiF
         NoBA==
X-Gm-Message-State: AOAM533i7laaf9SJH9+QZVao+i52QnqwBTbImDmYPaKzLtZV7QyAZGz8
	0+6kalc0rVi2hGypfbF+atoYpL6xqEz7zg==
X-Google-Smtp-Source: ABdhPJwR/HEsVFR3pHcTV0IK79Qepm4CJxyKIO9xujoFBpjVpBHU3hWcclvBuIq4H1buJAH4MQ5wlg==
X-Received: by 2002:aca:5310:: with SMTP id h16mr13449682oib.163.1592848773009;
        Mon, 22 Jun 2020 10:59:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.10.59.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:59:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/33] populate_sdk_base.bbclass: fix warning: name not matched
Date: Mon, 22 Jun 2020 07:57:57 -1000
Message-Id: <72b7c3c7a35d814510aa1a52d2707a1ffddf8e8e.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>

When do populate_sdk with SDK_ARCHIVE_TYPE = "zip", have below warning
in log file, this patch fixes it.

zip warning: name not matched: sysroots/core2-64-poky-linux/etc/tmpfiles.d/etc.conf
zip warning: name not matched: sysroots/core2-64-poky-linux/etc/tmpfiles.d/home.conf
zip warning: name not matched: sysroots/core2-64-poky-linux/etc/resolv-conf.systemd
zip warning: name not matched: sysroots/core2-64-poky-linux/etc/mtab
zip warning: name not matched: sysroots/core2-64-poky-linux/etc/resolv.conf
zip warning: name not matched: sysroots/core2-64-poky-linux/var/lock
zip warning: name not matched: sysroots/core2-64-poky-linux/usr/lib/environment.d/99-environment.conf
zip warning: name not matched: sysroots/core2-64-poky-linux/sbin/klogd
zip warning: name not matched: sysroots/core2-64-poky-linux/sbin/syslogd
zip warning: name not matched: sysroots/x86_64-pokysdk-linux/usr/bin/chfn
zip warning: name not matched: sysroots/x86_64-pokysdk-linux/usr/bin/chsh
zip warning: name not matched: sysroots/x86_64-pokysdk-linux/usr/bin/passwd
zip warning: name not matched: sysroots/x86_64-pokysdk-linux/usr/bin/chpasswd
zip warning: name not matched: sysroots/x86_64-pokysdk-linux/sbin/vipw
zip warning: name not matched: sysroots/x86_64-pokysdk-linux/sbin/vigr
zip warning: name not matched: sysroots/x86_64-pokysdk-linux/sbin/nologin

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5f7df08aca81ac269490876fe84c7fc5b1d5739c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index ef0d8bef58..3e5b1359d6 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -58,7 +58,7 @@ python () {
        d.setVar('SDK_ARCHIVE_DEPENDS', 'zip-native')
        # SDK_ARCHIVE_CMD used to generate archived sdk ${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} from input dir ${SDK_OUTPUT}/${SDKPATH} to output dir ${SDKDEPLOYDIR}
        # recommand to cd into input dir first to avoid archive with buildpath
-       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
+       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r -y ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
     else:
        d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
-- 
2.17.1

