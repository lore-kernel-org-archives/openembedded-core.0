Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13448.1793371742035009371
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 07:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ga6mYYNi;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=MwT8+hqw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: daiane.angolini@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UER6sK346857
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DD+4VhBdI84fN5ttW/nP1yozlI1r0QtHu+j
	Q98YwQVA=; b=ga6mYYNipG7vgKyc+KDmaQzkJK350tHONmWWzDptZm+VaEk9G7M
	Qq17haeualM1+yHDb3+CokanxymGm6SvYIL/9ukldWYOx8LT5wClVLMwqNA0Aaky
	LFuHQ+4kc94H/R5U02v126LXg1Knol753oMwshnnPLH4gVe5FtKoGLA5mYK+48DC
	fMX+Ni4PnqZVulGBXpw4YGv9WPV2k6ab25bjme2RgIY1XKadyW3aS2LjsbdUyWQy
	ZsSocEtlg0IEfkXJ/cnrQ1uSHivzMYuB4aOdPGWuHIpIKJrjo0voRMV4Zv/6pu7v
	h3JAqEvie0FPGo6PIn96Q8EboorL07qs9Gg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rknws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:49:01 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0d978e4faso12507347b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793371740; x=1793976540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DD+4VhBdI84fN5ttW/nP1yozlI1r0QtHu+jQ98YwQVA=;
        b=MwT8+hqw29CZW4e0+dBOYkzXN5jRPth4Or8SzghR0NdSsGthCkXm1JCUOlpFNDsnsu
         y8d0sRvNFH4jkvqVLJgDJMg+XXvn8auZAX48J3Qq9AUrxUHxSGk7KJV8T9aqTmiq+0xH
         2JnUOsma63wUpdB8NrUs75e2cDNcuXZt6YHtnjOu/I+OFI7ZwDgCGJQNKB8MIBEqBE+R
         QkQjskezd63PJVHSVzDTgSNX1TUqEsF/ZZFZ9CnbIRVSDMDWnsj5oKhi5KiCLkK6oTnu
         aMGo+Ie69fS2Mm0fG9rEiIwJ04U+yD1LNb+0uu8D4CH4n0AGuA/IZFSkfouSp9rqCuoB
         FvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371741; x=1793976541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DD+4VhBdI84fN5ttW/nP1yozlI1r0QtHu+jQ98YwQVA=;
        b=kbpsHh/W+VjrJA/0EEYM9/bFaxBFvk3TgI3R6zjMpyU/SlAJTn1wW4ohvcx7d4sYOI
         cJymXuFL3Loq77xRCGuEu1PX9M+5mjWQ9DH7j10fbIp2O/AzaBiKVyXcDbuNWcWsa7c0
         2OFaLqjQPcBlq0AfrHZ73bc4pobudLe/lCdgLkpBhHE6hpNj0VeDBQkKKFuFQRCquzm2
         jPr4gOZ72SVcUREmYZsQsTkXY5MIDqrVe71Rk7QQJBYG5/GTHvqZIDJW5SBTjUAD+J3O
         NeIk38MjVLzbU2rXaRr+WZglW9J6QP8wkZi7fCxQmXJcMeJE/Z4DPfkMsDY9AgLem7PQ
         fNmw==
X-Gm-Message-State: AFq9FYJ/GSg1iTDOiFfcjcxILAA2SFHCkdetDNz0VonmgjbH1MaohE8g
	079uLHRUoC222abZJdxB0tNZgNzC2U3jRlFPk8/ueyhm+b7uIZ5DTxT97nACvydNcaWX/73Sbrn
	pudjRH4YF3d8qH0HHetaWS4notMUpWgWHiPzdcz7M2F1WPizmjn8SXTjcvIbWEgqzqm3l5uIUi6
	u7vlEN0TF340ScjW0=
X-Gm-Gg: AYBFou21PoWlOCt0pjzmlC6zzUlZ1zbi4jT18bzvdEWqjfz5XbIevgzmxJ1ML73+rzL
	o3JXDN0eJIRfJtjY23NPI0s6gts5kQmo0rcEzwvatrLzGFMmB9ogDZpbIxKmTspRXb6Lh0PmR84
	pjCs/v6P7/swgSbRj1La0GaVNUiNDjlMiuz6XfttOk74BN6gf3C64wToAmLzq5yYFJJGleCWP7F
	Y7pB33Fzq0e5O3IiGy5orafX+XNkz9ame8jx7AtkwqAViMolCuTrYkbAQ2AX8eclwmKen/TdMDz
	Iai9D5OiF54ueBmaEoqzL8Qo1+uG7w+N7V+pFJkC2blJubmsvogfQuZN2IdoTkfp/dJBovZ34BU
	7T7JlfxOLxrq7UkWSAH933dks6kvIUpG9JHly5oWuHKfufXin7C8xKeyV6YMGqSgVn5Knnl6ytc
	mupmhE6mFgDd8nyJTkSIC/qwc=
