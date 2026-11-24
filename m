Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23075.1795540451894278822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:14:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=A/4M5BG0;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=YeEXVD1o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFKtBG2569557
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p6qSq0b//wK
	5UUTRMSLfUuz6EkM1BGOEkezNedaaTY0=; b=A/4M5BG0A3iuQmIDD/n8kxTzeTg
	S6sMca2tdJCXUEw3WljhiRRq6lPH7w9uaVWzBtt1PDrenZmZTnxlFshmE1Tzwd6F
	JcZv7/GBvbLVTUJCbqQPgSeFaEy4KViZdSg2C5UnNO80fYV8cbNyM6jxCbTjI5EH
	tb3ZRAyCKHzL63dEtugsZAZPMbShomkVJ4GkczoUVcwB1hKCMqSTkIjwnq/gQy7z
	A7R6irSt6WjTwQIQY1qZlYUfHu6rrLLiuDiXiRYtIVTPzwvfX6vbBXHOeJyo3Vj2
	qVtDERa/WMYB82ySEcWrc1IKz+t20XbrTtb5mI7vEKFGoc5gK3BYYPBv82g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6svk9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92106c98714so99383336d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795540450; x=1796145250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6qSq0b//wK5UUTRMSLfUuz6EkM1BGOEkezNedaaTY0=;
        b=YeEXVD1oAzyMnDcp/wwdYa0zsmEHCYOfRb1nsnCGgLS4/DrH697jKHpafRPBgxCWnJ
         /Pqf5zPX24B19tnq9qefLTqyzIfOJYD8Sn1PzlRRyFrCsNuWoLojgFKOH80UqYc1vTnw
         2QS6Bg7ymCNgg55kFI2KXE8PFy2GJ2+JdNtc/UfRmnc1IlGVhe6Nt5Zau5hFNsKqw8Qf
         nM62VXAjdAAZ88Sf+AJNZCotXrMCdLDrgShfIoBIO65pQYK+VFxympkjTYh5qz7GaV6m
         xfSt+AwCng0FTkPMN02fyMkfPzNzQPzT6Cbysk1CWmrq0auYXf91yWMuo+9zt5jNxnaT
         2BGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540450; x=1796145250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6qSq0b//wK5UUTRMSLfUuz6EkM1BGOEkezNedaaTY0=;
        b=CsiPn0kZPkpuh4Ejw388sDvUivxMc7kkI7F/rK+UDioGvAcchiJ3TSYJt3QdF49Bqu
         1U8HU9T+YhgYpXifjwHvQdg8He4FWObA+odyHXyPhgidSlsYTr0wfsR62XPW53YAt5Np
         Y5nDEOiTYf4IkZc/m4g9Yl9cOn2axCslO0w4CmkbgFzakv0dZR+plY1X2p1MwpWAqJ6k
         sR97P0sbo5WKzogHGbaV2K+kroi5Py+pWnYEOBYhx7LilOyoztiurz6Z/aP5E4jOFwjo
         e9LQNZfJ/Fhgml2dSHkYtP6CTgob5giERs5xWW6AL0LoRuPhtc+R7mms8NY8PD/XDC1R
         hfLQ==
X-Gm-Message-State: APuU4Z+6gg2ZbfeVyI9oDqEvZ+vNsK9OVmgdx8dEp/LHkBwiZJXhWxgy
	e0BBgd9c/qQmAdTIpRdAlKzMbSFdUFxKipDjfKlESVIuZOSpd7AthZlPGV/AvCs7eCkip8f+/Tf
	E+cHBKkbO9gC0yk20JsWhqhSdPJ5Bzco/E8EdMK87AOGKoq2dJxpqQM6RuPNEZ2NtkGlFDegGa6
	TesGUlsui0dQt9Eug0jVFF
