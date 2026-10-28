Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38186.1793175560474246363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 01:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Swds3TU+;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=iGFYK6nu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PXUc588275
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vdmZsuQIlyExODEaaHR51RMt+tqCCy5maVW
	sa45+I5k=; b=Swds3TU+3ineoi/wHm+hzndiLdpKZLX7q2s+H04x0Ww7fGWPH9K
	eV1gZQkwpIPCvI+fGEW9CC9SCpO16E31Rmg/RbkRB0KY1CH3Iz9yhyisJ/kSwsEO
	mC7VI6xs3kTGqgGZlKuYUm/AGwSN7LspA9HZIhe7EOK4XxvG0l2Bk0X9vG0m9YsW
	TvKjeWO8f+MkYW0VRX/49bRIBAXB74blFOdARB9OFNeIKsug1PsB+wWygsBxXhUc
	fkjAfe9u2cVkh1jSejEj22N7fyVPHLQ0Q7AfsOJZpVlXFTF/wmPvwCoWfJ7nhIN7
	fvcr+SfsMQKu3JtsykTwLlwYnt4D4EywHTw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk2qe27eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:19:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1269572eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 01:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793175558; x=1793780358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vdmZsuQIlyExODEaaHR51RMt+tqCCy5maVWsa45+I5k=;
        b=iGFYK6nu1x0EYSzgzMuB4ndNhnluErEBqhrZbQ9/4gymwTtk3JJSxdUmYIpJaLokMb
         2lz2cTsdTV54MyO7IOLjxPEv7lypowIMBBJgvK+2OWkSAnC4V59E4bif1KDJggk0JlTg
         shEfO5Ed49lraOpymcrEkREoEkaIfjlFL3fE1Oj02uJ0G6CHsLP6Zdq8aGeKSrencp+p
         lVmgL8FN8+FPLYDKMRFpZQsoP+ewjMNHpKV8DA6tlvJad9hKuifKTf8kkR8X1O02AfYn
         dFe0USN9ZH11p0xZQWABqc9ClOhtsNzvWk3MASUmahN5q5alW7C/nekW5R1NvAC4sf1G
         D+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175558; x=1793780358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vdmZsuQIlyExODEaaHR51RMt+tqCCy5maVWsa45+I5k=;
        b=ophxIwa4raz2BrQELds2FAj30piom4nYN05VTwWH46Rpz797vw56igVZLV8+Gz15zP
         V5wO8CKY5LGovZSIwbh3GfUqIOCFS302a63nIuAiL4t258Hj8RmnoScRGFT6svED6yM8
         zEg0/vhvtK4dlsa6MmIacXF93h9p0ZvqZF4EteFAQxQr+Gkk760GF4h5YH/IiseJ/nas
         1GsT2PD78KsJpJqvrNySaaBqECDnHC0Pl86U7WldsfhCRRgQ9N3ipsgvF+Vu/hNWdPXR
         fjz8i67k4ez/nwjtYn4NKpHAPqRmEmYxdIc3plcZn4++PYjBLmN2QayEz1ji3GcnsAbx
         Bs8w==
X-Gm-Message-State: AFq9FYKx5kk30yRnVus6T9qLul5MTouCRfvKOEpwt+MEcSUMBbfGCthG
	ihAPQ7X/wq0Xo2E1ENDcQk8EjPfj4aUhdlRYRKc/N5EaseKsMkqtzGK30vDTvRfX9NNd9yWpw34
	BPFnoHdvETUHXTSzKh+nQsiQ56hIDfG8o9QzuJOH8uYO/ItJlwFGVOWIooC9GUWz+bUom/wNrTm
	12Ab/wow+TzgluwzHnAEIW
X-Gm-Gg: AYBFou2xSy5yRL9IyJOi+jsSpPD281PmSH6c5zdBGLYmOG9z++yIQSt7sJ78yr870ce
	qvL2pS9HpiDBmimq0sS0AdwiSxxaZxdIuvdNk/blz/SViM9111HjbxMldOIOZkFMKS+1+8EfI8W
	qh/MpoYP7SzRRtJySa0ErQ7WuUAiYY1dtbEmyy/cXAzf1OP804IbnH5nJcMSKHfijPE3JmCev87
	R5LOT9MVZkTalDVtjwcSIUVpYuRXkr3HHG7sQhLFTwSTIWDs82PEamUKxRUGrafFmTnyA6VqsmR
	LO+DA1Vjef45DSs9hW9VQBtV7reqnuBM1lqfSIBCkqRkxuLsA4ngDtw1RUnmYfXOiIMS38+Ji0e
	OYY0KnwW1riPMx3X/Of5WJ5NB2Cv86crd2ppdaqcljB7UvPQ7y6Zkn1gnF1ABtKX4T1JriCRFlr
	gmKag=
X-Received: by 2002:a05:7022:224:b0:14b:cf58:ce5e with SMTP id a92af1059eb24-1a6c298f0bbmr3421973c88.0.1793175557850;
        Wed, 28 Oct 2026 01:19:17 -0700 (PDT)
