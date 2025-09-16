Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C235CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 04:10:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11323.1757995847364233297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 21:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Mqt54dHr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13540941b7=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G3Fxux1248862
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 21:10:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=RUu+lDKvdAU8kz17sr5yCV8cS4Fc+Ow+h/4J9/OuJnY=; b=Mqt54dHrXwKV
	NIr/KgkCpVBGdW+bY1vSV8k7ncNI0HYdSwJp2qYO7VWSMXbcnd8ckHlJgQovci1E
	4gGk/mqI5S4tCsSG2ToCOLOHysnk7tnoL9d6bxxKeZIJEUvWkzcnZsrG1m2BI/Lo
	jPyLgEQa9TszYshJVoj0bmSvPnZzqGOUToSvUGXtvubIn9v0UCONWCxcbVDFh75H
	5nva9t+poICDncuePsYyjCdprp9P83zfRllMze1n0SwCdm+3D8hzjJCeyxNPbY5i
	+TBnGS/UNw8ccnsGDA6rKs01wwd+cbmZ2iqeRHvK67OUmvOXapITOsTh+e2XPIpD
	MIuHlHJLFw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49584hjjj8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 21:10:46 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 21:10:46 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 21:10:46 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] nfs-utils: 2.8.3 -> 2.8.4
Date: Mon, 15 Sep 2025 21:10:56 -0700
Message-ID: <48b253e8cf9b0fbd50990d91b8a269d66103e197.1757995760.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1757995760.git.liezhi.yang@windriver.com>
References: <cover.1757995760.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Pbj/hjhd c=1 sm=1 tr=0 ts=68c8e346 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=CCpqsmhAAAAA:8 a=P6JkxrBpAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=RHmwHhP9esYY6eFHOTMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22
 a=dwOG0T2NmQ8MtARghG3a:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAzOCBTYWx0ZWRfX4eSMh00ibcSP
 VjkjgMZ3C+6usEsLnc7Io/9XmCNMM6Tbqpv0SQN2awUFpKb0Le0tU6Z3ARPMHTyayMKE3gi8GC9
 cD3mytLDNh5dK8VHDCxu8b4hOZaMO2pbhyYpT9sO/Iez0SrHp/QCEOSGNqSkWdCR8nuXTksq2fy
 KWTMuhR7ZTsD3/kZO24/d/73CFPJFEBvTQ3fXzK1mztvvXfWPVI7M4h6sqE2iY7MIKJbR+CgBxB
 h/zZ9SL2uzYXi8auxgDH9ZfJzFs3jNiF0F23XJEkS0cZCWuk55xM9tT24fGmaiuxBhpgKncU9AA
 nl776QPWnkTfB19bTYZ7kqSL/NhJ/BZwtnJ+05nWRph8AIoL83Oda5rZZsiNEU=
X-Proofpoint-GUID: tu-XyUJFYESFGopOBw5Dextw64pivFSI
X-Proofpoint-ORIG-GUID: tu-XyUJFYESFGopOBw5Dextw64pivFSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58G3Fxux1248862
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 04:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223525

From: Robert Yang <liezhi.yang@windriver.com>

* Remove backported patch 0002-Fix-build-with-glibc-2.42.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0002-Fix-build-with-glibc-2.42.patch      | 57 -------------------
 ...{nfs-utils_2.8.3.bb =3D> nfs-utils_2.8.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 59 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Fi=
x-build-with-glibc-2.42.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.3.bb =3D> nfs-=
utils_2.8.4.bb} (97%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Fix-build=
-with-glibc-2.42.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/00=
02-Fix-build-with-glibc-2.42.patch
deleted file mode 100644
index 0b22511873..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Fix-build-with-g=
libc-2.42.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From d74ef9afacf9dc4a067a2f984f52ad136fb46c31 Mon Sep 17 00:00:00 2001
-From: Yaakov Selkowitz <yselkowi@redhat.com>
-Date: Fri, 27 Jun 2025 04:54:08 -0500
-Subject: [PATCH] Fix build with glibc-2.42
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-exportfs.c: In function =C3=A2=C2=80=C2=98release_lockfile=C3=A2=C2=80=C2=
=99:
-exportfs.c:83:17: error: ignoring return value of =C3=A2=C2=80=C2=98lock=
f=C3=A2=C2=80=C2=99 declared with attribute =C3=A2=C2=80=C2=98warn_unused=
_result=C3=A2=C2=80=C2=99 [-Werror=3Dunused-result]
-   83 |                 lockf(_lockfd, F_ULOCK, 0);
-      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
-exportfs.c: In function =C3=A2=C2=80=C2=98grab_lockfile=C3=A2=C2=80=C2=99=
:
-exportfs.c:77:17: error: ignoring return value of =C3=A2=C2=80=C2=98lock=
f=C3=A2=C2=80=C2=99 declared with attribute =C3=A2=C2=80=C2=98warn_unused=
_result=C3=A2=C2=80=C2=99 [-Werror=3Dunused-result]
-   77 |                 lockf(_lockfd, F_LOCK, 0);
-      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
-
-lockf is now marked with attribute warn_unused_result:
-
-https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3Df3c82fc1b41=
261f582f5f9fa12f74af9bcbc88f9
-
-Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/nfs-uti=
ls.git;a=3Dcommit;h=3D9f974046c37b7c28705d5558328759fff708b1cb]
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- utils/exportfs/exportfs.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c
-index b03a047..748c38e 100644
---- a/utils/exportfs/exportfs.c
-+++ b/utils/exportfs/exportfs.c
-@@ -74,13 +74,19 @@ grab_lockfile(void)
- {
- 	_lockfd =3D open(lockfile, O_CREAT|O_RDWR, 0666);
- 	if (_lockfd !=3D -1)
--		lockf(_lockfd, F_LOCK, 0);
-+		if (lockf(_lockfd, F_LOCK, 0) !=3D 0) {
-+			xlog_warn("%s: lockf() failed: errno %d (%s)",
-+			__func__, errno, strerror(errno));
-+		}
- }
- static void
- release_lockfile(void)
- {
- 	if (_lockfd !=3D -1) {
--		lockf(_lockfd, F_ULOCK, 0);
-+		if (lockf(_lockfd, F_ULOCK, 0) !=3D 0) {
-+			xlog_warn("%s: lockf() failed: errno %d (%s)",
-+			__func__, errno, strerror(errno));
-+		}
- 		close(_lockfd);
- 		_lockfd =3D -1;
- 	}
---=20
-2.43.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
similarity index 97%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
index 039090df72..b68a55edcd 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
@@ -22,12 +22,11 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/nfs-util=
s/${PV}/nfs-utils-${PV}.tar.x
            file://nfsserver \
            file://nfscommon \
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch=
 \
-           file://0002-Fix-build-with-glibc-2.42.patch \
            file://0004-Use-nogroup-for-nobody-group.patch \
            file://0005-find-OE-provided-Kerberos.patch \
            "
=20
-SRC_URI[sha256sum] =3D "11e7c5847a8423a72931c865bd9296e7fd56ff270a795a84=
9183900961711725"
+SRC_URI[sha256sum] =3D "11c4cc598a434d7d340bad3e072a373ba1dcc2c49f855d44=
b202222b78ecdbf5"
=20
 # Only kernel-module-nfsd is required here (but can be built-in)  - the =
nfsd module will
 # pull in the remainder of the dependencies.
--=20
2.49.0


