Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7775.1793266206558664005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oAsMjwrU;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=eXcYB+Fp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vU55179454
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 09:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Qd/3KlM+GxZ1g1MTfWDBT5RKIUg/8iENdAT
	HaWUPhFY=; b=oAsMjwrUiHsG5Y5QjtwEEyESQMI/pOVr4S27uP8+KtV1/4pgKEJ
	aP1KcSe3VseU4Oc5t7yaImzEaq/TTa9hIKuaYx066CIlgeYvTALnzqu4H9Ar8pDH
	QCmhvNyVwFZzMrcI1BfPjUNmZwFdfJ3ive7fkyzaPbob/2LSfy3ybUseIJhMW6JW
	IPm2Oo0sRJEg3tHjufjoM8g/xTTj/aXgcb3b6/HXVlVlu178HC+LN5ge3b+73Yre
	UnRac65mhR9O9hfOM9bF7aQqPYIxBv1q3eWQqyJPCxQfYaZSS2z8Vna3ASkeTdkY
	l/OCIQ9fRJvw7xB82pMne1kwqYNShwj7FSg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc2v58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 09:30:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c85c9a756so38721446d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 02:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793266204; x=1793871004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qd/3KlM+GxZ1g1MTfWDBT5RKIUg/8iENdATHaWUPhFY=;
        b=eXcYB+FplDPxWJ/3F6g3SBuQb3hJKqYvoGGeg91Wu1/FxO4KgiVlKAVGnG4M1qjTFj
         WMafqODQK2ngBCflbrtQbmytkgtws/LOO9MbKgPJyHd6iXR/XN13ftTqioFehsrgI7RE
         IVmwiETGIbQ0NoYeyPZE5nBiDtvGJMkuR6C+CYal8J1TLAB/5RPIlKk9qva4JmTj0uGw
         XgquviaPYPCT19uDYJnaekqaWno2tZtdkEI+0GEFsUYLTElsWa2/gzANvF7yF2XS5LaM
         XtFssQl3hLDb7+vsUjizN4Q17AMc72bkU5IcmOtQ/GylzT5BdoXOfKoHqKYFVe9lPdD4
         fCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266204; x=1793871004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qd/3KlM+GxZ1g1MTfWDBT5RKIUg/8iENdATHaWUPhFY=;
        b=BNMebcH+dx5IpKLk2WaNnvbYCgqHq8oJQsBeR1aD8yoBCpBBRlMXHCRmgC2Lt2QpGN
         H0sDl7rCzqBIInKdHev5hUTFXpOrQdHFEQCqOBhAu2MFWRrK/RkNbLRz8mq6HbxTsFew
         Xd2MxGc56pABhN3386X0TU1UC7ypGrEOfJWnpNExVd2etMcm8LX+oMuMp8XFgmGaOf+P
         s5oGunNGu8TouPBWq0wfR96ds2SrlfiXPXJWnyOcsZWi9zXZkEd//WkpuKLidF+O2imz
         2LW25hppDteTgeZT/qrjLKjULIbPgl7H2FCpAVJo+7/NUTKg+SbZHHh4Da4A9kaaLhCf
         xbzQ==
X-Gm-Message-State: AFq9FYIEHh4eCIV2GYP5E2IrJHJrhFt5RVnMvSNBNX9e++pPD2tJkBWF
	8oLiqf+R1WhvXbu6QTGpwg7IbMB/wBbrYDhuVzcZrdeeNGygi3OzCkEAr/wY860rz1zyhia5Ttl
	a6QqojgKu9Lyk1fX+aIaJ32MYOS1Yz3nbaMVqFHEfU0zqeNrRHGqcXL3A/eZEOvUeoOZOcGNoTx
	GGfE3Y+ZczXjNeY5w=
