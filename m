Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16184.1794301864536695551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 01:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mpaE6hq+;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GvsIcNLj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8Zbmw1916833
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 09:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9q5XjpkRtFcEFJaTre9NeFJbRFqCJXkoh8+
	PWXnUs4Y=; b=mpaE6hq+y785GOO1hksP10dsamg67qof4tUcRemO2cYoAbkmINN
	mh0DDtZR/OlydBff1T5XKd7X+K4ajfch2mqQ9nlhRmwwXqXLWnpDWAwv8KjMpQvI
	WdW4RE4QS6BHa5NwA5xfIsrBFPOUwtl01ZkJLSEpPseRqg94g1xZ00gja0KpNamz
	5c3sQ4WZnVrmd0Ek4F6pQLCHaJBs0X3BzrxgwnhjoqwcXsyGkaaobFZRUi4k5HoL
	cDx5qEHRcfJ7/cnci6ysJU1RFVDUUjHOEDCFRsHm2Po4XFm1djhpXJqc37n5MtwL
	9dPy56nvRRv/n5e+kuVA0NH+ACBAHagwleA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw484kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 09:11:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37390b2989bso3969940eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 01:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794301863; x=1794906663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9q5XjpkRtFcEFJaTre9NeFJbRFqCJXkoh8+PWXnUs4Y=;
        b=GvsIcNLj9IJ9fBQuH7Ql247gd9HwxCRKr28/pOtYREOfnmkXb/ozMQlgZ6JRWgIvc4
         Z56EfBATLu+cQAeiBEXk2EGosrc16UHlVH6E6oNzgnyFEcUwggcdAIthHB4+Oo7JWbtw
         JEJ67vkvMUksZ4a3rOF4m6c1xdLh1pZHynPYxnoti6/FhhFwZnF8O4b6mdCOnkfyKGGn
         3np3GDqWxeFcRVlbyJVuhFYVtdjFqX+MjzkdO1TMGqzBjcWcwHoe5FxoySZ1p22oR0QL
         GHzFO2WJfBwpXZ2Q26UCIwkANIdqwHcrrK1pDPc8jYrF0zqPzkkHioCWIy2s2EBQZFPN
         PT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794301863; x=1794906663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9q5XjpkRtFcEFJaTre9NeFJbRFqCJXkoh8+PWXnUs4Y=;
        b=rjnHGiamBZQoaa0J/a/M4n1WaAqoCkf9/qdgpvvruJ/QZWPnd83H4sk25cEWXkhZmS
         J+xR7PmaOCU1CWHcwm36yGhBk8DC7k8Pa8ih0gwggZLvyfo1sODEQlwDatzDd7O+l6hv
         yBHzVorCUNOAeOYx86Ytte4hd1XgygJyqp9rzAXJN4DY7Btp7exsGw3h745zOmLaMqy1
         NumiC3Gv+FrvnFm+ei/d91jxhwDd/gJG31R4T4c6Iox6gp8785yug8J7uMDj7ezK8Pv2
         j9CS9NUWMRwyMB5VnjaTUEqFpjnxyxXNImL1ZRy0Q6EtiPEauVFHrVRCPp3Inwjmb+zm
         ugAQ==
X-Gm-Message-State: APuU4Z8xqWN0V5qc2/ZCM5O/vuxmxFgVcpFRONkP0AZpJg1fM/kYCQ1z
	LPm+JshC1m+uDsdUJ4I6Vdrrkf7dPFyaOWMn+TFqgbUIuuBAbur40yEJmZsWAKgQooKr0KqrkL/
	n8Dy1SfNGNYU8IfwgSyxvUXtioZB18PmVq/vbv6C0SxPmA0X7HQphmK1NdM02cAKVGqn/isRPGh
	0imLO+DY9VTsW6ugYU9Q==
