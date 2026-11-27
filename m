Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5860.1795818335350299533
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 14:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aaR2ma6g;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso18229131eec.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 14:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795818335; x=1796423135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=epwYbw2QWoaSgg5aU6yeY8ILMdhIzaEwrERL9z6iz2Q=;
        b=aaR2ma6gvY4CTd5q6ffiqLwoceAwtUnHAFyfecR9g5dlpoy4OIKUpQjS0wihZ+i0Hg
         3D53M4f3lFP/FCOBPPp1wRV++sisLHmZeQTrYvMFN8qzQ/GJLGq+6nYYOTubOCXXC4dC
         ABRYoE1zNIypTQwoi8vIl5kE2Ar6eHj/gD8h6QVmGAgHJirzTk3MULTvbR9zjEgRVI0u
         pbO/1db+MUU30smlRIPCDnwr/Vl6VeQJ6uVkMuOfbQ29irAeF1qT0APGSVUJGu0EIvDj
         hxtk4FRbQ3oXvl63HS/jh+Zq2RE3vAInJw6MXq4VyEasn+6eu53XAMl9MuX7GF2agBg7
         804A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795818335; x=1796423135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epwYbw2QWoaSgg5aU6yeY8ILMdhIzaEwrERL9z6iz2Q=;
        b=Tx8KIcUvEytjIxdaTFMHUlesiLaq7Uj0Jw1Vkm7NNts5AaYEvnQjyzVTlUSoz2PkoE
         0xNUgZCDee/2uxrnJkPDli0oPnilNOqj8gj/+O09nh194z6wXr1tUJ3HtHk/jcclj+oR
         ihttq5qzC+dlyE++bsIFpkrBiD6+Goj4BNDpGb/lNxBOdvMINfS67dDCjTl4VX7X1jXO
         FTLfEdpNmUV+nhKzmMgb/4hkxBmdL0nblDc0HjtVxQlBKnHNGub5CAI7ccAFkycUA0z/
         Jq5qyn8P3GHSLPLdg3+WFOvAMbPS9lFTF8niTH2r2Ha6C+Yud5TidX/d0h6QI5kAks6X
         8hcQ==
X-Gm-Message-State: APuU4Z+PfxcpF4+nnGo98YAQIT8PV1TOVjPOacg4EJjhRoBlrStgRO3I
	alSuOfmQGVad5sso+xCGMf9Gy/mawrfdZ4fbwGmkxX7Wo83haOtRrRlM6HD1tRx2
X-Gm-Gg: AZFdTZeSifRz/Exkpn4Vfd3+7sFU+comWGD75HrJm1dyJ2GPVpTvHuoyKOaazY7kRim
	9o+Kz+Lw60aD5cp3UKQ7rptSmjMkQvOZONOXsZx4cHiW7DEAkX0noHocwGmKtQS/RXbnswYw/jo
	k9yhXSdcholYryeHwhGleAoPEsZyA93kwtJx+gSFKlFlaUZAdJ4PkNQ1TVDnXyI3b8w0gR/LzAS
	9Gac0IfPnxCxXtLbVJh3CBVLutC+fQ6uqgM2+A+MWLEwqlPXZ3GJcIKmadXCD5rGK9T6Oup/F2p
	1lpLhD5B/ODpBK0hZkUUJMzJeTVd8JMjbQ4Fzo+DLsnu6dy+I134vADBZkaPfnfx/ETKADKThJn
	UXlbEd1KjiO1xK8oyrm5QhVA/Xbif65afdyxOnH8W1uDXAAAV2QMFQK0noN5o7U+wB/J9tkSBFn
	g69VYN0Rdz6J3eGaL/fWmdTQyK7bhmvcvZfyiBBHYCsQvrAWOF17AsUHqdM5TTeRb5W7ulGe6ia
	Vz6LQ+dcpe+aGs5D3R3WKlowhH4sH0QuTY/y/04J4/w/7MmYvpWk7ASqKi9ucxPCLO3krYt4j8W
	Kygtkl/fiT48WYX6tSrzhq/qBrhzT2JjQYktHvmVIVWy8+7TCqUBaw2US2j1MbfNOBUj3h6MYuT
	nWTFSNoAUCXeUE1xBh7FXbN/mFe7ppe9hLNF35Sv1kcabz4NhbPkeq2dZFdvFxXZSAq4v7zAVvB
	27VX0yqO21PuFuKmI1Dk9JhxPnwLiG6XPteIdU8yhhO7Cqeat5nnxn+qs4gqjVBI08YS96t3TvC
	XNOSYEC/vR1DTvAK0ImFjPF7eq4WPa5gxAWVAIxb1Vs3tRtYfS56mIgfNtTOoUbMZNgSy29FPlw
	xZKT
X-Received: by 2002:a05:693c:42c5:b0:386:bc42:b5bd with SMTP id 5a478bee46e88-386bc42b660mr13410147eec.25.1795818334409;
        Fri, 27 Nov 2026 14:25:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm68604909eec.20.2026.11.27.14.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:25:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] linux-firmware: Skip the vendor home paths in the buildpaths QA check
Date: Fri, 27 Nov 2026 14:25:31 -0800
Message-ID: <20261127222531.3233733-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 22:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251463
Content-Type: text/plain; charset="utf-8"

Some prebuilt Qualcomm DSP firmware embeds paths from the build hosts it
was made on, /home/ubuntu (Radxa Dragon Q6A and Q8B) and /home/scm
(sdm845, sm8250, RubikPi3). On a build host whose HOME is one of those,
the HOME check in buildpaths warns, e.g. with HOME=/home/ubuntu:

  QA Issue: File /usr/lib/firmware/qcom/qcs6490/radxa/dragon-q6a/adsp.mbn
  in package linux-firmware-qcom-qcs6490-radxa-dragon-q6a-audio contains
  a reference to the build host HOME directory.

These are not build paths leaking from this build. Skip both, as the QA
message suggests.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb
index 479c7e4a94..21b47920d1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb
@@ -3978,5 +3978,8 @@ INSANE_SKIP += "ldflags"
 # Don't warn about already stripped files
 INSANE_SKIP:${PN} = "already-stripped"
 
+# Some prebuilt Qualcomm firmware embeds paths from the vendor build hosts
+OEQA_BUILDPATHS_SKIP = "/home/scm /home/ubuntu"
+
 # No need to put firmware into the sysroot
 SYSROOT_DIRS_IGNORE += "${firmwaredir}"
