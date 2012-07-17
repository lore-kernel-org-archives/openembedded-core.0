Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr4cw-0008DZ-6m
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 12:03:34 +0200
Received: by bkcik5 with SMTP id ik5so119674bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 02:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=pyPiiLXiR18tzrjUpSlxIFRZ25v7pK6iCKSsoCmBOpc=;
	b=BmBxOdPQotKj1DDWg2HbSS1DOcqPz72CN1Wf9tpLNAd9rLjEymXRBT/KuRG+dSElww
	gEwsW5XY6lMs54voc4ssBfaR/B9LdMqT0yxoAxRQSPtog2ln5tKJuD2o4VP98OZXbmWK
	6TbKErEfWtFvXZF/22yKHnHB2qll8IHbLhqK/OQyGRH6sp6fpGZnW6wUZ+licgoWaJqc
	dd3yax9po5i+jheBtiAvCPmrR83bVhapT4+Vn/k9mCznYyB+LtA1StB+6qXfrQXNClnZ
	a3jJVXl+toV1FqHdSOym49ykEuR31eU6mx6ACkVKu1Y9Ps/Zjzgsx5MskoUedexEZHY5
	3axQ==
Received: by 10.204.156.73 with SMTP id v9mr647048bkw.116.1342518734993;
	Tue, 17 Jul 2012 02:52:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y20sm9517252bkv.11.2012.07.17.02.52.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 02:52:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 11:52:22 +0200
Message-Id: <1342518742-14636-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342517932-27013-1-git-send-email-Martin.Jansa@gmail.com>
References: <1342517932-27013-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2] recipes: svn SRC_URI s/proto=/protocol=/g
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 10:03:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../eglibc/cross-localedef-native_2.15.bb          |    2 +-
 .../eglibc/cross-localedef-native_2.16.bb          |    2 +-
 meta/recipes-multimedia/tremor/tremor_20120314.bb  |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
index 6f311fc..493eb61 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
@@ -16,7 +16,7 @@ inherit autotools
 PR = "r0"
 SRCREV="15225"
 EGLIBC_BRANCH="eglibc-2_14"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http "
+SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http "
 S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
 
 do_unpack_append() {
diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
index 88c701e..0f870be 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
@@ -16,7 +16,7 @@ inherit autotools
 PR = "r0"
 SRCREV="19383"
 EGLIBC_BRANCH="eglibc-2_16"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http "
+SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http "
 S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
 
 do_unpack_append() {
diff --git a/meta/recipes-multimedia/tremor/tremor_20120314.bb b/meta/recipes-multimedia/tremor/tremor_20120314.bb
index 19d03d6..cf51983 100644
--- a/meta/recipes-multimedia/tremor/tremor_20120314.bb
+++ b/meta/recipes-multimedia/tremor/tremor_20120314.bb
@@ -8,7 +8,7 @@ DEPENDS = "libogg"
 SRCDATE = "${PV}"
 PR = "r0"
 
-SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=18221;proto=http"
+SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=18221;protocol=http"
 
 S = "${WORKDIR}/Tremor"
 
-- 
1.7.8.6



