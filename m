Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.583.1598464142180634355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 10:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cmda/GXu;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id y3so2708312wrl.4
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 10:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nXoWzo8qpHf+bIy7l+6XUmxMULHhHPBeuPQy2ggoDbQ=;
        b=cmda/GXuxo1JYj3QJbSCTlnMp4Zz6iTifwmE7OAoAUIwKpNVRXSKaUZlSowHxrKog6
         iYB4cvyEiaKE1l3QKchJDs9XDOwCVPkpH6wa9ioWy0y/rkMYeMk4XY7MXPIR0JCQKzrx
         rjXyfYscTy/6Demlc/4mPFM5QndQNs3QBtv6elq1yjAyTmBKfsl6RzCH1iTyNbC1Elur
         lRWWC9eoLkgCB3DXQi+9VM12cS5UrBAbsEh4OcCpcSUh2jMeCxu9otBnWsvuli9hfvam
         xHyJHc26VZFYFCbQW1YQ96YjN3PA/qt9IzspAp6rBa6RfcV/ezW9KoQ5UrUjrtKBsvWA
         HE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nXoWzo8qpHf+bIy7l+6XUmxMULHhHPBeuPQy2ggoDbQ=;
        b=LlOCON+JSYO77snRfv1e8ictsFNRXh98/cb7KrXQb7iKwyz59/cdBS2ABYO7HlegRu
         ngg/Z0N38S23E72evzmQTk7mnZXPV241uOr1LtOQgvnudNvUKzTehyC3+jZcZAXv+ke4
         wuqhUdmId6uVEVp96HBktPIOoVSYbouy/0CmTB85jTIlFgOiy9WSHqkxWGBLOoVxTlbu
         kOdOOU15Kffr0O7BTPjj/4YILBlvotYucoYRO3j7sDUhaIxhMglDRJ8ihJC5RZiF7fhi
         345bJKCJnj9NVG8Tge+jHrhAlhCLGlw89S55uck3YvjB/FTHuXE0XD8o8XHU8tl55sqf
         322Q==
X-Gm-Message-State: AOAM532d3F4ko0nxYlNADJALIUr4PbOmYy7vDRiBJZlFqe0RcMHe23l1
	6t8bFzMFFZQYvFoR9jFfvcowQj3G3nLb7A==
X-Google-Smtp-Source: ABdhPJybzysAfqgDTht8eOhJH78pSHfW5PmXXP53KSruiwmOXiz+30s7tpfFKGl1YEMYFMkNInrs1A==
X-Received: by 2002:adf:f442:: with SMTP id f2mr6059110wrp.184.1598464140365;
        Wed, 26 Aug 2020 10:49:00 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id u17sm9168529wrp.81.2020.08.26.10.48.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2020 10:48:59 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	anuj.mittal@intel.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [dunfell] [PATCH V2 0/4] libubootenv: uprev to v0.3
Date: Wed, 26 Aug 2020 19:48:49 +0200
Message-Id: <20200826174853.8838-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Cherry pick the patches from master to upgrade libubootenv 0.2 -> 0.3.

Since libubootenv 0.2 is sort of buggy, it lacks of a lot of
bug/regression/security fixes which has been included in 0.3.

Changes in patch set V2:

1 Let libubootenv inherit uboot-config to get
  UBOOT_MAECHINE/UBOOT_CONFIG sanity check.


Ming Liu (4):
  conf/machine: set UBOOT_MACHINE for qemumips and qemumips64
  multilib.conf: add u-boot to NON_MULTILIB_RECIPES
  libubootenv: uprev to v0.3
  libubootenv: inherit uboot-config

 meta/conf/machine/qemumips.conf                          | 2 ++
 meta/conf/machine/qemumips64.conf                        | 2 ++
 meta/conf/multilib.conf                                  | 2 +-
 .../u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb}    | 9 ++++++---
 4 files changed, 11 insertions(+), 4 deletions(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb} (78%)

-- 
2.28.0

