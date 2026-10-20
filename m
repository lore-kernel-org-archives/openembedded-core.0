Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4002.1792535961152663104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 15:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=AwZKoKYM;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Yu/todjo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KLNj0W3372446
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 22:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zs2xoo/4TempeiMXzdPWlvTHYT3p4sEmS/z
	o1uLtk8s=; b=AwZKoKYM7ziE0VllFbpEPT5IU+JdGFzNFino3JcmRBCvU/Is7qJ
	v6ucv4ohGZyT/mPQJYo8Xf7ZyAmwm46f8PMmLzOL9MaqKHxtRcfREvzfNBz4glgb
	W3kfoaj8YThK0CUI4IgR7bkCeVwtpsgk/s1EPJr7rtRyEbT7BZFJrUzJDvLkQRoE
	l5VSA16OXDG3jdH2wI6V/mYtvXGbuOjIftEgjvl4uPZIAMPGLa0vGRuRulxM3+BP
	N3WNBwFYjiS5/blEyMWP0g2bpYkrHyzB+GQ4zR1t/jLkNCd6XUgMBEdcHWuxQCdD
	BcVtL4sReNuvFjjAmx5gocDJvWAFPAtaJrQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajgwgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 22:39:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a8ae5154e7so235856a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 15:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792535959; x=1793140759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zs2xoo/4TempeiMXzdPWlvTHYT3p4sEmS/zo1uLtk8s=;
        b=Yu/todjoRZmH5cVLXrM6BJSzK7R6MvPOr3hdK2f2hBX3Fnb92tlWXMYxS0ocReEccg
         Vcsro7LGGqWmUewKtR8Tf+HRo/1+sN/9s0fCBnEIUNrchR6AZ1DoA/tudNlM5CI5I4qY
         QOQ+ZTUCp+22Ezz5Ko9YlrD26xiKdSy4z4Qt3PF1jopjpoX247wOlRBVLR0Tq6wBbrqC
         Mx7OCAqDPUu2f7BOupdw9lXA+NWTxc3uajHDiDx9YWRPm+wKJiVsm/nl89IT5pil9yam
         jgYekTqX9sAdaMIiCjuGIoehcaS2nPTjBel5ckqdQ0+wTPYMhREpzhMI4oxK6ur5T4az
         n5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535959; x=1793140759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zs2xoo/4TempeiMXzdPWlvTHYT3p4sEmS/zo1uLtk8s=;
        b=tzcJ+ZqECzT5tH/2u1K8Nh1sJXmTyzxBVlRCIzoo9myGJffNl2gnBgU6elE15hlmmM
         4OZgFKgCHEmmchSLVsdIju5eIwPc36r0Dx6w0SmNusuX4bINaNsEwyW9CLlJsESVOkRd
         6EtlZY5cfb7ETsueoNj5e8+xomeKJJ3eunHhQkQaOxm3l9Sf8AlCJSDT566UUYzriFex
         NAMHPt+cDDPmfr5zU9njQRczZsILxj4mFdzv3+tvMjYpBNs+U6AqnbN2MVF1PuekIOm+
         MMZAXfggoAHsZiikgcFlpDtIEbr3J/iGPf32jF4fXhnI6i9UK9sh8gTqSAA0RlUqHIAo
         SE5A==
X-Gm-Message-State: AFq9FYIDpuSTUyHvZh27ZiBjeREaDPvgio2PLGCq7ZZIICkQCn1yU0ql
	Y4ALSbp65ckAlSKo5tyiKzPFIFyRVKwOtLAQva5hPPW4ITnGXcyiaQPyp2T2lNa8ze1Kci3cB1f
	ohiTan6QrzmA2wBXPYe4uaWJTHhEhe/LXSTxtFXyC2G9Te4lt0E1BCDGgdIaBWrL4ag5KGXqkrW
	hWqpvFql/bCfjjkP5ywg==
