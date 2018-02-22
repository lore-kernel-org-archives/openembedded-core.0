Return-Path: <prvs=1591333edf=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id BB4E878744
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 19:57:06 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w1MJuVBH008549 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 13:57:07 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2g6ha1y0rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 13:57:07 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w1MJv670032185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 13:57:06 -0600
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 22 Feb 2018 13:57:06 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 22 Feb 2018 13:57:06 -0600
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 22 Feb 2018 13:57:06 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Feb 2018 13:57:36 -0600
Message-ID: <20180222195736.21391-3-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180222195736.21391-1-alejandro.delcastillo@ni.com>
References: <20180222195736.21391-1-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-02-22_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=839 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1802220251
Subject: [PATCH 2/2] opkg-utils: upgrade to version 0.3.6
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
X-List-Received-Date: Thu, 22 Feb 2018 19:57:07 -0000
Content-Type: text/plain

0.3.5 -> 0.3.6

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 .../recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch | 8 ++++----
 .../opkg-utils/{opkg-utils_0.3.5.bb => opkg-utils_0.3.6.bb}       | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.3.5.bb => opkg-utils_0.3.6.bb} (94%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
index 75c6f3b8de..99c0883e17 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
@@ -25,19 +25,19 @@ Index: git/opkg-build
  mkdir $tmp_dir
  
  echo $CONTROL > $tmp_dir/tarX
--( cd $pkg_dir && tar $ogargs -X $tmp_dir/tarX -c --$compressor $tarformat -f $tmp_dir/data.tar.$cext . )
--( cd $pkg_dir/$CONTROL && tar $ogargs -cz $tarformat -f $tmp_dir/control.tar.gz . )
+-( cd $pkg_dir && tar $ogargs --sort=name --mtime=$build_date -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
+-( cd $pkg_dir/$CONTROL && tar $ogargs --sort=name --mtime=$build_date -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz )
 +
 +
 +# Ignore error code 1, caused by modifying the number of hard links while creating the tar file
 +rc=0
-+( cd $pkg_dir && tar $ogargs -X $tmp_dir/tarX -c --$compressor $tarformat -f $tmp_dir/data.tar.$cext . ) || rc=$?
++( cd $pkg_dir && tar $ogargs --sort=name --mtime=$build_date -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext ) || rc=$?
 +if [ $rc -ne 1 ] && [ $rc -ne 0 ]; then
 +        exit $rc 
 +fi
 +
 +rc=0
-+( cd $pkg_dir/$CONTROL && tar $ogargs -cz $tarformat -f $tmp_dir/control.tar.gz . ) || rc=$?
++( cd $pkg_dir/$CONTROL && tar $ogargs --sort=name --mtime=$build_date -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz ) || rc=$?
 +if [ $rc -ne 1 ] && [ $rc -ne 0 ]; then
 +        exit $rc
 +fi
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
similarity index 94%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
index e9ba9de094..0c21142b6d 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
@@ -14,8 +14,8 @@ SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
 
-SRC_URI[md5sum] = "a19e09c79bf1152aac62e8a120d679ff"
-SRC_URI[sha256sum] = "7f4b08912e26a3f4f6f423f3b4e7157a73b1f3a7483fc59b216d1a80b50b0c38"
+SRC_URI[md5sum] = "391c1c80aca26961375dd22e1d2d0cbf"
+SRC_URI[sha256sum] = "26b3f4dd1c1ef65f519d4cddfb35ebea41ae8af989aea2699a39783598c33769"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.16.1


