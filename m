Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17799.1795793272309716807
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XODoYwxL;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=FYrDp9PQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: daiane.angolini@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1FnA2683810
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 15:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7y7vIVV/ZkN2OloLL/z+c2+nVSWAycZ76/e
	WnT/V2ZU=; b=XODoYwxLNqT/jzYrVtVVudnqAc/fvfLXWwFWneDkZsAJ0s8oexF
	mjeSJFB4IB4SA0z/pq0uCw5saNswouLO5Bh9XFdH+GQRvX61zV3Us/la/xjqAwgc
	VHbVNAaUdnjffIUGhskfisj0BpejK4mzO2GrBJXHfAnXYeo/tsbN3PqlZ9HehklZ
	34PvqI6GExW1zI6/OYxdRTi8+vwxvAGeClgXZC7IWzJY6npaGNrEuRn57Qg4e/Wb
	2rg5wcqEeX0cM68FQtgpVJ/8spwOoEvz5qOhpnatMkdRXxyFpVja04SczC840naA
	vqsIumL4EWxnNe0rNWGD8vxoVZiDsZqE6aQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhj81n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 15:27:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f074b87307so51216875ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 07:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795793271; x=1796398071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7y7vIVV/ZkN2OloLL/z+c2+nVSWAycZ76/eWnT/V2ZU=;
        b=FYrDp9PQle206bjrt2j7ioSk7UXVT+JzEriqBVG1KiGjOAUxaWfCc0pwTWwwMmf4Nk
         IQwybuIuCmmOfRzrXvrHkVma4Ef4lgg8ZrzRI1aZIgYgqB1daN7YIIKMUKgvMUiGPXFh
         oFvUdyiQPozpbg5U3NyHC7ztvKRlG89s/VlJGy1iI3u594m/RkhIbKd/RKi92TMctaaN
         5ouZRjhf2e0rNR5w5R07tdHdkLlqe4vwQwfCdMMPzLoTLl/biEMK2JWnwT0K7I5qnUOH
         CKzuDm/hx8eB7anI8MPJtmLEXhnb0GxDXvva2ajJxzNco+SzXtUQBa4y8mVjd8EPRBBV
         LEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793271; x=1796398071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7y7vIVV/ZkN2OloLL/z+c2+nVSWAycZ76/eWnT/V2ZU=;
        b=V/dN0zF/LyfryNWTOzASer5a3R0hHfXD/dgKd/Coa85w+NXtfmWFMPI5WwTI2IR0lX
         FTwrJSKPqKKcdHuooA8puyVmTvG+MEJG7xqYG5m5mI9zKs0cPulvnDexka9ev497LmnR
         2mVRW3FOenq4RWooh+SjeKUJ8aS/OEC7BOuo9gHyp2gIoqDJnuOEyWmK55P9uCWhjRIo
         fzyMPAPlzF3oR6UCxyXjOAML05LEqtvBMUU68V2XiW/al93WJ6syRoqVkGPlmQM7qE39
         ppwkiA+HANQWfI+XXlT/BlUHaA6tusKxs8moKcGR8lzAvXeJ8BGa7JuY5BFz+izxhvg/
         hKGA==
X-Gm-Message-State: APuU4Z83iZhdsr8vG4h40nTuWxl19ePElpfLKmFdo7O1A1wzcarYwJ2t
	e+Re3R+go8l5YVcfHqRKoic5znlbUp0C9uPooXVu0+EmXvshCnensH/hKM/vOvKX0g3fEYAY0s7
	7Uhi+O+IKibfPWW8MhroLd2xaK9fSypnobuixlQ8s/XTdDZwh8cGhOTRayH8gpHf9hKncUgaya7
	YJefd4ndd7BMR7PgjVlg==
X-Gm-Gg: AZFdTZcJlfTuVSjLlJtQfSSgMrEL69hl3Uh7mbS01upOUP0IgU7NZNBc3WxvgVFNGRr
	VkH3ud1gnUd5DDM/OYX/v/uy3h2Q00oy3mvTVahnuY4Dnkh3h3xepZ73aE/J4RZ2p82bQEcKVgO
	Pdj5BUD8/pk1oop5dplEdV3ero0usakk8GezlqNUx3Tbr6+VSdpW4UMZZmsd7+fe6cHYpsePeSW
	94CPKKd0+Lh20UMAxNjoycG8wBMAqWTBz8GE0PPhoAEmrwn2+bo7SXp2xIl1xrgY3FLrnZ1EAjf
	yhUatp2bcJegYoOxhLrxb295fJQ6X2qciSVU1X8U1FlehvSKoUGJB4pJbKTRKVsl7LGVrLRiyi9
	IwIGzJwmvK7Q5xxq9eF3eYA0tZByqUQp5yW6zO/Ij0yb5mx4GfSbBprApmTBBQk2LEBGU/iwRQ9
	P5MKGvFU6WocYMQpqgpMCq5DA=
