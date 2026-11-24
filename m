Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23040.1795540448125979991
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=L36RjBP/;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=IEPQ0z/P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFKxpV4123956
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t4MnyV/+aKV
	JAZHWuV/WpArtbfRp4Qy0TvmVpnCrqWM=; b=L36RjBP/a/BDLefxuHUAe+lEHfM
	R6Q8OcBG1QZl4/UxwaVK9qqUL5eVGemzjcYLI+xX64cm0nokC2Qx4zUGdIjrbVjE
	tH6jGoSOgTpyBl7TdZiX2DkiAGOEiGsxg+qresFpVebM7oMytghSZJIjWTanPKCd
	Egs4rfFTsu9d0S3Xj6YmGx1WF6rUovYEjlYjws8ubY6ftzsqVHUoSqe9Y3JvZ7V4
	nS+k3a5nTQ+0cInjX5ZLkADWKD6H7TMPbUMMhXm5tElOG/iLQH2vEkvVqqwT5oaU
	abS1cuYLkHCrPaqVYWt5smjqs6lcAZdMMLK7T+9eyzlLO3wfOU7VkY7dNug==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rhay8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:07 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b35b88aa94so59990627b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795540447; x=1796145247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4MnyV/+aKVJAZHWuV/WpArtbfRp4Qy0TvmVpnCrqWM=;
        b=IEPQ0z/PGopQkotI8mwlGQqgqAIGsJDwERn8EzIANY7XTYk5qqVSZ9zO+yfbpv63i0
         OL1M+4ppFINHYNdHUKjF2WjHgx7RYS8O3wlyBC50G2ltC/795c+1ACxfnDN7n3Djtk19
         Zfmc/rkuYT0gTi8xW0VsOqnrf+efZaJQ2+9SwQLv0t+g0i5YcDBbkrTYYWFqOsVJix20
         ejiLgtSqWTcTJFs8mtrfnZhgLnimM68MUyXbSKEekB5L55giDTJFjvkUHKus0uDIuNbq
         dMAiHNGBPOY+34yejhV3nG1SsoWL7+96jWqY0z3ozxmdyxmAeOq4MJS2wdsUMs4U8hjb
         oNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540447; x=1796145247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4MnyV/+aKVJAZHWuV/WpArtbfRp4Qy0TvmVpnCrqWM=;
        b=TBXGDfJIRQQX9C7BfdXljoktnbVj0Bv7iEyjUA6HdwIHTLOWjOk+xflN5Pvr0Uplz/
         QoIl/PYTeL7zfBPIyq0B6hOXZu3yWBJXa67A3q7SHvjwqIJMA7LWYDIUa9N+FG9B4XkT
         LqCRPEIuKJrLqC+kghjFyaAwiwWlRo08+AJcXZ3j6E/L18fsHP/yW2fEj8q7eQwLqMm0
         J9qvIR7I3X4W18sZXsFQ+1JelpSIWS/ChtnKcnGdBeateGv7naMzua6xqMRdIz5PiX0l
         DzKeNuvOMwoLwoLqrkzgCKizXEkK9vwqND6JMX0BCV4mUMTpArjlUnB+zih5YoFjp6AU
         NIgA==
X-Gm-Message-State: APuU4Z/GqkIOPWRqK+QpEXURbPgWr39bULL2xxNGSDmvlDeIo/lQxZFo
	1uc0rYxG3f+YUxjmv5vD0q7eTMb719mwME2H7b8iC1hKujPu/Jlw5eAO9mcNCELrx0DWBcV0IJP
	op/J9aKwnZ28Sa55vYXzQNVyBlnl5UfLnSUFvGLl4u3YjTrBHHin+xCmjs9FBK8z61mTYzXdmdF
	WpPnkD+L8FpywjlCRQ4Ilt
X-Gm-Gg: AZFdTZeznPlqpZwb8gYO3nWoj1ni7Sywq4nyLBhD/QfDe2rkClswSTWkokc6xT+Ukcw
	d+rZjysXFZQDNzlXxaCe7cPMOhyaFwrMgrxLxMmc3QRduZkWX1QSBDAyWP8xCbUjdOvGVAB202F
	F1PpIXY6IjzHzVyM8Sn3INYiJC0MlHAVAL/RlreELxCieiQyoLUVmRn/nfAtH6BwcRpbcq4pL9d
	3qlRxhcYBKNzza55RTMKLu/EYbC1lVIM1eOeyXSV18dnCuMjhwfggZ0jDyVQCd9EWgrlmeofEHC
	DOCJM+eN9qI08q2Lg/D16vz5XZTCC/CUUv00PtW2MqySFvLRWCW9lzWzXIBVi73tWNIFkPJEjE0
	HlkQn4jw7Mi9lU/390q2VY8pSSBooLzOkfWULmDEsqs8VIV+awGBuaTAVK2gUTNQ=
X-Received: by 2002:a05:690c:e3e7:b0:8b4:c1ef:94be with SMTP id 00721157ae682-8b520435b67mr54679937b3.19.1795540446757;
        Tue, 24 Nov 2026 09:14:06 -0800 (PST)
X-Received: by 2002:a05:690c:e3e7:b0:8b4:c1ef:94be with SMTP id 00721157ae682-8b520435b67mr54679807b3.19.1795540446165;
        Tue, 24 Nov 2026 09:14:06 -0800 (PST)
