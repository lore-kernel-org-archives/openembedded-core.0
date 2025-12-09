Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B81FD1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:22:42 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7513.1765286555175149913
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:22:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=M/KaIRsv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8Lb6DA1329711
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Dec 2025 13:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=c7WXA6xd4MpnotjSpEOFxrPiemxNTaiWnlogegJXiew=; b=
	M/KaIRsvWnpVnjlVdFPqN0Cw77UHxy3l1HbLJTVODxZlf3cVijsrjHos8MO4wsi8
	IXPiqJ/wOdLFcRPz7xd904+3d6vnvOr55RM5WpGdAVIVAu9aGplfgdotyJZgJXZC
	7Pz5qfHd4p11i4C2Tfihqr3/i19jQ7iP8CiT750NGRIftkQRozQDq3WoEVJKyCg1
	P2x6M+r8Tur+nfaIPmjqZpk9NLw+Rl96AmE/jrQzs7hAC+Fr7+AcG+ig/jkPyqx9
	YleXEnNqc62fX9zzPuSf3NR8Chalwl93dA7utvJscdQp6aZ1q+yhCPyeIc8+glB9
	BeMw1OXsYn2+LlV03dhmzA==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6rdtaa7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 13:22:33 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:22:32 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:22:32 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 3/3] keymaps: Add HOMEPAGE variable
Date: Tue, 9 Dec 2025 14:22:08 +0100
Message-ID: <20251209132208.402718-4-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251209132208.402718-1-pascal.weisser.ext@karlstorz.com>
References: <20251209132208.402718-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=OamVzxTY c=1 sm=1 tr=0 ts=69382299 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=n9SCklZpAAAA:8
 a=n2TV8mzrvax3t4HcRGIA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-GUID: vNABcOcMLBoiPLlsw6sVAcckrs-7gqrN
X-Proofpoint-ORIG-GUID: vNABcOcMLBoiPLlsw6sVAcckrs-7gqrN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5NyBTYWx0ZWRfX97Gd5tYOfDqi
 KgWpZAI0Fayk3YHKZKN7lsacjPIiOI9Xn3e5I1Q814NhSPf3o6lzr3QaHgbX2lURZDPoaO3si2J
 DdTjtZ5AzFxzW4z32PdNFpG9hlF7h3XGBKeDGQKXjKo4iWaJVblTYrsbhfwgi6SKmqJ7dnsCYkH
 MS/9pwoSF1NzQhkcV1XCmEs+c+zrdlR+vnQIGLxrnK0fG2d1BPNKyjYL8Q0XUsBHP5z8tWqiq2L
 3XS5kxaaER3brvJTIQ3j/xZrx8nFped4ZpQ1xcV3REMfCaF1Wkc6nKmAfWrvQ1IHyOriFabuWFV
 JySoyQX9ZsR1Q+sWe07RU4rQbajm7GX2V4KnSrCw7yy4fWk+Us1bssYmbagzhXu6COXyG1xDLaw
 9U3pfiE2zXc29buhr7nGCJvd0Niwjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 13:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227439

Add HOMEPAGE variable to keymaps recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta/recipes-bsp/keymaps/keymaps_1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index ab2d68d6a1..b7e6ef6cb1 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Keyboard maps"
 DESCRIPTION = "Keymaps and initscript to set the keymap on bootup."
+HOMEPAGE = "https://www.yoctoproject.org/"
 SECTION = "base"
 
 RDEPENDS:${PN} = "kbd"
-- 
2.50.1


