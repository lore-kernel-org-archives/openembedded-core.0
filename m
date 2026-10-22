Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20635.1792668407166233504
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 04:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KZzk2hpe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso22170855e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 04:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792668405; x=1793273205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5z0cQOa5DargJooLSw/otRQ1XkSfEfWGdPGwCmWK64=;
        b=KZzk2hpeXIbXkc4hz3myH80Z6GHmxmFfF5MFollxdDTyRFUWoA3L1wv942nXJaNdOM
         0dNBnZf0emm5ujfcjpo5gb6eHSO+DLBWLUf+XG18cah9+TjM09+wP87mCraxibVNqWXz
         lQfLd03ooUKbeIUD8Oq1lIo5Gwl/zxu8Rtpt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668405; x=1793273205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d5z0cQOa5DargJooLSw/otRQ1XkSfEfWGdPGwCmWK64=;
        b=Oiv4ma7AeKTH4im07jzGURf6ro5qSpCeOg3PP9vRa+gmBN7O9QUNvVifLrjBA9lPWz
         BBTYlMeFA2odZNzHO5UWStKF2bLFs1splemLYwoDdTG4RgLzfC1bRbbDwY8tmQKwmEKw
         rKVNx/Pw7DzrIY/nNwrlxsmpkHQ4kkrLFRYCGz3ru75bYTNFI4kVkSBnVv34D0+oL1BO
         Zj3yuMrpCtoSw2NIyw+zOEZgupkQKDjGVDnxZ5WzXr0P/nvpQ/dnisV6bHr1Y9Uzjnl4
         pdrKTRBJMEp75QcDy4CTCSZ6z8N/Y4Vv39tNFSD4tM71sYkR1T+k9FxnRTZDqBZysIVU
         oieg==
X-Gm-Message-State: AFq9FYJfUknpub/cL7tJP0edcPwputh5X31ohkxOABrpz7xkWqovtOVS
	Rxas23sowhZ8EKjcN+gxAkXXBy/W0gndMrlA18A7h+54TxlEpN7RR1Gz4vJG+6FnMQUaKZ2U3o3
	643ohE8g=
X-Gm-Gg: AYBFou3bS2wbcFiR1az3AeJ5Yiui5NtXvZlWant5SUBJB7rQ+LZgr1LTxVXNNMno/Ns
	Y3s7WtROTcIrlLsAMQemcumvN6Q5Js6Y9veVxj2CnJPk7Z/+Je4rNoZ7jvVzo3oNauDiQ1UxDTB
	XaGFHygXTnEYvW5Db9l0Uteyrn8lFxrYI7rNjeput1BuZUi2RKMHNt4q7U+XLVNiHinOQRn1Ssk
	kEo7eLM7yks206mB36mW70QONIk2Eh4HrgRFAHwseIU97wT2NAF1RKdOHCjlU2Q3QPzvB+eTAtZ
	O/lXiOLlW0kcFJxGbDIVs5Pa/R+sO+eD59yODLcNqF+7b8waYWkzatUnuzFqwtE4i6IMGeQlqt3
	hPRY8AGu1jyP4d7AwIKDV48UPv5Sl6EjIVNts9pPS1am0HAs1zALjZpS36XRpI53vgPqcxaMqqN
	2Tpr/ymbK+b1WNBgz1P1tHtc/xs8ZiIPBibT7zT2JLoCwA+0UBZFvStgRvm7ESAS3GlaMVlySMn
	QXEBHUb6OwJX1GYlZJYK8OF9xaV+Seymh3bexjvSMSbMm3RS2+Ep7GHQWNKM5nNUpT2oFSX0VUX
	eHnu350V
X-Received: by 2002:a05:600c:524a:b0:4a2:994:5750 with SMTP id 5b1f17b1804b1-4a209945818mr22642415e9.32.1792668404925;
        Thu, 22 Oct 2026 04:26:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b8c1:c201:8aca:1e39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0e64esm63874605e9.3.2026.10.22.04.26.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:26:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] populate_sdk_ext: Fix locale error handling in SDK
Date: Thu, 22 Oct 2026 12:26:41 +0100
Message-ID: <20261022112642.3481476-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 11:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248440
Content-Type: text/plain; charset="utf-8"

During automated testing we occasionally we see the error:

"ERROR: the installer requires the en_US.UTF-8 locale to be installed (but not selected), please install it first"

This is puzzling as the locale *is* installed. The use of -q with grep in
a pipeline is potentially problematic as grep can exit early and cause a
pipefail/SIGPIPE.

Tweak the code to avoid it and a few other issues (add quoting, handle the
"." correctly, match a whole line).

[YOCTO #16198]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index a1188da9697..00b41ec0cbf 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -678,7 +678,7 @@ sdk_ext_preinst() {
 	fi
         # Check setting of LC_ALL set above
 	canonicalised_locale=`echo $LC_ALL | sed 's/UTF-8/utf8/'`
-	if ! locale -a | grep -q $canonicalised_locale ; then
+	if ! locale -a | grep -Fx "$canonicalised_locale" > /dev/null ; then
 		echo "ERROR: the installer requires the $LC_ALL locale to be installed (but not selected), please install it first"
 		exit 1
 	fi
