Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13755.1795251589333830967
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 00:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Dcm6QODV;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jemEJJLt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL8AsY4063787
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 08:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=y8oB6UMrzEj/P3IgA6KlKHMAx/XTDoCU8Yz
	JITHgpFA=; b=Dcm6QODVxPp3zw6PQlLZcGeUTH1MPIKlPa44UGW5qZzFzHYQKLa
	JjdofkLDbLtt94WCH8r0KOQiK9XqXEXkcB13Oj4tvRgLsv9FMuNGUkUbJr7pruEu
	oPMUWDGZhgVp73o3eQrQxl+jOy8hWYecq9KUfGty8SomtD0D1Zk65yG0rPdTj8Xz
	PbL0qju4tglnZ7j51h+gN/H939P4A7OlC+HuHD6GfiKC9/KhdgJ+rIWmYFiM6UX4
	b94TJuGhxp8uIxGAdlqQHD3fl2GPa4L4Em6OnmcRhxXFSOHO+OwCxT4FqsMDGwma
	sb4SnuOuWP5MjPwdIqFXzpe/uFSdG6LTRMQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu0k4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 08:59:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3854627c1c8so2599058eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 00:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795251587; x=1795856387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y8oB6UMrzEj/P3IgA6KlKHMAx/XTDoCU8YzJITHgpFA=;
        b=jemEJJLtatF/0sZZZClJz4+dFtTkhnjHDM/n+EtMFEAZcRSMQ9qdTHlPR5b8t7A1LR
         cNyX3zpIDvM1F0vgj2HsiRrHSdLGi4tMDxorb12d59c7mDELeoSnoBquESrw11jGoKeZ
         FkiDihpL6YeoiqyWaEpRI7Blk2KGQTfiHFLhNGPWTEEhlNabzLtucaDny8o2PKTL5I3l
         f4k3s+yG6yI1CiE+VAATvQgSJK8AFz1j3RdbHvep09escLdsHrSabRg8T1s2KJEoxX/6
         9BEyFJkThpt3LpfsbrrPowPw1H32euulUcY9DjnjvFSDT5vr/Nf5n1IzAM6J0yaHANRt
         4xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795251587; x=1795856387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8oB6UMrzEj/P3IgA6KlKHMAx/XTDoCU8YzJITHgpFA=;
        b=O9RXbK8yMSLLV7968r0kWd/SsFX2nVQI3KSy9aQTdrn4US9Z9zab9K2zDNmvBUdyvN
         7WuN6iFbtYhDZey5WKnF+dvGVbhWh+plXL0485nRylbLIzi76FJ+GdzEdWu5PZ9kZXe3
         l4L1e/NWvd3F9fC4v2BMvawLYbQOaI1hwa8paMrTHEmEO3NL6xI300UB5N2odBxQl6zd
         H98pAXQej2q1SeVk9v+P33adcPxq5XjZ/+USUFMfkiP7yCH91alT1hOODPCZaqDu1jxa
         xXkf1+afV7qgA/ATVFU5JfhLcIjGseFs838vAorCi18w1IXqzwQaI56Jj6Ogs+OJl9RB
         yZeg==
X-Gm-Message-State: APuU4Z/TjaPjPQkoVPq7QpwKyvm7jf1jGSO+HTJJDjxX/L0skfirxU+Q
	1KUemkHeFVgXKNy/HzmbJxlk30cUUTBv1SbnrdxPQy7A1d9xwhbU6SXj3VPxVHuXl69mK/5q0tS
	1Ka/r9IL3aS+1p0qwyKjDnU65qAaghhbQwUtlTft6aoU9HXahz8V6UhHCtTD2MqmG/yNchwhXGe
	6NftYU4veuGxv+BEI=
X-Gm-Gg: AZFdTZc1Tu2EbHufaGIUu6xP+kVMSdQKjORJSwPXYcP9NOKddACceyNgvrS2H9tgO7h
	gklPjo1QFQdAF8PMA1aM5egtg0napUKfZ0B2u19ma4UAB1ay001W6lhRgYpp6UJjffq1Whb1WRR
	6E7NYHXT07rtIvHQRYa2/iU1TtAvJEzIqKbgFYRCOdh2NO7fmaLLmHXh/Uv9jCspZ06F+tciyn7
	hGej5HmL5U+ErdSpVC6VFVQoIzT1hrGqxmq8y9OLBj7u4O74nJbu/leYmROnitZUB0T6G8gtvM0
	JDqmfqGRHQ55duRcRhDn5TfTuNenFfDPu9ypP2oxpt13+lKpwC3nnolxgNS3hKjvMhCB7Tvp755
	+xuJosySiwtVzvYbyHz8DEeISpz8lheVgAh0c9txwdd8Dexbs0BVOrYMvZBSVblo43AjJNE9xsL
	e1HrSQ22/7fUmRwvvlR3TUpWN07aR9FRwhorOUyvf0pRQ=
X-Received: by 2002:a05:7300:1909:b0:383:f646:9feb with SMTP id 5a478bee46e88-3856c4b8304mr8578109eec.2.1795251586805;
        Sat, 21 Nov 2026 00:59:46 -0800 (PST)
X-Received: by 2002:a05:7300:1909:b0:383:f646:9feb with SMTP id 5a478bee46e88-3856c4b8304mr8578081eec.2.1795251586038;
        Sat, 21 Nov 2026 00:59:46 -0800 (PST)
