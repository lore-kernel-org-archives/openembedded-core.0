Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911C4C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 09:58:40 +0000 (UTC)
Received: from sonic310-13.consmr.mail.bf2.yahoo.com (sonic310-13.consmr.mail.bf2.yahoo.com [74.6.135.123])
 by mx.groups.io with SMTP id smtpd.web11.4737.1740477517656065927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 01:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=ot7S85dr;
 spf=neutral (domain: yahoo.com, ip: 74.6.135.123, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1740477516; bh=iTgs3BVcmJpauz08qi6+3iGbyLK/vpjma2VZxHacZwg=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=ot7S85drN7D9dQRWUUwAtahmzapEDkFtQvSrx3pX2ztA+2UaaUAT4gXWQMQnJbEiwgP51nD6l4I4fNh+E1tzNCDgjA98B4tlQS5ok3NV7E0rh3SCojwBWUPcGDJbKZCL7DNC6gkWZHVdUL8HyX4oPMVqD1q0UWpOYMu8+AEfXXITDdRIUxAHPIOF419c6oFeOw2fehtq8/lBU+fBeC0bf91FB/32U4yO4IRHh8j8B03pUWB3Vkb49G0tBx4SqGcmoSTZwGRaA4idpVpssEt1gHcqNg47q/xpv+7Ep6sma38iJC6RH/ZnZ5lvJ8/hId95x/zcTLLMkqX7yfijhuinAQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1740477516; bh=VakWO+eGNBsVTc7/ky8cz6ZnkuK4ywY6eV2rLlHwPju=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Svm4Hg2PsAox7ItmdNBYVQA2Ubbof5jLTgHZ6W4/JrSLt0eq5XlNhRQbS/0o8AUwl4COQeM43PDBMWhwbRzEhxNlRvVY3+/C6UxXPD48d4XxjweobUNog5PTYe3BNBtuWg640CAr6TGYylYn7LTPyYfO6Q9Xef4frdDhbWJNfzn2nPlDR5iTYH0Rhr3exdS5et9RLXnslw8QxQ6bcSbSN0h+z3uJcjh5ZQvI54iEen1qsc2+yzbAR8qhQte5rpoYilXxcZx0419brimI81/RIOQwWYWRxjY/6dwGkA7TQz2HlopajEGESxByLJuwKblBzV3LsLsNbglRM/zl4n6g2Q==
X-YMail-OSG: 2tVIciwVM1koeXyE_tqXZC2eRbZcpu2YyGikAvtWE0qYbCbJY2o5O5t.NY5GT4o
 c2AaWKtR6J0IBkQji.3B_y_TVo6z8TiZVhEyMERzqxxUDnmfwb5tCM4JKJniDq_w.mSaxyPE7xa8
 6j0qJBjWpmam198ZUEw5q_rzXLcX9vBd8qV5.INstNzoAGYimdLiJ3c15pM68rgFGpNI8DpLaVFi
 Rcy_NLiqMK0M2ZkIbzwLUhE0ylFO9M8NjBg9vEIoLfXnOTHhQmLsjIO8FBl0oJFgNPZLn47MzEgv
 JUK_DY9StrYCj9SZRAfHdv5VnQWhXVhA.iRj.PEO4TehBybQKi_AAUEzivekkykBE5iDxHoW5PmI
 2iuKyOoVuTYA6jknmQQRys_2QRjOr6dBhWaf8cmEs0N0CBr0KTHum5QV2aU6.uY3p8qKml6pUL1g
 B6njNZ1qdP28QUwrrFBiPVfqknUloiUkyqAfRxtBhD4oYKZQGIFuqrZu26X0o15x7boLu5roE4Us
 CugtAiQWbcNJBVWqf9VV7rMJjCBKTjiRB.JJnnebeFyCjuMHpIp_gygo4HSW3vaQT5rDYAeJYaTe
 bOIsGXp1xpbmUJG_h4quJImXmJ0pPvpFhUxNq36IQh9gkib.3fvc05qOEhJyi1rdcmdSsq0giA59
 YbJNjC_4rb6AujENwFXBpLRxnZgOrzBUtclxrH6EufQc7ao8tgX.L91hd80XfoUDx0ydBLWWEqQC
 5zUY32YJHBGk4J5RPfspjhMr9EcWEApFuLHkzkc7YS4Mc5zyoMaoCm8tSkKo1TmlA5RM0q4xRYaZ
 hpUR54aBIeCOr3wrIYr5w3MoIytEEJWNq3CjmxsewHewtD4mGlygFBLeJLvjku4KKemiFbYEoQ09
 9iLbRKc4xfj3G2qco97VJwIvqpao8.FEwMy.6xvtLvJPF8DQhWsYoFXI.wHUdNJ3ntkdTxY_kAvx
 YiEsxD9NSMxnXISDSRA66gue8Oho.2p3LoknHIcvFZuBL8U6bitzNZRqCHzSE80ARcg00OfO.NGJ
 5qtvm44hP7vix.ALsRDbDSXcQJ7yQWQRjwdOvtSTiPHXT5ptml4jwY1jHmdhx0jOIWAFw9Rk979O
 8Bj3PFJ6FXkoOSGBx3jvi380YXkt1kdc4kRBxosY3hj5xghDuYVW6jdyeexe5.ceZLNIW6clro8g
 pEx_mEWI1Q964gPnFl6buPmEetjFSb7ExutYuGlt47Ao2yKN7dArY5Srcxt30DR3Q96G3KOG81GX
 NG_G4diuLsCGMD9B6lGgWBbMWSWdm1lQSsDGMpK_vM0KryThWYCG4_nuzbdDsObrNDNcEcAF6.h_
 uhxV1CI8mrOFH0dIElag18AM._ED7e_SkvJgW7gbW91kvd7j2p7so16H.TJPeJJhLcqTKRd5G8eL
 lZEsRZMEbHpFyP1sJPnc.3uGpWT9kp3v.7R7rHRzoQNoYU29tjW4dvOuseM06oLi6d1HGPxtGqjJ
 cns4Jxnpg3JxjotTdkj5G11IBRSzJvkEzdAy4Y6F6K9MPB8OLfiT9eAmBuBXDcmSI7UkRGtYkdF4
 GQCkaZXRwtWD2QbYGLrl8Huz9JFm_atiNUfBnX_jrVH4gZ4fpK3GqV52jj0OPXJoKO8W28HZIJ5y
 qu9Kg5piY5diJ.Nn8Qgx7kOgroIZnA3URURfNpKGz7hwURh5D9yFrtsnDqEYPE5vkks9q6GMEmeR
 eyK9RQcXTr6OcKKWlG11BCZqetFJ59oLjf1bYInOiNs8lD4sF7sn654NWur8sr6HgfuHmhrVG1On
 5jXRkdpLn6h0IZSPyzMD3Wcxw8MbEJhQ5eqqkV1aAbRoc0vONun.O7DNYlyg5s5imdpWlju9K1FQ
 HhiDl_hc6Y9oNxWQ3jMHr6ujj9jBSXR8lilcaANTir7qLP.UdGIuZVnWmqp9Y7dT.2YfPkvq5HdX
 Y2USghQ4dmE7exFTBtFY1759Zp21kjkFqzVgyoNDb0sLAP7s_1aCZFhgl1gM9w2MGljpS0whNyQm
 rJWxXc9r5SuyjQVEcvv5wsGbiLBizpDhkapogNsvbM1woy6Ds5yN36SeeLMBfad_c1Uh56IMdBX.
 hIhVQ1_V_AZahY34tlP64r0sNcP1a.EFUv6N2CDvZepxTuDWzX9jZhi1Ax8K.SqvzysTRP_GFiAc
 Ek2lPgPNze9aVv260uD2tXBGexH.D7FJ8MZdDpZiUjpsIR8d3ptc9.kA6SwBAS22v6H4M7s5gvtl
 8u58C_XcfNBmgC3KPymx_B7FwE8IzfhqDJ2LjdHk7.ccCoNjawbWFJw--
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 100f8f68-fc71-4406-b4a4-0b73fb263cb0
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Tue, 25 Feb 2025 09:58:36 +0000
Received: by hermes--production-ir2-c694d79d9-nk5dk (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID cb34db0a5148323d71de8edab9d020d6;
          Tue, 25 Feb 2025 09:58:33 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2] oeqa/selftest: add a newline in local.conf (newbuilddir)
Date: Tue, 25 Feb 2025 10:57:55 +0100
Message-Id: <20250225095755.12352-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250225095755.12352-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 09:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211868

If the build-st/conf/local.conf does not end with a newline
when is generated then add one
Fixes [YOCTO #15734]

CC: Randy MacLeod <randy.macleod@windriver.com>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
v1->v2
* the comment is changed
* last_line is initialized to "None"
* add a new line by using f.write("\n")
---
 meta/lib/oeqa/selftest/context.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 5eb4cc44fd..9145cbd72b 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -102,6 +102,15 @@ class OESelftestTestContext(OETestContext):
         oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
         oe.path.copytree(selftestdir, newselftestdir)
 
+        # if the last line of local.conf in newbuilddir is not empty and does not end with newline then add one
+        localconf_path = newbuilddir + "/conf/local.conf"
+        with open(localconf_path, "r+", encoding="utf-8") as f:
+            last_line = None
+            for line in f:
+                last_line = line
+            if last_line and not last_line.endswith("\n"):
+                f.write("\n")
+
         subprocess.check_output("git init && git add * && git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
 
         # Tried to used bitbake-layers add/remove but it requires recipe parsing and hence is too slow
-- 
2.34.1