X-Received: by 2002:a05:7022:224:b0:14b:cf58:ce5e with SMTP id a92af1059eb24-1a6c298f0bbmr3421904c88.0.1793175556696;
        Wed, 28 Oct 2026 01:19:16 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a5594efsm4626842c88.2.2026.10.28.01.19.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:19:16 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH] recipe_sanity: Drop rename overwrite detection
Date: Wed, 28 Oct 2026 13:49:05 +0530
Message-ID: <20261028081905.1780834-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bYFhJfqv64TJMKwomFIE-uUJUA1Y8FXT
X-Authority-Analysis: v=2.4 cv=YuGa1IYX c=1 sm=1 tr=0 ts=6ae1b006 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=Q4-j1AaZAAAA:8
 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=UBRZH4KWpRI4-zv4EucA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMiBTYWx0ZWRfX5wDFqOgNKGnQ
 6nLl6iiEb588WEmL9uuDIzgW9aWbFfyrKVtumAsUGIxsv67M6FNGGSOC4WOAmHjbxTMOl/haE2U
 yCsZEDb9EajKGfHVoSSjjYDzsO0BNhA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMiBTYWx0ZWRfXzku1QE8RaSCG
 5qlCyqoz5Y/GPAKghdnbUGAxHkvSOpmBu9/3bdA4pfIJn1qPI9d0N5nK+P6QAahDgsS1vqy5WH0
 OTM+7jQBb7cLLylpbED2jmxPEut1o2Ldx3dJiyRPR8iFGSPyZtZZeu2BPyccmxLLIqUqWrZ29pC
 0+zFaIxnjQd+LXXl7cJ7+zXxFSoFcuxRKcWdd2QPSs1sgIVHImqVE+iODZsW4hpAiB9nvd5URmM
 kDedmULPuuzhiUylJebGK7Fwf++YwhgiH7ykWsxOk0rX6Apizm21akMIOZXff+upixN7s12aAXR
 r9hw+NK4QM6GDQS6ug8o4CbI4Na9mpv2Yu63rzdibo+ocX3/YoI+SGXON3pSGHaMOujFbDNpum4
 s9SX+23icy0vwloyDlvy23P0cghniITm3PSYsA+z2xL46fYew81COYw+fkTwzyzNaXoZIw7K0Re
 IlPWBcy+A/k9oxUbICw==
X-Proofpoint-ORIG-GUID: bYFhJfqv64TJMKwomFIE-uUJUA1Y8FXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 08:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248797
Content-Type: text/plain; charset="utf-8"

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Bitbake itself checks for probelmatic renames now during key expansion so this
check shouldn't be needed anymore (it dates from pre 2011).

(https://git.openembedded.org/bitbake/tree/lib/bb/data.py#n96 in expandKeys())

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7944665886cb0bf881807a5d849ebdf42a33d1bf)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta/classes/recipe_sanity.bbclass | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index a5cc4315fb..3c763de1f2 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -34,13 +34,6 @@ def req_vars(cfgdata, d):
         elif val == cfgval:
             __note("%s should be defined to something other than default (%s)" % (var, cfgval), d)
 
-def var_renames_overwrite(cfgdata, d):
-    renames = d.getVar("__recipe_sanity_renames", False)
-    if renames:
-        for (key, newkey, oldvalue, newvalue) in renames:
-            if oldvalue != newvalue and oldvalue != cfgdata.get(newkey):
-                __note("rename of variable '%s' to '%s' overwrote existing value '%s' with '%s'." % (key, newkey, oldvalue, newvalue), d)
-
 def incorrect_nonempty_PACKAGES(cfgdata, d):
     if bb.data.inherits_class("native", d) or \
             bb.data.inherits_class("cross", d):
@@ -113,7 +106,6 @@ python do_recipe_sanity () {
             __note(msg, d)
 
     can_delete_others(p, cfgdata, d)
-    var_renames_overwrite(cfgdata, d)
     req_vars(cfgdata, d)
     bad_runtime_vars(cfgdata, d)
 }
@@ -137,19 +129,6 @@ python recipe_sanity_eh () {
 
     d.setVar("__recipe_sanity_cfgdata", cfgdata)
     #d.setVar("__recipe_sanity_cfgdata", d)
-
-    # Sick, very sick..
-    from bb.data_smart import DataSmart
-    old = DataSmart.renameVar
-    def myrename(self, key, newkey):
-        oldvalue = self.getVar(newkey, 0)
-        old(self, key, newkey)
-        newvalue = self.getVar(newkey, 0)
-        if oldvalue:
-            renames = self.getVar("__recipe_sanity_renames", 0) or set()
-            renames.add((key, newkey, oldvalue, newvalue))
-            self.setVar("__recipe_sanity_renames", renames)
-    DataSmart.renameVar = myrename
 }
 addhandler recipe_sanity_eh
 recipe_sanity_eh[eventmask] = "bb.event.ConfigParsed"
-- 
2.55.0