Received: from hyd-e160-a52-10.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm17887231eec.26.2026.11.21.00.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:59:45 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
        Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][PATCH v2 0/4] uboot-sign: support an SPL FIT with firmware loadables and extra configurations
Date: Sat, 21 Nov 2026 14:29:33 +0530
Message-ID: <20261121085937.411140-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6IhHdaBAjKfulBBHtJfmXeTTbjLvNxQC
X-Proofpoint-ORIG-GUID: 6IhHdaBAjKfulBBHtJfmXeTTbjLvNxQC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAzNSBTYWx0ZWRfXyuwPSibDGCdX
 XotnbxuG8YuM4MAM60KRi+lHqC9ZZgKv9UFmjRZU5TkuZLzZIFu0iQPPBx61dS4bFR+iDSR5F1M
 YUf3RR1BMN4ciEVJePBb5KVG5GMNgJQv3UyRKpNGxl89tC6gNJanOIGvGacrpFfPNw4FbnQAC+h
 owX0Zm3UmnmIEP0HXUII2qGdAU9JhC1GdU7AQKu9OfOsP15G+JnucTtfR9OhqfkAc5mMicx5Taj
 Sedw11UYL6X+t/hKlvyyStRUDsevCkk2iT2nSE1ztniBiZ637EkZOBNIhNwhPmdXb5bVFkX69Nv
 ejylVpf1BEpOt3CLxIo5fzsRDeg4MgLnxPE4q5cNhX+8EHnKylJk+Z+yaHar+lxUNTtCZ/HleO4
 bp6lvYu8B6PVt8xeSgCAn1+aMOVaE7kriL+VcRVimomXpVH+fF0RcZ3Hnd/AKxnd6Ex4uMO/r7r
 CoHxvqt5izsJNTGkXmA==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b015d83 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=m5KGUUsMeP5xxakH:21 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Q4-j1AaZAAAA:8 a=sqVg5m5T8SLKeALI-HwA:9 a=PxkB5W3o20Ba91AHUih5:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAzNSBTYWx0ZWRfX6Ib0Kgwgaxn/
 b90avuzIgF2jI/HF9kKLH+kNrRLbattqACsEv1gEktiq/nrILFYBfvAJRogpCHZhobprEIENTRc
 xAMyMraPrL0jPwlbTTLUi8jTaLasmQo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 08:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250842
Content-Type: text/plain; charset="utf-8"

The Qualcomm Shikra open boot flow replaces XBL with the U-Boot SPL,
which loads its images from a single FIT. Besides BL31, OP-TEE and
U-Boot, that FIT carries the PMIC, DDR, QcLib and RPM firmware, and has a
second configuration, "pre-ddr", holding the images the SPL loads ahead
of DDR init. The SPL picks the configuration by its description, and
reads the image data stored after the FIT structure.

uboot-sign can't build that FIT today, short of writing the extra image
and configuration nodes as ITS text in UBOOT_FIT_USER_SETTINGS, along
with copies of the hash and signature nodes the class would give them.
This series adds what is needed so the layer can describe them with
variables instead:

  1. UBOOT_FIT_MKIMAGE_EXTRA_OPTS, to pass options such as -E to
     mkimage when the fitImage is created and signed
  2. write the image hash and signature nodes in one place, so every
     image node is signed alike
  3. UBOOT_FIT_LOADABLES and UBOOT_FIT_LOADABLE_* varflags, for
     additional images, and UBOOT_FIT_CONF_LOADABLES to load them from
     the default configuration
  4. UBOOT_FIT_CONFIGURATIONS and UBOOT_FIT_CONFIGURATION_* varflags,
     for additional configurations, each checked with fit_check_sign -c

All defaults leave the generated ITS unchanged. Each patch extends the
U-Boot FIT selftests, and oe-selftest -r fitimage.UBootFitImageTests
passes on master with the series applied.

Changes in v2:
- Rework the series after the v1 review: the extra images and
  configurations are now variables and varflags handled by the class,
  so no ITS text has to carry its own hash and signature nodes
- Rename SPL_MKIMAGE_ARGS to UBOOT_FIT_MKIMAGE_EXTRA_OPTS, separate from
  the kernel FIT_MKIMAGE_EXTRA_OPTS
- Add a patch writing the image hash and signature nodes in one place
- Add UBOOT_FIT_LOADABLES, UBOOT_FIT_LOADABLE_* and
  UBOOT_FIT_CONF_LOADABLES
- Replace UBOOT_FIT_USER_CONFIGURATIONS and UBOOT_FIT_CONF_NAME with
  UBOOT_FIT_CONFIGURATIONS and UBOOT_FIT_CONFIGURATION_*
- Drop UBOOT_FIT_TEE_TYPE and UBOOT_FIT_FDT
- Add selftests for the new variables, signed and unsigned
- v1: https://lists.openembedded.org/g/openembedded-core/message/249691

Viswanath Kraleti (4):
  uboot-sign: add UBOOT_FIT_MKIMAGE_EXTRA_OPTS
  uboot-sign: write the image hash and signature nodes in one place
  uboot-sign: add UBOOT_FIT_LOADABLES
  uboot-sign: add UBOOT_FIT_CONFIGURATIONS

 meta/classes-recipe/uboot-sign.bbclass   | 313 ++++++++++++++------
 meta/lib/oeqa/selftest/cases/fitimage.py | 352 ++++++++++++++++++++++-
 2 files changed, 579 insertions(+), 86 deletions(-)