Received: from toster.lan ([185.228.162.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b33a596f9csm9632479f8f.12.2026.11.24.09.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:14:05 -0800 (PST)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>,
        Luciano Dittgen <luciano.dittgen@ossystems.com.br>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [RFC wrynose][PATCH 3/5] yocto-check-layer: Add --run-tests to select the tests to run
Date: Tue, 24 Nov 2026 17:13:49 +0000
Message-ID: <20261124171356.951415-4-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124171356.951415-1-jose.quaresma@oss.qualcomm.com>
References: <20261124171356.951415-1-jose.quaresma@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05c5df cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=qOKIifoFPMYe9XV0Ag7/Dg==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=alK4_DS-AAAA:8
 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=2V6DY6BgAAAA:8 a=sIxgEDDCWNsi49mcXwoA:9
 a=kA6IBgd4cpdPkAWqgNAz:22 a=rOCknGvZllDBBwZ8Yz5I:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=ldqKKs2zR4t-S6fqr-1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX1LBykUCLp67/
 gUIXVDaCVFrbPyIr+A6dkK67YaX6jyI0FQfq+iww1bLkmruK4TXuPPgR81XNllhLwXz9vGj9Cgb
 pkPWBXHBeMRPO8/fvOdsF2Ouqh8Vnw8=
X-Proofpoint-GUID: UoduvBq4JNqNdfavVc3SZ5OhQhbrzZmG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX/7xPdw9pIzlL
 SvWD1zaQT4/D79oxzIoSedITctXivgtBg6sjpcHALjJ7D/z+9RU/Njqp4Ab1AqHqOI5H6viwSlJ
 o/bTDYhSVpH5mUp+JUDZ9cACu2me6+76gqteHU3iLCfK6xNNmO/Ad7gJ2E2vC2VwRg8BnWUJZFI
 LnhIjB6EP38B1/1fcwUw0/RKKzKF0d9TIC0OH2xjzO/7wptVYOr2v/4VDAGPPbNrx7fcda26CiV
 efGn/UgqhNMpEEXcEp1SaESuKONleccZt75tMtP51IdJBeWzv832g+qOd6Usd4kja+UA9WGku88
 ewz1mHIArIzWfhu0eTkmupkFuwVblCMJwV7Wmii+pmcdBs6wk7oykPt1uI/otz2g74l/equ3gVY
 BPevTEggZzWjyNYASXzPnI6Nq6GFSRllK994RsD4oyXSkCaIRVROQ1hS1gIpkKGZFA6CnmlfV8e
 eXfhT/mUJDmykUygIpQ==
X-Proofpoint-ORIG-GUID: UoduvBq4JNqNdfavVc3SZ5OhQhbrzZmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251047
Content-Type: text/plain; charset="utf-8"

From: Otavio Salvador <otavio@ossystems.com.br>

The common and distro tests ignore --machines, so a BSP layer checked in
several runs, one per group of machines, repeats them in each. Add
--run-tests, taking <module>[.<class>[.<name>]] as oe-test does, so the
common tests can run once and only the BSP ones in the others. A name
matching no test is an error rather than a run that checked nothing.

Tested on meta-freescale with "--run-tests common distro" and
"--run-tests bsp --machines imx8mm-ddr4-evk imx8mn-ddr4-evk".

Suggested-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a72b58e99fcb3d873cabf0c29f07585fbd2de2e4)
Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 scripts/yocto-check-layer | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index ca4ada0f35..4634672162 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -32,14 +32,14 @@ CASES_PATHS = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
                 'lib', 'checklayer', 'cases')]
 logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
-def test_layer(td, layer, test_software_layer_signatures):
+def test_layer(td, layer, test_software_layer_signatures, run_tests):
     from checklayer.context import CheckLayerTestContext
     logger.info("Starting to analyze: %s" % layer['name'])
     logger.info('Distro: %s' % td['bbvars']["DISTRO"])
     logger.info("----------------------------------------------------------------------")
 
     tc = CheckLayerTestContext(td=td, logger=logger, layer=layer, test_software_layer_signatures=test_software_layer_signatures)
-    tc.loadTests(CASES_PATHS)
+    tc.loadTests(CASES_PATHS, modules=run_tests, modules_required=run_tests)
     return tc.runTests()
 
 def dump_layer_debug(layer):
@@ -86,6 +86,8 @@ def main():
                        help='check that software layers do not change signatures (on by default)')
     group.add_argument('--without-software-layer-signature-check', action='store_false', dest='test_software_layer_signatures',
                        help='disable signature checking for software layers')
+    parser.add_argument('--run-tests', nargs='+', metavar='TEST', default=[],
+            help='Tests to run, as <module>[.<class>[.<name>]] (default: all)')
     parser.add_argument('-n', '--no-auto', help='Disable auto layer discovery',
             action='store_true')
     parser.add_argument('-d', '--debug', help='Enable debug output',
@@ -235,7 +237,7 @@ def main():
             layers_tested = layers_tested + 1
             continue
 
-        result = test_layer(td, layer, args.test_software_layer_signatures)
+        result = test_layer(td, layer, args.test_software_layer_signatures, args.run_tests)
         results[layer['name']] = result
         results_status[layer['name']] = 'PASS' if results[layer['name']].wasSuccessful() else 'FAIL'
         layers_tested = layers_tested + 1
-- 
2.56.1

