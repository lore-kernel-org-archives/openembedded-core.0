Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web12.1120.1617290971480337629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Tf55jJfW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso2526051otp.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZBsa4eHPHmutUvQ1nf9pG5+yn8u9LvOdkoizgGhH/wI=;
        b=Tf55jJfWaC8JHbF38nLFnHZGfrP356R9QVQeLn7rc0uYjLTYqqbeTzOSZhZ0khJ0Lr
         cuRXasmAj/rs40kPoeqmmULsJqPgPxfy/jX070FxEo4EDSZI2n5BPgdRKxzj7/iT97Ej
         0tEPNemUh/4CbqxldBuwURm4ZP2htwdrf5EIrfywDgx1QRmLrWgT3ns/R4aqdEtgYXbL
         +sRN9DCQPppuT9D/lfWLFJ+rGxgnvZcAxgzDUopXXoGoD/HodDQclm4tLIEiFos3oYms
         kC8KEOt9Q7vNYLjUaoewBOOtDsYKLP0N8gVfFwItMpTAo5sqPbI9kxGzzwUo1mB9q7uQ
         0uFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZBsa4eHPHmutUvQ1nf9pG5+yn8u9LvOdkoizgGhH/wI=;
        b=iGZNnMQjLoaqHs4jqPbdukqVobMeo8QaPf1OdDfjpAaJD8BSff5Q3EI4nrH1mAf5YN
         cLWISSBKwRQ7RBcHv7Xr9Qao0J3kJOfvaRibZ4xZs1yUWuvTfSfJZsj1E4kI9lcn8bjW
         qBP2D1SGPYJ293VLJPlhood0MFLnr5kRC9Csur38oQU1NpI4zE2m1G7Wkc7htrIP8efp
         xq2kyQfNHiSgM9V+dS1/D6BBhmTS8viSE7b+J+97jOF8Ie00L0O92+b5xWEpeQngMX3L
         VvBIW0om1TOJkH9IqwxjeRkIWvAyjNzarhCXfSQdOjr4tsknfO7PvuBNhGZRc1qOOqaw
         73Rw==
X-Gm-Message-State: AOAM530T73IYj0ehuzcuy4Zgm45EqDWAf5UdX0vKUkFxWdp1TWt/1WJu
	XfU4YiG8ETJUA0FlzAf9eng/nwsPRJRbVYie1qc=
X-Google-Smtp-Source: ABdhPJxfA3LntLDvZh71Nf5kF7s0CYOvLj3oc6V4xOs+6XsViMY4VAUMQ3hMaCcaQwDOpNhqgVjOSQ==
X-Received: by 2002:a05:6830:14a:: with SMTP id j10mr7456657otp.143.1617290970406;
        Thu, 01 Apr 2021 08:29:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id u7sm1159610ooq.13.2021.04.01.08.29.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:29:30 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/15] buildhistory: add missing vardepsexcludes
Date: Thu,  1 Apr 2021 05:27:43 -1000
Message-Id: <7b92087492b67d6ff1f58fe3fa0f7dfbc732e5ab.1617290310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617290309.git.steve@sakoman.com>
References: <cover.1617290309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christopher Larson <kergoth@gmail.com>

For POPULATE_SDK_POST_TARGET_COMMAND, POPULATE_SDK_POST_HOST_COMMAND, and SDK_POSTPROCESS_COMMAND, the appropriate entries were added to vardepvalueexclude, but we want them in vardepsexclude as well.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 554b17e0bbe5190e4b03121f2ed06f4845012a71)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/buildhistory.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8a1359acbe..44a66df962 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -671,13 +671,16 @@ IMAGE_POSTPROCESS_COMMAND[vardepsexclude] += "buildhistory_get_imageinfo"
 POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_list_installed_sdk_target;"
 POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_get_sdk_installed_target;"
 POPULATE_SDK_POST_TARGET_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_sdk_target;| buildhistory_get_sdk_installed_target;"
+POPULATE_SDK_POST_TARGET_COMMAND[vardepsexclude] += "buildhistory_list_installed_sdk_target buildhistory_get_sdk_installed_target"
 
 POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_list_installed_sdk_host;"
 POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_get_sdk_installed_host;"
 POPULATE_SDK_POST_HOST_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_sdk_host;| buildhistory_get_sdk_installed_host;"
+POPULATE_SDK_POST_HOST_COMMAND[vardepsexclude] += "buildhistory_list_installed_sdk_host buildhistory_get_sdk_installed_host"
 
 SDK_POSTPROCESS_COMMAND_append = " buildhistory_get_sdkinfo ; buildhistory_get_extra_sdkinfo; "
 SDK_POSTPROCESS_COMMAND[vardepvalueexclude] .= "| buildhistory_get_sdkinfo ; buildhistory_get_extra_sdkinfo; "
+SDK_POSTPROCESS_COMMAND[vardepsexclude] += "buildhistory_get_sdkinfo buildhistory_get_extra_sdkinfo"
 
 python buildhistory_write_sigs() {
     if not "task" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
-- 
2.25.1

