Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA91C021B2
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 09:40:32 +0000 (UTC)
Received: from sonic315-15.consmr.mail.bf2.yahoo.com (sonic315-15.consmr.mail.bf2.yahoo.com [74.6.134.125])
 by mx.groups.io with SMTP id smtpd.web11.43545.1740217226333510016
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Feb 2025 01:40:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=fLG3QKdA;
 spf=neutral (domain: yahoo.com, ip: 74.6.134.125, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1740217225; bh=UEZgbaKI8UokEB+leMq/ii4g25aKGPnI1HqmpzHfjB8=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=fLG3QKdAGOvAt6Omieawuo8O5/0r891A37QMGUk6IURUQFJgOP8ChGOxTGf+OXP3+bDcb9jtw+sdjrmjb2TP532943knBDwtugIUrkYx5qTNVRS/YQT8b7GQA5ULfmxGvSLR8msBFEaTWKlyrFaNXkB3h8fLwEEI9wu+xbrcf8osRQja3X9D/FAKx2Ww3mlfNHa3RseLf7fB8AwN9hxSNJcYPYhncZNyOMbvCr4EI7SwIWCE1fvlyQ4bQFMwXfDUcHEaUfklfA/CK22T7zpesJRD+p31aw9l1GDtAwwkoO05p0LMHKAF0eAnNhazDADBSQO6rYaLO2DCif2ioPEvNg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1740217225; bh=a+yJpic1bTY4q3lPzJnldZgLQbBxLIvyQEPvPPNa5kC=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=bbpPK2oqTGwRd7Vf07Vh1R+JjRslrPFBq9yAMGIeNss5htCn96WBlDI0C2wU1HuRzYS8VW/a11Yvz5gGu8TklwNJX3YhpkJzqzfnT0OO55C6wIS36JqRSn9c0BkW+9/o/SvR2Wx6JhneU585R/T/fgxdfe0FPyCYjMIZ55WrxytWXaJxVVmCMoe4hMVBdKPhEAfReJuJ5hUlA79W7UTJfeULV3NzWnFpnwMww/jwvrZjRjgQO2kty1eTqe94Jm6mWiDsyaI2XkwxRb3W+JOw1RDKFBMDHKiGLjS6X5aIJMFmomRt4RTHkztIQzqBHAv1V08aM0MpMV0E9iqCiXPKFg==
X-YMail-OSG: r2bDi4oVM1mPScRZMKZ9iNXcSz_EhsOiRIkjN1SnuMTqKechprrDhPo8qzRKs_D
 JN6I2wsgaOe636yCJkgbCVXAgtPcv25Owghc1wtO1q_gkYkbYQVJ6RZi7UAPVDKbGQ.gqPINZTmR
 mXSyjW7Pms1M9mj4mjlwFRFR4170Hhzzw4X9yXIEZoU4fwrlwghiXz0RKQAJNPj2ns3WQfGZnGGB
 ApGoPhjJVbDiV4wjlgI7vBcBnKOrUxGAkHjGeyFDFd6UocfQzM7ZKOE5s8CplMM49cW69SGuoxUQ
 SYz6_gLrR9FLBloUpm10BGmo0Nr_LMue6qiUla5QIkckmGxle7ZNVC9.Hva.dK1cK.vmzBXygsFS
 x4PVdlwDXnCfQvxDCGeeunoIwI5VhHvupl8JMsUByAQ2l9tpGLCZLApMguNeE4BTRwgV5UhGk.R.
 TSbehEst9VfxPy_BaXQzB8jvyCsTWdNYxGqwN4CUQ2GLQ41fpWMwfnt8yWFpW6B9Atmx.gtJeqkj
 .akT1qVd2K2AtsyygTQ0tDrLA7y1qucX9n3AelQSHgA6gyUzxyfWCXmcb8DEGPlMihUB_u_R8aOL
 e3OInONSYPFud.tk0GbwIJlO2VLSpfas7QUpjLMfHJtSXJsmIYj7W_74TfsjsgNi1U3vq6g0TZYO
 CiEsLTYJomY.XN5Ebd9WxWJGNd7MHujp3RoJDKs2exnHAMxbmy5x7TML7CPhxeSJCXhnNEAhuUpk
 xjrWfJtN1fIWF7D.fzpfTzCV0elvj4UwhJUQjr3gc.YedWtgBC0VEgrzIEJ2LGa6eQlK9Vtt.bz2
 9eehoFBSVohSoyOlPe.qPAYUnvc9h9UY8HunGk2MuAqucnDqNT3.cELzesgKev43ILBwJ7DfFRMm
 Aa1aEDJ_fSBwdkAlic6Jz7Uf1SR..DAD8FxUxTpXEFlNhd6Mk5oj07yG2SiA1Fbc4W_xX4AJIvko
 .rnhPRvI0U3CfqXdSJ3Cd7TKhioGooxrcadk3IieOH8D8ppLJUVRswnW5Mt6UFmPEjVTjobIghtF
 g2qidX2xCiaLBi6khkD9Fm60.J83XThmqJQ4RiP16tSlDzCH03png7FgYa3B0PTspHM2warP_zum
 iqtM4iGlbaFgN2IqijvDot36x4hRjj.xnmLvQc0gjQFdGQhSZBmeiaFZzz5x_yAbrVSgWeiMROc0
 7yynxpZ9.gC2saEm7faL1vigRjyHXHVEaTHXHuYiSEazMhth8JNR7tdA7tn0C4KDnRjqecAdyb4E
 E3WahKFuw_uyRIerZHmI5BXem9GbCSzDtVXKA3EWe1XMqMDtZZgtNf6Rw8Z1P04yK5J73bWmS4pS
 IvD4sEbAW_RtLy9oMjodZXFYhfRG9CMIjCydK1EpUc_Psv1lmPp7g648dRL6n3Hhaa9nZQewamSS
 8oDf.0hijx7nDgav2bg36euETfCRUQCpXtdHIH_y8hPHek5ob_SgJX.ln7LhdOWxBg1EkpZoV71E
 xoOqnvON35B_yc1AQ4cw.93b9pvKPPY_SzA5GG4BYLEvktya6Hi0PA8sQrLl3YXb6o4TSDIiUiE6
 bkxLb6e5Do8POd2JFYsrh5uYf7Cb8hzNS7ci8dauHwTrevcBor8SU2AVQHvrk5U2ZKzqNJDZTveL
 eNZNwlX1XOF8iFlLTCE8nc6iDTmMAjVpld.pvXqcJIREEteZZDcB.Qj37qbI6hyN2v5SGEeAyOEY
 h9b5FF0.dFc85RFKWydIRM_kX5ZEl7XBBX..NWosFmtZZ6J2.CkNkjteIb9lQrCiHBXBVdpQSoJC
 MQQumntXo89X6q.KquCyucCYefsI5NKxN0VynwdM0C1KYqs91GMORj2OqLuKxTeXbiJVr2GtEO54
 gSH69oCO0iC_mVwR27CSs_3mf2zdi8Br2cs.SnackWsFwBj02SXMczf_GRP7Ek6lhDqG1MMQu3aV
 .lLprdPR2oLIuqUukQo9RQvJWldaX7zbkAJ.MuDOaVE21R6.8b8kofbr6RGdX16GEy4vxa1xoRzw
 lbRda_KzLYNayhapINcL3TIyBuBScaBpzSUcjoYF9HY0BrOFc1TvFnBq_4GELxgtqUQ9UOMPRQTi
 tuEpJSHFskJZWuDiYn9gYRFcb.QkpmRMHeANn6Qsr01.JqTBjAfAQ4tQRV5gUSsMjjKOgB14b.4f
 QrFEXFGN5G2VAX41afA.Na8VwBB_n.H.khSXpZcvlp5drFdw..K45tFFhiRTliUPQgQtHrZWQEfX
 IcJBdfNbrzLHSyAxi8eMukHN2rBv.oThOfKPXR6FvA_aPkQymU81HbjE8qKc-
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 50106ccf-55d4-44ca-841f-bee5625927ac
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.bf2.yahoo.com with HTTP; Sat, 22 Feb 2025 09:40:25 +0000
Received: by hermes--production-ir2-c694d79d9-qm6ds (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4c3b68435d3bd91cdadbd130eef5b225;
          Sat, 22 Feb 2025 09:40:20 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>
Subject: [PATCH] skeletoninit: remove broken link
Date: Sat, 22 Feb 2025 10:39:18 +0100
Message-Id: <20250222093918.5204-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250222093918.5204-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Feb 2025 09:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211819

The link in the comment is broken.
It's removed together with some text.

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
 meta/lib/oeqa/runtime/cases/skeletoninit.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/skeletoninit.py b/meta/lib/oeqa/runtime/cases/skeletoninit.py
index d0fdcbded9..be7b39a9a3 100644
--- a/meta/lib/oeqa/runtime/cases/skeletoninit.py
+++ b/meta/lib/oeqa/runtime/cases/skeletoninit.py
@@ -4,8 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-# This test should cover https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=284
-# testcase. Image under test must have meta-skeleton layer in bblayers and
+# Image under test must have meta-skeleton layer in bblayers and
 # IMAGE_INSTALL:append = " service" in local.conf
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-- 
2.34.1


