Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1F7CAC5A0
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 02:55:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7037.1758250498077798506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 19:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UNlQwXbx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1357189f71=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J2W3me404275
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 02:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=iOUENefy74JVpIUQk+wx
	06NN/owkoYmQGxc/TEScbPo=; b=UNlQwXbxIpzBfADP9T3My+5rkaTfm34a3TSs
	Z469gfp+qkZWoDl5Awr8anNj18ASIbbJ9zQTC/qELAAtMJx5a5xi6cCVqIb8Dswp
	Y04uFA8qNe9DQEEYglp0JbuB9RRdH6irFWjvclHBvk7HSPzP6i8YFl9uamCruQNF
	KZsob7WFbgXQ0nMxLVg7E4L8W5pOInG0rYTk0wsH6DMUur3Wn3kR815kUztCbESY
	ygWr2kz3qhDDx0HlcNo/xAbkpmqxkX//qoT1QWjMFnKWS5eHrZwYidm5ESFkb7ZW
	mlTvny7kWvnRiRWEmc/zz/JNNeWPm9Y1RcZf1BkT3x2576dcIA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vjw0381-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 02:54:56 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 18 Sep 2025 19:54:55 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 18 Sep 2025 19:54:55 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 0/1] openssl: 3.4.2 -> 3.5.2
Date: Thu, 18 Sep 2025 19:55:07 -0700
Message-ID: <cover.1758250424.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Hrt2G1TS c=1 sm=1 tr=0 ts=68ccc601 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=iI3V-C70qVcyW01IOVgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Mkcce3qL7j4A7mlaIaHIcLjCBLtPxxHr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDAyNSBTYWx0ZWRfX/tf8nbj96VTK
 MJyH9Iqw4QbhIggweHtyY9DdXy3x6lFLMRQE3da9A8OO5tsbidmMTcM7PUpZ7jMO9qu2QSRR9Fs
 yorN9xJDMuMavTkOSrOe45/6H5XYABAjbpWuFPZsVHopzD7Fm33LjH9YOioQ6E5kvmRyfgzD3TR
 ONAyxlRLb2l7bNqUCRdSnL/bvON9PU+vjH9lWeN+7cwkks2ZGvLYvD801oV7+IYGS20FyWJa0Hp
 Zxov3X4N2xYj74cSjcQ8CgQ0KlJeqEayDui0OVIF/5tIZpqQF9LnTOHH4xTK767iKU5n/Hqeneo
 f8pVvgdVTUr9Um0Ogh7PEgfCsU+rReJ+d3uzfmhGJKBMjvtvuLiYGERJbIk0Pw=
X-Proofpoint-GUID: Mkcce3qL7j4A7mlaIaHIcLjCBLtPxxHr
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223717

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

// Robert


The following changes since commit 575a4316f661392eb73d1d97300511e2bca24ada:

  rust-target-config: Add has-thread-local option (2025-09-02 10:15:23 -0700)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/openssl
  https://github.com/robertlinux/yocto/tree/rbt/openssl

Robert Yang (1):
  openssl: 3.4.2 -> 3.5.2

 .../openssl/{openssl_3.4.2.bb => openssl_3.5.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.4.2.bb => openssl_3.5.2.bb} (99%)

-- 
2.49.0