X-Gm-Gg: AYBFou3PII/RiB84ean1DrsGeY8hfGqAdDTweX2Wxwt6ZokSvcShnW1vrKksWibO/gr
	Hb/qomm4CHi57NH0nnub9cHrX84cYM+BRqxmWBnYjc4OgBaWoA+bnsHvT2nmFMGdzJ9TDGV+BeC
	ft+Ehcm0wfSAryQwl7MZozWF/FKawGNyNMIewCzB9P9I0Bh3/+fhnVEtw72e81nzejzFPcjwwVX
	5VK2hKZb8A+BWfifPr9/QdR8TFe3j8CF+P1371d7te7WEjYeSyd7MhJOXCXSk2j9ixG6zTsuQGG
	KX4wznYBRBK0yW317neGmaGBI5poqs6UKPj5uNdCL8RY6PJyCDPIm1MjeAC7cbfAm5u12XLgB9Z
	l5+X56PGYFVqI9jooYNJ+mrP7AVO8QglufKSoDv+pCWjxDDSlnpBGF0//w1oAX/W3uTzuaEdjTx
	y0hNmMEPQmVgB80gbzxeoeZtqrolxR7FZE3EebKg==
X-Received: by 2002:a17:90b:4b11:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3ad86cd60a8mr241429a91.9.1792535958368;
        Tue, 20 Oct 2026 15:39:18 -0700 (PDT)
X-Received: by 2002:a17:90b:4b11:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3ad86cd60a8mr241415a91.9.1792535957882;
        Tue, 20 Oct 2026 15:39:17 -0700 (PDT)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad815e7f9asm1149152a91.17.2026.10.20.15.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:39:17 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: jose.quaresma@oss.qualcomm.com
Subject: [PATCH] checklayer: run bitbake once per machine for the machine tests
Date: Tue, 20 Oct 2026 22:39:10 +0000
Message-ID: <20261020223910.539165-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA5MCBTYWx0ZWRfX+zAU9yETifJz
 rCPyV4SB7UIz6iIrHZl8HVpIEMa9FR4u9N0aJb/wS+zVgyD0QKs0vIseoUMVa7jlnptMNeojJ46
 K+jeVCXcAqPFZ/+C6Vl6gE6qoaDhWM4mb89Rrm4KipypvJq/CLwuzTGC6D/4TsS+3gd+lDBkTfb
 ixjRyDyzOsDJsE10ivbIqZrXIQ6fItgYz2nWGhUQ+LpMnd4/ursgxEDtFIVhvFEd5I/QIPyPend
 Wn8rlGk6Fo10rpLVx2hkEh9hs6bjh+phtO3Gk8HEANAAaGmyzwJe522AXSL0PoO+8DkJxP56ZHJ
 yZD+hFPm8khNYqQCj3NSa5WsMC88+tPlB8UbRFeEVQ6OHDXqUEglDeeMB4FnXeW9c8yvyFTSs/M
 3tjemwlU2SVtsiBWjp86j5e4a52SrJ/Jm6APWgDMhybV16OzzxFMOuoNzYT/KOIozX5Mmt4kB4k
 SyKJvNul1vrdRRrleIQ==
X-Proofpoint-GUID: gZmve4UiuId0KV-7MytemmikiYR9pi-h
X-Proofpoint-ORIG-GUID: gZmve4UiuId0KV-7MytemmikiYR9pi-h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA5MCBTYWx0ZWRfXwwS6gxEjQFda
 Se25F3HKoT7oXGxpKLZdAAxCrhe+3NG2YJpmO3UkXvUpPkfNV+uQ3uNxM85gBrrGPFJ/Lf1Hcxc
 tAlz+yvIgKZhOsxS0wB9ckgNzGwQkM0=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad7ed97 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=fvEszTyUgsvutjo8:21 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BdNBxS9luIjZx7zHeNMA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 22:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248313
Content-Type: text/plain; charset="utf-8"

With --machines, test_machine_signatures and test_machine_world each
run "bitbake -S lockedsigs world" for every machine, with and without
-k. When world can be built, -k makes no difference and both runs give
the same signatures, so bitbake runs twice per machine for nothing. On
meta-qcom, which tests 24 machines, these two tests take 1665 s of the
1818 s of the check.

Cache the outcome of the run without -k on the test context, which is
created for every tested layer, so that whichever test comes first runs
bitbake and the other one reuses the result. When world can't be built,
test_machine_signatures still runs bitbake again with -k for the
signatures: get_signatures(failsafe=True) ignores the error of that
run, which test_machine_world needs, so one -k run can't serve both
tests. test_world and test_signatures have the same duplication without
a machine; that is left for a separate change.

