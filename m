Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.20719.1621847646840034729
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jygLufsI;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id gb17so22647504ejc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xF89n+LNa6o5FvjalO1ddsU8sRHnLAUMUplF+3yPNFk=;
        b=jygLufsIICNl2qxcLlNt4U7i9KVxtcsl6wIoI/HR34rJqwi852x6wNrtnfMz3ZaKnF
         JEznucojuRVjDAQo+GdCahOdoTI9CjcTE8q6QatenGcGe7eZV1SSyK7zAd6cvIU7M4fa
         2kWMhxqc36+PWcGSPSF5T+QhIZEdtttpNXxic6fEpSv/0+7AkweCruD77F1+nI497zhs
         s6uSsDC5Sk2a2UVfu80IJyRg6ZD3bxiI+dQMsgIaiKMz5aj4LkHiW4yPth6TSUFfq/eC
         LCjRNLfjSSeGAcum7MW/prbK2Vvc4Im8qCMp1iSFvX+cRNhz4Zy5bp0k8S4+xOlGCr4I
         bhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xF89n+LNa6o5FvjalO1ddsU8sRHnLAUMUplF+3yPNFk=;
        b=OUQvaDFYyVR5/kwStMi2vhltha5Ugm109OPnTA7sWxi8j3LJBp74O1rwdL/8iT6pUk
         uMfgYrZkxTlCXgyvPP6TJDbXCeNRAQQvvgm8tpqtwxItZL0mXbRE9RZ+okBh0pLPy8Yi
         v/2nVSA0AZJuUIJrqm+1r+wxIXThXhvjDIvE8C12PHGAf28Rt449pshvsAfOBt4fD9Ty
         S9NTBHCI+lIFaEthGXxtfuMoAzNImvFX8Pq9/FSm2AYmaehuImPv52Dsv2hdpfJS1AwH
         R4gdBgnqqrBOlPMEUG1QJkr17FFwSlr4VmtZ5S33NZBM5f7ymbA+YdB+7GixjhElKRmt
         DwdQ==
X-Gm-Message-State: AOAM532tBX6B/loKH6uG7bQ7ioTifDGfRbjd9AaJeMsWIkDZetC8a4EE
	uNSH88GnX94BBaFdtAvoG1Q4PXgjXks=
X-Google-Smtp-Source: ABdhPJxeWbKra0WclU+oruYk7BPdR/4ESiQLSEnI2r1YmuE+b0VwQzU1zBM39gZxY+na74y1hQ+kAw==
X-Received: by 2002:a17:906:9bd6:: with SMTP id de22mr21988636ejc.382.1621847645430;
        Mon, 24 May 2021 02:14:05 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:05 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/21] systemd-conf: do not version in lockstep with systemd
Date: Mon, 24 May 2021 11:13:29 +0200
Message-Id: <20210524091347.419253-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is not needed as systemd-conf only packages
standalone config files.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../systemd/{systemd-conf_247.6.bb => systemd-conf_1.0.bb}      | 2 ++
 1 file changed, 2 insertions(+)
 rename meta/recipes-core/systemd/{systemd-conf_247.6.bb => systemd-conf_1.0.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-conf_247.6.bb b/meta/recipes-core/systemd/systemd-conf_1.0.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd-conf_247.6.bb
rename to meta/recipes-core/systemd/systemd-conf_1.0.bb
index ea35e83f4f..235923be85 100644
--- a/meta/recipes-core/systemd/systemd-conf_247.6.bb
+++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
@@ -5,6 +5,8 @@ DefaultTimeoutStartSec setting."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+PE = "1"
+
 PACKAGECONFIG ??= "dhcp-ethernet"
 PACKAGECONFIG[dhcp-ethernet] = ""
 
-- 
2.31.1

