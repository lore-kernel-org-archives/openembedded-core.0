Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39515.1793182268522882923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 03:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=D6Kup0Fk;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=PymkAZAR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8Js8v611814
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 10:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s2/gI6+IhCEV4Zwctov1gBWe2RWb+JFICOT
	ENpvGqgo=; b=D6Kup0FkoZuVRMSRQM43VSwVW3RZBLFNgb2YodEoCL+TgNGRH0H
	jrnUukRN1XV99pzDLRR8uyKyTiKzoP5UAwLHSNWTNOmOiGmcmp3/sNMvVsxJ9mS7
	wpRL6yp0G78foPCgJ7JUDTDRBg1+POPv+WNXrA+LUZV+7DgvV6wr2WYwavW+71Co
	BJon4eMVYUPNeBcZi4rSL4cLB9gx8MPUAxDyHVv2evjlWBmVus3x6FBBqFNs2uxD
	pxfLpR2rwZHE1X3I+HqzEOBBlriCby8xnGgoNMVlhGmjvjlvZegnZ4ocKNO9S3oG
	Lnag1O7+0M79M0F0UHJCpE9aFf/94C1H6jA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw8vcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 10:11:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso163388685a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 03:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793182267; x=1793787067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2/gI6+IhCEV4Zwctov1gBWe2RWb+JFICOTENpvGqgo=;
        b=PymkAZARHzu134MoOAVYDV2y72xqKah7E/WoTM4n4TBC149jh2qSTxpq8pPTdl2RV9
         6vLzknAQu+k+3gtS8MwkqppDUlEVQS+NlO4MEd+9NKEjE0r47WAFxwg21fh/kD1BAuxX
         qdwSyl1pAv+IK133Z/KUz4yfuMcVZASHxvUeP3Nyv5kPf86Synz0Ni+iU+Qk8y96kTwB
         heiocqxvRYURzMy3rxXRtYNIITc5POk48yTY1B0QtoSeozB00dNKwdXIDx84KEyTEzFV
         tis4EFqwdeDUBVYLQJBr1eACmpZJGWlPXNfv+/rjmnpP6ULb8TEqusnhRk3EXqdvB5uu
         RCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182267; x=1793787067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2/gI6+IhCEV4Zwctov1gBWe2RWb+JFICOTENpvGqgo=;
        b=0HwUFeMto7xWGk2H/gYWhsD/y1mtEVhKmHuX+f9s+LGglSVBnppZ6G3RgDTH36InG/
         VjMYxus/TJGwUqCU+XjVS0rHHbRgbui4wJFVeJxBrWHTEswkvbQN++PcOKnhJeI195lV
         /uYTHFCew4pPIHyz5r+Z5oLWbrq42nc2RO6vju2GYFfzmZ4LJH55lgMRSoauV5KqdVV5
         5btwWdG/BV6hvcrbr91/hpXkusZb/hIZQZKP7zdqvWfRfgu64BG1/jZNR65bpWEbkkOi
         GxZLmyAb0pmh2S5NOb5vHkMqVUK/IQQXIHB4+yFY7Ff8EZtIVyOz51nKOF1wYOOUtJVK
         ievw==
X-Gm-Message-State: AFq9FYKp6grfu6ZH20a8gh8+Gi8m9k81EHxzrg6ZH97ADjI4Fa1hCgnz
	Hyakg6jMCYnGMBc1HSOQcSYL8dddI7fOUVtouDudAWwroF/svC0xY336E6LdzRrq0JjZ0DL3mV/
	dDy6FGnp9MljrojQ62Bq/j24hJBznptAihLJWPkUJiZu2bJaJCy/lRrUDn/1PcPu8tCWRFrc1hf
	ABaQHRJPezwuS/7Qc=
X-Gm-Gg: AYBFou0JnvZybaJ6nZgfYy5SmzCuG7cAoIiZxHPOjsnXg2cjs7gQPO5dVV3cCAipLnY
	ifGFrDbUQZePtOueO2OUn2ilQRJ3Xw4H9xwCELjCcyO1ZOebKJMVe9GSIVhqg2H8jHbFY6xYJck
	5d9DRy6Ab0bctPG8YDGYx6YCrrQ7sawyeMth7H3e2fgmbtMcpw8LAWdoJGIwIALkLhbCAYbsiwy
	xnK6KPAOohYTTiqAMbth1tDSPDI8DdOKIk52FEudqpYmkvn8yPgmm38DS66BE1xGW7RJlq4wUvY
	FEfdLc8B1gnzBsBKsVTpMJchcHZetn2+UCy8f/bb8qLRwoTrOAEe9p+faW8lk1qEXsVSPtYX5jv
	y5rGhs7XN78xFe7x1rnDePqIc4apVahfFiZWZISJgWNyMM14PysgtlzEv8HKXUWk=
