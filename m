Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W0b-0004v2-9q
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:30:53 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=zmSa+7xBCpN30Qv4iENvE+lNmHAivhYk+05DhU+h1jg=;
	b=pHyYYiB/czbXougnBW6U9uWd6vLtzZh6v3RakcgGAZGpA7AOyahA9EuouYLeuVMFWu
	8tchgijMaoB1VUaXZKcbUVdMfRrUbslrVOXZDWlITV5CstNa5qUUqB5W8HSKK1rnHJk8
	PWRDuWjaP91daXWMWROsrCfX5aUiupBgY3JrM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=T1hmEd9vhZrqMpYH/dbRwf31sb11Xyh2X0OwAWRJDthNx//b3VwlF7qv5fmH7hJXU6
	RR6wHQVQgMFPpiD0QVP21tO2d6ORkxdYeC7JEjNTx7YnQ2/KX2FPZpzRh/bg5oyp1iTd
	NfcX5ENOtDrXNMnQni1UqKJCM9XtoHhf1EVHg=
Received: by 10.231.55.90 with SMTP id t26mr2126344ibg.116.1301632133236;
	Thu, 31 Mar 2011 21:28:53 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i26sm1178130iby.58.2011.03.31.21.28.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:44 -0700
Message-Id: <5c630b052401ed65728becb26825f777fc4ce79d.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 12/46] coreutils_6.9.bb: Remove gettext from DEPENDS
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
X-List-Received-Date: Fri, 01 Apr 2011 04:30:53 -0000

inheriting gettext should take care of this

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index d8ea8cd..f837a22 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/ls.c;startline=4;endline=16;md5=482a96d4f25010a4e13f8743e0c3685e"
 PR = "r1"
-DEPENDS = "perl-native coreutils-native-${PV} gettext "
+DEPENDS = "perl-native coreutils-native-${PV}"
 DEPENDS_virtclass-native = "perl-native gettext-native"
 
 inherit autotools gettext
-- 
1.7.4.1



