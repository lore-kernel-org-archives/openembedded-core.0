Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.301.1793650043124252178
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 12:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=H8sGscSz;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=EYT1KgRi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6Bci166068
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Nov 2026 20:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8k26iT6PSWQu/23i2VQVC6j87dbm372txJp
	au4E8bcQ=; b=H8sGscSzMgD5A/4AWArbidhQmrk7vog/SDJ3uWTb+2vrEo+ZpVq
	PmZL82Vu6ThKoqGN8jf0gZu+L82g4LeYFK5uUZMmIYCHDtsCHf/sfOY9MGf+JlWv
	zt15310ac4LD4xcgyL67eQspXPwIP6lR7BQrfJxBPZfm22j+xkLxlvtF7DVUwhDe
	1gIPi2IRLBc4g9KRY+PA3QIJnqbURaCNMIGCvQ7TWlB1Z4h1ZJhnBG1byXq9ha7C
	0tGqZeHk9c7+/RtoMD31Emf9ggtoBDcAd4J/vFfxwripV22DYd8FZAula5YA+jhM
	plp/VRci71WGljj9BmzKn7Rgnvv8d6zK76w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrjs0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 20:07:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so2842775a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 12:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793650040; x=1794254840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8k26iT6PSWQu/23i2VQVC6j87dbm372txJpau4E8bcQ=;
        b=EYT1KgRig76v6zI5Bjr/ww4+5To/gDwtEu0LW/tlpT7f55URQCLSkNMekAKNbA4SfE
         8uXrJGwVAwonUV3mcf0l1p49kmCYk5Yr0Ie0aehXRMJArrPjdm8oQntRp10uy5G5T/th
         NYWe8+eQUcwMIZubLM3G8G/uoRSEkNDIR9F+SZbU8dzY4Yfc3E8kRT2nqpupLEtOUhGV
         815KMwhLDzFBkNL5soVV2+gJg5O0DSp2v2wYxx/w1VuM/PKy5WD/tWMsWFF/1JenSPnr
         +Pa+h5G1V/K9oO23Zxdi1XGiUdXPSLF7TYmS5yjECltjwAmf6FDK7y3RCJ6iiA8VF6e7
         jwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650040; x=1794254840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8k26iT6PSWQu/23i2VQVC6j87dbm372txJpau4E8bcQ=;
        b=e+aDSjyCdXerKf44jckP9Bi0CTcCIT3cHQg21YEa2raLpo8bJpDV74BQywCANPwNoA
         StvFZqDOg1vmweB/DTiJVn7q18R8vj1WKWwFOsSSFHOAxnN9977Baug2GigZNPtRyQN+
         +Des/p/BY0OEO7WLHnQFf+cDzqHxJFs04+FQ8Iqq6hWsgurg7wkZvFXjc4oPszOrT1pE
         9MTFFcD6ZK2yxBD42Z8f9mydWUb+q+3kjgccV7Rk7seQBNn8NtSeJJUNHpRAoVLCgiaL
         Vcot1PUhmma8Z+BNubZkax/C9UP7pSj+9vbKDxYmSYdZrzQSCBiaJJtZ1qLAi5XoSZFj
         jGzQ==
X-Gm-Message-State: APuU4Z96/5wYVkerfGHhgD7RVZLZxrFJuB4hrbRkaqEiApIx+6j+oPcl
	cberANv6FDZP0Z0IJSMoViybqjWUGRKx0XIRzzmztoFg2LKYTbEowZ8IJbckAfMUiATw+rU8VVX
	CWNtP7rUir3Z4krKPScvRg/7qhBFxTA82DcEIfc+vKKZbxaEOhvjqGDUSGGiSRMH+DRivioLSZb
	SKT1gImoNHi9kbGLQ=
X-Gm-Gg: AYBFou1HyUK19G4F07HD7MyuGXNwuVlAMBaCS54aG7I2ZcdpWQgZANvLGwRvfndzDcY
	k2sF0UQT+of60RQG/3By+AvnITMFqMOTVCcEMLXcJ/M67bL5a0K15+RpaamEW7TTxbjK7Svze69
	C0HJ7jb+kHUhI4F59gzGoQXJkT2HE2xGKJIT2Dl5xGKQDC7ebFHCVAax6irG02OaXfjAziu+VE9
	Pc1nf8oGXtzrVcDtA1uOtLIAft1cNYn9gkykBfbK1iXb9ZVE6dYXia2x4sBhxHS6z6TUlRFuvOO
	2WmkUcr4KXw7/plzXlTUJnNM9oZqVCo1AYydtR23sP5iJpT4FWji2xm/FIY/Dn8XOJ9GqVz3CDe
	Ibk1S7bZSlzl+YQ5X8vwC/JPzMd5c0osSZaOLCaH/Beq61/Z+K233fEMum5K4sRC3EYu4q2f21H
	xZYJt4a3ld2eEpWlioTw5AevmKdSuz2OJgynllqOuddkuR/2wFd3J130+mULTlMV6hCgDt5jhzb
	Ju8p2qhu3ePNak=
