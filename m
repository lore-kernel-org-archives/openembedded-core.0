Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1589CC87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 05:08:50 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.18158.1754456924617747346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 22:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j3gBNFuX;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-31ef50d8d57so3443254a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 22:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754456924; x=1755061724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UxqiJX9I96/rKR2VoSv5m7XiUU7krNTIT/8TfJ8pKtY=;
        b=j3gBNFuX5LxJ3iMhRtMe1CcMiHPIPJm6Vb8A+jfgSWF00N2NQ9H692Qu0R0VRtoQv2
         fg6BrGs2i/RIHNHoGLtJKEMEPZQsiDA3UfRgcMgDztNtgu+gsEuW6Zn8Orc+9fxqperl
         8qix3nq46ROxcuSKewstoZ/1lLj+Wyxo8xyivjCLmiJZkNx/7XMjIvJ80eoQ1Un6a6pw
         j7kKHOAkiLv3Rult5MdDWlhHmzfl+kTWgIMF/TnirDignolbjsmdEG5J1Ee6sxgCrO/a
         HY8sMyk28E45Y4c1ZMIdcyHuKgQHxe7gpAsv3Sohd1GTRJK69fkAOAIFAescvWWONaLC
         NnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754456924; x=1755061724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxqiJX9I96/rKR2VoSv5m7XiUU7krNTIT/8TfJ8pKtY=;
        b=nppRVn3aLM7G2hDyF+6Ij0/04E+oa9h2IOxsXEnlTTb+l545Bp3UcRzZ3fXzMuykMk
         UODiF4TUkH2o8QOtLB8aA4oJBY2L+jUliSAl6LmPBQQTQC7/489xZSqglpLVa5E4YP1W
         4qUtPNuVWfalf9KAwpv9Qw2w66fcXioK3Fl52imH1f8RlW7QfjRQbWwUuDdFB2jnEbFD
         sVeHqHS5DrtoXqXOHMenfqHN1Rj+S5aOHSbbP9z7nbc/gzt4o+wIJNbgTh97jWyJtg5P
         CyiAzb1S3m86/e3QWLKBroeWnAYywaeWXmUlAFnRy7xCRaOj8V65YkvaoZCns+dzjowS
         7rIA==
X-Gm-Message-State: AOJu0YwUQkvedaSgK5F+FTkWZihb/PucAd28uH0aE+tSQBA6hzGptVnF
	hyPzqe8ksP4D7L+GJJZbAyEphsAT0XWCHZMk7s0e6kUEwIMcVDFAnojhOXcJqttYrQ8=
X-Gm-Gg: ASbGncuv7VEuclm3PoEouf76eWXxq5KP3YMvqOyAHpdbBcchQeDb6Uo+0FThHCP54pC
	SdLWpv+kcldFtDMm3Wa81D/QAq78PiqIf3EAf/X9SLXoVg4kbHqnijQpSB+wJiZxo5tH054/XlZ
	r2ZUArbdU+rMwkpVjFWq5oZAwx+zEsHUO1WwezItDtNNxx9Ma7oEa8ws1WZRV2jWhOOJh6cL+FZ
	TixYzHLQ73rZhGWvmNUUK2pRxyZaJcUPRYk8+AxpF+25oSPjFYVq3a26JUdghzo8p7SNWOZi1zK
	M9uEog8XyDXm9IKGkAaV5IigHNAvZoigoHIm0QXlJTOM5G6DfDVljbbOhy8JJ9A8s0GlE+CCqfz
	8SHdFw/JXO8byWB9KvuPd+pgCZDws2GaT
X-Google-Smtp-Source: AGHT+IEvAgs2ruTejT1MQSlu0lsEhzKE5LRYA3plvsNxCoRl5frk2oMvD14gyKigi7UZTUOfg9epxA==
X-Received: by 2002:a17:90b:4cd0:b0:321:2407:3ced with SMTP id 98e67ed59e1d1-321675924femr1747523a91.28.1754456922322;
        Tue, 05 Aug 2025 22:08:42 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ccc5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7d9dafsm12209114a12.23.2025.08.05.22.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 22:08:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jon.mason@arm.com>,
	Ryan Eatmon <reatmon@ti.com>
Subject: [PATCH v2] machine/arch-arm: Append TUNE_CCARGS_MARCH to TUNE_CCARGS conditionally
Date: Tue,  5 Aug 2025 22:08:38 -0700
Message-ID: <20250806050838.3311037-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 05:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221498

With [1], we now have a non-empty else block for arm-features, uptil now
feature includes only appended when feature was set and unset case was
appending empty string, which hid this issue where TUNE_CCARGS_MARCH_OPTS
could be non-empty but TUNE_CCARGS_MARCH is empty, this is possible when
a tune file overwrites TUNE_FEATURES and does not have a feature that would
add -march or -mcpu at all.

This changeset adds a check to not append at all if TUNE_CCARGS_MARCH
is unset.

It needs to append -march/-mcpu via TUNE_CCARGS_MARCH Currently, its
appended directly to TUNE_CCARGS which now means that any feature flags
coming from TUNE_CCARGS_MARCH_OPTS will be missed from final
-mcpu/-march option.

This also ensures that appending order is always correct e.g.
-mcpu=<cpu-tune>+features

