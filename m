Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22997.1795540444854774833
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=k24NX1bC;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=I+pa4aRM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFKv3L2569582
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qtNS0tDbEQl
	FakWdzDdCfGFjw0ed4G5hkRNoarp8OdQ=; b=k24NX1bCZQ4QfzD4Y/sRZPRJayA
	ZJw39Yfg67kt79cPHmzKpALU1cs5CMaQgFNGXjVeJYv8QfzU/UelkzezBDcN1KYm
	7YCsJMI2/PsRoi9riMkRCNaNKqstI9bM7o0kbzy+5hli6f1o+EZ5EzYvbsjIzWNF
	Mq+0TP8i8wUWx6u3Wq9MXv5eT4c7azGcISiDTf6wfKINAeEKoyn7fg4/MZy57R0q
	rVIFfy2XTOQD3hMgGgR82stBWwIYnbkLiR86yce3O6NLkN5dD80BQYs6P8SMXHol
	GMFem+uKHpTBn8wFRMzI5rWYFFHhvdIq3R2lONn3aHE9S1d52+i37jPkLMQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6svk8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:04 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4fc2d32caso68974267b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795540443; x=1796145243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtNS0tDbEQlFakWdzDdCfGFjw0ed4G5hkRNoarp8OdQ=;
        b=I+pa4aRMQ9HUR1CQgGlVPmDahZAQZWfxJGEV9c3NT4lS486BnaIjMBhh9KW4DtkejY
         M8sqLphCf+qvwhgnqpNdVs0Y1KQ+7McA2ztbUGhCygX/HE/cTHnpTDaF5odHJyStVNl4
         gugIThiCU58fg7DAdULBMATOrxA0hW6gjxHCO35XSYGnOq9qiwUS6C1Z+4q3F3dwAAL2
         5t3aEPHAPE1PnnpFRLvR5QW11CUELZY8jfhmVzEcyvzCV15KPi8kMgGnPf8rMFDzUj1r
         MB3JTP+jX/BFRPgj/f/ou4C/okzAnStZBUgrkM8YLAdBhw2pYWUYH3sMkI+62nDtCH/+
         Py6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540443; x=1796145243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qtNS0tDbEQlFakWdzDdCfGFjw0ed4G5hkRNoarp8OdQ=;
        b=whJJcrDi4w9AJadVmhdTN//M01N3G0VHVjJ+J6gcnuIqRCA+Ar/YVXSf/i9yVKdxqt
         U9bDyRkKLeJPIXt11riQ+bCiGjiNHP9p7X1ea5b2hADrIlxJySW6g9gSNQIEd6voFGBo
         YKtL7EA5I7FB9+8hBvr9KY9x6yi2LUrddoClgE+SU0kr4Rf4/jCINSZ8HcNgW4EXyn36
         XKewBDx1yrkAMVTavZ0pBoid48zmE0J67LAvymh9aIAwxhX8SiAZHHhqdMZWPxSjD1nc
         uQHEv2N43Z4858v7gAgM59lfYIUXUK/2rSGD5JQsODjdFf9fQt5wo9Zje59ASdDcuzX4
         o+9g==
X-Gm-Message-State: APuU4Z+gks2KZPRv9iLhGz9fbRVyYvJJkTbfrZPfsOf4rYx2VTFSQY21
	9840sLgfbwrUzy4wgxI+ljPmSntpioZX8vlfQhvgNMd6i9sgtsrbW9+l/AKFOze7pc/2EVz4f3x
	7n6TW1W9Mp3DzvbZN/cqrLk3i+4hKPKGbAcrtKr4fmZFYbemW8ckwSJ1nQjke0AXcATRZifLwr8
	trcskaRjrz62FA1ai33+YT
X-Gm-Gg: AZFdTZcq0WL5oTDtPxGPdK5lGXGdjZVjYxhb/q21QLGauCIJ0V/ScNSs3HjHDofNRN+
	tI9MOHIKJ0P+PDZg+DTv62xZxcH+5yRIqFt2DONKzz/U67Pyx4ce+wzJgdy9CWSmGHIKkoaHSiA
	o/AT5j8qsZ8y0fiQEL3rXJQyQn5AtqdRflxwn5cRAbXp0M4tVjNciYsVj8w/1xBYkGorLDGo0jf
	Tjiy65KKhBA5No8x69WmAA9fDllRU/CnuvX6fnD/tp/0WrYR8kb95PRKOTWMV3Ptu6eTqoSUZSq
	Hz7SKjzkVUSTDBLi//bHu7ngLSSA7t0G7QM+97M3ZpnHTCQlsbNiBBKpR1koD2cZSR8cc2VZl5b
	0IX4meDQ4Hl9SgF9ZDHIMVocdR6tMww3rMRqjb5TUV1l1paol0Snl6IzBLRx8NDA=
