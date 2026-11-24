Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23165.1795540449785063090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=egwZ9Sav;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=gJWolJxX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL1i31872647
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qQadHb1//+v
	teUFI0ZjqgPSqT+5fBq/4PEdKDUDvQwY=; b=egwZ9SavyIxrH/FfCFI//aOVbzC
	seuYI8kkmq0GtOm5CAoHXr9vjtdgmLsM686L5vO1y2kl8/QTGYOokwphnmaCGZvu
	4Mt0BGCfV0r7GwEZDWQoGW5/JNxq7Y0ZLV85okPWXpGNmpm3jBSQK+xqGcbmeDeu
	WoaFg/81tGnLE8xk6KH/S0auGPIuIeuQtoxARBDf27XJfSzAgAaBH1N2fnmFsaKu
	RwLUxjocBsdY9xgrTRY4AdVDs/AR0XYNrv8tOHPrxWZboT494Nnh8/6t54IQs9+G
	7nxRT6dNhYPYBa3HH+ptt1dF3e8eo2z1gBwd0Zdi9gt7Vz/JtZLdbhJb7DA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxk8kbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:09 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b3ad09ad82so65037577b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795540448; x=1796145248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQadHb1//+vteUFI0ZjqgPSqT+5fBq/4PEdKDUDvQwY=;
        b=gJWolJxXQpCuuEyuBNPWcPB6q0AZ0wbgsJ7dvNBLdY30/E80+Ft8BENUxRa57cd3UK
         8R8izI3WNADCkd2QMCPI0bPdFh4ysFh6YvXB9qLMs/hCobSQxr7gZMcTocTmB+1ab1FI
         N5OCXzWN1OOYn0OAWVKab57KEh2eLMdQXRnHAYEx0OruJSlUN4FxAAPMX+KQDs1dRY9n
         5w4wVwA7+uWdIQq8oh+ppghwKkEuQZf+Rm1DlzBCEwImrJBemLYpGTCC8fWbyPgc/NW8
         5okNn8eZp0Cls9X7H/hxlN8RwKvaBxiRE8RojIkmP01QxL+jttOqraQTR5EjqvauxwJ3
         eEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540448; x=1796145248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQadHb1//+vteUFI0ZjqgPSqT+5fBq/4PEdKDUDvQwY=;
        b=zIQpF0YmMAoeBZ2S3VF/Wn1loF7bGVj0VWjj7Hx9TqOPQRBwU4jnRkTqSgScvUnU0H
         Kig5+eK95htYkbOspRHyJPTP9cgjjhmtb13HDuUQmdLbTaGcccVtUnx6s9SEJUxc+hfH
         Rd9XQzh0NwPinPsYeGkeQ3zRCYB4BzGklebaup/z7L/I/udyqVvkjSGBGPBh0rSuirwf
         qh9EA59ctDnoquJYHpCO9F7GvKuHPDEmZhdMFxGbNij2r6v7gpgjCETVFqOrJJOv3d3N
         1MqklSEk4v8+F1cm7kWbZbnsEA6mfeZ8GkTiG0I0nVlcDE8CZoXcP6LD3JtlPr1hR53A
         R/yQ==
X-Gm-Message-State: APuU4Z8sLkfzPwzwfVrBS4PN16CEjoF76vadfFErbwD/n26qI8XxKYBD
	48q/HXvzxzrrS9tICYK8yztzyqqBmEokNReondrKGtzsWhhOfKRcXm8fRuIahH5xPmY2/2Exvkn
	LMbYux+ZG1P6d1JUGHckPjCkWNlwh/Xpsg8yLihZwt765Ud5GG4jqYgYvpSVVDkK48FVg5YQFR5
	kPSJQaNKv5RR0mwlIPVX85
X-Gm-Gg: AZFdTZcmbrFa/ObcgLZ8f9dYm/JRvbOjrhOWS1DSOigRXSwz968UhRrjhffGii9t2eK
	Ht1YGbUeDqp6Dh5L7iI2zKLuffGCYkf1HG7rPl5Advil1MxEOrM8G/d1ySSGWdtVA3HOs5jklZp
	6igt3zP+LpAKNtZS8ZqVEIuXKZ50mj7KjKTtRC7Jk2VEVUeH/fTcG43UtwOMhBI11wNSbTKZRDV
	wEGecnf1JOWCVX3F3KdTkGD+4UC4XRC8zBSoTMr7aGn3Ly2PyJhCXOeBX2PcjnLRhm6eXHDVNSP
	qBtToFTv57pJqaFKf6aOVTn1YTvjwl+/QhrcDqmvLIWLVUYAQy9vM+83FqHmg/Oirsihfz53c8A
	Q/qtc8bdZ/FS4v63+p5QIZh8ZUbT6Ka3dS15sFzN8c/btywe4MiQ9PecQDduyP58=