X-Received: by 2002:a17:90a:ec8d:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3ae897ae130mr8284508a91.45.1793650039579;
        Mon, 02 Nov 2026 12:07:19 -0800 (PST)
X-Received: by 2002:a17:90a:ec8d:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3ae897ae130mr8284485a91.45.1793650038911;
        Mon, 02 Nov 2026 12:07:18 -0800 (PST)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5844acsm681797a91.4.2026.11.02.12.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:07:18 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] weston: build the RDP backend against FreeRDP 3
Date: Mon,  2 Nov 2026 20:07:10 +0000
Message-ID: <20261102200710.3953951-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8ed78 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=S7CKLp61JXdiZ-bsxcYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: FIXasl2UqrRWTWf8Ce_wjAIRMZbGytCM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4MCBTYWx0ZWRfXylVRu7N/F37b
 oouGdfhxIgRd1Z197eW/XE3ClRCkWJ30AmhGjDdPb2cLYZmTX5Ml1lJ/Dnh9if0CFyurYnbZfvu
 hPWvx2Fr+pwFI5AnMSnpW0JCV+bWjHg=
X-Proofpoint-ORIG-GUID: FIXasl2UqrRWTWf8Ce_wjAIRMZbGytCM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4MCBTYWx0ZWRfX+d0LFx9bUIxi
 UM6FnB2P1QCzgsUCSLZq6TxlrAa9v7O0goCmE5OqrB+l1Y6QBb2EEYrYbiaCPgNEbs0X3jUdMCl
 NG5BeViOHeU5oL8ZI10MzdPLim6IRDSaVEEnyCi1+BAtzl778UGGxihi4+6a2NG+zvYtRtX/Zra
 ZusztMgj6yfeYrc97gPvOPjPSgcZj7qDUfJe6xbFqtjsyLIf2A9KnD6iofIJBI2hKdq0iC73ZvT
 bRX/lK8kLyE9Q0vBuacJoG5Jbvd4jKhD0W9S2ACOZisKJaQCldZbEaETpg0uvVIL1nyd/JG5abI
 H9JunWPfmbcKxG30kOu3oLBt8LmIYIGWCZSqVSnh3qJguIesWVPa/kYehKl7KvTu717TwodTG38
 Gs/qODHJjcYc9w6A9wvX1bEdWLEFoAEfAreODQKaykI3FBA2knYLSnSSEzaUFTM0TRvPrdoWvSX
 hqTtXFfvzBep5DwddVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 20:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249223
Content-Type: text/plain; charset="utf-8"

FreeRDP 2.11.8 is the last 2.x release and upstream no longer maintains
that branch. Weston has supported FreeRDP 3 since 14.0 and prefers it
when both are available, and meta-oe already provides freerdp3, so
switch the rdp PACKAGECONFIG to it.

meta-oe builds freerdp3 with binary versioning, so the winpr-makecert
and winpr-hash tools referenced by weston-rdp(7) are installed as
winpr-makecert3 and winpr-hash3.

AI-Generated: Uses Claude Code (claude-opus-5-5)
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta/recipes-graphics/wayland/weston_16.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_16.0.0.bb b/meta/recipes-graphics/wayland/weston_16.0.0.bb
index 8e5d79aec3..870d7fca69 100644
--- a/meta/recipes-graphics/wayland/weston_16.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_16.0.0.bb
@@ -59,7 +59,7 @@ PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libx
 # Headless Weston
 PACKAGECONFIG[headless] = "-Dbackend-headless=true,-Dbackend-headless=false"
 # Weston on RDP
-PACKAGECONFIG[rdp] = "-Dbackend-rdp=true,-Dbackend-rdp=false,freerdp,freerdp"
+PACKAGECONFIG[rdp] = "-Dbackend-rdp=true,-Dbackend-rdp=false,freerdp3,freerdp3"
 # Weston with EGL support
 PACKAGECONFIG[egl] = "-Drenderer-gl=true,-Drenderer-gl=false,virtual/egl"
 # Weston with Vulkan support
-- 
2.43.0

