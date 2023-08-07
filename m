Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD85C001B0
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 17:24:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.40902.1691429076601986343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 10:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sjGyAhJ3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7583fd2801=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 377FStwt023153
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Aug 2023 10:24:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=gpn5t
	ZjNEXeynOENV8VxikkoWCv62sR9w8ZyLZGlLg4=; b=sjGyAhJ3AvLQwheA7XOVs
	94pWn7CyWnKjvZRMaXZHAn49eM59YtASvEewbcVoYn/szz8X+kPOeVmp1QpNJu7I
	uk+kT5j6bxAvxFDYYnrBlVPb1O0oFMI2L5MqkSV9qxofST+PN1Qua1j/lk+u5rLp
	hV9hxHY7xHjeRuCivq3tNaRVYpST2jjkgknoRCgQWV3uiE6/x9HMvdkAwOgR98cG
	WJwiDzWi7CcFJuvA1lrQ6rbrhlrI/mhDFEIg6+W+ARxzieRJuF/galZi+tfG5dpL
	HsDKmCSEbRFvqi/uFjy6qut2FPH4YfPRPNxpSK8J3P86k64W7Qxn1NXUjWJCtdcP
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9nxfhgvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 10:24:36 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 10:24:34 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core]mickledore][PATCH 1/1] bind: upgrade 9.18.5 -> 9.18.16
Date: Mon, 7 Aug 2023 17:24:14 +0000
Message-ID: <20230807172414.3219478-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: WpAkQZhrozFPMM4HhZHD643ihLracNoQ
X-Proofpoint-ORIG-GUID: WpAkQZhrozFPMM4HhZHD643ihLracNoQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_19,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308070160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 17:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185615

Remove --enable-epoll  and  --disable-devpoll configuration option as these are removed in bind-9.18.16
    6b6076c882: Remove obsolete epoll/kqueue/devpoll configure options
Ref:
https://github.com/isc-projects/bind9/commit/6b6076c882a00028197b04a827f6cf8e7a5369de

Security fixes:
https://nvd.nist.gov/vuln/detail/CVE-2023-2828
https://nvd.nist.gov/vuln/detail/CVE-2023-2911

Changelog:
https://github.com/isc-projects/bind9/blob/v9.18.16/CHANGES
https://bind9.readthedocs.io/en/v9.18.16/notes.html#notes-for-bind-9-18-16

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch             | 0
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
 .../bind/{bind-9.18.15 => bind-9.18.16}/bind9                 | 0
 .../bind/{bind-9.18.15 => bind-9.18.16}/conf.patch            | 0
 .../bind/{bind-9.18.15 => bind-9.18.16}/generate-rndc-key.sh  | 0
 .../init.d-add-support-for-read-only-rootfs.patch             | 0
 .../make-etc-initd-bind-stop-work.patch                       | 0
 .../bind/{bind-9.18.15 => bind-9.18.16}/named.service         | 0
 .../bind/{bind_9.18.15.bb => bind_9.18.16.bb}                 | 4 ++--
 10 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.15.bb => bind_9.18.16.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.16/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/bind9 b/meta/recipes-connectivity/bind/bind-9.18.16/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.16/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.16/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.16/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.16/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.16/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.16/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.16/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/named.service b/meta/recipes-connectivity/bind/bind-9.18.16/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.15/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.16/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.15.bb b/meta/recipes-connectivity/bind/bind_9.18.16.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.18.15.bb
rename to meta/recipes-connectivity/bind/bind_9.18.16.bb
index 80164aad87..1b1649566a 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.15.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.16.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "28ae8db14862801bc2bd4fd820db00667d3f1ff9ae9cc2d06a0ef7810fed7a4e"
+SRC_URI[sha256sum] = "c88234fe07ee75c3c8a9e59152fee64b714643de8e22cf98da3db4d0b57e0775"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
@@ -39,7 +39,7 @@ PACKAGECONFIG[readline] = "--with-readline=readline,,readline"
 PACKAGECONFIG[libedit] = "--with-readline=libedit,,libedit"
 PACKAGECONFIG[dns-over-http] = "--enable-doh,--disable-doh,nghttp2"
 
-EXTRA_OECONF = " --disable-devpoll --disable-auto-validation --enable-epoll \
+EXTRA_OECONF = " --disable-auto-validation \
                  --with-gssapi=no --with-lmdb=no --with-zlib \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_DIR_HOST}${prefix} \
-- 
2.40.0