X-Received: by 2002:a17:903:32ce:b0:2ef:d0b0:c386 with SMTP id d9443c01a7336-2f03f170cb6mr274649815ad.32.1795793270702;
        Fri, 27 Nov 2026 07:27:50 -0800 (PST)
X-Received: by 2002:a17:903:32ce:b0:2ef:d0b0:c386 with SMTP id d9443c01a7336-2f03f170cb6mr274649425ad.32.1795793270189;
        Fri, 27 Nov 2026 07:27:50 -0800 (PST)
Received: from duda.lan ([187.183.48.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm123607145ad.51.2026.11.27.07.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:27:49 -0800 (PST)
From: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
Subject: [PATCH] meta/conf/fragments/yocto/rm-work.conf: add fragment
Date: Fri, 27 Nov 2026 12:27:12 -0300
Message-ID: <20261127152712.3705004-1-daiane.angolini@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MSBTYWx0ZWRfX6Ao2xKybEQ66
 C7pMtRwmNXUlJOZ5P14hl6mQiWeTK7ESqYBzUbat1hGe7Rn6ZmCuV1F/isvmWhxtOBKbPt46eCb
 k5DLKQ714iSEOOFIciVo8T9nu4Uf7Qc=
X-Proofpoint-ORIG-GUID: DSvnKxTXVKOs0JErFfJpBsKlTVJIwASQ
X-Proofpoint-GUID: DSvnKxTXVKOs0JErFfJpBsKlTVJIwASQ
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09a177 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=XAuqcxNhqWdpT/c4fHa+Hw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=eOFwdvGiUY5CkF_VzuwA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MSBTYWx0ZWRfX+EBtHC2JLGRs
 2MMfdfDEAp7geFfnSgrzZpZf3WlFeHK4tp815J8+fiKUAVUg27U0OM17w8cSKFUwoHFKALCBLQR
 gnnGeWIgW62Blgqjvi+xCkhd96Lbbm0E5hXMJmsnYmd5+UYV68wSPb2iRcVa0PQrWZeAJjmLlyw
 lfg04JVMB5MA5dxLo4xot2DciGrV1hvs44zWuAVGBr2UEazzdhV/a0w6ZJOV06aC8z8LwZv5BNa
 X6akux+O51q0ObhMzgDfBkdnEo0MgS8Ke2Ba3442CekNgzd7ZuGssRrCKSYkCo+3jBH6Y8gVFdB
 coWqDi5jEHXjpcOHbLK/5DHFY7vGPBL92JLfKUC/tvKpWOOz+NEtB4TbRmSjUjObNcwof//P47X
 4J+Rjg6hnK9Rpl+ZmXJYLquISBL9gJ13yMucLfC0sMWPNjwszgDN3qldV1jtne7PcTCFN4afKFt
 1P1+cOwIFdRCrpRskXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 15:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251400
Content-Type: text/plain; charset="utf-8"

Add a fragment to enable rm_work with bitbake-config-build instead of
adding it to INHERIT in the conf/local.conf.

Tested by enabling and disabling the fragment.

AI-Generated: Uses Claude Code
Signed-off-by: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
---
 meta/conf/fragments/yocto/rm-work.conf | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta/conf/fragments/yocto/rm-work.conf

diff --git a/meta/conf/fragments/yocto/rm-work.conf b/meta/conf/fragments/yocto/rm-work.conf
new file mode 100644
index 0000000000..068223f643
--- /dev/null
+++ b/meta/conf/fragments/yocto/rm-work.conf
@@ -0,0 +1,6 @@
+BB_CONF_FRAGMENT_SUMMARY = "Remove recipe work directories after the build to save disk space"
+BB_CONF_FRAGMENT_DESCRIPTION = "Remove the work directory of each recipe once its tasks \
+complete, keeping only the logs in temp, to reduce disk usage. Use RM_WORK_EXCLUDE to keep \
+the work directory of recipes you need to inspect or debug."
+
+INHERIT += "rm_work"
-- 
2.53.0

