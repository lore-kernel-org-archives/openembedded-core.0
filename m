Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A56C5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 17:11:13 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web10.33271.1748279465747327630
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 10:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IKIAio8l;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: hiagofranco@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87de33ccdb4so741717241.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 10:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748279464; x=1748884264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tjiBVXp00faRu4jVSXyiFAju9/mLRic/L6hnBXD6WkU=;
        b=IKIAio8lFXqIPsVrLRvSHCs5O+gzRN0LGxVujydpdBgvZg8HJtTLvl16H+JP+P9XQi
         5eaisY/1sTsW0NJv3cFE4YQ7G2XofZC2Nu35kAAflHiz1JplzuG8L1KH8EEt9OgRAs2f
         Irscd8MKxOH4ynfVK5rcrLwvmJRS4lrP4TTz/OO3qoL+K4wtG3JJ7otBi2SJXeCqGk0d
         HPUyqXbSSy2fT6ACADr+2T2CcPJVNb13JtGPumKa90KgeA25N1GpJIHACuRXyaRR14Vq
         GzLGbyKDbP1+YZpn86MHMTkAdH6vS17Pc8geqaT6Sw6+zZVp0hbqLmr7j6TaX5lTVdg0
         5Ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748279464; x=1748884264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjiBVXp00faRu4jVSXyiFAju9/mLRic/L6hnBXD6WkU=;
        b=I8RCOWU20i/PIOY237lL1/7drfHW4wyxEyFuEGzUN8d6wYBRplCB/fhkdlSa/2VLr/
         gdaVTp86gFFFyD4Oq0UFnUKKKjWrK2oLIU7uK9OE+mgSmjdBF/pVQWY6xSFeqG42fG0O
         rafgGxxEv/7mUarQ/s2G1zaa7ieC7AvPeHIYHSVGv06pEMjWTna43iMi1llemri6MaHO
         5DSZ/usjSjhk2hipAjfbVrEJnq0duu5hcjVTwdmz+obRZqCRSwdFTM5PrRkmfqlrZ2o0
         f3eMn49DQnY7YZhYQklUxksMQBPVmU/D1gASxB19gADSk4IX2J+1TL1lWhpGKIJ/+2ul
         HFfA==
X-Gm-Message-State: AOJu0YwmQRklIgS48Jn7564egg0I7Du45EJCldiQWQKbOh3+9tQ2NS8W
	PS8eM7TbgGywUsUxjMI1S7o0JzJL74mPtbIfjP++hXEQ45EUbqf/ZHw4ZSEfHw==
X-Gm-Gg: ASbGnctDKR9pDyEhnVMvHwbVJ5Kdgoj9NzjbDemwTxB5K/oxqg/OUjECGNExWMSlFWr
	qWpjxzJcOfn6t3PAXOnRGGhR2zx4T9W990hPsCT3LhpXgrVSjZDNibY/+nmo+Eaa29pJuAAvZ2j
	6TSWoLcqf3QFFVJg19tTBgj4Qg/6O2nrd7ECDrPAAmzovrQUd2sob47UoUS+oIBxxsmjfjta9qz
	1iBjTPg00yMlseI7gSNk2KArigChe/c4nDsxM1d5a9Y+iZiuzHhfkJAHvbvR/4wKMBIp4c0hCym
	X2tvL4fDYZq9mv5aaiC8LNkZOJ5u5Oki0SKdatkwDegoKDhR40v2e/q5PRzyj+xllv6cAR/G4A=
	=
X-Google-Smtp-Source: AGHT+IHBjclrf0UxEr1Q7F4sdi37b/fj0hW7qwg0D5XbgoG+w1eWUN59YyumJ9KYtnz/dZtVNPDM/g==
X-Received: by 2002:a05:6122:8c9:b0:520:6773:e5ea with SMTP id 71dfb90a1353d-52f2c57b328mr7435335e0c.7.1748279464129;
        Mon, 26 May 2025 10:11:04 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba910d62sm17915185e0c.10.2025.05.26.10.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 10:11:03 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH] readline: enable HOME, END, INSERT, and DELETE key bindings in inputrc
Date: Mon, 26 May 2025 14:10:42 -0300
Message-Id: <20250526171042.57341-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 17:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217271

From: Hiago De Franco <hiago.franco@toradex.com>

Enable readline inputrc bindings for HOME, END, INSERT, and DELETE keys
to support common key sequences on terminal interfaces. These key
sequences are commonly emitted by terminal emulators and physical
keyboards.

This enables expected shell behavior on embedded systems, especially
when interacting over serial consoles or minimal terminal setups.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta/recipes-core/readline/files/inputrc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/readline/files/inputrc b/meta/recipes-core/readline/files/inputrc
index b5c4c8af24b0..4a2874bccc7f 100644
--- a/meta/recipes-core/readline/files/inputrc
+++ b/meta/recipes-core/readline/files/inputrc
@@ -24,12 +24,12 @@ set output-meta on
 $if mode=emacs
 
 # allow the use of the Home/End keys
-# "\e[1~": beginning-of-line
-# "\e[4~": end-of-line
+"\e[1~": beginning-of-line
+"\e[4~": end-of-line
 
 # allow the use of the Delete/Insert keys
-# "\e[3~": delete-char
-# "\e[2~": quoted-insert
+"\e[3~": delete-char
+"\e[2~": quoted-insert
 
 # mappings for "page up" and "page down" to step to the beginning/end 
 # of the history
-- 
2.39.5