[1] https://git.openembedded.org/openembedded-core/commit/?id=db1b355b2b15ba57bd89c2dfb88c2c667551863e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jon.mason@arm.com>
Cc: Ryan Eatmon <reatmon@ti.com>
---
v2: Append mcpu/march always via TUNE_CCARGS_MARCH

 meta/conf/machine/include/arm/arch-arm.inc                     | 2 +-
 meta/conf/machine/include/arm/armv4/tune-arm920t.inc           | 2 +-
 meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc          | 2 +-
 meta/conf/machine/include/arm/armv4/tune-ep9312.inc            | 2 +-
 meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc     | 2 +-
 meta/conf/machine/include/arm/armv5/tune-arm926ejs.inc         | 2 +-
 meta/conf/machine/include/arm/armv5/tune-iwmmxt.inc            | 2 +-
 meta/conf/machine/include/arm/armv5/tune-xscale.inc            | 2 +-
 meta/conf/machine/include/arm/armv6/tune-arm1136jf-s.inc       | 2 +-
 meta/conf/machine/include/arm/armv6/tune-arm1176jz-s.inc       | 2 +-
 meta/conf/machine/include/arm/armv6m/tune-cortexm0.inc         | 2 +-
 meta/conf/machine/include/arm/armv6m/tune-cortexm0plus.inc     | 2 +-
 meta/conf/machine/include/arm/armv6m/tune-cortexm1.inc         | 2 +-
 meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc        | 2 +-
 meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc        | 2 +-
 meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc         | 2 +-
 meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc         | 2 +-
 meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc         | 2 +-
 meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc         | 2 +-
 meta/conf/machine/include/arm/armv7m/tune-cortexm3.inc         | 2 +-
 meta/conf/machine/include/arm/armv7m/tune-cortexm4.inc         | 2 +-
 meta/conf/machine/include/arm/armv7m/tune-cortexm7.inc         | 2 +-
 meta/conf/machine/include/arm/armv7r/tune-cortexr4.inc         | 2 +-
 meta/conf/machine/include/arm/armv7r/tune-cortexr4f.inc        | 2 +-
 meta/conf/machine/include/arm/armv7r/tune-cortexr5.inc         | 2 +-
 meta/conf/machine/include/arm/armv7r/tune-cortexr7.inc         | 2 +-
 meta/conf/machine/include/arm/armv7r/tune-cortexr8.inc         | 2 +-
 meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc      | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc      | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc      | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc    | 2 +-
 .../machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc  | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc      | 2 +-
 .../machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc  | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc      | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc    | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc      | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc      | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa78ae.inc    | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa78c.inc     | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexx1.inc       | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexx1c.inc      | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc     | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc     | 2 +-
 meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc      | 2 +-
 meta/conf/machine/include/arm/armv8-4a/tune-neoverse512tvb.inc | 2 +-
 meta/conf/machine/include/arm/armv8-4a/tune-neoversev1.inc     | 2 +-
 meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc       | 2 +-
 meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc       | 2 +-
 meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc      | 2 +-
 meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc        | 2 +-
 meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc        | 2 +-
 meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc        | 2 +-
 meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc        | 2 +-
 .../machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc    | 2 +-
 meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc        | 3 +--
 .../machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc    | 2 +-
 meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc        | 2 +-
 .../machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc    | 2 +-
 .../machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc    | 2 +-
 meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc        | 2 +-
 meta/conf/machine/include/arm/armv8a/tune-thunderx.inc         | 2 +-
 meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc        | 2 +-
 meta/conf/machine/include/arm/armv8r/tune-cortexr82.inc        | 2 +-
 meta/conf/machine/include/arm/armv9a/tune-cortexa510.inc       | 2 +-
 meta/conf/machine/include/arm/armv9a/tune-cortexa710.inc       | 2 +-
 meta/conf/machine/include/arm/armv9a/tune-cortexa715.inc       | 2 +-
 meta/conf/machine/include/arm/armv9a/tune-cortexx2.inc         | 2 +-
 meta/conf/machine/include/arm/armv9a/tune-cortexx3.inc         | 2 +-
 meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc       | 2 +-
 meta/conf/machine/include/arm/armv9a/tune-neoversev2.inc       | 2 +-
 71 files changed, 71 insertions(+), 72 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
index f1e92e19c61..ae661b1ab4f 100644
--- a/meta/conf/machine/include/arm/arch-arm.inc
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -17,4 +17,4 @@ TARGET_FPU = "${@d.getVar('TUNE_CCARGS_MFLOAT') or 'soft'}"
 
 # Some -march settings need a +X option passed in.  Since we cannot guarantee that any specified TUNE_CCARGS option is set in any order, we must hard code the order here to allow for it.
 TUNE_CCARGS_MARCH_OPTS ??= ""
-TUNE_CCARGS .= "${TUNE_CCARGS_MARCH}${TUNE_CCARGS_MARCH_OPTS}"
+TUNE_CCARGS .= "${@'${TUNE_CCARGS_MARCH}${TUNE_CCARGS_MARCH_OPTS}' if d.getVar('TUNE_CCARGS_MARCH') else ''}"
diff --git a/meta/conf/machine/include/arm/armv4/tune-arm920t.inc b/meta/conf/machine/include/arm/armv4/tune-arm920t.inc
index 1b1cbdb5a7d..f55df60b4f5 100644
--- a/meta/conf/machine/include/arm/armv4/tune-arm920t.inc
+++ b/meta/conf/machine/include/arm/armv4/tune-arm920t.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "arm920t"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm920t] = "Enable arm920t specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', ' -mcpu=arm920t', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', ' -mcpu=arm920t', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', 'armv4:', '', d)}"
 
 AVAILTUNES += "arm920t"
