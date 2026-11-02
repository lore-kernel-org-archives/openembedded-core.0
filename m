Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1349.1793652744775907701
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 12:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Hl3kbqST;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Vtx9Jalz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6Qk51301324
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Nov 2026 20:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5c3CfV5iYegbBW+aclYXsxfV4qlpINeBnqx
	b3nBvwXE=; b=Hl3kbqST/qolxtG94KZwJhpSqLZRqOKwqPdBWXazNc74Hj68OZo
	RofbClYujTKC4+XggekNj+PQfZekLRKusABg+8PxETve9eOyu+QTHTrDzjsaoTAw
	NtBfTsITn1Y0SYML03f5+6Z1aZhN3C6yFhlKpO2f75ABLdRJnzPmxydwEKouNAGR
	+BSfOO7KsTIL/xNDMBCG2yyAKgwVwmjPQxWRxJ4S7MbXtCYPYPmECuY4TB1/xfq6
	NIiUBSRoH9SmPeQVE5pUgzWyQoWVyCWkzx5ypqBXEDzg+3E5N5cI20tBejGWYfYj
	c4QXpXeY5tpHWOtYTKVPRU0w7r5qCCz0Z9A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6tdgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 20:52:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb061cc4dbso34632a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 12:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793652742; x=1794257542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5c3CfV5iYegbBW+aclYXsxfV4qlpINeBnqxb3nBvwXE=;
        b=Vtx9JalzvV2yYcjLt2+f+rMsSDmq9QgxEm2yA7lDS95FhsRmHRk6TkU5tv5iSFu4aY
         4tQPEYW7zQmcBZgwjBRbNe0yEWENtlkegWawntwocR/P0EPYxR6i/9kdSnRJzu5sOtk5
         6njlUpEmYqmW5zaoi/e9QQ0BP2JRpT83TnU4qsTkgyIV73UNrcpsRvxAfMVG/yEzut/J
         n6mPBwfZrrHZvIg430J4cdIfE9ck4vDjhevt/MKg9j0g81hur5dBHoEpexXk+GwPJvr5
         d//qSpA0SKptitcfgIg1jLCggTf65MjLNm0bcHxpKq3cAdwve9HeWgvQp6rm6uujVDO/
         3idQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652742; x=1794257542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5c3CfV5iYegbBW+aclYXsxfV4qlpINeBnqxb3nBvwXE=;
        b=YO8FzzuwZ1PbEUAGR2aTbOfICfYvQfXGnRtx5khFSEduMrkUPRvY9QbwHygfQYTq71
         vAG0/ebREH3ZYvyJ6oGk4HYOHtDhI+otcITt8DAtZ/smK5OgdjHKS9uIKnD4p0X66rmB
         VHNrujPyYdXOtgI6P2kZ1x9aWtJq/GHd6e0fJL3WWstfsNFJbzJjaEUB2HAV8ZZF9icZ
         FukY7shMgk3+p4G91fNZJVU8o0NmuNkG0eny9zepul8HMJ5PbeGZevxQuDPUl9t0RJTi
         dEUxtSpZjagP5K2xOLCqkwOrmlD/169+7nHUbjlDFd0GAABXqDsxXcfyZml7rUjL/yly
         rQYg==
X-Gm-Message-State: APuU4Z/emJdKFpZW8lhvFCD6IP6Yvw3MQGV4t6ss93jPVhivv2O8uPrI
	eHOgI/EibMLI9YevOAZQPSwdwC30di0Rsqk1sA2Eww9d2E6nZJWbyC0FpkRqLWuOqQv2QGHcoL7
	YpGnmcludR/SuF5H75Haui7W0MVyz/DHO/F72vM4CGs72i3jvXtewxAxQQwFGoDqZBm4JqxsydD
	A3mpCvDZO0IiYAJhISIw==
