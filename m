Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7870.1793266712875133089
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ERVNy5aG;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Sl0tR3Wg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vDXF3824956
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 09:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=coS+GnNhdVPb3H4YcWYbdXl8YH5KyBviN2O
	HsFQRWo0=; b=ERVNy5aGYmYIbI1vB8uxBvzMqSlaDnxnbkjOmeHmm+W/d+KB89U
	pQC8ZALQ6q7GeK4FAvwoTCEX5KpEmdd5K/tAdYC8hTeQmdXU/Y0DwTSqI2YQsaoj
	HOesbMUbSio7p+0AHVz0eJHourOAkej1a9bYddgQ2ZfwttUAfnUN3NBeEXKRKSNy
	CQzNew8S40uqdsR1eb3PGT0c4sUtAU3f1KFhvIy2gVpUorRLbA4BlofSfNv5Yubj
	ANLypNNkVd1ASbLLO/Q8K6B7qZHoZ/CynQ+0v2QvXTouOplGi4+Esf2i2MgPGlx9
	T1NLOaDGTCcJ11vLbK3FcMf9BhqptJWOhVg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3hqx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 09:38:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5351f1b26e6so31089931cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793266711; x=1793871511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=coS+GnNhdVPb3H4YcWYbdXl8YH5KyBviN2OHsFQRWo0=;
        b=Sl0tR3WgUbpfel4IBrh8swGzMp/x+/fJ15FHOEYvj9m9BSeJK3TKlzm1dMoWng+BhZ
         pUp5e7DmtlME0s9qC9vii7sWR9IGmJ4/Uyhi7yPW/BQHIIDBC9/1bBR80z50P7jyK0+0
         wWOuYmVWKfjn/02HOgwRoCoOYHIsWXb7qJ/yPp5h3UM7VQGQ3+ilrOZITCLqs73PMcaW
         aGDieTR6jVETUICWlK4xR9hAtCrHYwGwfo3JWAlh04OPX0bmMlFnSCGFUqWeFsuGGPmW
         fkPmyDo/Fx4cyR+TnokZPV7wppQ7nZzH/U2G/U+TjVeyO8Iie7Z9xO3akaB6HhIp+aqL
         b/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266711; x=1793871511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coS+GnNhdVPb3H4YcWYbdXl8YH5KyBviN2OHsFQRWo0=;
        b=t+UzkSouD4xKr4k0kPNono969QZhZxD/gB0qVggjp+8ukC2L7CUrlVS7EEOlROmHbK
         E7byCZDkIDirFWgP4aD6XBgIfJHqBAQW5EL9yqEkT88iqc+nE4oDwmJcKj5H0jvqUKw4
         LQ4E5pEYGEq8fHQinrvrTlaQwdupznOPIbPLbvE80ZvIvTgDzCFodvwjnKbULssZrDZ7
         2kt+OPPE+hBCN/KZJNDtTb5BJJVL7y07f20HB//1SCZBjkQCGd02I99ksHey/95+8dGg
         qogJ7Eh7wMkMj1wkfAyILMoFPSw0y04qH9CYL2Ep2qkB6LYU9RiRdh7KlWVCbeo/OWli
         RsdA==
X-Gm-Message-State: AFq9FYLZyc9Gqnqqo2cXbb9EcevOqavSmjR+kiiJYxLdbuoNbZBqA44y
	HViN9CQUDvfezNdDM7/XDP0chcYMAF+Kof5BI11W9MbyXD0VKEDiaJ808K8QIwyRsJQMTgHhayH
	8mnj3KBcYCcO16ONeJdfRapmluNYYxJ8T42qZ+I1q4wuihInWtcdpER71bai+haJxrMmwomBTu/
	mVN6zCencTqgOmBdc=
