Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18616.1795796098441087249
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 08:14:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YokIpvaj;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2761c69fbso11993186c88.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 08:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795796098; x=1796400898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1sVv2BKRhH96Zt03n3eyITGPKss143bEoLWfaNDsmZ4=;
        b=YokIpvajVGuYAZuNNQRwbu67kG6zHffPRTFTGTAe6O81CQel5MLb+7W+vQ8plz8zJi
         v8LoVPz/8bpvP0ors5DV7Y4QAoBegYNAwmxf8oTsTxtyO1iLx0B525kVCbhC9u121swc
         lfUtyGNs6U6kN89Ihr5SoVPIR/0nWkrDFvEif4jTJ18VEeiEEsE/8VBIH2x9vSKeKjed
         mrmHNYl4mBJACZbFApDx0dxamWaBgVJ8Z6nNzqZpZ2AcHH+3odU1olofaozrIytzFQs5
         12GeldfGrIAgJ8VfDYYDItpG1/S2OqBgT0CWh40M7G5wWwbFQeLtS6+VYwi0rLNb0xgH
         gXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795796098; x=1796400898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1sVv2BKRhH96Zt03n3eyITGPKss143bEoLWfaNDsmZ4=;
        b=w7jtgMfP0pFAFZlNeJ+OYcIrgh6yr5wVb2o4xUdQ6PAXulk/5n4XwroISd235b0exp
         BB+dvX1to0xri9XA2SLHbhuXQGLTp4Ia4MkK4FdDonfr7fyGBMPKT1GTzbiZzxB+hsGi
         Z9hoVJ5ZDKxTxwAtUogVDexXxxd/Gcumjt/ZV57UJY2nOBJk6xDyl+QhpSUcgO2Y0Gqv
         h4vxC9/e2od2r0NB3F/vq3VNfC4tpni5cjbI6sHN8uF/iOGPckAtmdtmQ7zdC0/7Xrjw
         dRcfibLlD28nWkOrld3I0rU504Vi26VISnXBG6PaIeS8ZO27TD3Y24dX2GGFOBQzc1sS
         gQcg==
X-Gm-Message-State: APuU4Z+mjaYq0BmBucICriplBHBOumnZV2obXmr6MOTW2Kr/oFMTFt2P
	hHtlD+mI4z296KkFpU7Biu35lOuSzjfM7+2R3sDYMNV6SGhvazvUStpQHejwGcEM
X-Gm-Gg: AZFdTZcI5IxitJfOfK1+69WT0kc8tMSg0aWkothrFPuYhB028pPfF4eQ2Ih069329cO
	UhsdW8KtAZppJSzszBnED5L0FEB1e9oGiEDteeW+z7XAnrezKp5jFE0wfWskQfmJnf2YhhvPrsG
	+GhWrsEDrWcFYriIMzIy7ErTOjgDxAxz2RJXkgPCIFE8x57TRNz2W8j14ppgGL/W6vyrv2jBVIS
	F6WuFlP2KiPYBN11QS/X0jHzIXOTt9WSRLlhhvqCmrxQx3iI+m/TfcSfaXVzgl+2tey+WXVmgO4
	2relAlTEJBRTu+y0vpWIw0kGiAwX7nLTR6nzJG7ndUaFm/RCQ4NmnIY3Vd0PF3D8EFpig2VVVI9
	9/CCkkykZ6eDGxQKEnjv2PhWoijZk2Z+D50JoLOr973cOeEU7s9yZxV1bytPqhTkpgijikM6bFJ
	68TD2pRWlEN2xNd26pfo7mnu0lqL3WgtoFcEOkgcExLVRgFCjVC9pDM3TXthhMlZuh6lhqs+7xm
	Ds19ZvBmNzh+GPaT4Db3efVtmIuIr52WtjhraSs9t87BD2habzmBHPbuJs5nyN/YzwMWdjlWM7F
	njo3YQSTcPKWNEtzLYWFHlxjWXhK/ddErJnbCS1BkryIAT0YB52jjYjQKQiKKjDd0wk1Ce9nAsF
	rFo5NNZ7CKL7yIkCShgBY+IwYXND0/UOP554FKmLHkvcvI58ASljNZXg1A6yLp24aZdS5Jc39gJ
	QeUhwluOfoNH1JSHf15NrwFfGfZGwJF9/XEcuyt8+i9EbE9FvCito1t36m0peTeWB9lOApTPE4/
	s/5gJS/JzbEIopqEwdPyxNATJVX4Z6bWXSGv1Sm2Pw2ii2Bqit+3OYOAR2eL8sCz2bzqpwLIDPf
	vhfX
X-Received: by 2002:a05:7022:e80e:b0:1b5:3b6e:e1ed with SMTP id a92af1059eb24-1b55690bcf3mr28927016c88.32.1795796097580;
        Fri, 27 Nov 2026 08:14:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm58515970c88.12.2026.11.27.08.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:14:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] ffmpeg: Use the external assembler for RISC-V with clang
Date: Fri, 27 Nov 2026 08:14:54 -0800
Message-ID: <20261127161454.2880456-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 16:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251405
Content-Type: text/plain; charset="utf-8"

ffmpeg's RISC-V assembly is not ready for the LLVM integrated
assembler; for example libavcodec/riscv/h264_intrapred_rvv.S uses .irp
without a comma after the symbol name, which GNU as accepts and the
integrated assembler rejects with "expected comma". Pass
-fno-integrated-as for riscv32 and riscv64 when building with clang.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_9.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.1.bb
index 8413b16c25..5d58ae4b90 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.1.bb
@@ -33,6 +33,10 @@ ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv6 = "arm"
 
+# ASM code for RISCV is not internal assembler ready
+CFLAGS:append:toolchain-clang:riscv64 = " -fno-integrated-as"
+CFLAGS:append:toolchain-clang:riscv32 = " -fno-integrated-as"
+
 # Should be API compatible with libav (which was a fork of ffmpeg)
 PROVIDES = "libav"
 
