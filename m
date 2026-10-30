Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10131.1793362917268163486
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 05:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XpMH9Nil;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fAoqxIZo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: daiane.angolini@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG3dX4116535
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 12:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DD+4VhBdI84fN5ttW/nP1yozlI1r0QtHu+j
	Q98YwQVA=; b=XpMH9NilKDVTxNhl1SKpimd/Wuq/1c3TIu0oPHfdDvImkgcg8KK
	xpAPPEPXy0FzFo2SO2OKpbeqSlu0N8Mui85f1o999mxMy+ZYPh5BvYUJFg+7HxE7
	X+qIqehFDAj9YDF1Wl5KwcA+uBZIreGCTlosq6AbGQEmW9qSRJKyAkqKwNNFE+jD
	e9vD8qTjOkWT0MfxLJBAHepWEvriouz6qzi0J6KeHXwhiV2o1guvgfMLIhLPgh6B
	HfiGk4Z/LYf8YJSJ9OBCivm0oI10DJQOVQzi+eHT1XW1B8ES2AXKhsp35vOtBF8l
	lk16a15aiYeHpt763RbYGO59/1QziIfuVzQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rk2pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 12:21:56 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eabedcf97fso161021e0c.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 05:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793362915; x=1793967715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DD+4VhBdI84fN5ttW/nP1yozlI1r0QtHu+jQ98YwQVA=;
        b=fAoqxIZo1gEIDccnkK3Fe9LovGxv2RxNst+vbdHDJrCsUnYJnhCzUiRvxKRQIWYsLX
         Y9WC0sJSym1x3XwzbBf5IgTguE0i7PO/H8W2huLmyxvTjC7oUBPGECNUj/2t9+fIZsG9
         JY14eBduVaBTX/V3/XInYc3H1Ox1wAxIuGzHXIxayu3lZhTXvRNr6r6RAJ1XnSM6Sizj
         jlqUt44zwv5+/YDKDJgqFneOa26UW3fo6TTz39BkA47cHbfm1/hESDgzwM/rc3mOfjrn
         UaO/tGb1UxNH2OCGhBcucx2HBNNiDKd+57tIQoSkxyP2taZZrqTUQ+ocCCMMkiP6yg9B
         muKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362915; x=1793967715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DD+4VhBdI84fN5ttW/nP1yozlI1r0QtHu+jQ98YwQVA=;
        b=j+qMcONc9kkQxBvIdBvsUwNZY5UON4oC0AuHko7+TwbYw8BAWfHRW+p/n+1rNCO0vs
         7/gepvO+UYIfPxaZEKc0dt9+2NfrE2AzdXzChJW7qlAlXJA7oXjJFYXAqKHyCglGRtAR
         vFMlNs9Gq0xon6K3PE6XBjdqckx8bfQ6WHuMRZy61pHrPIg0wbdpkTLOsVGiiQh5WK3A
         1NvyhBUfXCkDDusCq8NAttIOUBQZrNPzWRlcgSxdpvvkZ8queoEFws3qpR3hHN3OUX6T
         B1RqOqrodlSNJGZ1oCM/JdomQau5JbxGjp4rhSwIE7uotWPJAWnuCJHzMkwRZBxv32td
         iEJQ==
X-Gm-Message-State: AFq9FYKHGA/UsUw7eE/V5MehdMN1Adx9f2enIXN4jLmVYBeDFYm8bEmt
	yLUoeRUon13ebtjvn5Lst5Rqn8pp9OPj4tXxJ4w3/biDZDHwyByYMkFQMV3W7ytnD7sTbN1SX0i
	1mvaUUw7XWdWF4D1LT/dilbH1Jf4GktufoON6jBfEqX8osZe3La6lMwkNomVl/eN0O4NSr4K09L
	ihJc0YGJxo7FzQm54=