diff --git a/meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc b/meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc
index 78b890b43c3..53e530bb5fe 100644
--- a/meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "arm9tdmi"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm9tdmi] = "Enable arm9tdmi specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', ' -mcpu=arm9tdmi', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', ' -mcpu=arm9tdmi', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', 'armv4:', '', d)}"
 
 AVAILTUNES += "arm9tdmi"
diff --git a/meta/conf/machine/include/arm/armv4/tune-ep9312.inc b/meta/conf/machine/include/arm/armv4/tune-ep9312.inc
index 0d481d38881..f5f0776bbfa 100644
--- a/meta/conf/machine/include/arm/armv4/tune-ep9312.inc
+++ b/meta/conf/machine/include/arm/armv4/tune-ep9312.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ep9312"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[ep9312] = "Enable Cirrus Logic EP9312 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mcpu=ep9312', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mcpu=ep9312', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', 'armv4:', '', d)}"
 
 AVAILTUNES += "ep9312"
diff --git a/meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc b/meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc
index 38ea9b7dd59..f41f0c74757 100644
--- a/meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "strongarm"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[strongarm] = "Enable Strongarm 1100 series processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', ' -mcpu=strongarm1100', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', ' -mcpu=strongarm1100', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', 'armv4:', '', d)}"
 
 AVAILTUNES += "strongarm"
diff --git a/meta/conf/machine/include/arm/armv5/tune-arm926ejs.inc b/meta/conf/machine/include/arm/armv5/tune-arm926ejs.inc
index 84c50848686..37192b1426f 100644
--- a/meta/conf/machine/include/arm/armv5/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/arm/armv5/tune-arm926ejs.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5te"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[arm926ejs] = "Enable arm926ejs specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', ' -mcpu=arm926ej-s', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', ' -mcpu=arm926ej-s', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', 'armv5:', '', d)}"
 
 AVAILTUNES += "arm926ejs"
diff --git a/meta/conf/machine/include/arm/armv5/tune-iwmmxt.inc b/meta/conf/machine/include/arm/armv5/tune-iwmmxt.inc
index c584b47d180..b8418ee3ada 100644
--- a/meta/conf/machine/include/arm/armv5/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/arm/armv5/tune-iwmmxt.inc
@@ -6,7 +6,7 @@ DEFAULTTUNE ?= "iwmmxt"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -mcpu=iwmmxt', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -mcpu=iwmmxt', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', 'armv5:', '', d)}"
 
 AVAILTUNES += "iwmmxt"
diff --git a/meta/conf/machine/include/arm/armv5/tune-xscale.inc b/meta/conf/machine/include/arm/armv5/tune-xscale.inc
index cc67dcd304d..311c82b00cb 100644
--- a/meta/conf/machine/include/arm/armv5/tune-xscale.inc
+++ b/meta/conf/machine/include/arm/armv5/tune-xscale.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5te"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'xscale', ' -mcpu=xscale', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'xscale', ' -mcpu=xscale', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'xscale', 'armv5:', '', d)}"
 
 AVAILTUNES += "xscale"
diff --git a/meta/conf/machine/include/arm/armv6/tune-arm1136jf-s.inc b/meta/conf/machine/include/arm/armv6/tune-arm1136jf-s.inc
index b848580948d..04bea8de5f2 100644
--- a/meta/conf/machine/include/arm/armv6/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/arm/armv6/tune-arm1136jf-s.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv6hf"
 require conf/machine/include/arm/arch-armv6.inc
 
 TUNEVALID[arm1136jfs] = "Enable arm1136jfs specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mcpu=arm1136jf-s', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mcpu=arm1136jf-s', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', 'armv6:', '', d)}"
 
 AVAILTUNES += "arm1136jfs arm1136jfshf"
diff --git a/meta/conf/machine/include/arm/armv6/tune-arm1176jz-s.inc b/meta/conf/machine/include/arm/armv6/tune-arm1176jz-s.inc
index 21d77f081e5..89f261ae515 100644
--- a/meta/conf/machine/include/arm/armv6/tune-arm1176jz-s.inc
+++ b/meta/conf/machine/include/arm/armv6/tune-arm1176jz-s.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "arm1176jzs"
 require conf/machine/include/arm/arch-armv6.inc
 
 TUNEVALID[arm1176jzs] = "Enable arm1176jzs specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1176jzs', ' -mcpu=arm1176jz-s', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1176jzs', ' -mcpu=arm1176jz-s', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm1176jzs', 'armv6:', '', d)}"
 
 AVAILTUNES += "arm1176jzs"