X-Gm-Gg: AYBFou3Chmg2PyLmnPtefWuzrThtOj5Om0CeJSa140Q8ufrR3ZAuYQFgZe9B0+UZpTf
	a7+5hQw4jBNoceCmdE64bVhSpUtViLf9Hx849wpSKlhbih6yROLDwhtruhjkMUUH8E8bNwIEmKT
	YBxEy2xo2e/iD5Tj58NYT+YnXiFC30EGw8Ie1AS3NtIjUipHuqr8gvLY6s19euJP99zqbmoxUGh
	+xnx7RGGzEBUD+FQFfqpDyMy2kr7WlT7EXC/XtM8Qf4UbS8A/US5+SPZi1sd+/jH8K/mO0pqCMV
	6Km4/94pRHog1+RFbQWFQzcziIvr1Z44IqHwiHXI5rSMxmsPqDDgNInxsL887Gm0kvD3lR6rLwo
	Go7/eMmhtSr3hqqGP7y0yF3xulgzpvzcQBdJV5NKO5VUEBQr/9CgEchOvIX6WCKw=
X-Received: by 2002:a05:620a:2685:b0:93f:1ca9:f2f6 with SMTP id af79cd13be357-94408d77ef7mr664053085a.77.1793266204462;
        Thu, 29 Oct 2026 02:30:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2685:b0:93f:1ca9:f2f6 with SMTP id af79cd13be357-94408d77ef7mr664050885a.77.1793266203894;
        Thu, 29 Oct 2026 02:30:03 -0700 (PDT)
Received: from toster.lan ([185.228.162.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece13aasm30944070f8f.58.2026.10.29.02.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:30:02 -0700 (PDT)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4] igt-gpu-tools: fix build on non-x86 platforms
Date: Thu, 29 Oct 2026 09:28:42 +0000
Message-ID: <20261029092841.1314-2-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae3121d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=qOKIifoFPMYe9XV0Ag7/Dg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=vsqMbstPxYt-GFuWyhQA:9 a=iYH6xdkBrDN1Jqds4HTS:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: aAVcJIpfQpm4RXEhrNOVhhJJuAZUChmN
X-Proofpoint-ORIG-GUID: aAVcJIpfQpm4RXEhrNOVhhJJuAZUChmN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNiBTYWx0ZWRfX5ZqQttk/Mk0L
 FyLhGsK+In06umsTgMvu3XNETDLOT6O/O7Fi5z3hCIlmzFUe8BPiO4t8jWccbaXUstlrlVQO7gw
 cxej565z/P0f7xi3OoknvYiwlmdK1Q4r3IH57wva4eYIWBjWYfGMMQrOehc8Vn/zR5L4kZX3yGk
 9cHQdQQjS8qrwfRXHiSkupGSNNm8vO33u9D5Se5rma+LvrF6Mv75xH+oOngMVpIA8qHMuXGUZYl
 6eh9Qdftm5flYjZpMcSezOoMKKdaiyq0RJbOaWAYxk/6+z3Dm6raWnBjvxuLk5I5M6RQb+Lfc6J
 S/7kgeQmLemfSXWO7lV4fyHrlJdwZputlNsqkLdtI0JqDV9clmmsDvl9Hx5KWNU1hQGY6POL1A9
 ajDvSFapi05XBz5eDqUEY6bKWgohwngw6rxXHEK6fqc00a5CNIIZ85jl7DxQX9iCNwz965/ntqe
 4v12iOOV9HQszsQgZvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNiBTYWx0ZWRfXxz1rYYfC3hrR
 zQdOdwIUpzGzQIjtrYaIUEM0d28JaYCBnHvoNPOpbdlClwI3vBaKDvnh+nmCSYYPNvjjvHM492Q
 0rNlB5itAtnHxhHD6j44ASCvafaZzjI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 09:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248919
Content-Type: text/plain; charset="utf-8"

From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

The "pause" assembly mnemonic is only available on IA-32 platforms,
breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
assembly with the preprocessor checks, making sure that other platforms
don't see the invalid assembly.

FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
Assembler messages:
{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'

Upstream-Status: Backport [https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc]

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---

v4: fix Upstream-Status

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

