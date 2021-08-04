Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.7168.1628073415378966704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 03:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O7LEBzk0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id b11so1674428wrx.6
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 03:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DtEpzc5/qcOdtRpFxyhP8x0Asm59s1w7Ym5ryGqRstk=;
        b=O7LEBzk0lbFpAsU+AxTR6o/uFpVmL2lrt5iG/MsuInHSdE63O1JjSAVkH8HRVYkb2d
         ksmkQ/P1KoPUuRKxvLFaqout0asisFWYAlLYCg7P3RMnF3h9PeuRgzb2nXUCu9nbXXQM
         /RquZZUC51G+MHmq+FfyXcgdU/A9sPHK6q/v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DtEpzc5/qcOdtRpFxyhP8x0Asm59s1w7Ym5ryGqRstk=;
        b=aNQq0MMn0vdhFi10qsQF6hU37HpjaoSIr73dEtGadCDbD3ojhbnE92Ldcn1IAMRu4i
         K7ODhtjIfrVosPhMa+MH62okkSixL8tMSbq4EoExgxlqmwnLum7oPs7k0r+dAqdQRO9d
         x18UM8ki9ev+UL5c8H1O9I2Jbi0jPSJq3RxJoh9JuWupMoikYYF25gUX896X3Vp6lN+b
         9+RADdG8FdsSka5Y4HojRFnRKUbCL7yx2MLIPAJqVmtt9yM6HG3VF5vXRGhEK8h2W4QH
         4aSYYBg+rm+P1gDTJNjA5dLxFQem/0dcWVrw7f7CNnQNBtvnlkDUqVcaA/JaNei0tTjo
         uQNQ==
X-Gm-Message-State: AOAM533ojG6QhvtwlPr7lZrokKqtxK+gBoMrAAK8O1UQAWmTDQMurVEi
	uTcUAcqUvLjWx1NBXbn5rZzwoNH8eIHrOw==
X-Google-Smtp-Source: ABdhPJz/FGZuLDL1Y4h/abXYqS/Tml3FEEahMpWbe00LvY8yqiQSaygtWtH7iW+qoD0/AK6C3wHlZQ==
X-Received: by 2002:a5d:55cb:: with SMTP id i11mr27854411wrw.158.1628073413945;
        Wed, 04 Aug 2021 03:36:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id k17sm5847043wmj.0.2021.08.04.03.36.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 03:36:53 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] uboot-extlinux-config: Fix missing override conversion
Date: Wed,  4 Aug 2021 11:36:52 +0100
Message-Id: <20210804103652.3507412-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804103652.3507412-1-richard.purdie@linuxfoundation.org>
References: <20210804103652.3507412-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/uboot-extlinux-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index be285daa016..dcebe7ff313 100644
--- a/meta/classes/uboot-extlinux-config.bbclass
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -64,7 +64,7 @@ UBOOT_EXTLINUX_FDT ??= ""
 UBOOT_EXTLINUX_FDTDIR ??= "../"
 UBOOT_EXTLINUX_KERNEL_IMAGE ??= "../${KERNEL_IMAGETYPE}"
 UBOOT_EXTLINUX_KERNEL_ARGS ??= "rootwait rw"
-UBOOT_EXTLINUX_MENU_DESCRIPTION_linux ??= "${DISTRO_NAME}"
+UBOOT_EXTLINUX_MENU_DESCRIPTION:linux ??= "${DISTRO_NAME}"
 
 UBOOT_EXTLINUX_CONFIG = "${B}/extlinux.conf"
 
-- 
2.30.2

