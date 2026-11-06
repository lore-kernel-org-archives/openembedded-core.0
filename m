Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7493.1793976618052062584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ehym9llM;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Nev+UzFY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EQ6mJ3647683
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Nov 2026 14:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1rus0I1umTo
	W12SMAHZGGuydeX48PyAnlsE2vaZ6wMU=; b=ehym9llM9HPplC3M5sgbS5MFhGx
	KLLQ2LYNPwBEphp/+ymV6HfpZD8z4A/v3g22I9SPMD820ndybH2oVQZYHu1M8A6N
	2q8BOCi1imsMXotRHO8yoh4oC3PbvApAsrwwHkrlGRCnSIqa45mKq5pLprrBjzVX
	1bVoVMhdHm+2g7Ry/hn9UcvFjlq9jp3oD2ggTB6aMGZ6RxtWtz0L4noj04L7GLqz
	ktvpuYp7KgCMZ8H5mL39wsKUZiGaUnJtXYaGOrMTq3Hn7s1yWfrLquEmMIfR228y
	dsg9a5MMa2ffb20sQ/f0b2k6yNJajgn4UMm9hPgqwWIWHgyiC7ij58y31/A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9k68m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:50:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso1035282eec.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793976617; x=1794581417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rus0I1umToW12SMAHZGGuydeX48PyAnlsE2vaZ6wMU=;
        b=Nev+UzFYrW5TXZdipsYl8YL3tDX54eNm9WkIXzM4K5XgBjx+6JXt9Lpmsh2cd7d3Z6
         i7ViTEDt9Pzj4YJvlBa8qIe6Cvo2FYHmUOA8jjdo2ZWlVf0KUNRZwr+Xz+UZ1Wr5Ki50
         N0nnsExsPYa8agQJnwhMBxYcEvB+/raEkV2jmXd7jwbSFpQgCNcG+ZJFJZVw5bJyg9nn
         HzwwAEwGSCaaYLEC+AbFTEXaGGrCWujAmyKGRmteHdU6/hcDm9o2nJ5/c9EOgKhYyrt4
         DDOqhnU3QF8sjYF4j1J0lQh7zHuBr1XLy2W8FkLeUnUfUHFBmd8NRHDzNFSauMTgjX/3
         YCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976617; x=1794581417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1rus0I1umToW12SMAHZGGuydeX48PyAnlsE2vaZ6wMU=;
        b=V8Of9zZATj5GSHg5rlVj8ErdUSWk1Bm6Hy9/xNGJqisauHwG3qL6fCCnZOf+BA5YYf
         q1IreK2kw4cZKJVo+7zWdLz8OL3f/pzo1+LDzVS2eYYyQzCGwzsab4NjokDequTFdvnN
         Ey3j57l4RzqaMiYbEXTVJPRzXsv/FHu/W6O9y83WUAtTHFb0O1qJJ9eeKNPzR1nb8w0y
         FrwT9+Be6WpRGu9oPaTF1ZeB8h1Pee30kI3v4EJZociM6/OQhW1mmquNKf/8KxvwKshz
         EMB+dirKVk3rKIBT/K7Wy+p3zWP2mn4UidtNWLejiiwwQfqWIqT03MvXJkjWvW+p9o77
         BbkA==
X-Gm-Message-State: APuU4Z8Oab4QPmDIrlr1m7jOh6STJXA9wSfOXiWtqe3AiBZYEH3Hgr7J
	7fSun1vnYqSnfuK7AhVE2EWKdC2xys/04Btcyt3kFz++DuztOm+YKto8HuUMEB7qm4D7Vs/ZX3B
	FwIvto1X0g3guMiHCf/H2Ewy2Zad1dcVt9hhBSHSRR5jRatPHaNQseEXmCs59JrvxpRWcgFff0f
	f44fcGBi7/DEW+MIg=
X-Gm-Gg: AYBFou1d0LgdzjS2iTu4tLPKcrLQ+cJEi+U5c347dHgvMoBLUKDlwvZrPMqphxCn0TN
	7OKX6esjEcHmoZMnaTjrQ/No8GhfYivuEkQjxHB0GnqYkIgImPnf5cu+9h7HVsIMyv/5w9CvCsR
	CKWFgcP7iA+bu+I6MKnhzJLeI76jpVOn6ev2L4uPH4/mA4FT3x9D5LtwqPtGVz7+MQNWEV3eVjw
	ewaXKMXVjLuv53GX223TODYBnrKHXRScaiM/ch5tSiIm5iWa0aOcV5V3P8AxfvAfuoabtJHDxkG
	u7ojdk9W1FmEmgwmqiR4xZQGfDcwV4WYi6fGF1dyfFxV8Q1EJbz0ndUMmDXg0ZJaL47Pf2u+Ecd
	Kf1xMW+bGhUc0ZedLHBNRin0r3qUo2z1kAppoA4SwP9YAL+Of4vtaD4fL+YNz0mr88M1vZYxFLL
	eoZgNR7DAIsOpIUgUHR0chJieubHUq0GiKEFrcPunnI34=
X-Received: by 2002:a05:693c:68c3:b0:36a:32ac:ad89 with SMTP id 5a478bee46e88-36f722e7fd7mr3821422eec.2.1793976616197;
        Fri, 06 Nov 2026 06:50:16 -0800 (PST)