diff --git a/meta/conf/machine/include/arm/armv6m/tune-cortexm0.inc b/meta/conf/machine/include/arm/armv6m/tune-cortexm0.inc
index aadc5326cec..be8d2d9d572 100644
--- a/meta/conf/machine/include/arm/armv6m/tune-cortexm0.inc
+++ b/meta/conf/machine/include/arm/armv6m/tune-cortexm0.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "cortexm0"
 require conf/machine/include/arm/arch-armv6m.inc
 
 TUNEVALID[cortexm0] = "Enable Cortex-M0 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0', ' -mcpu=cortex-m0', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0', ' -mcpu=cortex-m0', '', d)}"
 AVAILTUNES += "cortexm0"
 
 ARMPKGARCH:tune-cortexm0 = "cortexm0"
diff --git a/meta/conf/machine/include/arm/armv6m/tune-cortexm0plus.inc b/meta/conf/machine/include/arm/armv6m/tune-cortexm0plus.inc
index a3cf3f0bd2c..5e7e588f8be 100644
--- a/meta/conf/machine/include/arm/armv6m/tune-cortexm0plus.inc
+++ b/meta/conf/machine/include/arm/armv6m/tune-cortexm0plus.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "cortexm0-plus"
 require conf/machine/include/arm/arch-armv6m.inc
 
 TUNEVALID[cortexm0-plus] = "Enable Cortex-M0 Plus specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0-plus', ' -mcpu=cortex-m0plus', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0-plus', ' -mcpu=cortex-m0plus', '', d)}"
 AVAILTUNES += "cortexm0-plus"
 
 ARMPKGARCH:tune-cortexm0-plus = "cortexm0-plus"
diff --git a/meta/conf/machine/include/arm/armv6m/tune-cortexm1.inc b/meta/conf/machine/include/arm/armv6m/tune-cortexm1.inc
index 16661f3a26d..0f81157aa4d 100644
--- a/meta/conf/machine/include/arm/armv6m/tune-cortexm1.inc
+++ b/meta/conf/machine/include/arm/armv6m/tune-cortexm1.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexm1"
 
 TUNEVALID[cortexm1] = "Enable Cortex-M1 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm1', ' -mcpu=cortex-m1', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm1', ' -mcpu=cortex-m1', '', d)}"
 
 require conf/machine/include/arm/arch-armv6m.inc
 
diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc
index e827afb2a08..c5283feb712 100644
--- a/meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc
+++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "cortexa15thf-neon"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mcpu=cortex-a15', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mcpu=cortex-a15', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', 'armv7ve:', '', d)}"
 
 # Little Endian base configs
diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc
index 3ad00b16d81..902d5bbffd2 100644
--- a/meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc
+++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "cortexa17thf-neon"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mcpu=cortex-a17', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mcpu=cortex-a17', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', 'armv7ve:', '', d)}"
 
 # Little Endian base configs
diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc
index 0de5aadaaa3..b55658ce456 100644
--- a/meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc
+++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "cortexa5thf-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mcpu=cortex-a5', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mcpu=cortex-a5', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', 'armv7a:', '', d)}"
 
 # Little Endian base configs
diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc
index 1ada527d8b3..db4be344175 100644
--- a/meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc
+++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "cortexa7thf-neon"
 require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mcpu=cortex-a7', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mcpu=cortex-a7', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', 'armv7ve:', '', d)}"
 
 # Little Endian base configs
diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc
index 952302afa21..9225acd244f 100644
--- a/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc
+++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "cortexa8thf-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mcpu=cortex-a8', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mcpu=cortex-a8', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', 'armv7a:', '', d)}"
 
 # Little Endian base configs
diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc
index 4b4a52884d9..46f9955a474 100644
--- a/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc
+++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "cortexa9thf-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mcpu=cortex-a9', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mcpu=cortex-a9', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', 'armv7a:', '', d)}"
 
 # Little Endian base configs
diff --git a/meta/conf/machine/include/arm/armv7m/tune-cortexm3.inc b/meta/conf/machine/include/arm/armv7m/tune-cortexm3.inc
index a6cb566387a..9f75c865e66 100644
--- a/meta/conf/machine/include/arm/armv7m/tune-cortexm3.inc
+++ b/meta/conf/machine/include/arm/armv7m/tune-cortexm3.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexm3"
 
 TUNEVALID[cortexm3] = "Enable Cortex-M3 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm3', ' -mcpu=cortex-m3', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm3', ' -mcpu=cortex-m3', '', d)}"
 
 require conf/machine/include/arm/arch-armv7m.inc
 
diff --git a/meta/conf/machine/include/arm/armv7m/tune-cortexm4.inc b/meta/conf/machine/include/arm/armv7m/tune-cortexm4.inc
index e86622ff3da..59516f7df0f 100644
--- a/meta/conf/machine/include/arm/armv7m/tune-cortexm4.inc
+++ b/meta/conf/machine/include/arm/armv7m/tune-cortexm4.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexm4"
 
 TUNEVALID[cortexm4] = "Enable Cortex-M4 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm4', ' -mcpu=cortex-m4', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm4', ' -mcpu=cortex-m4', '', d)}"
 
 require conf/machine/include/arm/arch-armv7em.inc
 