Tested on meta-qcom (127450527f) with 16 bitbake threads, time in the
two tests: 24 machines 1664.8 s -> 969.9 s, three machines 229.9 s ->
140.5 s, with the same results and logs. Adding a machine that breaks
world, one with different zlib CFLAGS or one that doesn't parse to the
three machines gives the same verdicts and errors as before.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 scripts/lib/checklayer/cases/bsp.py | 11 +++++----
 scripts/lib/checklayer/context.py   | 35 +++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/checklayer/cases/bsp.py b/scripts/lib/checklayer/cases/bsp.py
index b76163fb56..e9472fd512 100644
--- a/scripts/lib/checklayer/cases/bsp.py
+++ b/scripts/lib/checklayer/cases/bsp.py
@@ -5,7 +5,7 @@
 
 import unittest
 
-from checklayer import LayerType, get_signatures, check_command, get_depgraph
+from checklayer import LayerType, check_command, get_depgraph
 from checklayer.case import OECheckLayerTestCase
 
 class BSPCheckLayer(OECheckLayerTestCase):
@@ -45,10 +45,9 @@ class BSPCheckLayer(OECheckLayerTestCase):
         msg = []
         for machine in self.td['machines']:
             # In contrast to test_machine_signatures() below, errors are fatal here.
-            try:
-                get_signatures(self.td['builddir'], failsafe=False, machine=machine)
-            except RuntimeError as ex:
-                msg.append(str(ex))
+            error = self.tc.world_error(machine)
+            if error is not None:
+                msg.append(str(error))
         if msg:
             msg.insert(0, 'The following machines broke a world build:')
             self.fail('\n'.join(msg))
@@ -80,7 +79,7 @@ class BSPCheckLayer(OECheckLayerTestCase):
         tunes = {}
         # Preserve ordering of machines as chosen by the user.
         for machine in self.td['machines']:
-            curr_sigs, tune2tasks = get_signatures(self.td['builddir'], failsafe=True, machine=machine)
+            curr_sigs, tune2tasks = self.tc.world_signatures(machine)
             # Invert the tune -> [tasks] mapping.
             tasks2tune = {}
             for tune, tasks in tune2tasks.items():
diff --git a/scripts/lib/checklayer/context.py b/scripts/lib/checklayer/context.py
index 4de8f668fd..19bd59a709 100644
--- a/scripts/lib/checklayer/context.py
+++ b/scripts/lib/checklayer/context.py
@@ -9,9 +9,44 @@ import glob
 import re
 
 from oeqa.core.context import OETestContext
+from checklayer import get_signatures
 
 class CheckLayerTestContext(OETestContext):
     def __init__(self, td=None, logger=None, layer=None, test_software_layer_signatures=True):
         super(CheckLayerTestContext, self).__init__(td, logger)
         self.layer = layer
         self.test_software_layer_signatures = test_software_layer_signatures
+        self._world_runs = {}
+
+    def _world_run(self, machine):
+        '''
+        Calls get_signatures(failsafe=False) once per machine and remembers
+        the outcome: the signatures, or the RuntimeError raised instead.
+        '''
+        if machine not in self._world_runs:
+            try:
+                self._world_runs[machine] = get_signatures(self.td['builddir'], failsafe=False, machine=machine)
+            except RuntimeError as ex:
+                self._world_runs[machine] = ex
+        return self._world_runs[machine]
+
+    def world_error(self, machine):
+        '''
+        Returns the RuntimeError that get_signatures(failsafe=False) raises
+        for the given machine, or None if world can be built.
+        '''
+        result = self._world_run(machine)
+        if isinstance(result, RuntimeError):
+            return result
+        return None
+
+    def world_signatures(self, machine):
+        '''
+        Returns (sigs, tune2tasks) like get_signatures(failsafe=True). When
+        world can be built, -k makes no difference, so the signatures of the
+        run without it are reused; otherwise bitbake runs again with -k.
+        '''
+        result = self._world_run(machine)
+        if isinstance(result, RuntimeError):
+            return get_signatures(self.td['builddir'], failsafe=True, machine=machine)
+        return result
-- 
2.43.0