X-Received: by 2002:a05:690e:1697:b0:679:8ef6:d7f4 with SMTP id 956f58d0204a3-67ba5045014mr1613151d50.59.1793371740576;
        Fri, 30 Oct 2026 07:49:00 -0700 (PDT)
X-Received: by 2002:a05:690e:1697:b0:679:8ef6:d7f4 with SMTP id 956f58d0204a3-67ba5045014mr1613141d50.59.1793371740013;
        Fri, 30 Oct 2026 07:49:00 -0700 (PDT)
Received: from duda.lan ([187.183.48.203])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf2b138bsm84988d50.9.2026.10.30.07.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:48:59 -0700 (PDT)
From: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
Subject: [PATCH] files/license-hashes.csv: add go-cmp and runtime-spec hashes
Date: Fri, 30 Oct 2026 11:48:41 -0300
Message-ID: <20261030144841.4015868-1-daiane.angolini@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cpvzxP1hdPAWxjvtpZk5QeUydXegkRPJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1OCBTYWx0ZWRfX1SgQSxjYO8az
 flLG3bFSRX+k/N0e6IMFq4CW2/qbTaBfkUOx20G10CDCVRxd2IAFt1+rAfIi6cx/F2vSIMDbnR3
 P0BMoL0SEKkWalDxoDiE0+RAP3LK64w=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae4ae5d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=XAuqcxNhqWdpT/c4fHa+Hw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=nDbBiVWsAcUxG_RB_-MA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1OCBTYWx0ZWRfX4qh+a3EjxT+z
 UCmxyYzgHe4Fi7OH/jaGzndPYSHGPPtbmLY2B0dK0RiOciw994CzD5oPERCsGf8WvODCt61zAyk
 zX+T130A2ZX8vrRglJgzlUDqfwET8bjOdJ6ofikKuFAfJBSAtmNDDwP2Z1bLPW5l+pQWudC1ezR
 EwgbCOgz4/T9354TWK74IGKcGQFIT5dF/VDDFolB+n8QfXpR6JTnUgb/ta9QEpMnr8zYc1gWXK9
 ZWXdgAhTbzDyuCjUa/5oSpoahWP4lw6orp7UPCV6WPHFNPPIKpkgJMANp2t3FYj96nCX6RX1XVi
 icfMvr7FI5DvZuthFPxQ5udtOmxsFVxByk2NZHr1DvCZKQsj2yJhMUs0G5nynEM0cczZLhq2/0p
 fFLdLUPQyFWFyDXos4e7r3TEnSKmWL+yTbFHGmk6k8mO/KtxDZCb5hauXz7LMFo/CkWJCjdg3Tr
 ZUDA6XivjRZL/iEwSDQ==
X-Proofpoint-GUID: cpvzxP1hdPAWxjvtpZk5QeUydXegkRPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249050
Content-Type: text/plain; charset="utf-8"

go-mod-update-modules reports these two module licenses as Unknown:

  github.com/google/go-cmp@v0.6.0/LICENSE
  github.com/opencontainers/runtime-spec@v1.1.0/LICENSE

As they don't match the text of common-licenses lets add their hashes.

Found while updating the Go modules of a composectl recipe.

Signed-off-by: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
---
 meta/files/license-hashes.csv | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/files/license-hashes.csv b/meta/files/license-hashes.csv
index 1895f4d377..78f6017767 100644
--- a/meta/files/license-hashes.csv
+++ b/meta/files/license-hashes.csv
@@ -26,6 +26,7 @@
 3c91c17266710e16afdbb2b6d15c761c,Apache-2.0
 3debde09238a8c8e1f6a847e1ec9055b,LGPL-2.1-only
 4325afd396febcb659c36b49533135d4,GPL-2.0-only
+4ac66f7dea41d8d116cb7fb28aeff2ab,BSD-3-Clause
 4c641f2d995c47f5cb08bdb4b5b6ea05,BSD-2-Clause
 4e2a8d8f9935d6a766a5879a77ddc24d,Apache-2.0
 4ee4feb2b545c2231749e5c54ace343e,BSD-3-Clause
@@ -67,6 +68,7 @@ ae6de3dee02712a1e55b280671be53bf,BSD-3-Clause
 b234ee4d69f5fce4486a80fdaf4a4263,GPL-2.0-only
 b27575459e02221ccef97ec0bfd457ae,Apache-2.0
 b278a92d2c1509760384428817710378,MPL-2.0
+b355a61a394a504dacde901c958f662c,Apache-2.0
 b376d29a53c9573006b9970709231431,MIT
 b5f72aef53d3b2b432702c30b0215666,BSD-3-Clause
 b66384e7137e41a9b1904ef4d39703b6,Apache-2.0
-- 
2.53.0

