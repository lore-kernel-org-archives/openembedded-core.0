Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FE5D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:22:32 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7541.1765286542278485379
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=mqtVWzMJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8LcfMP368633
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Dec 2025 13:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=jjztQ
	nujhT53D6RTcFtzK3foLRtdq3iU04Dg3MyamWI=; b=mqtVWzMJhHUiYsNiLf+bc
	Mwvht5WolaOFXZbWJsvvGglnIX5SbbqRiMjTdctYEelUFFhGod4XWmpW42nzdCvk
	q7+hTf3/fkC3B+rrsOmTiuHQZMpgJND/sfqP/g5bqRNhMewvqD6i7KReGkLw+m99
	8eswsHf54hBfRe0v6jEJ/PeGH+YmD1ROBQp5tVLyUx5UEET6afJGYENpS18LA9YX
	LRkLUCiIW73xs0HkcWvu4QzH6YTZBLV4c4ew5b2DAa9CT+1UoYXgrN3msKJsc2hq
	qNprIyUrLKz9nT8zReHgkWJfe0rqTwdvoHG3yDt59pqwBYN5+a0en6pMYuCI7lAe
	Q==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6s4a9jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 13:22:20 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:22:19 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:22:19 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 0/3] Add HOMEPAGE variable to several recipes.
Date: Tue, 9 Dec 2025 14:22:05 +0100
Message-ID: <20251209132208.402718-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5NyBTYWx0ZWRfXzvAV5okRcP/I
 MlSAHeMCI1s+0QnbORQr+aWxskqNriZ96OfRs4rwxbVh3lkAHlKeTh9c/yLvvj3uH6ld3XHIzaH
 AUvkIWUqPuC0FU4DJGhkrbyIESq8n1s3S1C/f1+r/T7i+o+94uNKl7UyjQDGVgtfzDFq/xJQCql
 FfbOQLIOyLs+q+ENYdY8Riz7JWAwvEMsFrPOaHUMzxv1xdublqNl1G0g57plzUmSFEFfkbLEP7O
 c8liM6Z+sz3NOM+9g16u0Onccgc42uZ2lHBVBwu+O80ImAtj+eDVFxaFKfpYRwDjqvkMtrTCNe2
 h4HCrgdAobsLeqprnEncLJp8Q1L5kbzoCgnnlREFNj/i4/mKhOLDVSawONq27AtinE1Bv1/OpMk
 WLMg6HTuOkZ6ti3pdAzv0bR7c55TyQ==
X-Proofpoint-ORIG-GUID: Zt6nYsHAq6TG4FgNQcFpDV5s0oHdSMRR
X-Proofpoint-GUID: Zt6nYsHAq6TG4FgNQcFpDV5s0oHdSMRR
X-Authority-Analysis: v=2.4 cv=N/ck1m9B c=1 sm=1 tr=0 ts=6938228c cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Oev-GeVAxmXuYPzUVhIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 13:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227436


Weisser, Pascal (3):
  ssh-pregen-hostkeys: Add HOMEPAGE variable
  weston-init: Add HOMEPAGE variable
  keymaps: Add HOMEPAGE variable

 meta/recipes-bsp/keymaps/keymaps_1.0.bb                          | 1 +
 .../ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb               | 1 +
 meta/recipes-graphics/wayland/weston-init.bb                     | 1 +
 3 files changed, 3 insertions(+)

-- 
2.50.1


