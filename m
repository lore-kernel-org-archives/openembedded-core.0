Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.155958.1598109734857701584
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2020 08:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IdFDlxdu;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id c19so3127250wmd.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2020 08:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pvBDn3iqYYwPYkbtU7bLsyfvt2vLmW0woNVIGlzi1Hk=;
        b=IdFDlxduQWvr86YWRL2lGsmhXWhJfGfbobEbJ1jn/0kWkDD/MCLSBpPmiXETYAoSmo
         2M30+H/fhjy1xpPCP4/bAvUe5GYdqlpVuQmRQJnIix52mzmRGK4zzhZRpYJfkjfFi80l
         ENCFeQYFRcxHVOub+7UdWoR92f+rWAPBQQLz5tXB6d9g/WdnVIR5IFygeGJjKGuAthMM
         qEc8WCeor9S73oY/yWmLgfVisgTw6dXcaFcanxmyvfSm0SBNpFcGJkp+zDJP0Z/8uwWX
         cT752aYtExuMVtpecc/XGnMamOAaU4t0djbmsdxQDMCt9H0i/O8VSVlHIyirBym/HGwE
         E8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pvBDn3iqYYwPYkbtU7bLsyfvt2vLmW0woNVIGlzi1Hk=;
        b=mcperuFm8d+17TQgsIxptknyj/xa6wBRoia6SM9Uc4GVK7tJ8m4SoS9Frf0LovpJYP
         w0h28TiKiQO6q6lP2YuAhKPmhfzjAjWU7OMD4Xy9a+G9DNdupZ2hbZAyC1kZ1qbxr2j1
         Rp2i9SqqTda60phaR9M/tEFoPJQrZU31BB31zIvnDzq9QjYnKmkBzjo6iYCEwGFXsxSs
         cFJSOvLwylKsEE6ezGaygbiGCyvwe/4nvtTMGIHx+u26RbkormVmZRWFY+px7f3qh2T9
         A0vvVCBaqj2u8iJi3dWB6MacuaC0QjbVgoamzLFw+804OKuLkbwAsBC5nXI26ai37v54
         6B1w==
X-Gm-Message-State: AOAM532DZd83rGNhIdiEjSwnnw248NbZfrnEC+awO0venuKKrE6xvDNT
	Kt5uecokr7bE2OyhTbtmCVCA6q925GH94w==
X-Google-Smtp-Source: ABdhPJxkIEusRjUDJgb9Dunap8yKJIUFKvli2vt8p0x6k0KeCFrvNDUeWDNY/4KpMR5Kn4b0xErv3Q==
X-Received: by 2002:a7b:cf08:: with SMTP id l8mr7621097wmg.183.1598109732365;
        Sat, 22 Aug 2020 08:22:12 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id c145sm12110018wmd.7.2020.08.22.08.22.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Aug 2020 08:22:11 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] [dunfell 0/3] libubootenv: uprev to v0.3
Date: Sat, 22 Aug 2020 17:22:04 +0200
Message-Id: <20200822152207.32161-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Cherry pick the patches from master to upgrade libubootenv 0.2 -> 0.3.

Since libubootenv 0.2 is sort of buggy, it lacks of a lot of
bug/regression/security fixes which has been included in 0.3.

Ming Liu (3):
  conf/machine: set UBOOT_MACHINE for qemumips and qemumips64
  multilib.conf: add u-boot to NON_MULTILIB_RECIPES
  libubootenv: uprev to v0.3

 meta/conf/machine/qemumips.conf                            | 2 ++
 meta/conf/machine/qemumips64.conf                          | 2 ++
 meta/conf/multilib.conf                                    | 2 +-
 .../u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb}      | 7 +++++--
 4 files changed, 10 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb} (82%)

-- 
2.28.0

