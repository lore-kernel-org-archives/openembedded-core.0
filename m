Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288ACC3ABCB
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 02:25:01 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.68.1726453496560547489
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 19:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2KFk+A+k;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2054e22ce3fso41548015ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 19:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726453496; x=1727058296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fns/b/WXJi3RoIUPJYWaQGw+YReUVXyHll+DJIyJCEY=;
        b=2KFk+A+kpJIJ3AUciLqE8OReNhjABSH6Os94NWTVUN+K1qKP8f+Or9aalWTsnK5Nk7
         b6DRMaUrzcfH8jL3B4imZej9gh6dbkpQOScdIGX3Ktvh0IGX6xHCWTdxBNnOeVEVWctN
         II+LMtSIvwtqRoeUcy/IC7DI12PWSpGIzi6PYePPpYB1bXFIRr6zbVDhMqKpakASQQgh
         bH9fwAwzZQoRzeyiR6tPXYBfCEKInAEpB0eDefcvgPPjQ1RrbQYvi1Aq9Uwo23E/NWdw
         ZO3Hr/wwDCkYOJd1dy2NoZus/yk803vwfc/D3grJH+jgf9AMEXexO28hOjCHuL0YwvYE
         7Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726453496; x=1727058296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fns/b/WXJi3RoIUPJYWaQGw+YReUVXyHll+DJIyJCEY=;
        b=Lshj1ebjgNWmQrSFsE4Lk511pFtTzvzmq07tSWCu9owBgpMDYkdBVPyeOFyLyxwS9D
         tdvxCM1zvmxMCBsJuV0/DzDzs6mKlemKgx3YeV4/XMbgCQL4yy7AETZL+GX4GvYoe/Hm
         Vi1LvFaVQ3O1KrHm67bJekMRpM+YquVpulkHOklyvD/bexBKeIetaBuE0hPMyTTMMhtd
         6SnFglgUjyXSPZqt72P+R/4hIP96d/AyXiTZ+jrxe5XjSglp26ATkE0110sIdv3Pm/4Y
         fWOh8tXt6AnPxGBgd2C8HwjmjsaK9PmtUWM/1MtVyZTpgOt8Dq1xw+zNP1zO2gS2PL0P
         7TEw==
X-Gm-Message-State: AOJu0YxuNQy2FdnmoqlsOiNv7cE9kKxB/XgK7G1Q/Pvl+WhUMjMdP3iL
	GIs3Cx1BFU5oHv3KFmgEhRByxKIr1WX84blaIobN2njtGHdsPo5qduTjArCr40UXrpPHm7PmMup
	M5i8=
X-Google-Smtp-Source: AGHT+IFcpHcBJXQFvynCUdNhYfTdnj42X5DCDMhXjz2L1doH0hPs7NsYVaLrrleqc5xiqe8kxlZyWw==
X-Received: by 2002:a17:903:230c:b0:202:54b8:72d5 with SMTP id d9443c01a7336-2076e44df88mr209592935ad.59.1726453495808;
        Sun, 15 Sep 2024 19:24:55 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079460255asm27866555ad.107.2024.09.15.19.24.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:24:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/1] Patch review
Date: Sun, 15 Sep 2024 19:24:49 -0700
Message-Id: <cover.1726453391.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204601

Sorry, missed this in the patchset just sent out!

The following changes since commit 9ed723d1972b4e1bd1ae799661194ccbd4c6c759:

  ruby: Make docs generation deterministic (2024-09-12 14:34:56 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Richard Purdie (1):
  libedit: Make docs generation deterministic

 meta/recipes-devtools/libedit/libedit_20230828-3.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.34.1