X-Gm-Gg: AZFdTZexlMt2ngO4zKKrQR5IOXpL9ccy1sQ0WvADNLk9dWOxS2/sKpMtc+XwVxkgPW3
	EULa1iGmGt513Cb3+CygdzLFDVMIhgM+vpBG5EmbXSj/9cmIXWuO6nh8levRFeEVqQDRUH6HIUj
	RkpUOIPx2zrrN1rPay82Cc6gPl6lpLli2rbSdimSfWxQKn2paCKJQx/Tn4T9rgyb+kBcrduuTIL
	405e7h7LidbE6pmxyJebOfvfdaQ7XZt3JJaJp11/q6c9twUo89GEiWXsUUkDh+QNZjL+fesShge
	ohwJGHKzOevX5FwNaawZ5D+FPvRPOS5teClnT2H1wuAujnAUWkh3bNSoGYObBhAQn8v2+Xdtegn
	SuHEx5LgwbMz9A0J1/snUh1+oTr5NSBrNPvL1C0aDwHne8dg2NUS9Ou08wqWLx5E=
X-Received: by 2002:a05:620a:28d5:b0:949:a623:515b with SMTP id af79cd13be357-949ba9c69c9mr2611572385a.22.1795540450192;
        Tue, 24 Nov 2026 09:14:10 -0800 (PST)
X-Received: by 2002:a05:620a:28d5:b0:949:a623:515b with SMTP id af79cd13be357-949ba9c69c9mr2611563685a.22.1795540449507;
        Tue, 24 Nov 2026 09:14:09 -0800 (PST)
