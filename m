Received: from ams-iport-4.cisco.com ([144.254.224.147])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TBM7w-0004hG-Ic
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 10:47:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=796; q=dns/txt; s=iport;
	t=1347352496; x=1348562096;
	h=from:to:cc:subject:date:message-id;
	bh=kJm8GvjduS+HWGj1loqIZZJQFZfReub/WpkbS6wdH3k=;
	b=FSkmORkTtEnSFuuX9l9xUe+viF82QmjXigWiKdqmR6fNgJJFtTgBU4tb
	X5ag9HhG/jt2++9dqGGT56Y+koODuDMqVGpVmUFzzC3kkaSLvcpGbgVsc
	KYno7G605Z2su6kkde8OUtRaByOEcwbPcrRNwwaFqyNhVA2Du5OHZaq6V U=;
X-IronPort-AV: E=Sophos;i="4.80,402,1344211200"; 
   d="scan'208";a="7956645"
Received: from ams-core-3.cisco.com ([144.254.72.76])
	by ams-iport-4.cisco.com with ESMTP; 11 Sep 2012 08:33:50 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id q8B8Xo72022596;
	Tue, 11 Sep 2012 08:33:50 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 10:30:18 +0200
Message-Id: <1347352218-3570-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH 2/2] gettext: Make gettext 0.16.1 extend native and nativesdk.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 08:47:24 -0000

gettext 0.16.1 is a GPLv2 version of gettext. Making that extend native and
nativesdk makes sure we use the same version of gettext for compiling internally
as well as in our toolchain.

Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
---
 meta/recipes-core/gettext/gettext_0.16.1.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index fa8a213..00045d5 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -93,3 +93,5 @@ FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
 do_install_append() {
 	rm -f ${D}${libdir}/preloadable_libintl.so
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.8.6