X-Gm-Gg: AYBFou3jAZa8H09JD9wC14fQ9dAjPVlU792HvBAjJO1PhkqfqznSQaarRwo2eBvse6L
	tFEW9z/xRwHL+UGd0K3//KeDDZvEqdxarkDU96q8l5k3mf0yRAuk6xiGMPegzSkGoheTO792xAc
	0MtSzWcF4BVOSIOxvrSTCxXIdexWwLUcLN3lIrSTSwq/cZsFdbXlIFb72pbn2ENweGB4q8jO/Bs
	40UlVGRaO/6BtYelyP0jGpkvHUxlxjLiC5+QXTY0ROZrRvmMCokQp5e69DfWItI7ANY/IfS1U3V
	xd+1i20a4VsxE0j+AuMGb9fT5V09dTBesYQZo+XL6Y7Ua0a7KbYc4cX83gVfyIsC52wmySZdvI2
	DW1Ly04notfjKYnw1UCFiN694om7KTQxPwfGhVoilAtgYckW06zfzxT8+Caq/hYptkC5scjRGou
	v7soAMR8IhZkYb0upZGo0+irukA62Zl103shKmiZ+oew8o5xXxcBQUkp6CzgK7D0wrH788QAqGv
	HFdQU5nn3Nd/Yc=
X-Received: by 2002:a17:90a:dfc7:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ae6f00cccemr9016861a91.37.1793652742231;
        Mon, 02 Nov 2026 12:52:22 -0800 (PST)
X-Received: by 2002:a17:90a:dfc7:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ae6f00cccemr9016848a91.37.1793652741669;
        Mon, 02 Nov 2026 12:52:21 -0800 (PST)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392486bbsm31345365ad.30.2026.11.02.12.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:52:21 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] weston-init: drop the stale screen-share section
Date: Mon,  2 Nov 2026 20:52:13 +0000
Message-ID: <20261102205213.652922-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4MyBTYWx0ZWRfXzlgbz/mPVWoc
 DK8vVSyNnTilOLrY6V1019hQxqlzOoI0SOe1zFY1Efi0EOShIp8mmkliV2jAU9yOdMMnP/3/Bz3
 kdZo8cPASs5sitkbahScGR9Ys+Jg/4z1kHwTF7s1tpFrhE5FDPnObJAEXfrqUaDXOuVEmDLICa/
 8wjcEdKZCm/Kt3oK74xfh1tZF1kx2ekgjik2Ep3cU8VBuG3buDNQh8pwSENrt5EzKlPde3VUDe6
 cLesZ+0EMY4Rs9Y0zDBPjrgN9bV12jtmPckIc6JsArv8l2z8Atlu2G7j6+uCDqQOshRhqoIm04V
 zBkS1GtrEeWLprBHCKOzjirXI6hjCt86tG86krj6MGHuByzWO+gCxdFiZUx15j62Hh44zl2K2vH
 fp2atdl7DgUwVw0Yq3T0eoK0bs4A376db0/zAz0lM8F+yQU9+zkYbOXQlBKsQfIcaqFx2mHZAjO
 iBQprSgY4PuaerSTG0w==
X-Proofpoint-GUID: D885Y6hxM_vA3uQsycGiWpGOeEM5cd1G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4MyBTYWx0ZWRfX4F82nmFySGAy
 ylcX9sQ5eHqdeMY6WJT1iZxrXdXyTLOWTM4Z5frt5p4kzSrZnK9r4VFz46+Twub0RDeI8X4A/h1
 pg4jjMAutlxlQiHdGf/jA35SUeGOz5s=
X-Proofpoint-ORIG-GUID: D885Y6hxM_vA3uQsycGiWpGOeEM5cd1G
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae8f807 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=KQ1s4FroH7B7mCAmJSEA:9 a=x9snwWr2DeNwDh03kgHS:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 20:52:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249224
Content-Type: text/plain; charset="utf-8"

Weston 16.0 removed both the screen-share module [1] and
fullscreen-shell [2], and the 16.0 upgrade dropped their
PACKAGECONFIGs, but weston.ini still carries a [screen-share] section
launching weston with fullscreen-shell.so. Nothing reads it any more,
so remove it.

[1] https://gitlab.freedesktop.org/wayland/weston/-/commit/3bd77f781766abaf8aa9fe55d4f9b98c03e29e42
[2] https://gitlab.freedesktop.org/wayland/weston/-/commit/29b740ffee98236c5ccb93c09d750b07d37fb8fd

AI-Generated: Uses Claude Code (claude-opus-5-5)
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta/recipes-graphics/wayland/weston-init/weston.ini | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
index 41360bdbbc..8201d76345 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.ini
+++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
@@ -70,8 +70,5 @@ require-outputs=none
 #min_accel_factor = 0.16
 #max_accel_factor = 1.0
 
-[screen-share]
-command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-resizeable
-
 #[xwayland]
 #path=/usr/bin/Xwayland
-- 
2.43.0

