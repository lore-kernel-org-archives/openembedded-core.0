Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA11C021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 18:11:09 +0000 (UTC)
Received: from sonic315-13.consmr.mail.bf2.yahoo.com (sonic315-13.consmr.mail.bf2.yahoo.com [74.6.134.123])
 by mx.groups.io with SMTP id smtpd.web11.15949.1740507061134100125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 10:11:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=A5JjuMYe;
 spf=neutral (domain: yahoo.com, ip: 74.6.134.123, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1740507060; bh=3a6V58Lh0J+pHzWbYXoChrsVYsLf/0poFiwr3D8wcV8=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=A5JjuMYeOwCBBasIIKKZ+cl+mFeSJvBvqDzJn5VF+74pdYXNg9EPcAavjlT2XVu2or38Ll/GR9+NFuqBHCq1INk0p4cFS8eVxwGezYj7m+hglK4Ukq+h9s87dnAJtIZuHwJSydy2WDb06a88BBTFzBwJRm98tmLwjxHEjFaw27+iMgA45BCwYQIr6DJjVc75Uu9zFHaAl85bPyyYe20mu2B6cnajoBc1gpst3ki2LbIJfROzk0TA14fiSMtCzbco8H42nMr7zz2CkHGbLkbfFf6pJSnpErNQ4IDyg2qeek2Qei1CVxlJWAudfu3gQ2OxqSPvgJgCvmoE534v7bB1uQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1740507060; bh=tuJWHdxKNEXu3o9/2Fcmgec93GHMiXxW1kfKa1gxBd3=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=cDLexfZ1Xn2P3pmBcYLnyLllNtSdW+rzgYnYoaoDDbzABdlq5mp8mI/YS6kPk0mpeZWGkiRc835qw3p2FvYpYJdrhaRoj8yNoflaDVtNSJqh5NDtCRc1fMvZ2VrQm0Hs43Rv8N6WpCAtK17xaVZQl8/sekCPFkjCmNTefOgUS9FB36xL//T32e4Y/RhuIHjgMthYa8WPhuLmfMIYs/kWM+mka/pjo1sSgjzRajUZCHSuUf+uQfweusEyd1C4Mg3659sr5ypbbrqEqDVlnHqVo8TbLTWUR+wi3cKQozyuPCmsN78HSY53pcdCn+7Ke/3nIyumygOw4kLLe9I7fesO7Q==
X-YMail-OSG: toSCOiIVM1nWWvQGht2gcIJA8DsdrxD6uow9bhB473qfWiuSW_EggZHAMp_WiWK
 dc3BbSMc_k9UyL4CMBqaOq8dOcqw3BfmxEdirkH1VjbLf97pV48x9klE5SnMfYM_K7enVykMIA98
 jzuGq2wPzHvqCntCp4SPyGeT6wZGaQtqX32n6k5bFEKXVQT.AbyNcOD.wkhU94uH7HVGKo7QMYGG
 HyM9N42AfLBLX3Nrzoi9ChzLsbF8U..X9YqxAvdrArPOO2jJjn2B26IES9sMv6e9iV2V7OWd4c7n
 4dwPRs8tDZzfNH6SgWiRPmgiNSe2wng4Cd4m4crndTblMa3uelN7jx6ZaS2c5LhEaqDFxzFPi.Mt
 uP9y4PSplXHAeYy8jp9Nq16SQzhAoQNdGZvKpvLXeZ5x1LRlUfOI4IxDs1AS1..30AOjBTeIJM9_
 pECqEi_r.qG4vFjiENc3eBy7zuWgrsaS8VKhFGvRVJXpCr5oVVd3e5Sj3GxtHEF3A.Zw5l5E3utw
 eByp8EPPKBpb4juKnSDltLCcCyNrtXjuG5j3iVLb5rt_phnRXHix9HZtxMbJhItqemn9nQ_f4MKT
 .YWA1GtnPQZMvmXt5weugRPzGmRaOxMwlgwfy2oGZ5HFPo2MVGpby5wuZFGQDOv2TjnQll8meKoT
 .QBmC8RTF84BswwjFctK6bjQkDGQ6gNjzgDl4xoYUCM7AGVAWS9x.mc17LJ1cIjdym7yV35FLxWn
 VC9NRlSEa7wWqq4oogIXN97pZIqL57GPBGmHSVUKjRJhf1JWfOxpmxuJnKEnwZwp2vmBcIt1D31o
 u2Mw8jIA2el_ytGl3lwffrJNOiv8bV4BYuye81.cYrWS2M878fnq7bXyk_FzE1N81K8AsPbv0K69
 FmM1UvXSaqXxt.OOo3C2eHM30UqZe9VbPMlg8ItgAgachsDNC60TfzFsfG7x4YBpYVfzGzrS07zk
 ePlNWjavcNTbwLVIPmwHs0QSUHIyG3fUSEdJudzqxI3LV5uJsAQHM.wOD7EKiz1J8vt2r8xULj3z
 hy9iXZSrWFPtzHnX1KJiWNFFzYDs2wxHpIXfzFK9zc6wApZQ8aZ_7e6z4UOe15aTwUOAZS.3LRia
 iv0ZI.o499lHGfZHYtseu4tGDDiiwQzOzQ_4V7BleB1.5TPSCQ2.kiZbVoFbmSmOlCE6TGxHn.rG
 xTsuP.CDPzmmxURg9oPkmDyiAlaGdUjvRGuorLoUCo4gevgtGKPTQSI6afARUY0zoRIIAWwOL7IV
 awBqy84VejONKv9OWFkkaHCH7eKKTC3bLWfMqnhvEVeF8BSBIhozRg_4AeYQaxNkpgSL.A5jdeR6
 P.9d3_4KFakaf4G9FSO3qt3zdPsVFzvbgoAf7uIWAn0b4gH.iKKmMly7Yu7JkGDGbRFp.dy79QVN
 eycDuNXuhIzlzUwE.HGS2.p80nnk46LZ0.1kEwU7.ua2OYiiqaMHRHqR_fceJ7EnlHqSAjXa_Bf3
 Vwjq3MJGpuBSFxKY.rvS7NIl.m09Vhu3LcTksfjA6fh5XeSRBwXp99fAI_gYkw7n1Kt3rj8u6nj2
 217ZhViNrljvUZwHU.A9eZjvh6a0Q1AUfKcwpCD_1nLIxnzT2n.6vywFdNeYeS6aHojPAKyOSMEr
 ldzbqjQFJzXrUnK3IVZKRid51Z96JgzlTtaGViEWmusQBFFIDpw96q3.UZvkSb4rtpTkmXew7qmB
 LccUWQ4oGvrSxfikq4LRIpd8jhCtGEZ.XLD_.XiMvGb0bOSij04Ga_yM4iAWfVk5FYM_ifinkTGv
 Bsn2gesecuIO09NyLqocxk6HK9pEgzSqZctNuc4kGrTflEiEXx94xibZpMRT6wvu0FL9pADT6Wli
 X1dy7ZndCMHHUFSokIPpv3dPY8GDYx_GWhR9e6hiXgi9q1a9KoSbIvUglEoD9AgAteegtpCXrrPV
 6DajuiUOPQCy1t1DK2YRe.cOzjzB46PMLFXED9P8gSEq2pXQibbQlMcRZ9VSN7f6fVYrJD2_BSBR
 1LgozWfybR9ycfU0m5oiJwRtZXh.suFTotr.caAWBouNewDfRvrAMBLUJgsycFD.WzwqeLjUZLcW
 q_kb0ukShI4u8tqd8Radl5J9GbJKJhNUBWfZAFeIP_gHjIgKOKp4GOkilVvLNG3qW5hy3skCW2z2
 GELCMyPJzX6fK8z2y_F3pbNmbu_UlEE959YRdp3PNrqnJYolaxveEw1C7Jp6s2EFBrAAJ9eFUqWt
 J5y5u4nxt1SN9Op2Ogu0d8uwaYvB1.Txu6yYYF.xnNeKF9JF.ZyEKuNvqdrw-
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 6c075ac0-702f-4c3b-85c9-a00375642e83
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.bf2.yahoo.com with HTTP; Tue, 25 Feb 2025 18:11:00 +0000
Received: by hermes--production-ir2-c694d79d9-5hgbf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 5eaa815f590ad633163bc07b8cffed45;
          Tue, 25 Feb 2025 18:10:56 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] sanity: check variable GO_IMPORT
Date: Tue, 25 Feb 2025 19:09:39 +0100
Message-Id: <20250225180939.21341-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250225180939.21341-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 18:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211920

Check if the variable GO_IMPORT is
assigned with a value. If not generate an error.
Fixes [YOCTO #15763]

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
 meta/classes-global/sanity.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 1bae998f74..01e48b4347 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -1010,6 +1010,10 @@ def check_sanity_everybuild(status, d):
         if '/dash' not in real_sh and '/bash' not in real_sh:
             status.addresult("Error, /bin/sh links to %s, must be dash or bash\n" % real_sh)
 
+    # Check if a value is assigned to GO_IMPORT variable
+    if not d.getVar('GO_IMPORT'):
+        status.addresult("GO_IMPORT variable is not assigned with a value")
+
 def check_sanity(sanity_data):
     class SanityStatus(object):
         def __init__(self):
-- 
2.34.1


