Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CD7C54E90
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 08:50:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6632.1747817416107054013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 01:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7236f77f38=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5THFG011938
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 01:50:15 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfr91u8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 01:50:15 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 21 May 2025 01:49:57 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 21 May 2025 01:49:57 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <liezhi.yang@windriver.com>
Subject: [PATCH 1/1] autotools.bbclass: Copy gettext/po/Makefile.in.in to all po/Makefile.in.in
Date: Wed, 21 May 2025 01:50:20 -0700
Message-ID: <ec444128381202080ec89649e127d0e6ae6cbdf5.1747817251.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747817251.git.liezhi.yang@windriver.com>
References: <cover.1747817251.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA4NiBTYWx0ZWRfX5nt6cfpYHyTA 5MlXnf521mGRlWav214sHch/mdjznXsr5iPwzZIpWZOPjhgX2kjkWC/mqVLrpTvmsHMSzszQqB+ LkQYWiqMhPd9u3lDa2MsgLVNZVB1Fuzx1pHkU641uQd6MFXwmfRFvUS8z9QgGN/q0I8yP6yxRlu
 ITlrQQeDabq8BD8SvfJqphusFvSKwjnNagv80KoKAandlN9iUB4PUkjUvT4RS0OqLyFOEV4Y1ZB 7+/Njx1np3LNf6l7upg4NugCbEmLhDnBQ1r7MgLw6Mhk7/jxV7NPWgFXcZyqx0X5/EO0gvngw0o M61VTKHYviNbz7jlNC7P5gmFTooDi+BC2adSbr2bajTFD91X7izT+gcbyj0WZNMrEDNuR/pcPcT
 +EbxquKkn7lXcb5cGrW/UuH9p7qepBQ3LFhZFYhdyBkbAsGq2Tj32h0i9POcNgAzCliMW1px
X-Proofpoint-ORIG-GUID: 8hQNgr5WgHsB91jcBwDZw2RaK4k8jBDu
X-Proofpoint-GUID: 8hQNgr5WgHsB91jcBwDZw2RaK4k8jBDu
X-Authority-Analysis: v=2.4 cv=TrPmhCXh c=1 sm=1 tr=0 ts=682d93c7 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=kkVTH7LnwwJlE_cJ3zAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=982
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 08:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217006

From: Robert Yang <liezhi.yang@windriver.com>

The previous code only copied to ${S}/po/Makefile.in.in, but there might be
other po/Makefile.in.in in ${S}, for example:
* bison:
  runtime-po/Makefile.in.in
  gnulib-po/Makefile.in.in

* gawk:
  extension/po/Makefile.in.in

* fontconfig
  po-conf/Makefile.in.in

* There might be more recipes in oe-core, and more recipes from other layers.

The build would be failed after upgrade gettext to 0.24.1 since gettext changed
the way to include Makevars, so we have to fix the recipes one by one, such as:
do_configure:prepend() {
    cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/runtime-po/
    cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/gnulib-po/
}

Even if we don't upgrade gettext to 0.24.1, have different po/Makefile.in.in in
the same ${S} is a kind of bug, this patch can fix the issues.

The fix way is:
Find all possible po/Makefile.in.in, if it is the same as ${S}/po/Makefile.in.in,
then override it with ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes-recipe/autotools.bbclass | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
index 948f8c183a..d4138bfc57 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -188,8 +188,28 @@ autotools_do_configure() {
 		elif [ "${BPN}" != "gettext" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
 			# We'd call gettextize here if it wasn't so broken...
 			cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
+			# Find all possible po/Makefile.in.in, if it is the same as
+			# po/Makefile.in.in, then override it with
+			# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in.
 			if [ -d ${S}/po/ ]; then
-				cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
+				makefile_in_in_top=${S}/po/Makefile.in.in
+				need_copy=$makefile_in_in_top
+				if [ -f $makefile_in_in_top ]; then
+					makefile_in_ins="$(find ${S} -name Makefile.in.in)"
+					for makefile_in_in in $makefile_in_ins; do
+						if [ $makefile_in_in != $makefile_in_in_top ]; then
+							diff="$(diff ${S}/po/Makefile.in.in $makefile_in_in)"
+							if [ -z $difff ]; then
+								need_copy="$need_copy $makefile_in_in"
+							fi
+						fi
+					done
+				fi
+				for makefile in $need_copy; do
+					cmd="cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in $makefile"
+					bbnote "Running $cmd"
+					$cmd
+				done
 				if [ ! -e ${S}/po/remove-potcdate.sed ]; then
 					cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sed ${S}/po/
 				fi
-- 
2.49.0


