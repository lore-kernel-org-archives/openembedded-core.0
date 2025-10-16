Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79866CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 07:42:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2941.1760600566865753820
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 00:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dt2Bjy7M;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23841fb33c=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59G1T3Tl3896191;
	Thu, 16 Oct 2025 07:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=/n24rMP6cz8ZgOvjXVEIFLnXGMSOdZqZDRLNrZNwsyw=; b=dt2Bjy7MOLGe
	fMUdAEIS5bRQv7MEqdRAvKreYebQ9u2CRbUDf7MSzGoaBOgDfRN3Bxewz6Xw5sXg
	OUbzCPVAoDnAkf0Satx4foTZ9yBO/1ru2w0OhLGxlvGTehMZba3Wwf+uiWJMcrEn
	Wkm75fuhQXhDiPW4crZeWnLz6O0/5ylEq9yE8QVZwHoQAZISj/dQ0a04lzTbHzm1
	3wr0gZgs4zNJJUzc7jx6uwwJc/vFBPkKu1JX9wesNeAoWtrGsb60dZZPCQ4HKKF0
	YEL2etu4PvAKLesP3jn+boTbpaja+btOmUTaqOnuXBq0HqO+cFKCgD/oC7s2K/nV
	Nv1Z20VuBA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewp1bc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Oct 2025 07:42:44 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 16 Oct 2025 00:42:43 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 16 Oct 2025 00:42:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <mathieu.dubois-briand@bootlin.com>,
        <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/2] libxml2: upgrade 2.14.6 -> 2.15.0
Date: Thu, 16 Oct 2025 15:42:40 +0800
Message-ID: <20251016074240.2464360-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016074240.2464360-1-hongxu.jia@windriver.com>
References: <20251016074240.2464360-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PwBEldCxnLRYKrnyCwZhQ6A2tbmVJDdt
X-Proofpoint-ORIG-GUID: PwBEldCxnLRYKrnyCwZhQ6A2tbmVJDdt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA1OSBTYWx0ZWRfX1Kkd2oywIFzs
 P1O7ZzrukRgXLckylJeqj3xlztEiziXmn7XIYzddJ7GOAyJUnIwo68f0Rf66QVO41SChGn5fiXT
 a8KRwcJCoptTnPiti7H1XDapJKsBcAcp6fTNB7Mvtgu4p/MQkak5TJTAPZuxdBge+LacSkKw/dO
 hEyMj2Fx/yHMc5LgbsN7o8D2CFgd2HCjEKX1sTsSj6YTmho5pbDPjnBmt38+1QezdLfDxmIncf7
 QBBcuGGiEaAu7uMpwv5EDuSSyksw7TToCVJxQAg7vT8sipZcyaNlTUYbghSLhM/vmKi9GsOcE7o
 hJHt+HHaJsYSHYEEyduWY+PAJCAqOrdObZrfx+KKOvIhc4Zxq1oAdftmJ3ew2B73UI8MOrokt2H
 hIg2aMPswvsiVngC/8kedtd+/weZ2A==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68f0a1f4 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20
 a=Z5getJ8MAAAA:20 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8 a=isp07eLyWszCQwSOGOwA:9
 a=m9p5bXcFLgAA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=yULaImgL6KKpOYXvFmjq:22
 a=CTwFTDRtctY-zZ8oRDn3:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=UDnyf2zBuKT2w-IlGP_r:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510160059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 07:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224951

Due to upstream [Remove LZMA support][1], drop option --without-lzma

Due to upstream [disable python bindings by default][2] and are
planned to be removed in the 2.16 release[3][4]. If we still enable
python bindings by --with-python=yes, due to upstream [doc: Build docs
with Doxygen and xsltproc][5], build python binding requires doxygen
otherwise build will fail, and we do not provide doxygen in oe-core,
so remove python package directly.

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf123eb7358690c214b0b
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/fa931566d2f541d3162c7b98c8a12e6b2a6ae542
[3] https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.news
[4] https://gitlab.gnome.org/GNOME/libxml2/-/issues/891
[5] https://gitlab.gnome.org/GNOME/libxml2/-/commit/bbe5827c94cc9b0e393ff3e6eef6dec2376317e2

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{libxml2_2.14.6.bb => libxml2_2.15.0.bb}  | 26 +++++--------------
 1 file changed, 6 insertions(+), 20 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.14.6.bb => libxml2_2.15.0.bb} (78%)

diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb b/meta/recipes-core/libxml/libxml2_2.15.0.bb
similarity index 78%
rename from meta/recipes-core/libxml/libxml2_2.14.6.bb
rename to meta/recipes-core/libxml/libxml2_2.15.0.bb
index 6ed8760f4c..6dbe1c16fc 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.0.bb
@@ -21,26 +21,18 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-6021.patch \
            "
 
-SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"
+SRC_URI[archive.sha256sum] = "5abc766497c5b1d6d99231f662e30c99402a90d03b06c67b62d6c1179dedd561"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
 
 BINCONFIG = "${bindir}/xml2-config"
 
-PACKAGECONFIG ??= "python"
-PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3"
-
 inherit autotools pkgconfig binconfig-disabled ptest
 
-inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
-
 LDFLAGS:append:riscv64 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', ' -fuse-ld=bfd', '', d)}"
 
-RDEPENDS:${PN}-ptest += "bash make locale-base-en-us ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
-
-RDEPENDS:${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
-
+RDEPENDS:${PN}-ptest += "bash make locale-base-en-us"
 RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-ebcdic-us \
                                            glibc-gconv-ibm1141 \
@@ -49,10 +41,10 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-ebcdic-us \
                                          "
 
 # WARNING: zlib is required for RPM use
-EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --with-c14n --without-lzma"
-EXTRA_OECONF:class-native = "--without-legacy --with-c14n --without-lzma --with-zlib"
-EXTRA_OECONF:class-nativesdk = "--without-legacy --with-c14n --without-lzma --with-zlib"
-EXTRA_OECONF:linuxstdbase = "--with-debug --with-legacy --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --with-c14n"
+EXTRA_OECONF:class-native = "--without-legacy --with-c14n --with-zlib"
+EXTRA_OECONF:class-nativesdk = "--without-legacy --with-c14n --with-zlib"
+EXTRA_OECONF:linuxstdbase = "--with-debug --with-legacy --with-c14n --with-zlib"
 
 python populate_packages:prepend () {
     # autonamer would call this libxml2-2, but we don't want that
@@ -61,11 +53,9 @@ python populate_packages:prepend () {
 }
 
 PACKAGE_BEFORE_PN += "${PN}-utils"
-PACKAGES += "${PN}-python"
 
 FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 FILES:${PN}-utils = "${bindir}/*"
-FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 
 do_configure:prepend () {
 	# executables take longer to package: these should not be executable
@@ -76,10 +66,6 @@ do_install_ptest () {
     oe_runmake DESTDIR=${D} ptestdir=${PTEST_PATH} install-test-data
 
 	cp -r ${S}/xmlconf ${D}${PTEST_PATH}
-
-    if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
-        rm -rf ${D}${PTEST_DIR}/python
-    fi
 }
 
 # with musl we need to enable icu support explicitly for these tests
-- 
2.34.1