X-Gm-Gg: AYBFou0tNXJ97mJIxAQGbIzKVMYuZHBWZQcqmevcbRnU7CN7cqcGGlmFYWmRKYORG7q
	8i0OMGvotscLMNU0Dve7oFdAog4jw63V+gAY031B5xq4DBpLkoiiuwcTPSOM+gqejXVKqy0jcgH
	LehsoQ+gpS5f5/HfQUy5vUtGiDUHm8UOj8lUhM8GGU7LOgPRegMkKKYyFVJl6wPIs2aVw4iV3vh
	QTKaD9/6vT73gsNd5XHiqxUY5iDeQCozgUdp01URECuF6Tu4fbJ/kF9cDFyvs0vtMPgfeieDbUu
	F7COaUd7fzRH4mBIppi+UX+Bx6AuBBtVzXRtd4Dp3Gjh+6AR3vvzEjcnMEfRCK9Jl753IX9a34Z
	sTU2esCrzTUCg/IBG0wVNUEatuXtwwrg79Hu1vevV51r+2EXk/y/G4NIexcZ0UrM=
X-Received: by 2002:a05:6122:3d0b:b0:5ea:d1c4:7cbe with SMTP id 71dfb90a1353d-5ec6899a08emr1161942e0c.23.1793362915141;
        Fri, 30 Oct 2026 05:21:55 -0700 (PDT)
X-Received: by 2002:a05:6122:3d0b:b0:5ea:d1c4:7cbe with SMTP id 71dfb90a1353d-5ec6899a08emr1161926e0c.23.1793362914562;
        Fri, 30 Oct 2026 05:21:54 -0700 (PDT)
Received: from duda.lan ([187.183.48.203])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69caeccdsm2069959e0c.16.2026.10.30.05.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:21:54 -0700 (PDT)
From: "Daiane Angolini" <daiane.angolini@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
Subject: [PATCH] files/license-hashes.csv: add go-cmp and runtime-spec hashes
Date: Fri, 30 Oct 2026 09:21:09 -0300
Message-ID: <20261030122110.4005530-1-daiane.angolini@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: mgFZ_Ku1yEUpxgYdsnMhLaRyHVZJsaBa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0OSBTYWx0ZWRfX9EWQV8aJ/135
 +gU94Q9+Roup8uIXwjv3DMJsFJKeDUnZ4P3CCsdA15+JFf1eiYk8SAsMwhP2AY0CgZq7gjwurzG
 9isFf6UXzxopWJ2UlvD50ldj8DuSfhA=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae48be4 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=XAuqcxNhqWdpT/c4fHa+Hw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=nDbBiVWsAcUxG_RB_-MA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0OSBTYWx0ZWRfXxaMTZUQTYNnv
 g4mSS0rBVIyEKThsh2RB7/P59rmA+kv6HkG1fCmVLEViUQkEXuBKuM0C6pUn2b4eJ61hgpwZOGe
 pDSTHtseTSqIPSVIhoVzbGItqtFX7RvaabL6fnHuJxdCRo3rzZpl+JraacbBA+lUQoOaGOqTDed
 S+HmxAVhX2N+tkEeuF4MUBVQivpV3YLj4jRmKZEWPtF0KuaNwXKHhzKEl02jD8KMATZYVhS72mK
 dFVX6j+Xy0zAs1Pm9ozT/yUSBQNzm85Cxc9maRNC3OPSC37CT+ooQW1MApMZ+8JXxdm408HFOvt
 E3JL7DaUYeSAuU+4WT5EN1J7XA97aGuc557r3e+FmPpXWjNRNMNQirOPKeUpIReWNiwQkamq96W
 zAPpcvZ3++QixMdOzpJFJtyqPkPWI37VqDM8QmGMG4Rw4xW32Len+Kr/OenV6EzTgjZiA5Is2V3
 bhTyG3jnebfiOzWySAQ==
X-Proofpoint-GUID: mgFZ_Ku1yEUpxgYdsnMhLaRyHVZJsaBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300049
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249047
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

