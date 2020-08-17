Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.39928.1597656787632800607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 02:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B8XrcZUY;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id t23so16713913ljc.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 02:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KujZjCAi+C1kFwzlMIIGiWRi/0bx2CTeYqaILCYd1dc=;
        b=B8XrcZUYZwAk3pETjIYEaP0wLA3QYIsQpDyEVhIKVlQMO7FZ6xTg7IuKmByGXBRWzv
         n9KLKMxjmahzhSJtcI04PBHR0JNHnzKkBcdaCdC8Fe/tkdHvHGqSnw07E6gM3bKpyG1x
         Sjrg6lc/03J1eJ2c+ZpaMqef7ONUapFTNzs92h3JsUg3blrGZSCGc2J/YXbYedNKk4Q8
         cTFt0vb7xxO5sllsOvtXyNoX6WYscbIicgmszj/iR7z494MAFCqR3fQfb96xpZ96TKc3
         WfRvPAsLmYrr80obtkVlnlnEcaWp/fGUrfmQOhl7QwUjbkSkt5mkmV6PZoZyMkQ2EfLR
         IoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KujZjCAi+C1kFwzlMIIGiWRi/0bx2CTeYqaILCYd1dc=;
        b=ITau0bsTk87i9xvGOckJLFEOBBjqSrxqoAtg0g4//uU+CQT7wJR/2xwW+veBy8dpRU
         Z3c0Na6/1+M9XqrxMSVoQUqfokB/Q6XO0Xdj0bwuxw/nZzZiYLi4cgA8lDdEhx5McMi1
         2Pf7Kq/OOF2NIssp+6JqqrnZTZuK/A8UCJeAD8U8I/X+2isP8hkEA8aREdiH1XULwIbT
         841ZvKGRWqK1uWKLRxWbioePJq6gMlJkNkjw38K2nL+n8SFqhsHTgyyBTJBDuP4OYsU6
         vqXS6rxcZGdAhjnkN2Ag9t44id8tpZdY3HH8+CcIgLUTaW4oNnLZvrZ93uGC5n8G+uQp
         8lSQ==
X-Gm-Message-State: AOAM5318qHhaP+f2+sgYbsx1gOQ661FhXlR8+dUalLRgmiadNL2sZti6
	HI45nSSNokGLTn/OKlIrVf8TblkA8empqg==
X-Google-Smtp-Source: ABdhPJxIpBxN3x8huOQMJlO7XEsJhdo8/hlAL6nZBR3nKiILHXDTcTnAFiG/o5euic+idq4XyH7thQ==
X-Received: by 2002:a2e:8612:: with SMTP id a18mr7070369lji.149.1597656785462;
        Mon, 17 Aug 2020 02:33:05 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id u20sm4980097ljd.135.2020.08.17.02.33.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 02:33:04 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V4 0/3] libubootenv: uprev to v0.3
Date: Mon, 17 Aug 2020 11:32:53 +0200
Message-Id: <20200817093256.21644-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Changes in patch set V4:

1 Add UBOOT_MACHINE to qemumips/qemumips64 to fix a uboot build issue.
2 Set PACKAGE_ARCH = "${MACHINE_ARCH}" to fix a
  test_sstate_sametune_samesigs issue.


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