Received: from toster.lan ([185.228.162.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b33a596f9csm9632479f8f.12.2026.11.24.09.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:14:08 -0800 (PST)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>,
        Luciano Dittgen <luciano.dittgen@ossystems.com.br>,
        Paul Barker <paul@pbarker.dev>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [RFC wrynose][PATCH 5/5] checklayer: Share each world signature dump between the tests needing it
Date: Tue, 24 Nov 2026 17:13:51 +0000
Message-ID: <20261124171356.951415-6-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124171356.951415-1-jose.quaresma@oss.qualcomm.com>
References: <20261124171356.951415-1-jose.quaresma@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xmFouT8A08TXpmfoJDuHiRtqf72Le9Fz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX85Hp3JCYJ9WA
 ci0It+chEGvAMzqKVrwHx90IYMpzdnfocZRCgc+GuDZTULc83h5BY2iEeXQErog/jvV/r3N0SIL
 3FtALrlILr8k4eZvTx7WE/gNCt/spcI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfXxTwh9ZhTv5QN
 VnUFMlNnxYAmRGfXCR50L4xD9C191YkIuStzNHL7iGDE6exdlvuJwy5h+YTLkJUpr/0p03En2gB
 EUuh8kfRHe13AAxngcJLHER4PZAT6pSJ0gugoPWGRd+DdoPr9w4E5OO3lSEnUN+9aD/nG32w42J
 cVENoGe8F+4dqLpQh9OxAfExrPZ5A5Nxi99dF5NRsp6RILJ5zXKJjbVuX+NjZCZNicZibg+AuET
 rHiVijgvMjr79DspY2IeeBPr2v9THThl3XJCDHEowZKiCxl5GD0+iOgdtH05Ynyy0864MVNFba2
 UaShBUhWc8tblWtRZzVS9D3fmhwj7Py+3VOK4hsl2QcX4uRfjuTU4f1x2jX2hC4eG0mSEubn/9R
 8ACsW8LY4dFvbr33BzJybn90sg29HUTZMvQeyjAY7sT5ELF42LsoN/aKUe6OsSmDAVo2ncwRHMH
 qDPrgRidRB2bvlvfePw==
X-Proofpoint-ORIG-GUID: xmFouT8A08TXpmfoJDuHiRtqf72Le9Fz
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b05c5e3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=qOKIifoFPMYe9XV0Ag7/Dg==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=alK4_DS-AAAA:8
 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=2V6DY6BgAAAA:8 a=TaT9bM_6USgai8DJsUMA:9
 a=OIgjcC2v60KrkQgK7BGD:22 a=rOCknGvZllDBBwZ8Yz5I:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=ldqKKs2zR4t-S6fqr-1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251049
Content-Type: text/plain; charset="utf-8"

From: Otavio Salvador <otavio@ossystems.com.br>

test_signatures and test_world dump the same world signatures, with and
without -k, and so do test_machine_signatures and test_machine_world for
each machine; when the dump succeeds, the second only repeats a world
parse. Make get_signatures() always run bitbake with -k and return the
error along with the signatures, and dump once in setUpClass(): for the
common tests, and per machine for the BSP ones. test_world and
test_machine_world check the stored error, the signature tests use the
stored signatures.

Tested on meta-freescale with two machines: 5 world dumps instead of 8,
same results; a recipe breaking world on one machine fails
test_machine_world for that machine only, now listing all its errors.

Suggested-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Suggested-by: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 530be0c29e906a312a61322e73e20309731c4569)
Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 scripts/lib/checklayer/__init__.py     | 28 +++++++++++++-------------
 scripts/lib/checklayer/cases/bsp.py    | 15 +++++++++-----
 scripts/lib/checklayer/cases/common.py | 20 +++++++++++-------
 scripts/yocto-check-layer              |  4 +++-
 4 files changed, 40 insertions(+), 27 deletions(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index aa19a8e2ae..9d79ae9cd0 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -287,7 +287,12 @@ def check_command(error_msg, cmd, cwd=None):
         raise RuntimeError(msg)
     return output
 
-def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
+def get_signatures(builddir, machine=None, extravars=None):
+    '''
+    Returns the world signatures, the tasks of each tune and None, or the
+    error when some recipes failed, with the signatures of the others
+    (None when none were written).
+    '''
     import re
 
     # some recipes needs to be excluded like meta-world-pkgdata
@@ -304,25 +309,20 @@ def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
         cmd += ' '
     if machine:
         cmd += 'MACHINE=%s ' % machine
-    cmd += 'bitbake '
-    if failsafe:
-        cmd += '-k '
-    cmd += '-S lockedsigs world'
+    cmd += 'bitbake -k -S lockedsigs world'
     sigs_file = os.path.join(builddir, 'locked-sigs.inc')
     if os.path.exists(sigs_file):
         os.unlink(sigs_file)
+    error = None
     try:
         check_command('Generating signatures failed. This might be due to some parse error and/or general layer incompatibilities.',
                       cmd, builddir)
     except RuntimeError as ex:
-        if failsafe and os.path.exists(sigs_file):
-            # Ignore the error here. Most likely some recipes active
-            # in a world build lack some dependencies. There is a
-            # separate test_machine_world_build which exposes the
-            # failure.
-            pass
-        else:
-            raise
+        # Most likely some recipes active in a world build lack some
+        # dependencies: the caller decides whether that is fatal.
+        error = str(ex)
+        if not os.path.exists(sigs_file):
+            return (None, None, error)
 
     sig_regex = re.compile(r"^(?P<task>[^:]*:[^:]*):(?P<hash>[^:]*) .$")
     assignment_regex = re.compile(r"^\s*(?P<var>\S+)\s*\+?=")
@@ -362,7 +362,7 @@ def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
     if not sigs:
         raise RuntimeError('Can\'t load signatures from %s' % sigs_file)
 
-    return (sigs, tune2tasks)
+    return (sigs, tune2tasks, error)
 
 def get_depgraph(targets=['world'], failsafe=False):
     '''
diff --git a/scripts/lib/checklayer/cases/bsp.py b/scripts/lib/checklayer/cases/bsp.py
index b76163fb56..6bf04b5b00 100644
--- a/scripts/lib/checklayer/cases/bsp.py
+++ b/scripts/lib/checklayer/cases/bsp.py
@@ -14,6 +14,10 @@ class BSPCheckLayer(OECheckLayerTestCase):
         if self.tc.layer['type'] not in (LayerType.BSP, LayerType.CORE):
             raise unittest.SkipTest("BSPCheckLayer: Layer %s isn't BSP one." %\
                 self.tc.layer['name'])
+        # test_machine_world and test_machine_signatures share one world
+        # dump per machine
+        self.machine_sigs = {machine: get_signatures(self.td['builddir'], machine=machine)
+                             for machine in self.td['machines'] or []}
 
     def test_bsp_defines_machines(self):
         self.assertTrue(self.tc.layer['conf']['machines'], 
@@ -45,10 +49,9 @@ class BSPCheckLayer(OECheckLayerTestCase):
         msg = []
         for machine in self.td['machines']:
             # In contrast to test_machine_signatures() below, errors are fatal here.
-            try:
-                get_signatures(self.td['builddir'], failsafe=False, machine=machine)
-            except RuntimeError as ex:
-                msg.append(str(ex))
+            error = self.machine_sigs[machine][2]
+            if error:
+                msg.append(error)
         if msg:
             msg.insert(0, 'The following machines broke a world build:')
             self.fail('\n'.join(msg))
@@ -80,7 +83,9 @@ class BSPCheckLayer(OECheckLayerTestCase):
         tunes = {}
         # Preserve ordering of machines as chosen by the user.
         for machine in self.td['machines']:
-            curr_sigs, tune2tasks = get_signatures(self.td['builddir'], failsafe=True, machine=machine)
+            curr_sigs, tune2tasks, error = self.machine_sigs[machine]
+            if curr_sigs is None:
+                raise RuntimeError(error)
             # Invert the tune -> [tasks] mapping.
             tasks2tune = {}
             for tune, tasks in tune2tasks.items():
diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index d20559e163..812bb6e637 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -11,6 +11,11 @@ from checklayer import get_signatures, LayerType, check_command, compare_signatu
 from checklayer.case import OECheckLayerTestCase
 
 class CommonCheckLayer(OECheckLayerTestCase):
+    @classmethod
+    def setUpClass(cls):
+        # test_world and test_signatures share one world dump
+        cls.world_sigs, _, cls.world_error = get_signatures(cls.td['builddir'])
+
     def test_readme(self):
         """
         Test that the layer contains a valid README file and that is meets
@@ -98,7 +103,8 @@ class CommonCheckLayer(OECheckLayerTestCase):
         are not actually buildable, so here we fail when "bitbake -S none world"
         fails.
         '''
-        get_signatures(self.td['builddir'], failsafe=False)
+        if self.world_error:
+            raise RuntimeError(self.world_error)
 
     def test_world_inherit_class(self):
         '''
@@ -106,10 +112,9 @@ class CommonCheckLayer(OECheckLayerTestCase):
         class, which can do additional per-recipe test cases.
         '''
         msg = []
-        try:
-            get_signatures(self.td['builddir'], failsafe=False, machine=None, extravars='BB_ENV_PASSTHROUGH_ADDITIONS="$BB_ENV_PASSTHROUGH_ADDITIONS INHERIT" INHERIT="yocto-check-layer"')
-        except RuntimeError as ex:
-            msg.append(str(ex))
+        _, _, error = get_signatures(self.td['builddir'], machine=None, extravars='BB_ENV_PASSTHROUGH_ADDITIONS="$BB_ENV_PASSTHROUGH_ADDITIONS INHERIT" INHERIT="yocto-check-layer"')
+        if error:
+            msg.append(error)
         if msg:
             msg.insert(0, 'Layer %s failed additional checks from yocto-check-layer.bbclass\nSee below log for specific recipe parsing errors:\n' % \
                 self.tc.layer['name'])
@@ -135,8 +140,9 @@ class CommonCheckLayer(OECheckLayerTestCase):
             raise unittest.SkipTest("Not testing for signature changes in a software layer %s." \
                      % self.tc.layer['name'])
 
-        curr_sigs, _ = get_signatures(self.td['builddir'], failsafe=True)
-        msg = compare_signatures(self.td['sigs'], curr_sigs)
+        if self.world_sigs is None:
+            raise RuntimeError(self.world_error)
+        msg = compare_signatures(self.td['sigs'], self.world_sigs)
         if msg is not None:
             self.fail('Adding layer %s changed signatures.\n%s' % (self.tc.layer['name'], msg))
 
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 4017b3a251..9b00bf5b8f 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -223,7 +223,9 @@ def main():
         try:
             # Only test_signatures, a common test, compares against them
             if not args.run_tests or 'common' in [t.split('.')[0] for t in args.run_tests]:
-                td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
+                td['sigs'], td['tunetasks'], error = get_signatures(td['builddir'])
+                if error:
+                    raise RuntimeError(error)
         except RuntimeError as e:
             logger.info(str(e))
             results[layer['name']] = None
-- 
2.56.1