diff --git a/meta/conf/machine/include/arm/armv7m/tune-cortexm7.inc b/meta/conf/machine/include/arm/armv7m/tune-cortexm7.inc
index 6434ec63983..4ea098b696c 100644
--- a/meta/conf/machine/include/arm/armv7m/tune-cortexm7.inc
+++ b/meta/conf/machine/include/arm/armv7m/tune-cortexm7.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexm7"
 
 TUNEVALID[cortexm7] = "Enable Cortex-M7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm7', ' -mcpu=cortex-m7', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm7', ' -mcpu=cortex-m7', '', d)}"
 
 require conf/machine/include/arm/arch-armv7em.inc
 
diff --git a/meta/conf/machine/include/arm/armv7r/tune-cortexr4.inc b/meta/conf/machine/include/arm/armv7r/tune-cortexr4.inc
index 0eed7296302..4e0a79fe0ad 100644
--- a/meta/conf/machine/include/arm/armv7r/tune-cortexr4.inc
+++ b/meta/conf/machine/include/arm/armv7r/tune-cortexr4.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexr4"
 
 TUNEVALID[cortexr4] = "Enable Cortex-R4 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr4', ' -mcpu=cortex-r4', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr4', ' -mcpu=cortex-r4', '', d)}"
 
 require conf/machine/include/arm/arch-armv7r.inc
 
diff --git a/meta/conf/machine/include/arm/armv7r/tune-cortexr4f.inc b/meta/conf/machine/include/arm/armv7r/tune-cortexr4f.inc
index 0712b3ab1b0..234008fea99 100644
--- a/meta/conf/machine/include/arm/armv7r/tune-cortexr4f.inc
+++ b/meta/conf/machine/include/arm/armv7r/tune-cortexr4f.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexr4f"
 
 TUNEVALID[cortexr4f] = "Enable Cortex-R4F specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr4f', ' -mcpu=cortex-r4f', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr4f', ' -mcpu=cortex-r4f', '', d)}"
 
 require conf/machine/include/arm/arch-armv7r.inc
 
diff --git a/meta/conf/machine/include/arm/armv7r/tune-cortexr5.inc b/meta/conf/machine/include/arm/armv7r/tune-cortexr5.inc
index 4c8985292b8..02ea2962507 100644
--- a/meta/conf/machine/include/arm/armv7r/tune-cortexr5.inc
+++ b/meta/conf/machine/include/arm/armv7r/tune-cortexr5.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexr5"
 
 TUNEVALID[cortexr5] = "Enable Cortex-R5 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr5', ' -mcpu=cortex-r5', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr5', ' -mcpu=cortex-r5', '', d)}"
 
 require conf/machine/include/arm/arch-armv7r.inc
 
diff --git a/meta/conf/machine/include/arm/armv7r/tune-cortexr7.inc b/meta/conf/machine/include/arm/armv7r/tune-cortexr7.inc
index bfae1f00751..5ba607f391f 100644
--- a/meta/conf/machine/include/arm/armv7r/tune-cortexr7.inc
+++ b/meta/conf/machine/include/arm/armv7r/tune-cortexr7.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexr7"
 
 TUNEVALID[cortexr7] = "Enable Cortex-R7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr7', ' -mcpu=cortex-r7', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr7', ' -mcpu=cortex-r7', '', d)}"
 
 require conf/machine/include/arm/arch-armv7r.inc
 
diff --git a/meta/conf/machine/include/arm/armv7r/tune-cortexr8.inc b/meta/conf/machine/include/arm/armv7r/tune-cortexr8.inc
index 7fb824f6e91..594d74c1297 100644
--- a/meta/conf/machine/include/arm/armv7r/tune-cortexr8.inc
+++ b/meta/conf/machine/include/arm/armv7r/tune-cortexr8.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexr8"
 
 TUNEVALID[cortexr8] = "Enable Cortex-R8 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr8', ' -mcpu=cortex-r8', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr8', ' -mcpu=cortex-r8', '', d)}"
 
 require conf/machine/include/arm/arch-armv7r.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc b/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
index 0a115be8a47..ad90e0bce4a 100644
--- a/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
+++ b/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexm55"
 
 TUNEVALID[cortexm55] = "Enable Cortex-M55 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm55', ' -mcpu=cortex-m55', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm55', ' -mcpu=cortex-m55', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-1m-main.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
index 5e63b45ae0e..35a2dbb45b7 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
@@ -1,7 +1,7 @@
 DEFAULTTUNE ?= "cortexa55"
 
 TUNEVALID[cortexa55] = "Enable Cortex-A55 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=cortex-a55', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=cortex-a55', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
index ba96d0452e2..bb7d97abcfd 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexa65"
 
 TUNEVALID[cortexa65] = "Enable Cortex-A65 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa65', ' -mcpu=cortex-a65', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa65', ' -mcpu=cortex-a65', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
index cc921474417..ad1134efc80 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE                                        ?= "cortexa65ae"
 
 TUNEVALID[cortexa65ae] = "Enable Cortex-A65AE specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa65ae', ' -mcpu=cortex-a65ae', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa65ae', ' -mcpu=cortex-a65ae', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
index 6b9b541f9a0..a093378d649 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
@@ -9,7 +9,7 @@ MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55"
 CPU_TUNE_ARG = "cortex-a75.cortex-a55"
 # clang doesn't support big.LITTLE tunes, select the LITTLE tune
 CPU_TUNE_ARG:toolchain-clang = "cortex-a55"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
