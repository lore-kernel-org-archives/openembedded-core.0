Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.14544.1597397365279431596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 02:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NJ9ONR+9;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id d6so9234351ejr.5
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVHEzrHe8tC361BwYscMzFC8Qnzl0iGxDL0dRLcOrjs=;
        b=NJ9ONR+9jJFTK09YGzDcB2enGRWEL5Mp3ClrLvbLzpXygdcs8p8ByI3n4KX7ykURTd
         cSP4iezu7b9bS+AnXo5b1I1IxjrpLVsg1bVDvEkFZ89Ke9D3lWVD3qchv697lmmgBjKR
         Yb+cWGrXXVPBvoK0IO2evpypp/Xiu5AIkBtwV2WqbzGnPHh3dS+qC+BMdUKhKozgPxXw
         V3pa3isxZfUQSVqorXu2WhUE4VhGBmqjYBWCn0aXRFsYpveAHtswfQs/UNA9srMpZpEL
         Kj3R62J4NKCFAiWRMHhIvzc7/dWqva6W4aw/mOkQ10qQIYmCdRCfDTUc8QBnHdpzCSxq
         ctig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVHEzrHe8tC361BwYscMzFC8Qnzl0iGxDL0dRLcOrjs=;
        b=pwWkf9jGa9UwMvIzaQNqWhtJMKaIU4XEBFmIsPIviZzUGnHB6zksco0PQ2EYIa0SxA
         pW3piGtQ96Zk2k4kPiVjt453xDoxSwYKUjCT1IV9SoI9HNesf5rHo6wVzfSOOvFk1/H9
         l4T3XMwTTDWQO85Wp9Xq0C7J+x3SIu/a1XQh1l22G6GGRjCNMJY8hrgw3WnyrmgbnZ47
         jZpmBM05C0BDl2vIpqdOqGkQSc1wCxrs/DuAQiEm72JCR501vDMtTT+WS/H5NiOweDwy
         9ukjHgriBEkd0ciM1BTaUqpXxoTIaD/nLIGeGdbrL30yLRskMhxg9aiOBrigwiR0BWTr
         KAzA==
X-Gm-Message-State: AOAM532sjVdxukfiRZ+xlTcUzDxoxV4WSWn+6VdVws4k13IAK8sgQRx6
	su0I3YrcEzMYPSCpmvD9f5naOzFFeh2+Qg==
X-Google-Smtp-Source: ABdhPJz1SdvtU74lAoHWUCfP6bGWRas9u2JU8pnoAXQeH9vK1/crL4wIemUo3eylVhoMIxKMjZWANg==
X-Received: by 2002:a17:906:401b:: with SMTP id v27mr1525328ejj.300.1597397363550;
        Fri, 14 Aug 2020 02:29:23 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id b2sm6329962ejg.70.2020.08.14.02.29.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 02:29:22 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	bunk@stusta.de,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V3 0/2] libubootenv: uprev to v0.3
Date: Fri, 14 Aug 2020 11:29:12 +0200
Message-Id: <20200814092914.4160-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Changes in V3:

1 Drop PV definition from recipe as suggested by Adrian Bunk.
2 Change a '+=' to "_append" as suggested by Khem Raj.

Ming Liu (2):
  multilib.conf: add u-boot to NON_MULTILIB_RECIPES
  libubootenv: uprev to v0.3

 meta/conf/multilib.conf                                      | 2 +-
 .../u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb}        | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb} (85%)

-- 
2.28.0

