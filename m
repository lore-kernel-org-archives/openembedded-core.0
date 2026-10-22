Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14579.1792635581144387193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 19:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=iyQPuvZM;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ChlFsalf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1il2r2821591
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 02:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/h/CdbOHmSXWETpittiPh6gRzUrPKDeCm5X
	AM5HGoQc=; b=iyQPuvZMTUKLOoHKQXvuKdWtJAQhHbM74tA7ZYrlYjkdek1DYmv
	eSDl+HSBlYL5HJIWvVPa7+LsIl7vfEQ0I+IrhWdbYijoDJ4WzITKWfKVMYNRZ1Pk
	h3Ck59FzAPOv2HYhEitG0JJ0wslvElpTCNgrsI0GQnBOkh51jQ029PZCOlCAMILI
	otacVyU0w4EOC5bNqr1tEbsZHSPfO92W6VEKeO96cC9uSlI7gR58RKVz1E3A96kk
	QAwEaawkMR9qD3NmPaqjUDHX5G1kXNKdZn87pzwfOp0/Abm17QlghHL+IvSkY2a0
	X5NC+GQlFVuVW9WfMzsTxYDHlAMnAupfTYw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bg7rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 02:19:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so1985187b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 19:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792635578; x=1793240378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/h/CdbOHmSXWETpittiPh6gRzUrPKDeCm5XAM5HGoQc=;
        b=ChlFsalfOyTeJJxxMvUYipGhpzZ3PHMHQXZYeJokmQEN4kEdThT5l804L0ZBi7Zs5p
         XJBGXba2/PJLaiLE4TuLeVaX37tWHbWg9Qw94U6bj9Ol7jW0JohzzeiRIswPNIWFYMb7
         6skbGfyuekOs2K0+vZsVnAgugqnkh0Gu/YFYNIoFC7RuyLAvQLQwsgOE9typSu66wQ12
         gAUKvVLg3YBO5V50powbCCIwQM3MGwMK60bQEYP1AEnFiGvosyorqE83aEWtb9aSwnSH
         fNSgqZsmtQlsUMMwjh0PYj1zmXejMs+2hIS4rKqm5Ye+6nzVeodhGqSqXt9tp+g0O+AC
         rKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635578; x=1793240378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/h/CdbOHmSXWETpittiPh6gRzUrPKDeCm5XAM5HGoQc=;
        b=0aVmaBm6n+f1stf1/nyKDxDQnmP9/gw4HHoByteJFcuoJad8LoWjdXXfJ6OTVjFsrh
         sskgKwm7uPxSJjhWasnrF7ae7Qj6hcE1kjxo0tvEF4Vo1mcZaVshvKqsIXVjdgEp8tve
         bW34+1qGs0tQmiv+DViXvLvDFP1I2ghUKlQqR7sLozZzmSjOHXn9YXeKyy0fUDZfWgI+
         6B9RXzNqR4EsRCUD9mUGbGy+qs01D3HGa1iaPfFwpKCjFuM1QoISql0jrIzvPcqKjFGi
         cwOkKeCtpfr81blj9OBSjdMN5XgmbruxaX3FKII++N1o7yxtS2BjlnLwf1RZZkch/KCy
         DjSQ==
X-Gm-Message-State: AFq9FYIm956zPVo4+A11CepoAPvDJ+5ynFzKlPT0zsHla161HQP2zg9X
	HNpsU+vZqs+nXRP4rsZXk7o3PWq06y7zj7NV5cT5dCpXFrv+XLr+iONObUwHb7kYhVTc7TSUzj7
	jntnifw7aXyI9KTdsEnC9Q4hkvrLUYGc7biN0IlUE+yCz+nmb76LstTbLTtS+cqMrAwAv+hAw6x
	qWFoBubxfML4Sdk/0=
X-Gm-Gg: AYBFou0S1NHpsmX3kvI23TndYYYg2Zrhl9xWhvlLOaQSTwN002Y4AyIIL3q+uJaQFPY
	fIERInSVNZdGIP1QcgkqviirYaGtG4EWzn8VzrRqiJRRJKyMVX/MX8EknLpjtRacAhi9Pqm+Kaw
	xORUqSO8RDryu1S2NOrDg6C/ySrB/D5BZpXC/J3+7s2vCVN8R4gZOwONRwfR4IYmOINmKn47zrP
	z1Nae7dWP4N0aaWbtRY4RVf4VAfX+E+l5fNddBPq7PoqTL9Uy0gvM+5nIBskzlx9yoo/38Slwf9
	OkKRNAPh6fSKAD8dJE8Ak8Nw0FhpEpwydY3/w376IFwNI0x2m6fI/ud9JgUGJFUfttBxzzOkgbh
	7iItTr0kbL3fw75pFdrYMHemi1tzPVqvmWvAvXfcp7/T/MIt5mNFG6DjcztLQQ+nuXeVHN+k8sR
	JhtzroBuKrzqeFUoP7xdn0PbUsH2Vezybg6zxmkA==