index 453be2e6fda..f4d27fb0178 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexa75"
 
 TUNEVALID[cortexa75] = "Enable Cortex-A75 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa75', ' -mcpu=cortex-a75', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa75', ' -mcpu=cortex-a75', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
index 8195782cd99..d40a6c0e7d0 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
@@ -9,7 +9,7 @@ MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55"
 CPU_TUNE_ARG = "cortex-a76.cortex-a55"
 # clang doesn't support big.LITTLE tunes, select the LITTLE tune
 CPU_TUNE_ARG:toolchain-clang = "cortex-a55"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
index 14ed81214de..d552eec4c23 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE                                        ?= "cortexa76"
 
 TUNEVALID[cortexa76] = "Enable Cortex-A76 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76', ' -mcpu=cortex-a76', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76', ' -mcpu=cortex-a76', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
index 191863bac86..8fd0f5fb4ff 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE                                        ?= "cortexa76ae"
 
 TUNEVALID[cortexa76ae] = "Enable Cortex-A76AE specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76ae', ' -mcpu=cortex-a76ae', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76ae', ' -mcpu=cortex-a76ae', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
index 1522fd6abd9..b0e9b6a2740 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE                                        ?= "cortexa77"
 
 TUNEVALID[cortexa77] = "Enable Cortex-A77 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa77', ' -mcpu=cortex-a77', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa77', ' -mcpu=cortex-a77', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc
index 198b94c679b..4ab83b2052f 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE                                        ?= "cortexa78"
 
 TUNEVALID[cortexa78] = "Enable Cortex-A78 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa78', ' -mcpu=cortex-a78', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa78', ' -mcpu=cortex-a78', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78ae.inc
index fe68bda9a03..a29d677132f 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78ae.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78ae.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexa78ae"
 
 TUNEVALID[cortexa78ae] = "Enable cortex-a78ae specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa78ae', ' -mcpu=cortex-a78ae', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa78ae', ' -mcpu=cortex-a78ae', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78c.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78c.inc
index cb1fe91dfca..4bb724bdbf1 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78c.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78c.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexa78c"
 
 TUNEVALID[cortexa78c] = "Enable cortex-a78c specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa78c', ' -mcpu=cortex-a78c', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa78c', ' -mcpu=cortex-a78c', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexx1.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexx1.inc
index 0a99156e629..f0ce94aecdf 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexx1.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexx1.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexx1"
 
 TUNEVALID[cortexx1] = "Enable cortex-x1 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexx1', ' -mcpu=cortex-x1', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexx1', ' -mcpu=cortex-x1', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexx1c.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexx1c.inc
index 2a16d1695de..f79868ab86c 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexx1c.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexx1c.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexx1c"
 
 TUNEVALID[cortexx1c] = "Enable cortex-x1c specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexx1c', ' -mcpu=cortex-x1c', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexx1c', ' -mcpu=cortex-x1c', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc b/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc
index e906cf965cb..557f30e6442 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE                                        ?= "neoversee1"
 
 TUNEVALID[neoversee1] = "Enable Neoverse-E1 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversee1', ' -mcpu=neoverse-e1', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversee1', ' -mcpu=neoverse-e1', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc b/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
index 55f054713fa..48d9a7312ec 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
@@ -5,7 +5,7 @@ DEFAULTTUNE                                        ?= "neoversen1"
 
 TUNEVALID[neoversen1] = "Enable Neoverse-N1 specific processor optimizations"
 # Note: Neoverse was called Ares, and GCC will accept "ares" in place of "neoverse-n1"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen1', ' -mcpu=neoverse-n1', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen1', ' -mcpu=neoverse-n1', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
index 5eed3e5d15f..d348ef9ecc6 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "octeontx2"
 TUNEVALID[octeontx2] = "Enable Marvell octeontx2 specific processor optimizations"
 CPU_TUNE_OCTEONTX2 ?= "-mcpu=octeontx2"
 CPU_TUNE_OCTEONTX2:toolchain-clang = "-march=armv8.2-a"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'octeontx2', ' ${CPU_TUNE_OCTEONTX2}', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'octeontx2', ' ${CPU_TUNE_OCTEONTX2}', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-4a/tune-neoverse512tvb.inc b/meta/conf/machine/include/arm/armv8-4a/tune-neoverse512tvb.inc
index 450bf748963..825c2117747 100644
--- a/meta/conf/machine/include/arm/armv8-4a/tune-neoverse512tvb.inc
+++ b/meta/conf/machine/include/arm/armv8-4a/tune-neoverse512tvb.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "neoverse512tvb"
 
 TUNEVALID[neoverse512tvb] = "Enable neoverse-512tvb specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoverse512tvb', ' -mcpu=neoverse-512tvb', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'neoverse512tvb', ' -mcpu=neoverse-512tvb', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-4a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-4a/tune-neoversev1.inc b/meta/conf/machine/include/arm/armv8-4a/tune-neoversev1.inc
index 2b4da7db3cd..c5a8db8b8a0 100644
--- a/meta/conf/machine/include/arm/armv8-4a/tune-neoversev1.inc
+++ b/meta/conf/machine/include/arm/armv8-4a/tune-neoversev1.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "neoversev1"
 
 TUNEVALID[neoversev1] = "Enable neoverse-v1 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversev1', ' -mcpu=neoverse-v1', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversev1', ' -mcpu=neoverse-v1', '', d)}"
 
 require conf/machine/include/arm/arch-armv8-4a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc b/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