X-Received: by 2002:a05:693c:68c3:b0:36a:32ac:ad89 with SMTP id 5a478bee46e88-36f722e7fd7mr3821355eec.2.1793976615316;
        Fri, 06 Nov 2026 06:50:15 -0800 (PST)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9be7077sm7466502eec.17.2026.11.06.06.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:50:14 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][PATCH 1/4] uboot-sign: make the type of the tee image node configurable
Date: Fri,  6 Nov 2026 20:19:54 +0530
Message-Id: <20261106144957.3818987-2-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106144957.3818987-1-viswanath.kraleti@oss.qualcomm.com>
References: <20261106144957.3818987-1-viswanath.kraleti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8VEvojvb3bTdeJ3uxL5aD7UdEuGwjMqP
X-Proofpoint-GUID: 8VEvojvb3bTdeJ3uxL5aD7UdEuGwjMqP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX2e/PGrdW+05R
 YH7gw27f8T4vIsP7HD8neoPTdEe/o1flaBj//pK/cW2Ix9wT/rBO+hFg31FzIhq5CffRP20hedO
 P51/wjEQpZG7UC5Uai+5m+lx5WCdbJk=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aede929 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=zzEQe1jJQc36kTSQPKoA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX/r2ldzisqj9I
 PdZxZ8O2u/kSbKdQwF9rvkYXTIeOSRXnV8JmrOeOCT6zxjHKlqkrw3h1GiWyZ/DyKCFe0KStI2B
 peDxvkYeZOnPjglI9DfHRe3oYDKAb0OTxAcntXrfVCy8Z8WiWiFGRrSOfU2BuI75fP1hNfXVbsg
 bLU7mxQmDqDFJkuzrJyBg5UjQbQD/uynGz5eV8qQj7xw0uU2IoZzKhuI5hURKhYOb3/kNbKWir9
 PBvBSMIxfdjrv9VFmkMD2+Wf18HQVUBp/8p7jlFSYZORKQJWuKTw3GaFHZwblJLo9MRgkpZ3wDC
 bZM0JLV3J7W1adupIkrLe+aFddRTG/kTbLKcgh8irxPc697PsK2t16Q5gBetHOfAkvOorb/JpHV
 uXRqBX0LtqVC2NelMMsmAtQ99BFR9Ix1+JTENSWcZtIGVuiwI7JHBf7RPEtnbItyERwrBZLS60V
 jfDBcKH+R+IP1XVvV6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249692
Content-Type: text/plain; charset="utf-8"

The tee image node is always typed "tee", but some SPLs, such as the
Qualcomm one, expect OP-TEE in a "firmware" typed node.

Add UBOOT_FIT_TEE_TYPE, defaulting to "tee", to set the node type.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta/classes-recipe/uboot-sign.bbclass   | 5 ++++-
 meta/lib/oeqa/selftest/cases/fitimage.py | 9 +++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 409f6376b1..82ecba108b 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -112,6 +112,9 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?= "bl31.bin"
 # management of that surrounding environment.
 UBOOT_FIT_TEE ?= "0"
 UBOOT_FIT_TEE_IMAGE ?= "tee-raw.bin"
+# FIT image type of the tee node, e.g. "firmware" for an SPL that loads
+# OP-TEE as a plain firmware image
+UBOOT_FIT_TEE_TYPE ?= "tee"
 
 # User specific settings
 UBOOT_FIT_USER_SETTINGS ?= ""
@@ -388,7 +391,7 @@ uboot_fitimage_tee() {
         tee {
             description = "Trusted Execution Environment";
             data = /incbin/("${UBOOT_FIT_TEE_IMAGE}");
-            type = "tee";
+            type = "${UBOOT_FIT_TEE_TYPE}";
             arch = "${UBOOT_ARCH}";
             os = "tee";
             load = <${UBOOT_FIT_TEE_LOADADDRESS}>;
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 1fad53b16c..15b3de04d8 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1713,6 +1713,7 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_FIT_TEE_ENTRYPOINT',
             'UBOOT_FIT_TEE_IMAGE',
             'UBOOT_FIT_TEE_LOADADDRESS',
+            'UBOOT_FIT_TEE_TYPE',
             'UBOOT_FIT_TEE',
             'UBOOT_FIT_UBOOT_ENTRYPOINT',
             'UBOOT_FIT_UBOOT_LOADADDRESS',
@@ -1815,7 +1816,7 @@ class UBootFitImageTests(FitImageTestCase):
             its_field_check += [
                 'description = "Trusted Execution Environment";',
                 'data = /incbin/("%s");' % bb_vars['UBOOT_FIT_TEE_IMAGE'],
-                'type = "tee";',
+                'type = "%s";' % bb_vars['UBOOT_FIT_TEE_TYPE'],
                 'arch = "%s";' % bb_vars['UBOOT_ARCH'],
                 'os = "tee";',
                 'load = <%s>;' % bb_vars['UBOOT_FIT_TEE_LOADADDRESS'],
@@ -1882,8 +1883,12 @@ class UBootFitImageTests(FitImageTestCase):
         }
         if bb_vars['UBOOT_FIT_TEE'] == "1":
             loadables.append("tee")
+            tee_types = {
+                "tee": "Trusted Execution Environment Image",
+                "firmware": "Firmware",
+            }
             req_sections['tee'] = {
-                "Type": "Trusted Execution Environment Image",
+                "Type": tee_types[bb_vars['UBOOT_FIT_TEE_TYPE']],
                 # "Load Address": bb_vars['UBOOT_FIT_TEE_LOADADDRESS'], not printed by mkimage?
                 # "Entry Point": bb_vars['UBOOT_FIT_TEE_ENTRYPOINT'], not printed by mkimage?
             }
