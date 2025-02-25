Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7457C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 17:57:48 +0000 (UTC)
Received: from sonic317-26.consmr.mail.bf2.yahoo.com (sonic317-26.consmr.mail.bf2.yahoo.com [74.6.129.81])
 by mx.groups.io with SMTP id smtpd.web10.15444.1740506266865967144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 09:57:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=VrqyQ5pK;
 spf=neutral (domain: yahoo.com, ip: 74.6.129.81, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1740506266; bh=4gRDHwkSehHJ3+atbxMEgGT4xLkt1kYe+jp3S6BXgoI=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=VrqyQ5pKPtovtFqyYlfecjsyVUtWLI/5YCnXwx7wRzEuYWKmKseoyskDmwTvg3RNnaAF0S8N6GIRjfMy/hlA5Z2ntWqvXXjIYezSZdfqShOLqR8KyK1i9eR0q3+MI3pd7a1q447jMp2zsUeV/ETCU7vLaIFbyyevelz30R6dJnu68bBDDRvaFotZtmQBxTSmz6ydDvC7AeEFc0WqcDbUlDkHdQ4ohJGXx2qiRLTyNhaiD/vRRzOtwuLKa+JF1Ki6HLWne9q22PIQXC5XBlCW1i+DpcvZjIQn1nbHFG8ndpdnkoi1lp593nr5zELfxWA4mt7hzhWk1i5S0EHah07Jkg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1740506266; bh=8AvSup1IkSqyTz77KLO933y1kZ0jZk5xbqA6B6ld/Qa=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Hv3sStMmwTb892fy9AKjRAS3I7/1UVAAyIVMizj+IUwAZfIt9Frm20cHsf+7zz8Mn6k1TYIUGB7El9MLM395OwBM2Ik+499yXfcd6/LCGSpDXsjSSGuaMlughMpERf7WNEWAVazEJt+ik+PrrBaT5OO5DQiy70coIH6V7TbQhNvZZElpOcEVJTKGpXCHHqXSUwrwcQ0Bq60FZeHomptegCSEmjuMau/RYPMqQAIXRwFOTGiqMD+a5QoOfr39goC9bjMsI2jp48p+DykQPXNH08FNQkYvOaUmL5JuHn3ePmLrvxoVK9lRo2oiMJQPXgH+iiXY4J9axAxIfFpvBySNvA==
X-YMail-OSG: hsi4W0cVM1konsMBD6gr1V9ikRwEGwPYSQB6MjGCSq6tiTRf2VstyjcIjVcjlhL
 Av5HoDJ12Csa7gKl0VTci5ZV9Zx_2pjdJbvYcCxA4jW3w7Lgz2i177G0.oMSG16a_cy1Up7DvU2a
 PU5z1N3n7b2uv04maTWsW6BQLOaFOlhiOcLx7TZnclzBQEF.FoHXfJNwrOobbbxqPXagS6Nj6lku
 GqmO.P5Auuw3cBWqE0iFgb9HAzFK35bdhn6Ln6p8ET4vX1mg_mjA1fTuxEzNJv04c.DtfJaH6_Vp
 AvjGbHN4upJTmx.yt8BW9lv.CIhuvyMitLlmGgxdjJV4Q.qA5KGleWaB_o6T_22YEZ_24Mppb6hk
 9Kdiuytenti7bzLv389GD78S.629uizUR9oOmuh6Ge49orZd4s9MOaEHZyrt4XCvI.iOYUOvdwn9
 5S8pVHYaYGyIVymBpZpazaXXcCpVK_pRYwiABcDaCA1_pC_IXMjr2opEXsr5qm85_xm0RnTMNJ13
 o48nfYOknPc1SGVD5CR.7ULizrwAcqlDCJyCxgJVB66ku2RuXyRjf7K15fQPumM2Uf6qKE6qtdLO
 Mov5S73TWSljosrnl2jqnagKHv27FKuiP_1kSiExIoUixgz4iMyDBFWCZ28sljU7Pe16iqIGTA9E
 Gs1Vosge9iHCk5Msj8fx9yqr3FkQ7isrUXdqWC6QKx5CtlT6VBlEk35b798ds2NGmNJ0jWXuBGtA
 MdBWlHdnjEMIK2EoCHFvDoP15N3QTtpxzWsQmSefLgOaFxB1jsqs_G6OhpziOcKvq4c6lD3KDlYP
 RGhNdH21.wLSSFe94eFs_biJBUDFrs_lZRzJO3dptz5xB0J0eST28wXsLhfNPf1BAHjUCO53jlV5
 PnxmyXkxn8le5qsys7OrY6VVoFrAHFRo_gbQdKm5BnaLBhQkKg4vjzJrYwyLn2mVCj1LZMDuqhUW
 nq95U7SBGvu2zIRxhbGfv1eiIpvJkGDbrZ8DCTQXjRXhgTmLFDQN4RTxmqWxzRWGGSIAcNxQrKBY
 5VYsRGrGYpAZxyCDpwc701pFDU.f.i6bYMsCMF10AWMIWpKnse8LwKMaF96sFRaNUVvIt9ixxp0n
 CbhzbDDYiabpkX8D.BfuXRrHeHM3bn9ewqGCf8xHJd0O7bLQxe.nDPdsO55ckvM9bE12jgqi4LzR
 0WRRWrKeAHZG9MRUblqPpT88Ksw2VQJIspN3S0in25SBEpnf25wUCnfGuJixdk0NyZkUbNRjiBOo
 uX_qOffII.nP094rXzkNGjM1kSR5dvUcj3MrTPJVL1Tlz8a0pBVesHptmm5zAvOKd1nmLLsgU7ZR
 YWpmWVxZSu9TYSq6Kl3jMHCoX_GV10kxYC41YijnaxXm74SVMrfwRjjoCFSQjv0dcI63NVU.8BpY
 dLhZOl70ATkrlFQlnjSezBG7fcL0KK4zXEKffRubxCfJ6ApNdhA86nOg9hB_TdC4mhPVHDSQNfQ9
 Z0qjC_d70141.GZKnMeVVZZqL5NB0x954t9PQL2ukkM..c_DSNo1sIbHrZwciutCG4YAQCHdHpLO
 BMGIpIeSeG3ni03RzRHKvgr7n6us9RUG95zuvJRIcuzeVgVE7LomBk7A7zopm0jGCOR48Z1lFOLw
 UQahFYfor9lJOSNTl.ts4DlUOQGoCGntGPNR0u1NGXs1PnHh9a85fCtFICuvcGMnraC4VYa.xNf3
 4xgG8Mr5lZE3Ak1S0gQkTigdxFH3KWeVPh.C5BI5WbbvE9yzhWXmiCH0JQBFMNJchharAadRohXk
 RAIexsL8fDCDD6UiZ4BOgcGWNjKhMeOxiN2O0mIi3WAFgWriL7zzj4eSPMx2.Q0M2sAelja.ol_2
 yrT0JpKt9nAnVTaRBu4pWJFg4vGfLNFptkMWzh4PZYhrjVcuAkKyKF3Uh1KHQ.lVpEHku43A6HWI
 kbi_q_dZNn4QcBXmIDBMYRM9Ode.n3G9ZDx36WgyxAP_sqEpjaV6RpmZ_hOjk6usnRJ8NAmzp9RK
 y0sZHCsjTrFeXyjYTZSXod0Ie.aFiCPgsIqZ0DkCmNsBGkBIMnzMYsMMiLE0DCsvZ19R962pi33S
 qe4_RXz9kj2EJYIIE_mlr0BiUt4dcSHz52CXbtY.gv9NSK_sdI_d7doH_BvgWea6A5bIe4ByHeXf
 Y42nrV06XJewub.ZdyXmul.396mpbGauCqzjQ_1t2uHoDBH3CUW1kDwKZOJrKfQnHtPeVs8mpyAe
 FJoXgNA9M4Fhh.NgSEc3mIr4VQTYSWlHYWscdQtUZuYZSSEsNjXBrkbYRfxc-
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 301f93b5-3673-4a64-810d-d66c5c37a788
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.bf2.yahoo.com with HTTP; Tue, 25 Feb 2025 17:57:46 +0000
Received: by hermes--production-ir2-c694d79d9-qp6kn (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d149f854e05567ff6255a990e2a34690;
          Tue, 25 Feb 2025 17:57:42 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v3] oeqa/selftest: add a newline in local.conf (newbuilddir)
Date: Tue, 25 Feb 2025 18:56:51 +0100
Message-Id: <20250225175651.20909-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250225175651.20909-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 17:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211919

If the build-st/conf/local.conf does not end with a newline
when is generated then add one
Fixes [YOCTO #15734]

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
v2->v3
* reading the file line by line replaced with f.readlines
(it uses more memory but gives faster access)
---
 meta/lib/oeqa/selftest/context.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 5eb4cc44fd..16f82c6737 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -102,6 +102,13 @@ class OESelftestTestContext(OETestContext):
         oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
         oe.path.copytree(selftestdir, newselftestdir)
 
+        # if the last line of local.conf in newbuilddir is not empty and does not end with newline then add one
+        localconf_path = newbuilddir + "/conf/local.conf"
+        with open(localconf_path, "r+", encoding="utf-8") as f:
+            last_line = f.readlines()[-1]
+            if last_line and not last_line.endswith("\n"):
+                f.write("\n")
+
         subprocess.check_output("git init && git add * && git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
 
         # Tried to used bitbake-layers add/remove but it requires recipe parsing and hence is too slow
-- 
2.34.1