X-Received: by 2002:a05:6a00:1806:b0:8a0:58c3:8ceb with SMTP id d2e1a72fcca58-8a089e11c57mr2892013b3a.45.1792635578374;
        Wed, 21 Oct 2026 19:19:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:1806:b0:8a0:58c3:8ceb with SMTP id d2e1a72fcca58-8a089e11c57mr2891989b3a.45.1792635577682;
        Wed, 21 Oct 2026 19:19:37 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e6b14sm1502009b3a.43.2026.10.21.19.19.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:19:37 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstatesig: write locked-sigs.inc atomically
Date: Thu, 22 Oct 2026 02:19:32 +0000
Message-ID: <20261022021932.1842395-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAwOCBTYWx0ZWRfX9lmo0NLJCEr7
 OgSiYvyilK2zcb7YG5DDrTNtM6n7gQArRjbFFoQpJ9/4negQhKxcSXxzk+ABNBhGf2LuIE4XTax
 JizuFWRzYslJi+AE5bsK/bBcgd2uqmVF7fCb81TdMjRrAkco/nAS3Gf1zAHwqLLmpEHY4BAbCl/
 TbnuTEN8YEXJBHis7zVrAYlCoCu4tL31HyoGNWvJz/78Vv+/Rq9IenORph2DhM0kZ/WLLEPvBiq
 G2W4u6adH9QIN/MyQWY9pmuv6jXsCNGgc1wKJfnuLh8vzFHhMZT9WqUmw1xEGsMfgPZrkNM3Deg
 SMbQdD92jW6RO3MS7qwskLrEE4aTlNoXD5HRsIAZ2ooTAwyY0UwTs3SRRxPXy1u5K58XJ3uo+9W
 bgsp8SEXAPpCvnuQRGlB8FZm3iqeJxl+VAyZzGI0mr2dNahYzBa8+OJp1DS8uhPhJrOJ3bQQ5rr
 zZ7X91fLd/iM26QIuRA==
X-Proofpoint-GUID: OHzFIFRoJ0XWzDVso5yMq6g-Xr1UFs3L
X-Proofpoint-ORIG-GUID: OHzFIFRoJ0XWzDVso5yMq6g-Xr1UFs3L
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad972bb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=hHVG9z__Ecf_OG34pOsA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAwOCBTYWx0ZWRfXwgBvQG+dKqHp
 7+6VQwpuKbyFgGrWrxkPSFW60pON13WRIbYsQSmfATqaJMZDZGq5XhZueCrpGrvmv0A8BXhVV+E
 4cTppw//wMvHwI7BDju+GaLqJU0lhiI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 02:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248408
Content-Type: text/plain; charset="utf-8"

dump_lockedsigs() writes the sigfile in place, so if bitbake fails or is
killed partway through, for example on a full disk, a truncated
locked-sigs.inc is left behind. yocto-check-layer's test_signatures and
test_machine_signatures run bitbake with -k and ignore its exit status
when the file exists, so they would compare a partial set of signatures
without noticing.

Write to locked-sigs.inc.new and rename it into place once complete, as
epochfile_write() in oe/reproducible.py does, so a failed dump leaves no
sigfile behind.

Tested by making dump_lockedsigs() fail with ENOSPC halfway through on
meta-qcom data: yocto-check-layer previously accepted the partial file,
now it reports the error. Complete output is byte-identical and a
meta-qcom yocto-check-layer run gives the same results as before.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta/lib/oe/sstatesig.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 9928f3af49..e5a6eb45b9 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -259,7 +259,8 @@ class SignatureGeneratorOEBasicHashMixIn(object):
             if taskhash != unihash:
                 unihashmap[tid] = "    " + self.lockedpnmap[fn] + ":" + task + ":" + taskhash + ":" + unihash
 
-        with open(sigfile, "w") as f:
+        tmpfile = sigfile + ".new"
+        with open(tmpfile, "w") as f:
             l = sorted(types)
             for t in l:
                 f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
@@ -277,6 +278,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
             for tid in sortedtid:
                 f.write(unihashmap[tid] + " \\\n")
             f.write('    "\n')
+        os.rename(tmpfile, sigfile)
 
     def dump_siglist(self, sigfile, path_prefix_strip=None):
         def strip_fn(fn):
-- 
2.43.0

