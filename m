Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AABCFA44D
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 22:36:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.141.1763678186017220771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 14:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F0YDAFGZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so10083135e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 14:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763678184; x=1764282984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=siQUiOrdDcN/tK0e0fBxVu/8U+p1owBQOFX3bdcOoFU=;
        b=F0YDAFGZ64Z9EJkjWmju1Mg9w4Xj3+zeg3m1P9BG0K3gCUJxhCPtcYX1v/1vVkUGcl
         pbj5V9E+4Tuoy+34j8pJsQZrj8EEqV8A0Ucg1z60kDy0EkoG/0WbrjqbZQw163WgF7i8
         bSFJv+yh1VSJfvjjvb6GGXRhxsDs3btPNcjiBJUPcQZoEwVv/2BkLqYxJtAYtX6sJpHt
         iBigPsTNuWlLgkQ/WnvpgxljC2XzsWYhYceC5I2V0xbkHBOoLwJVjy5TXaCFJ7NufnKa
         pXFc+UTDpu7oFAmZzhx6wwOGezTmTFdnwaHLPmFDMhcZT1RfaGnRilHsU/6htVL79NAh
         Zaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763678184; x=1764282984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siQUiOrdDcN/tK0e0fBxVu/8U+p1owBQOFX3bdcOoFU=;
        b=KsCqwi+39s2K8dHuwTMG5y8c+va11rrSmXdhna8bkDci9im04CyVbp848qklLN8uFu
         dyOsOtTZQO2W5/QepyVmSJbCjRpgzY8DhF8Uz6458965js6smBdK+RrK5bESAi4XOfD1
         9egv60sUe9XoWczHfGa334xxe0AUiBaAjRk5B3i8gzAlEbWVp+loMvY9ZpATcp7zg4Jo
         ZhdCcD+2XwwcNy7qVtmywj0sDOe++6d26iLuceijoOu0xteG8OWnE8XSxg0z6MsvAHjo
         o5BFqZDzzDn9x/PTbuhUh0XxAI/g8/qEMwAjRze1gRmjVBRxMqfBD5o486caLZwK0lr9
         CeAA==
X-Gm-Message-State: AOJu0YxUeajO6+7De7Sw26Hnh7krssSWm9WtFpucsyGv8rEwe5ME+Izc
	KFcL4pm6QCQg9EUME5/hNCi7IyIFKX/NlB6SOrxtj7vmK+ws6BdcHusVxQwcQLZC
X-Gm-Gg: ASbGncuh63nBnmwTBEHsfHI+je6ABPkZ54xDHHg/Cmp7mrDxP/Vd7Z+1padMYLSAUDa
	dpqIMOsLlMkDZrtYLPwTV6ehBB1Rl5pQOSnGQOl28PCigORn9OQAfDpnzmO3LVr/P8l7Xh1Gv+z
	heIvxyUM0Eq+nqw7D1tYe1o2J9y6feBMFsLyJi9mEQNf3wd6VnUNhmFBboB0rRacJZ0EAA3FISk
	98gvKpD8vjeYlfK0+uX0Ry4xDxnwHSrtp0qkM+jSrhjW2vijrRTn0ce3CoqbeuukmAMT7FzssZq
	nJLfpEstnZm1nLHPzqclkTZuUSBervM72SbBUFu6LnWlNZphS2SL4Q5LFZ5jlmklxW+8fdBbzjZ
	dc2iI0oQILJxPeHICvlv3cy+i1b067RFsyXkbAxme8vGY4BQUAlPL224o3JFWwnviWs+ojKUqsw
	alvyywQeUn
X-Google-Smtp-Source: AGHT+IGNt4a35zrBIk9e7pGK3RL1i/eHjgSc+yLeAtZfU92huuEIKJhC834K9fRnRfCmQvzjuAxsiw==
X-Received: by 2002:a05:600c:1993:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-477c01a7daemr2505785e9.18.1763678184174;
        Thu, 20 Nov 2025 14:36:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f363e4sm7611553f8f.12.2025.11.20.14.36.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 14:36:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/2] -fcanon-file-prefix and cc-rs compiler flag mixing
Date: Thu, 20 Nov 2025 23:36:21 +0100
Message-ID: <20251120223623.282605-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 22:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226638

These two commits are very losely related to each other.

Patch 1 adds -fcanon-prefix-map to the compiler flags, when it is applicable 
(when gcc >=13 is used). This helps with finding the correct debug sources 
for the -src package. Without this flag some recipes miss some source 
files from this package, and sometimes they miss all files. (E.g. sqlite, audiofile, librsvg)

Patch 2 tries to work around a bug (or at least unexpected behavior) in the cc-rs 
crate. 

This patch tries to recognize if there are any flags passed to the compiler that shouldn't be there.

How these patches are related: normally the *-prefix-map flags are only passed to cross-compiled 
targets. However the cc crate passes this flag to the native builds also (due to flag 
merging), and in case the host compiler is too old to recognize this flag, than the build fails.

Though I was able to build rust with both of these patches for both native and class targets,
I wasn't able to configure qemu to run in my docker env, and due to this I was unable
to verify if the selftests pass in an OS where gcc is older than v13.

While not mentioned explicitly, but especially with the 2nd patch I'm testing the waters,
it is an RFC also.

---

Gyorgy Sarvari (2):
  bitbake.conf, gcc toolchain: add -fcanon-prefix-map to map-prefixes
  rust-common.bbclass: filter out incorrect compiler flags in wrapper

 meta/classes-recipe/rust-common.bbclass   | 24 +++++++++++++++++++++++
 meta/classes/toolchain/gcc-native.bbclass |  3 +++
 meta/classes/toolchain/gcc.bbclass        |  2 ++
 meta/conf/bitbake.conf                    |  2 +-
 4 files changed, 30 insertions(+), 1 deletion(-)