X-Gm-Gg: AYBFou1V1prkQMg8eEvC+ddT/Ty3trm19gIJPJGUkxeq1XfOWaEQ8DTBVIE/L5XvT+d
	JGYH4Ho1KovCyKGXxRewTY7SCK2nb45FrjPFoeUAVd0rADk0zz/DPXwmhrSkYiAhq5CAbPOLxF9
	7CUHff9OfNG2oHNoPJdnBAkFOkHo+tyE5RkHFzsoJUeZca6UB7i9kQwyU3XW1O0zr81906u08y+
	lAoN7HpE/saPo3itp5Y+Le8P+Zjuez2kQ8Zw7Z6cLL/5aX/kCCvqlbYLO1/egOxNr21wyqHSC90
	Chgp57suppau1ntg1XFqIt3AkiYUMtHhoH2ZIDwE88KJQoK6b9LpCiA1myJmF657o9S9AwILTHg
	mvv9Rl0gOF5fGFqHZTqZKproSbWoNbz86oE+cQez6FmDGJontnEYOLviDuV220no=
X-Received: by 2002:a05:620a:371e:b0:93f:309a:ba5 with SMTP id af79cd13be357-94408cbd0cdmr775029385a.47.1793266710865;
        Thu, 29 Oct 2026 02:38:30 -0700 (PDT)
X-Received: by 2002:a05:620a:371e:b0:93f:309a:ba5 with SMTP id af79cd13be357-94408cbd0cdmr775027885a.47.1793266710364;
        Thu, 29 Oct 2026 02:38:30 -0700 (PDT)
Received: from toster.lan ([185.228.162.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2640sm52611685e9.6.2026.10.29.02.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:38:29 -0700 (PDT)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5] igt-gpu-tools: fix build on non-x86 platforms
Date: Thu, 29 Oct 2026 09:37:39 +0000
Message-ID: <20261029093738.1507-2-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNyBTYWx0ZWRfXyp3ZMUdeztSx
 gfaAZufXQVgcRU9Z3s8dgdloCCrd/DKc+nXjcOJWQNFmxeh3d13xCFseJ67Ax6Qpu31KZS8eMHC
 hWT9pt9wtzED+/I/kl0YmUVbYrNeBN4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNyBTYWx0ZWRfX7ERPVNMUDwQ9
 t4pgIXa1GUfq4JXzVShGN8w+hwWWRg1ZLzObe4yKKxYcee+blW3GI2FBT3B0YlN85tZw1CooCIq
 BST9sW6CerKeSYFB2kbYq01n2pZsxHizHFyNzgrsQa29YQ1LcS8UkzaARGxhG+iJlK8cfyts8AC
 DbqoBsZ/E+TA/HODO5dRvc9/qHOQnK2JGV7NlfgiQO7aLjBMXFN0j6y7nHqDltZqmji83lVC+IZ
 7qwT6eMmU6djW2zUxojV2965oGNSlGJdDtwQsQ9lHqA9M3uGy7NukvN6hMJ4KkKMx2+532R+530
 531FsEQNk5mkpWoQPIj874kDCtZQyPAWzV3u+XauNa6fz3nskz3lhbFT6ylgJhxOFi1W1ThbNKV
 ln4mA8+PXVCoKKjmG4D4cwMCw/n8QcALl8cKOx0kseitUAEao1aXfgnLRhogyD/xrqR/sqWmXvu
 6FkQ6Q1tylXIZDlu3EA==
X-Proofpoint-ORIG-GUID: BczJqUGo8AtmenmLR6YdVba65eBrPOG4
X-Proofpoint-GUID: BczJqUGo8AtmenmLR6YdVba65eBrPOG4
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae31418 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qOKIifoFPMYe9XV0Ag7/Dg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=vsqMbstPxYt-GFuWyhQA:9 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 09:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248920
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

v5: Move Upstream-Status to the carried patch

 ...t-pause-mnemonic-only-on-x86-x86_64-.patch | 37 +++++++++++++++++++
 .../igt-gpu-tools/igt-gpu-tools_2.6.bb        |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
new file mode 100644
index 0000000000..38582bf1d4
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-amdgpu-insert-pause-mnemonic-only-on-x86-x86_64-.patch
@@ -0,0 +1,37 @@
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
+Upstream-Status: Backport [https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc]
+
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