index e83e0ba68a7..8cf6150745f 100644
--- a/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
+++ b/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexm23"
 
 TUNEVALID[cortexm23] = "Enable Cortex-M23 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm23', ' -mcpu=cortex-m23', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm23', ' -mcpu=cortex-m23', '', d)}"
 
 require conf/machine/include/arm/arch-armv8m-base.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc b/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
index 606900d7a21..72a26098b83 100644
--- a/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
+++ b/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexm33"
 
 TUNEVALID[cortexm33] = "Enable Cortex-M33 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm33', ' -mcpu=cortex-m33', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm33', ' -mcpu=cortex-m33', '', d)}"
 
 require conf/machine/include/arm/arch-armv8m-main.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc b/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
index 4394adab0b1..c495b31826f 100644
--- a/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
+++ b/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexm35p"
 
 TUNEVALID[cortexm35p] = "Enable Cortex-M35p specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm35p', ' -mcpu=cortex-m35p', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm35p', ' -mcpu=cortex-m35p', '', d)}"
 
 require conf/machine/include/arm/arch-armv8m-main.inc
 
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
index 0eb938a2403..92581639aca 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
@@ -1,7 +1,7 @@
 DEFAULTTUNE ?= "cortexa32"
 
 TUNEVALID[cortexa32] = "Enable Cortex-A32 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa32', ' -mcpu=cortex-a32', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa32', ' -mcpu=cortex-a32', '', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
index c195d733784..477b43dbe68 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexa34"
 
 TUNEVALID[cortexa34] = "Enable Cortex-A34 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa34', ' -mcpu=cortex-a34', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa34', ' -mcpu=cortex-a34', '', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
index d811c84455c..0249a58e2ec 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
@@ -1,7 +1,7 @@
 DEFAULTTUNE ?= "cortexa35"
 
 TUNEVALID[cortexa35] = "Enable Cortex-A35 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa35', ' -mcpu=cortex-a35', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa35', ' -mcpu=cortex-a35', '', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
index a88575eb156..5e3fc672553 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
@@ -1,7 +1,7 @@
 DEFAULTTUNE ?= "cortexa53"
 
 TUNEVALID[cortexa53] = "Enable Cortex-A53 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53', '', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
index ee86c1c84ba..588f9f27fe1 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
@@ -5,7 +5,7 @@ TUNEVALID[cortexa57-cortexa53] = "Enable big.LITTLE Cortex-A57.Cortex-A53 specif
 CPU_TUNE_ARG = "cortex-a57.cortex-a53"
 # clang doesn't support big.LITTLE tunes, select the LITTLE tune
 CPU_TUNE_ARG:toolchain-clang = "cortex-a53"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", "cortexa57-cortexa53:", "", d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
index b0de20f8369..0c04033ef9f 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
@@ -1,8 +1,7 @@
 DEFAULTTUNE ?= "cortexa57"
 
 TUNEVALID[cortexa57] = "Enable Cortex-A57 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa57', ' -mcpu=cortex-a57', '', d)}"
-
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa57', ' -mcpu=cortex-a57', '', d)}"
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
index ba92161b9f8..d44c0572c3d 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
@@ -5,7 +5,7 @@ TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specif
 CPU_TUNE_ARG = "cortex-a72.cortex-a53"
 # clang doesn't support big.LITTLE tunes, select the LITTLE tune
 CPU_TUNE_ARG:toolchain-clang = "cortex-a53"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "", d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
index cbb6418c069..23680e07cdb 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
@@ -1,7 +1,7 @@
 DEFAULTTUNE ?= "cortexa72"
 
 TUNEVALID[cortexa72] = "Enable Cortex-A72 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=cortex-a72', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=cortex-a72', '', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
index 370882f2993..02b72301888 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
@@ -9,7 +9,7 @@ MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35"
 CPU_TUNE_ARG = "cortex-a73.cortex-a35"
 # clang doesn't support big.LITTLE tunes, select the LITTLE tune
 CPU_TUNE_ARG:toolchain-clang = "cortex-a35"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
index 388df5fb662..9b47a9c33a4 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
@@ -6,7 +6,7 @@ MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53"
 CPU_TUNE_ARG = "cortex-a73.cortex-a53"
 # clang doesn't support big.LITTLE tunes, select the LITTLE tune
 CPU_TUNE_ARG:toolchain-clang = "cortex-a53"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
index b3b06a4f09f..3fde9dd01ff 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexa73"
 
 TUNEVALID[cortexa73] = "Enable Cortex-A73 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa73', ' -mcpu=cortex-a73', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa73', ' -mcpu=cortex-a73', '', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8a/tune-thunderx.inc b/meta/conf/machine/include/arm/armv8a/tune-thunderx.inc
index 7bc6282be88..162432f4e5c 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-thunderx.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-thunderx.inc
@@ -3,7 +3,7 @@ AVAILTUNES += "thunderx thunderx_be"
 
 TUNEVALID[thunderx] = "Enable instructions for Cavium ThunderX"
 
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mcpu=thunderx', '',d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mcpu=thunderx', '',d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
index e8667bc16b9..f8a5d5b8e99 100644
--- a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
+++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexr52"
 
 TUNEVALID[cortexr52] = "Enable Cortex-R52 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr52', ' -mcpu=cortex-r52', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr52', ' -mcpu=cortex-r52', '', d)}"
 
 require conf/machine/include/arm/arch-armv8r.inc
 
diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr82.inc b/meta/conf/machine/include/arm/armv8r/tune-cortexr82.inc
index 84b2471c6b1..fbd7c39876b 100644
--- a/meta/conf/machine/include/arm/armv8r/tune-cortexr82.inc
+++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr82.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexr82"
 
 TUNEVALID[cortexr82] = "Enable cortex-r82 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr82', ' -mcpu=cortex-r82', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr82', ' -mcpu=cortex-r82', '', d)}"
 
 require conf/machine/include/arm/arch-armv8r.inc
 
diff --git a/meta/conf/machine/include/arm/armv9a/tune-cortexa510.inc b/meta/conf/machine/include/arm/armv9a/tune-cortexa510.inc
index 09219ec7f1c..8c565b2e20d 100644
--- a/meta/conf/machine/include/arm/armv9a/tune-cortexa510.inc
+++ b/meta/conf/machine/include/arm/armv9a/tune-cortexa510.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexa510"
 
 TUNEVALID[cortexa510] = "Enable cortex-a510 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa510', ' -mcpu=cortex-a510', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa510', ' -mcpu=cortex-a510', '', d)}"
 
 require conf/machine/include/arm/arch-armv9a.inc
 
diff --git a/meta/conf/machine/include/arm/armv9a/tune-cortexa710.inc b/meta/conf/machine/include/arm/armv9a/tune-cortexa710.inc
index 19743d67db4..9e92d427891 100644
--- a/meta/conf/machine/include/arm/armv9a/tune-cortexa710.inc
+++ b/meta/conf/machine/include/arm/armv9a/tune-cortexa710.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexa710"
 
 TUNEVALID[cortexa710] = "Enable cortex-a710 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa710', ' -mcpu=cortex-a710', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa710', ' -mcpu=cortex-a710', '', d)}"
 
 require conf/machine/include/arm/arch-armv9a.inc
 
diff --git a/meta/conf/machine/include/arm/armv9a/tune-cortexa715.inc b/meta/conf/machine/include/arm/armv9a/tune-cortexa715.inc
index 2f6d8c6f8f5..b5aafc9b02f 100644
--- a/meta/conf/machine/include/arm/armv9a/tune-cortexa715.inc
+++ b/meta/conf/machine/include/arm/armv9a/tune-cortexa715.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexa715"
 
 TUNEVALID[cortexa715] = "Enable cortex-a715 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa715', ' -mcpu=cortex-a715', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa715', ' -mcpu=cortex-a715', '', d)}"
 
 require conf/machine/include/arm/arch-armv9a.inc
 
diff --git a/meta/conf/machine/include/arm/armv9a/tune-cortexx2.inc b/meta/conf/machine/include/arm/armv9a/tune-cortexx2.inc
index c116e30ff59..aeaa8a7340d 100644
--- a/meta/conf/machine/include/arm/armv9a/tune-cortexx2.inc
+++ b/meta/conf/machine/include/arm/armv9a/tune-cortexx2.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexx2"
 
 TUNEVALID[cortexx2] = "Enable cortex-x2 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexx2', ' -mcpu=cortex-x2', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexx2', ' -mcpu=cortex-x2', '', d)}"
 
 require conf/machine/include/arm/arch-armv9a.inc
 
diff --git a/meta/conf/machine/include/arm/armv9a/tune-cortexx3.inc b/meta/conf/machine/include/arm/armv9a/tune-cortexx3.inc
index 7982079ef86..00701b4ee26 100644
--- a/meta/conf/machine/include/arm/armv9a/tune-cortexx3.inc
+++ b/meta/conf/machine/include/arm/armv9a/tune-cortexx3.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "cortexx3"
 
 TUNEVALID[cortexx3] = "Enable cortex-x3 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexx3', ' -mcpu=cortex-x3', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexx3', ' -mcpu=cortex-x3', '', d)}"
 
 require conf/machine/include/arm/arch-armv9a.inc
 
diff --git a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
index ad60a3c9f39..e408ee10b98 100644
--- a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
+++ b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "neoversen2"
 
 TUNEVALID[neoversen2] = "Enable Neoverse-N2 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen2', ' -mcpu=neoverse-n2', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen2', ' -mcpu=neoverse-n2', '', d)}"
 
 require conf/machine/include/arm/arch-armv9a.inc
 
diff --git a/meta/conf/machine/include/arm/armv9a/tune-neoversev2.inc b/meta/conf/machine/include/arm/armv9a/tune-neoversev2.inc
index 5d1e108468d..ec6aaa03939 100644
--- a/meta/conf/machine/include/arm/armv9a/tune-neoversev2.inc
+++ b/meta/conf/machine/include/arm/armv9a/tune-neoversev2.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "neoversev2"
 
 TUNEVALID[neoversev2] = "Enable neoverse-v2 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversev2', ' -mcpu=neoverse-v2', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversev2', ' -mcpu=neoverse-v2', '', d)}"
 
 require conf/machine/include/arm/arch-armv9a.inc
 

