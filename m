Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9552CA1013
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 02:55:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7038.1758250498526324392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 19:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N/Zqwfun;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1357189f71=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J2W3mf404275
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 02:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=/10os94uynt8OiB6lKn87KeyFeosYF1uA0NY6t3WZFM=; b=N/ZqwfuntW7O
	sCD/GytNmrhPut9InrEP9Uf/gx+Rnqem/s0Zqo/88CEDCDSFRySiFbi6ew7G0jnT
	ozjFHfJ2v3OUiTaFGOHL3FV8i/Te3Id5Wy85j9ETT4VUda3Vd5DL3n+YqqPLmfST
	Xi6x2wdzwOLYyp3JaeO9WHDikd+lYbcW6mVPe3OCQtP8d6wo0Dr82pPGjvmHEYI8
	vCRw5b1wqjNGyP+pAHPFxNZbO5Azv6zcHLyRVkEY4LZmkVQHkcRbhLjANOE5ffs6
	Mz18DZqN/MbvKWcFQrU2mMyRljzRoHCNIDcENsaOP4G27Sta9r45ykigqXz3Nrdq
	PjGQWiyIxw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vjw0381-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 02:54:57 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 18 Sep 2025 19:54:55 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 18 Sep 2025 19:54:55 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] openssl: 3.4.2 -> 3.5.2
Date: Thu, 18 Sep 2025 19:55:08 -0700
Message-ID: <c33930b39db477506067200c5c4f19cec0079b95.1758250424.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1758250424.git.liezhi.yang@windriver.com>
References: <cover.1758250424.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Hrt2G1TS c=1 sm=1 tr=0 ts=68ccc601 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=6fmMop8zc46llk8Z3TIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: UoqEJ5CyKd1o5AXakiJgo08qEG9ZIEGI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDAyNSBTYWx0ZWRfXymfzDkGv2/4L
 kZ8nrKmZ5PKxD1Kj0kEAjtzGIQyAQgbHZI4WBdMdO5TN8NOi3KhN4lDpFoBrRVD+FyN41uN2O/9
 OGQwYSZD/uDkuMUeByJcGRD0FZBeesPljs7ElYbJpuG4nxKjkzKEldOM1ynMSNQeDtQg/nGUwwO
 LOT/O5Ddrh4HwPttHgJ7fdSKaCuNxEUwLRXx8gGOm0tBlx90spDydV2hsEI8PQvbDWoksI8s9HT
 AcOFuodwwbjOXiFZyAVSlnux+EmeFcCPn0KYxtpErQUw8haDHeOoJRIYmit75EVEeI1R7Y62MkB
 DUJiZ99/W9L/dq+MDY41SNLXTyewS45mxJu/2/TQ/ER/upGaMNka6hfmfzZklE=
X-Proofpoint-GUID: UoqEJ5CyKd1o5AXakiJgo08qEG9ZIEGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 02:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223718

From: Robert Yang <liezhi.yang@windriver.com>

The benefit of OpenSSL 3.5 is that it is an LTS supported to 2030, which can
save the maintenance time in the long run.

* New features:
  - Support for PQC algorithms (ML-KEM, ML-DSA and SLH-DSA)
  - Support for server side QUIC (RFC 9000)
  - Support for 3rd party QUIC stacks including 0-RTT support
  - Support added for opaque symmetric key objects (EVP_SKEY)
  - A new configuration option no-tls-deprecated-ec to disable support for TLS
    groups deprecated in RFC8422
  - A new configuration option enable-fips-jitter to make the FIPS provider to
    use the JITTER seed source
  - Support for central key generation in CMP
  - Support for multiple TLS keyshares and improved TLS key establishment group
    configurability
  - API support for pipelining in provided cipher algorithms

  - The full list of changes since OpenSSL 3.4:
    https://github.com/openssl/openssl/blob/openssl-3.5/CHANGES.md#openssl-35

* Test info
$ bitbake world core-image-sato core-image-minimal

Works well

$ runqemu tmp/deploy/images/qemux86-64/core-image-sato-qemux86-64.rootfs.qemuboot.conf nographic kvm
$ ptest-runner openssl
All tests successful.
Files=341, Tests=4466, 206 wallclock secs (16.53 usr  1.34 sys + 582.73 cusr 109.85 csys = 710.45 CPU)
Result: PASS
DURATION: 206
END: /usr/lib/openssl/ptest
2025-09-18T10:17
STOP: ptest-runner
TOTAL: 1 FAIL: 0

All tests successful, the similar results to minimal image.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../openssl/{openssl_3.4.2.bb => openssl_3.5.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.4.2.bb => openssl_3.5.2.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.4.2.bb b/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.4.2.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.2.bb
index 2998e37e758..cd0d22e48ad 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.4.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "17b02459fc28be415470cccaae7434f3496cac1306b86b52c83886580e82834c"
+SRC_URI[sha256sum] = "c53a47e5e441c930c3928cf7bf6fb00e5d129b630e0aa873b08258656e7345ec"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.49.0