X-Received: by 2002:a05:690c:e1ce:10b0:8b5:6873:52c5 with SMTP id 00721157ae682-8b5687359damr6204027b3.5.1795540448289;
        Tue, 24 Nov 2026 09:14:08 -0800 (PST)
X-Received: by 2002:a05:690c:e1ce:10b0:8b5:6873:52c5 with SMTP id 00721157ae682-8b5687359damr6203957b3.5.1795540447803;
        Tue, 24 Nov 2026 09:14:07 -0800 (PST)
Received: from toster.lan ([185.228.162.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b33a596f9csm9632479f8f.12.2026.11.24.09.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:14:06 -0800 (PST)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>,
        Luciano Dittgen <luciano.dittgen@ossystems.com.br>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [RFC wrynose][PATCH 4/5] yocto-check-layer: Skip initial signatures unless test_signatures runs
Date: Tue, 24 Nov 2026 17:13:50 +0000
Message-ID: <20261124171356.951415-5-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124171356.951415-1-jose.quaresma@oss.qualcomm.com>
References: <20261124171356.951415-1-jose.quaresma@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX5vkvdeqD+Lqw
 veCV/9PRmwabs4Sa2bExQ9lzXumYiEiHfDGGvZavhX/GIRFA7UY5XhVNooJ/lM9oiljt5dcdqf4
 ZA/ehocFbP6mAxiUBpJ7YXplA4SReRa1JUStpQE7YHw77Vq3XEE82eNogZZfi0K9iPEDkeKk1Hh
 F+XCGD6suAOBijEuwxrH8HKKPshM9/rXaSKYjLRUcgPu9n+d6R/exE8BXuBgTh5He2H7Rd9Tz6a
 TDAywJNzSYOYtEi8iRK7FLjaa7Dgbr/Txvf808DFbIrAJ9P+Pk0tCxBwdXUNpCEh9eT4BYWDIef
 P8VZELzQnJgr/km3WKImuxLOfIA61vp3XleF436FmtxZHk68SyuGJALdcaWr4RjVmvqqOX2BCpv
 6LTEdaHFe6WV9A1ZAnLINvkeuHPqXtgIlOWZ007SEoeD//dzLonlypAz0aQObG8xfRUpWkmNNxX
 +9MgX1/K01grXu2bzTQ==
X-Proofpoint-GUID: rsBzgfGPko047STjBbfMhiAihreoFqDU
X-Proofpoint-ORIG-GUID: rsBzgfGPko047STjBbfMhiAihreoFqDU
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b05c5e1 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=qOKIifoFPMYe9XV0Ag7/Dg==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=alK4_DS-AAAA:8
 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=2V6DY6BgAAAA:8 a=T52UmR4tAmSjifIU3wUA:9
 a=MFSWADHSvvjO3QEy5MdX:22 a=rOCknGvZllDBBwZ8Yz5I:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=ldqKKs2zR4t-S6fqr-1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX4IWPEVjc4S1R
 8FbE+jdQunMx8D3Qcp5ekBZGxb3pW6yHIyMlQTS7sByLHytfw/0fk5GnjFYjLkIw28fr3czJjvx
 HVoxhW2wjmluf3tE/eBcVPBiOEU93B8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251048
Content-Type: text/plain; charset="utf-8"

From: Otavio Salvador <otavio@ossystems.com.br>

Only test_signatures compares against the world signatures dumped before
the layer is added, so a run without it, such as "--run-tests bsp", spent
a world parse on a dump it never used. Dump them only when --run-tests
selects common tests, as it does by default.

Tested on meta-freescale with "--run-tests bsp": no initial dump, same
results.

Suggested-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 34c0e63b2d14ca1eeb30cf6cd087d5cb5327e19f)
Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 scripts/yocto-check-layer | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 4634672162..4017b3a251 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -221,7 +221,9 @@ def main():
         logger.info('Getting initial signatures ...')
         td['builddir'] = builddir
         try:
-            td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
+            # Only test_signatures, a common test, compares against them
+            if not args.run_tests or 'common' in [t.split('.')[0] for t in args.run_tests]:
+                td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
         except RuntimeError as e:
             logger.info(str(e))
             results[layer['name']] = None
-- 
2.56.1

