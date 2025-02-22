Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18505C021B2
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 12:59:13 +0000 (UTC)
Received: from sonic311-13.consmr.mail.bf2.yahoo.com (sonic311-13.consmr.mail.bf2.yahoo.com [74.6.131.123])
 by mx.groups.io with SMTP id smtpd.web10.45504.1740229151830462581
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Feb 2025 04:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=WPwAFYIQ;
 spf=neutral (domain: yahoo.com, ip: 74.6.131.123, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1740229151; bh=/K+uGhTk3kM8L+1lv8hJ53RBMtM0iMZhNE3NzAtKB1U=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=WPwAFYIQ7QRigaLjjoEEkoo/WqN317pzCf6iOTk8l68DoSyOoD8+mZal1mBdYR3Zlr1M4/ZFNJ9VCQ30lxPsW2kjA4nJ0tFCjVVdahmgLN6yWEFaYMrviEweLMpWvyfgVuDA4RPntuTvxOKxWrOc/P1mFgCxoiFNHEdHgOteZQeo5KnqhJ3aizeLxgOWOmPaDYwgExWFpbLj2Q6UehLoVBdyo1fVW/VIgaNjuB+V/U7Ss1zWIEVBPH7ekD1/kjY/08xSZ7t/dXT5FNUQOa0CzhDoV9z7ORbFLm/22FIpNCizlvrijK0jPGx2FF5i7uMulFmJKhHCcKUbexDNI0ojaA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1740229151; bh=AgpRD/0sb+HVhRpAlhSO0AEJFfNvtMToxIg7yZscO8l=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Hd1Ejznb0FNmvE8sM5OtHXxZ3k1TXVj4ONRJTpqQnol3c+pT+ZoMURd3dARNYSEfLyb30w9QtN1/idDJSs4IqHNFrCewLpZuDFomHt3fV4GdA861mUzcgD5KK0gQuxGyq5fUGCYSt8kZd2RYGggy5uaQ3tSppGllpd3IoHd4jTaxnE7chkXTlCDSiLzIr0ZRIYj64b1kSnWR0Z9NV3a8k7uncQu7IuP+zjzp783rxl7SOz/yNUfezb1fFOBey0LSbvz7w2ckhyi2/etWT138gHnBUUL2JOSWcoY8E3B2mGJvB06MbMtvLgvm2tCRe5HHRoS7mo9cFNBOxNO+ynkd1g==
X-YMail-OSG: CxQaXOIVM1nt62YeWls7ZU14uO9qzKJ1j4K3zGySvGO_HzL5HjAO6Y7Vh355Vav
 yimLWJjvloy.beBUGRP7kJhH4NhX9S9chxxGmPys.fIHR3hyjcCItCByeH.JH2N5nFbT2m1EBrL2
 CRAuxaSOzwl1taDTbNZSALqynuaHUgsHaBsdIuBui2HlC3NRgF7WejGXA9g2W01EwqY9sGDlGVSG
 ihNLJ.dwjaM9xcKX1p809L0QGpIGZmqCCMPD2knbZsXLrsI9YwqzAB5ucBBgAX8O6JaIiO9LVGMp
 m5TnuoZICzk5cFP30PWRg0XPCKafEd_K73TfgOnM5xOgmX9ptTe6_NJc2bHVfZhSkYlluywFfkj9
 4qFoV5ycG8MdUqjXWUDJTDs146aV2mPrVDl2OACn4FJ9wXBFB_OFyohNsSuPnJFIKcDphixTnpgP
 VxVhkHhH5ICIl7ypDT8SimIn8UHGx1Ge4cw0vOBCxzF_zlqMY6Bhn.3Fx1ikVcFLdNLpeemjpE2v
 a7g_MMIugx2VLEQ9.l5PXiWvY3.E87_gnKtLJZYnwh6e51fh441_UMI_OU1l8EnuAcs8WcKS2jXY
 5TWjkGOlepg_plCYEdAXFG4kyeeXP2jXH_Rdyd2SW0th9KCXfZovqzV6lCTsoRgCEaU0td1QMSiY
 9veEsZSg8r6AyYoTCRbseTgfXiIPkHF2LumhOTkxUUEi1zuWecJE8Dr3U4pqM7olLxXkf5grMCEr
 EBqYvsSSY5K1NdvDGB9k3RfpoOppKmK5Pwbq.YI.FH.a7i2nc22D0meUB0WPmW4ZKExPaQO_Rd94
 rC.S11Jz0V5IeJLKRgszAPwBjW_xt7n3ID9SBj0dAGgQMQ9lWyU7xh9m8Bt0c3FGMEPbOClTymyi
 nUfgiPVOYSyF8NzWTvhMvgHASzU1QUBvq1uFbJsxYpqgi.OxjgKretkrhohy1ZL_A6kWpcwAx7CM
 JQNS6WJxKYqSdcGk3liCYUz5.tZoLw.s4IXtbYiEI0rpxL._nPV6Tw3h_4GuBKAq83J8o.JgIIN3
 FLYmdZQVZ3x2OFSJysxzSf5DILu3JUxdCfPuE2IUxXSYhCU3M0cmadvqx4VEs7QzQgIyeOm4jYTH
 gP2lYyLJgawnYu45DqmPNjQd1.tmAfqm.bZUjHMqZvg84Lw.cpNnRHtkKNLLWNsNcuBpLdMuuygB
 jdz7eINwZURS_k.sWYPaxeEc3XdH8.Wut5r796xdF.C7sMTG0INazBkfqXmrtpgCm_Gkm3HQXKPs
 U.rpkE7vnxaPz7h0G1.6bwPuxADkSAjf0KuJ_yyKyXCkyzULUEiFJ69UUJdJkDzaEaQQqQ9tURpG
 5lap_Nnd3NV7B0OFlszt0qzsLBvpHGq.Jtm47WD9qvJ4aPsNqcT8Utp98y98hjU9pR3ho7Yn2d9G
 .G6PSqWEWFxmo328e92eimacu2i1.5tli226k0QaylxLhYAjoPVEBcu3usPEjRwpO5PzwUgnMOj5
 Qi6j9IIFSEUElcWMP8AV6JEATsn82hxT6KHk96JoSC_GXTxSqCTWsVUjqa9E5WYYOs076cayH3pT
 K56D1.AbC_5QVmth9lJAcqlLY9kNgZD6L9kAef80ccwBw5t5FMt29us4YN8059hZaVguY8qZDpGw
 DpTkcIXrlDg_z_DmZDrkeKRE3ssRItXfsoOchk7rYm_QGDXoKxQl9MiWFtBev7KMiodBLXHdvgdW
 9aP5fI9j6PA6AI4pXFmlLawL1UhzMW9t3G4RiwJiyY6hnZTQQb.asH321kjUZh_hjIAohv_s_Eqg
 5IEGhfSw25giJnBrgu.5j63MuHeBSzD2dVbwwx.PJtFDZU2cPw8YuA4ZZihIMgOvJtAcpNpLp8Lw
 cqj5uqFtb4HjhjovUh2OhOvOkUrbdI8Hsgvl9Leo0knmlU0cfsaluuhHJ2O_bY4xsXpWzn.s9IHa
 _xLePxpLdZ2b8UGj9yP2j7SJSOYmxbSKL0dgTa9kAx2V3ZK.e0Fxd_LWeuIuQRzuaUcu6ZLZTYcJ
 gNeK_M39RjpkoGO1OxIXjFd4M.OMFs6frhONc08A4ihXMWzy8lnlTjPszRhE2GmGynxPJFL1NzGy
 hGpJYeC0Mp2aj3LsY78o0Y9xtK6cZOQeQPHeo3pAQXtk6boYEgSLMAIRzaP9pTYvpqkkV2PuBkae
 xgXQKtnlQL3aCFwA7XmAcoR2.b6CNiYngqKme890JGy5R_pi46PWHd3RGF3Ey79Hp2CgC3lgc.PF
 _dSkT1saUDD4qUwRL.3yHRMFkwcOfd1cq6YGL4.nbxStoDgu3klLr2PWryQ--
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 6c3473f2-c5f3-4de7-8850-83c6e74f9b97
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.bf2.yahoo.com with HTTP; Sat, 22 Feb 2025 12:59:11 +0000
Received: by hermes--production-ir2-c694d79d9-nbvqz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4cf0a00798d3b0c80d33dd70db470d1d;
          Sat, 22 Feb 2025 12:59:08 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>
Subject: [PATCH] oeqa/selftest: add a newline in local.conf (newbuilddir)
Date: Sat, 22 Feb 2025 13:58:22 +0100
Message-Id: <20250222125822.385265-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250222125822.385265-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Feb 2025 12:59:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211820

If the build-st/conf/local.conf does not end with a newline
when is generated then add one
Fixes [YOCTO #15734]

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
 meta/lib/oeqa/selftest/context.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 5eb4cc44fd..986fe8e1db 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -102,6 +102,16 @@ class OESelftestTestContext(OETestContext):
         oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
         oe.path.copytree(selftestdir, newselftestdir)
 
+        # if the last line of local.conf in newbuilddir is not empty or does not end with newline then add one
+        localconf_path = newbuilddir + "/conf/local.conf"
+        last_line = ""
+        with open(localconf_path, "r", encoding="utf-8") as f:
+            for line in f:
+                last_line = line
+
+        if last_line != "" and not last_line.endswith("\n"):
+            subprocess.check_output("echo >> %s/conf/local.conf" % newbuilddir, cwd=newbuilddir, shell=True)
+
         subprocess.check_output("git init && git add * && git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
 
         # Tried to used bitbake-layers add/remove but it requires recipe parsing and hence is too slow
-- 
2.34.1