X-Received: by 2002:a05:690c:79a:b0:8b4:c989:d936 with SMTP id 00721157ae682-8b5204c4342mr50637287b3.63.1795540443229;
        Tue, 24 Nov 2026 09:14:03 -0800 (PST)
X-Received: by 2002:a05:690c:79a:b0:8b4:c989:d936 with SMTP id 00721157ae682-8b5204c4342mr50637207b3.63.1795540442632;
        Tue, 24 Nov 2026 09:14:02 -0800 (PST)
Received: from toster.lan ([185.228.162.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b33a596f9csm9632479f8f.12.2026.11.24.09.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:14:01 -0800 (PST)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [RFC wrynose][PATCH 1/5] checklayer: Improve debug output
Date: Tue, 24 Nov 2026 17:13:47 +0000
Message-ID: <20261124171356.951415-2-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124171356.951415-1-jose.quaresma@oss.qualcomm.com>
References: <20261124171356.951415-1-jose.quaresma@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LkzNNd7XL8kI908BEY2SZRUehyr0TrAX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfXz10SPh+yhG3S
 s48eefKYDUhULeG7tJ1b2/5s8noHGNpoFghxACCDOKPdSyYNQjuCgQkj3+zCaLQZNvxEysimSpy
 g4XUvrv0+3HS+es+BAg5RiapoV1Gm18=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX1GHs6kQ2fwyQ
 ZzsWzq6tFOqxm5UsQ5hSemYJgHkOag2ERNIiepY/z4+7yzP0Ozk7R/xlK0u2qXeX0jHY+Ud14MX
 Ig2So0WeyvJ/zvDX4OM67D7diHC5HL6vdvSJ5VGp5LSoDEVZwGbGWDvEG/3IUsqd9eb3Owv0D+0
 Nsyr2xGop/jXreIruolC+NPy8D8TSO95C/DLFi5qPNfe3WiWTk62p6CmtVHACc6EemmVnCBQjkI
 nhQXOoJC6oQ3AAMGq6s3v+42tVUxM9FJrVrUYYumSNVuZUy6g/QZ6BAeAXt7HrsJDupVc+qO4cS
 qW5QbYcGqJx9MixPCN9uA22cdzRW43qDuVx4WVOvG6xCIUa7yLvQYhchhs27LSN1Wqp7vYJ+rF7
 L+AGhe4ZqNi8GxZ/E7DgSyXsTNEU5tgnHGTlC7vhAeMJUDRf8nbqbL2lcYaJztEUBZsefLq54qo
 vtM4nnHvydWuFLpTbwg==
X-Proofpoint-ORIG-GUID: LkzNNd7XL8kI908BEY2SZRUehyr0TrAX
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b05c5dc cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=qOKIifoFPMYe9XV0Ag7/Dg==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=ag1SF4gXAAAA:8
 a=EUspDBNiAAAA:8 a=EPGeQEHa4kSpGNn_6JcA:9 a=kLokIza1BN8a-hAJ3hfR:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251045
Content-Type: text/plain; charset="utf-8"

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When tasks don't match, the printdiff output alone can be misleading about
which tasks didn't match. Print the mismatches explicitly to aid debugging.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a2e37fab7c7f8aac4a5b1bcfb696a3fe263326bc)
Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 scripts/lib/checklayer/__init__.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 274dc7578f..aa19a8e2ae 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -422,6 +422,9 @@ def compare_signatures(old_sigs, curr_sigs):
     if not sig_diff:
         return None
 
+    for task in sig_diff:
+        print("%s changed %s -> %s" % (task, sig_diff[task][0], sig_diff[task][1]))
+
     # Beware, depgraph uses task=<pn>.<taskname> whereas get_signatures()
     # uses <pn>:<taskname>. Need to convert sometimes. The output follows
     # the convention from get_signatures() because that seems closer to
-- 
2.56.1

