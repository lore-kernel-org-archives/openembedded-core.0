Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 58A3372146
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 06:02:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAL629KR005221
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 22:02:09 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 20 Nov 2014 22:02:08 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Nov 2014 01:02:05 -0500
Message-ID: <c126776d9ca1af6e592a6f3ca1f7c83303d31be3.1416549482.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1416549482.git.wenzong.fan@windriver.com>
References: <cover.1416549482.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1][Dizzy] serf: uprev to 1.3.7 for fixing CVE-2014-3504
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Nov 2014 06:02:14 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The (1) serf_ssl_cert_issuer, (2) serf_ssl_cert_subject, and (3) serf_-
ssl_cert_certificate functions in Serf 0.2.0 through 1.3.x before 1.3.7
does not properly handle a NUL byte in a domain name in the subject's
Common Name (CN) field of an X.509 certificate, which allows man-in-
the-middle attackers to spoof arbitrary SSL servers via a crafted
certificate issued by a legitimate Certification Authority.

http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3504

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../serf/{serf_1.3.6.bb => serf_1.3.7.bb}          |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/serf/{serf_1.3.6.bb => serf_1.3.7.bb} (82%)

diff --git a/meta/recipes-support/serf/serf_1.3.6.bb b/meta/recipes-support/serf/serf_1.3.7.bb
similarity index 82%
rename from meta/recipes-support/serf/serf_1.3.6.bb
rename to meta/recipes-support/serf/serf_1.3.7.bb
index 08b04d3..5230ef7 100644
--- a/meta/recipes-support/serf/serf_1.3.6.bb
+++ b/meta/recipes-support/serf/serf_1.3.7.bb
@@ -1,8 +1,8 @@
 
-SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-1.3.6.tar.bz2 \
+SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-1.3.7.tar.bz2 \
            file://norpath.patch"
-SRC_URI[md5sum] = "7fe38fa6eab078e0beabf291d8e4995d"
-SRC_URI[sha256sum] = "ca637beb0399797d4fc7ffa85e801733cd9c876997fac4a4fd12e9afe86563f2"
+SRC_URI[md5sum] = "0a6fa745df4517dd8f79c75c538919bc"
+SRC_URI[sha256sum] = "ecccb74e665e6ea7539271e126a21d0f7eeddfeaa8ce090adb3aec6682f9f0ae"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-- 
1.7.9.5


