Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A437BC83F0C
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 06:26:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6718.1751610383039627287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 23:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9280fa9c81=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5644e3pw002077
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Jul 2025 06:26:22 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1eh8c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 06:26:22 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 3 Jul 2025 23:25:23 -0700
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 3 Jul 2025 23:25:23 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] git: 2.49.0 -> 2.50.0
Date: Thu, 3 Jul 2025 23:26:19 -0700
Message-ID: <95cf4a5fd613055b4467df6a4806a4fc3f648279.1751610337.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751610337.git.liezhi.yang@windriver.com>
References: <cover.1751610337.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA0OCBTYWx0ZWRfXxuNIWosYtu3u uRYNHjmHQ9wuljYIUReMW5W5heSLxKTr463fb4kOfj7Uokw0kbRsvFQXiWMakstXTHR1KtSLElp ss8uGGn1noxzPgDN8MlGa/ZaRa70wzLmPHmAMyrs3PZCvp8iVPKMh97mTA5MVoNHbKyEetyDFgJ
 8wmVb34AL2rt4Rw2HdZrIX+fGpE12VZP+aMEzxh3zv7nnISp/lKJv5Sj7oDPlpLZFM5hsqoCyTl ciPzmAjqUm4nSTVRfi/1dA9gq3ng0cno/MjYaQud4UmRwejiKPo6EncTs0sb8xe4+nC6Vao8SYv NGnz7K7r5Ro0YFClO4aYzn5sEWdBmn5asMUJmEZ8x/0JhqfvemgI5AAvfhqHphfigowfDzLl1Ff
 mpg7cJea4A3KhlbnWGNlOl7V6aSvQsogEI+jPtVD1bKY0fSHXUsoNdF8n38UOYYiWaA46Rvm
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=6867740e cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=5rxgeBVgAAAA:8 a=t7CeM3EgAAAA:8 a=FQJPOKc63k4MBbBQ8gAA:9 a=PwKx63F5tFurRwaNxrlG:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: OBKoncCACtfPeYNNSKmB_m3eL3GSDz26
X-Proofpoint-ORIG-GUID: OBKoncCACtfPeYNNSKmB_m3eL3GSDz26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507040048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 06:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219901

From: Robert Yang <liezhi.yang@windriver.com>

* Rebased fixsort.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git/fixsort.patch      | 16 ++++++++--------
 .../git/{git_2.49.0.bb => git_2.50.0.bb}         |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/git/{git_2.49.0.bb => git_2.50.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index e077eba8ff..7066e1808d 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -23,15 +23,15 @@ Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd3
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/generate-configlist.sh b/generate-configlist.sh
-index dffdaad..cc35a21 100755
+index 75c39ad..6d4525e 100755
 --- a/generate-configlist.sh
 +++ b/generate-configlist.sh
-@@ -15,7 +15,7 @@ static const char *config_name_list[] = {
- EOF
- 	grep -h '^[a-zA-Z].*\..*::$' "$SOURCE_DIR"/Documentation/*config.adoc "$SOURCE_DIR"/Documentation/config/*.adoc |
- 	sed '/deprecated/d; s/::$//; s/,  */\n/g' |
--	sort |
-+	LC_ALL=C sort |
- 	sed 's/^.*$/	"&",/'
+@@ -23,7 +23,7 @@ EOF
+ 	d' \
+ 	    "$SOURCE_DIR"/Documentation/*config.adoc \
+ 	    "$SOURCE_DIR"/Documentation/config/*.adoc |
+-	sort
++	LC_ALL=C sort
  	cat <<EOF
  	NULL,
+ };
diff --git a/meta/recipes-devtools/git/git_2.49.0.bb b/meta/recipes-devtools/git/git_2.50.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.49.0.bb
rename to meta/recipes-devtools/git/git_2.50.0.bb
index e1b501d62b..2d28fd05fc 100644
--- a/meta/recipes-devtools/git/git_2.49.0.bb
+++ b/meta/recipes-devtools/git/git_2.50.0.bb
@@ -170,4 +170,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "f8047f572f665bebeb637fd5f14678f31b3ca5d2ff9a18f20bd925bd48f75d3c"
+SRC_URI[tarball.sha256sum] = "920f8ca563d16a7d4fdecb44349cbffbc5cb814a8b36c96028463478197050da"
-- 
2.49.0


