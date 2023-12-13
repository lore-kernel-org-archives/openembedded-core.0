Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF778C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 04:33:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.29459.1702442015939354606
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 20:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=T2LeVro9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07118c8f6f=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BD4K2eH027878
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 20:33:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=uWToK
	kzX9a0UnreLpIdyfgCoWo7JWUK5JelCOJLbVik=; b=T2LeVro9N1GOs+AzJ4hoe
	D8XubS6Y24Pk/N5NqnQCtt+ZTehL35ZSuEhSdWPCWtRSMgU27BFFTAjnLY2AQ5W8
	/0P2SyOiJEJy3o1w9z18cS4gY8l+brO2pNhO1PfPLZ/SiwfOpEBRoP27ZTwGL24a
	PWj7PKcNt72ODlApO09ll32YR119Hoc+icQbyrfc7Ql2+lAfUuZcEHvHrmTUTUy4
	qrip4LJnLn0D89BKXFaUZBGeSuP7ZsoAoq0Qi60h6kMqfGjSk1s3BnBD4oCrYuSN
	5eSfB3qgk+deAMGcUUmwSUjHQA5RJsY8uPbvRV5oYQssEZ3SPZBWCkGwcM8M5eI4
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvmd4behc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 20:33:35 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 20:33:38 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] perl: update 5.34.1 -> 5.34.3
Date: Wed, 13 Dec 2023 04:33:08 +0000
Message-ID: <20231213043308.1766415-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: dBw0IejmTb4SbIO6GyA2mYWd4o-yPXsm
X-Proofpoint-ORIG-GUID: dBw0IejmTb4SbIO6GyA2mYWd4o-yPXsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 04:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192267

From: Soumya Sambu <soumya.sambu@windriver.com>

This includes security fix for CVE-2023-47038

Changes:
https://metacpan.org/release/PEVANS/perl-5.34.3/changes

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../0001-Makefile-check-the-file-if-patched-or-not.patch      | 4 ++--
 .../perl-cross/{perlcross_1.3.7.bb => perlcross_1.5.2.bb}     | 2 +-
 meta/recipes-devtools/perl/{perl_5.34.1.bb => perl_5.34.3.bb} | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.3.7.bb => perlcross_1.5.2.bb} (92%)
 rename meta/recipes-devtools/perl/{perl_5.34.1.bb => perl_5.34.3.bb} (99%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
index 8c8f3b717c..0ef9b27439 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
@@ -21,8 +21,8 @@ index f4a26f5..7bc748e 100644
  # Original versions are not saved anymore; patch generally takes care of this,
  # and if that fails, reaching for the source tarball is the safest option.
  $(CROSSPATCHED): %.applied: %.patch
--	patch -p1 -i $< && touch $@
-+	test ! -f $@ && (patch -p1 -i $< && touch $@) || echo "$@ exist"
+-	$(cpatch) -p1 -i $< && touch $@
++	test ! -f $@ && ($(cpatch) -p1 -i $< && touch $@) || echo "$@ exist"
  
  # ---[ common ]-----------------------------------------------------------------
  
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.7.bb b/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.3.7.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
index 99a9ca1027..ac4dff33bb 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.3.7.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross
            "
 UPSTREAM_CHECK_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "77f13ca84a63025053852331b72d4046c1f90ded98bd45ccedea738621907335"
+SRC_URI[perl-cross.sha256sum] = "584dc54c48dca25e032b676a15bef377c1fed9de318b4fc140292a5dbf326e90"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-devtools/perl/perl_5.34.3.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.34.1.bb
rename to meta/recipes-devtools/perl/perl_5.34.3.bb
index db306d0be3..e8b518adc9 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.3.bb
@@ -29,7 +29,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "357951a491b0ba1ce3611263922feec78ccd581dddc24a446b033e25acf242a1"
+SRC_URI[perl.sha256sum] = "5b12f62863332b2a5f54102af9cdf8c010877e4bf3294911edbd594b2a1e8ede"
 
 S = "${WORKDIR}/perl-${PV}"
 
-- 
2.40.0


