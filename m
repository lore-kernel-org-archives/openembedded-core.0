Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.621.1793298373585219341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 11:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Yhc0TeF4;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bgxH+h4W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: daiane.angolini@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGD3SA1143410
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 18:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DD+4VhBdI84fN5ttW/nP1yozlI1r0QtHu+j
	Q98YwQVA=; b=Yhc0TeF4/3KRN3qV4yFvPEpH1Fml+8SPYPx76hJEvs7v9C+bDJg
	mh90j+mdW6Rbn3G6NtUi95I0RO1oWzWcONRKrWlEmtaX4dhieFzbvhhVK7G1VLtN
	G1ikCcACzW1iUrj5VlQrPSfd5egYC8F/aV3WRCU9GkCJA1/L6BG/HfnfEU2U6r0y
	oom1DCO5LCCzY8hFhoB5wPTMZE4S1VpexGMV1q0ylVYf5Smws/fB6+/fK/wMA39C
	DoTufD+lYs0k4U4OAAzSwmjiUux9H7UYjBQRrkri4OwPlsAgyWdDI/QvucUgwJks
	yWUTFuN7u4lhMypYH66J0r83fRyi0eizUig==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm76cjbn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 18:26:12 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c15deb3794so532490137.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 11:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298371; x=1793903171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DD+4VhBdI84fN5ttW/nP1yozlI1r0QtHu+jQ98YwQVA=;
        b=bgxH+h4WaLE1kecVRISe+17x/ixGyIdaMbTIEfGfkokbfe7QbSpS1elGPoOHg48wf5
         h42jbfWF6Kf9MG0V863IgI24YSvRkXp3g8gHPOhdOsh00rXr7imq8sLVlwSL+EaMilft
         hERa1fbsnQDtKovhP9jaAlpGsmke6lVViTTum+8bO4E2Av+8IiYeHHVbNvJcGeQTXIOf
         8KtS5+xBkEecYbuIfWlGgp6Yi4mTvwxm7pZaE587noM2Y+PogvTwvzavV/uEmHjJ7ezT
         MpciGDJbdO5gIRzvgCGwzHOLhaOvWCy4qfIb0FfKEe+wzhJ5dIala72i0ONVkD4gHWgb
         2eJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298371; x=1793903171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DD+4VhBdI84fN5ttW/nP1yozlI1r0QtHu+jQ98YwQVA=;
        b=S1U4fBZ50EGhj/Uq3R2NkRbZdhf+xf/r6VO3c9WBQVBhKmZxXogtzEZRrQJx631Us1
         6QWAZi9zNHErzW+DTthmFriPfvoErNbNoKvYmqRdY7FyIIdNITdlgtHrikuOPzCa3ElZ
         uydG8YK5d0FIpojOVz8aqvoL6hILDh0tqRhxtRBc8mgXYrtmiS7mAO+HLz+cJQMhQjgI
         m4MfYDHudJY5dkiCgc86x4ADe0G/dW0TtRkW9EUv2Y1mO05zd29SJteE/FmNCy2TbLFl
         Mb4tecUcbwJ2F/w88BHN2GtIwuzUFlJ8PXUaW3gPpw+fNxKyPcBy1svKeIc04nffmKKj
         A4Ig==
X-Gm-Message-State: AFq9FYIC81xX3r4d4rEeeEIMSskyDVvRPa8Y8BXbYQcDlDNEuCPKbBpF
	ixx6FXk9xy2EKBJbQYXGBvRK2bWBoQ0nOCkzn5XQPr7NvLF8li83IOPvMHKCgQrRhaPrGzYesK2
	dz3fj+p02vDC8ndW+kq1bNXY8O08ZuW7XkpzoykOo6v1EKIO4uVTpstsYaifqL/xIFLskoNEIyt
	R5WrQGi2+x4V74BQc=
X-Gm-Gg: AYBFou12FYVxLarYft969jCszcUjcW1fOQQIuhqgMRYlk7D9TYhT4io9t5+rJGdOEza
	z6mUk2kPSHYLxFuwWPA9g2xUrLMU4V3KDvclkINLSMUJdHg6uNpkucm79H+6W6nC2lITNzhcxXC
	CVQNlLnfjbkGwBh1rk2F4EGM+v8fKAOZrisdHTyGX6OVU3d1b8HQvmH+N355Sckdtk+vHGJUYy4
	vg1tsnOEgw4Kemywr0vI/OERPrvVylXxWcVeVBscAHC0ZKTBo/8F1afcLvXXNDtIAOOpKsFEBnq
	sDpoZ4/DQ75wHMIhP0+ex4qrlj8sUATNBHNRMfKW2YWVcLgDDYViXNZbU2NMyYVoirzNs0GL64B
	VBzMHYzk/qn3LknntEGQI3KpUIacCXoOIy562Edv84OuTp4zd1CiJDogJlKwefgk=
X-Received: by 2002:a05:6102:6058:b0:7cc:95ed:30c9 with SMTP id ada2fe7eead31-7d0726402e2mr67734137.29.1793298371365;
        Thu, 29 Oct 2026 11:26:11 -0700 (PDT)
X-Received: by 2002:a05:6102:6058:b0:7cc:95ed:30c9 with SMTP id ada2fe7eead31-7d0726402e2mr67727137.29.1793298370822;
        Thu, 29 Oct 2026 11:26:10 -0700 (PDT)
Received: from duda.lan ([187.183.48.203])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d0736464e8sm25183137.8.2026.10.29.11.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:26:10 -0700 (PDT)
From: "Daiane Angolini" <daiane.angolini@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
Subject: [PATCH] files/license-hashes.csv: add go-cmp and runtime-spec hashes
Date: Thu, 29 Oct 2026 15:26:01 -0300
Message-ID: <20261029182601.3965594-1-daiane.angolini@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Proofpoint-GUID: AtSEKfwuahgWdkLBiVWf2w2kgw7Qayhl
X-Proofpoint-ORIG-GUID: AtSEKfwuahgWdkLBiVWf2w2kgw7Qayhl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX8e/jzqI3gOub
 9MyuGc7MztaiQvZt4TQphj0x5AYCPp1XxFt519HsDqhlBBdxyDjsjHULRKMsCO3onRsbGj519j7
 UCiuspnUFjNI/ytIY2VS9cc3boN4rIw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX/5FVGN1rlkEH
 6DfFnnjkr/g30Ac60Mj1j5al9se3LtbNEYfoi/49fB6ZZpvReKP1OM26Xpu08AoT2zEjFUpPdRp
 nfyvgv1je5EvnD1WRn85k1lZa4fePnQlVOqvHViDRTXw1zTgfK8i9m7PgPItR2eDN2wCJeIGA7g
 Pg8H4hsKx77NyRZ3Wp77AvTfi7b2I09ZynGqrurHCUhPY9Q6ImLMfzAAUYhCzVGrzol94Fj5/ND
 4Iml7PNvP3Vk/XX5dgpy+Tv2xZRiab6e6958V6elp8YQtEeqwms6lUbSwKPW/si+RL2GdFQyTNi
 IKUV2twOzFWdiWqBcr7XPu4SZ9/K+4d3c/fdcegZVzNtme0Fhlv0F6e0P4IwLXPPQ2v+fbG7tof
 W9V8ycQ8TMXWeccyakecAOS/zPigVA==
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ae38fc4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=XAuqcxNhqWdpT/c4fHa+Hw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=nDbBiVWsAcUxG_RB_-MA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290072
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 06:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248990
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