X-Gm-Gg: AYBFou2zabDlTUZxHiuz/hJ5f8ko44uGdcCa0NdJqqgbe3WlFk+qwXbQGerkOsBCK/f
	MW7rEh8lrARPFXdmG+1Js+7j3/hvUJC8pz1nZWy9b/MZbYBJju799KBQJQvHGbIbNyAqjWQfgp3
	fYSCJIgVuh2g/UKCiI1ZI0ZRCPd+aQXNQzVeocy6QFkTKJPwHR6pciKjkonfVxD4XWrpiV4pcKT
	YZkfgsSKJtwnQL9pzP6QqGxf/caeBcpRZXtM+qM4V/s4R9nen11Ye2LIn0wK9ZfKVS50iyHVUYm
	xQ/QpQrXlPkCNil8TzrAtwpIq1FoIe+MLuZwm8tX8682kQJ+skaxOU7B4zxpoMPHztdGqNgEQmO
	yEfM1YDBWoDjCzD/cVqu+J+IPNlloYA0ufwkmpauFuA9V9tHuyMFF+Rmge/YrYM0mRWyUn26Z9O
	bYH9Q=
X-Received: by 2002:a05:701b:291b:b0:13e:5a50:1e17 with SMTP id a92af1059eb24-1b3b5fa8f4amr2477478c88.3.1794301862508;
        Tue, 10 Nov 2026 01:11:02 -0800 (PST)
X-Received: by 2002:a05:701b:291b:b0:13e:5a50:1e17 with SMTP id a92af1059eb24-1b3b5fa8f4amr2477438c88.3.1794301861647;
        Tue, 10 Nov 2026 01:11:01 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm11920962c88.10.2026.11.10.01.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:11:01 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
Subject: [PATCH v2] recipe_sanity: Drop rename overwrite detection
Date: Tue, 10 Nov 2026 14:40:52 +0530
Message-ID: <20261110091053.1643928-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfX6lnCCpJFVP7G
 n9k6sRCpsce7cr2qy6KZnW2EQpVVjWiGLL0xh72n8x07bBClbLyYn9nrvSs2zQZ6DqxphAV+orF
 yWRQLpG81gAZtR3LF5ZRtRxl4L9nmTFswdlu07AwMDFF5LDD14NtL1tyRfTfPtWCrkiiS1gSUuV
 8SVhAPKUtf6jdpqDjFgAP4FQ0Y4ZNYT5DEb6HICW80X9fQFk8umBWL7i0WgT2DQ46hSzWeUDp/9
 BTGhrGF4r07cwiiLR+e1TXa5MEpdMQNvlxS7DdjSZ+zWQRoSzK1IjCULUVMU+xj7OsSvtIHjMvd
 ab5bHJKCGubqVu2qjv+N2ZD2QW9Xk8CB6OqgcxfMIs8LY9RlLJ99FGy5t+kri+1yiJ93k9KU0Y7
 nUq023K87cPGRQt+29fPOuKlTyUwAU14MFdcCVnPXHvi47fppkzaV5/k1vAPJBuSlNIFLJNy2bC
 2MUFZYqPYGHF9ulQ5Kw==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af2dfa7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=Q4-j1AaZAAAA:8
 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=UBRZH4KWpRI4-zv4EucA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfX1ZnOZTu3eElQ
 lKw+dYr1BjxnMpLEpSdRq1e92u4Js7hfEe9UI7tWWjt9ogrppFuOUHyehVe6BIcO+aH/UTwZ36h
 8ZKJzTpxRg/Y+blJjchbSy/KnJrkmos=
X-Proofpoint-GUID: Vy3_sGyHHXHdu1Q91zmCuL7IKj4vkhgf
X-Proofpoint-ORIG-GUID: Vy3_sGyHHXHdu1Q91zmCuL7IKj4vkhgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 09:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249911
Content-Type: text/plain; charset="utf-8"

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Bitbake itself checks for probelmatic renames now during key expansion so this
check shouldn't be needed anymore (it dates from pre 2011).

(https://git.openembedded.org/bitbake/tree/lib/bb/data.py#n96 in expandKeys())

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7944665886cb0bf881807a5d849ebdf42a33d1bf)

The corresponding bitbake change was merged in 2.18: 4986a548e (data: Fix
expandKeys recursion issue). Include this in wrynose as well so layers
using this class continue to work.

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