X-Received: by 2002:a05:620a:470d:b0:93e:e4d1:797b with SMTP id af79cd13be357-94408cded4fmr236186785a.56.1793182266815;
        Wed, 28 Oct 2026 03:11:06 -0700 (PDT)
X-Received: by 2002:a05:620a:470d:b0:93e:e4d1:797b with SMTP id af79cd13be357-94408cded4fmr236181085a.56.1793182265977;
        Wed, 28 Oct 2026 03:11:05 -0700 (PDT)
Received: from toster.lan ([185.228.162.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm28977628f8f.28.2026.10.28.03.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:11:05 -0700 (PDT)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3] igt-gpu-tools: fix build on non-x86 platforms
Date: Wed, 28 Oct 2026 10:10:23 +0000
Message-ID: <20261028101022.3308-2-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DkUwoufnDoPYV2hRWVQ0-ZJdS-GGEMFB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MCBTYWx0ZWRfX9TkZzcs46vly
 boV3A0Bq0R+pAuN02VSN6mauS7JVvY4V0W0E77o2HFSYLjlHJL5PIKOywzReikrGQy2tjz9vykP
 JhD1fGP9nzHn9YLOTyalz7Ah1DX39OY=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1ca3b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=qOKIifoFPMYe9XV0Ag7/Dg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=e5mUnYsNAAAA:8 a=vsqMbstPxYt-GFuWyhQA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: DkUwoufnDoPYV2hRWVQ0-ZJdS-GGEMFB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MCBTYWx0ZWRfX+kkqzSztFQsM
 8NWImDlEpmpDtPML9ds/f4MxAKBVOhwBmkn0zAD5fiUqeyGe31yXYUqS8miUeWn0ANqGW32U6zI
 ZbJ+0ftjSVxJUXOj49JD/N0I+9bROfuW8OAzqVNqwEkFpmm6HzVPlSlP7iSue7bBCcAmWH292RU
 5PIutEnqlvOsZVn1st6BJfnOMcesawDAC5UFtutl6+TDFrmXU0RG+NO32WR9cvodBmOqLt30IKn
 Ex0tf09+Do3tJ8suAcpFfW6KhkSlitC/D06HXw1nZCJC2TZ+iIuJ6TFZaSsx9mngWf5VOz4BzQP
 RHX6K7e6hL1MHP3lrHzIH7EoJrUV+n6nvgHV33JetXNEWOBB23kTh9eNHlefpaAQQH5Gdx9JHmE
 Ex9lVBMP7OQG5kU+mCpbvpTkYSggndgUido6wOwQMASR14+FJqEclDR8EiFN8f1AlO8L8snliEJ
 Oxhn3aR0Z2Ga9TMnMig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 10:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248805
Content-Type: text/plain; charset="utf-8"

From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

The "pause" assembly mnemonic is only available on IA-32 platforms,
breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
assembly with the preprocessor checks, making sure that other platforms
don't see the invalid assembly.

FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
Assembler messages:
{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---

v3: rebase on 2.6

 ...t-pause-mnemonic-only-on-x86-x86_64-.patch | 36 +++++++++++++++++++
 .../igt-gpu-tools/igt-gpu-tools_2.6.bb        |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
new file mode 100644
index 0000000000..1fdaad7b0c
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
@@ -0,0 +1,36 @@
+From dc072dc0fc680a055d0cdf5adfdccbab6d0566d6 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Fri, 26 Jun 2026 22:34:06 +0300
+Subject: [PATCH] lib/amdgpu: insert pause mnemonic only on x86 / x86_64
+ platforms
+
+The "pause" assembly mnemonic is only available on IA-32 platforms,
+breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
+assembly with the preprocessor checks, making sure that other platforms
+don't see the invalid assembly.
+
+FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
+Assembler messages:
+{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
+
+Upstream-Status: Pending [for internal clearance]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+---
+ tests/amdgpu/amd_basic.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
+index 3ad023472136..e5475f337549 100644
+--- a/tests/amdgpu/amd_basic.c
++++ b/tests/amdgpu/amd_basic.c
+@@ -703,8 +703,10 @@ static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
+ 		/* Sleep if interval specified, otherwise tight loop */
+ 		if (check_interval_ns > 0)
+ 			nanosleep(&sleep_time, NULL);
++#if defined(x86_64) || defined(i386)
+ 		else
+ 			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
++#endif
+ 	}
+ }
+ 
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
index d76c2355a1..a46b002b83 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
@@ -12,6 +12,7 @@ inherit meson pkgconfig
 SRCREV = "916c79cfb7675ca01607dcd821f8c49d4f633a6f"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
+           file://0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch \
            "
 
 DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native pciutils jansson"
-- 
2.56.0

