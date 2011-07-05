Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QeCvn-0005Tw-UN
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 23:13:20 +0200
Received: by mail-iw0-f175.google.com with SMTP id 4so6024491iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 14:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=3iAmwFnVh/aoHO3azZJsnQ4HXKRDtGai0R24sTNVM2c=;
	b=Xtc4jKX+su5fuKJHLSMBbUmc7NAp4Fa+qOYvaFHlF7KEsdRysD+VXBBdeWnaYl8An5
	6fPQN6QETqY8t+zpFUszLWtM6+aly9wS8ZVmeRFjX8KMVfUI6pxGqrjigbFpl4UYRTsC
	LDUBAxLpfRg79F/38Zt07+YvG7OnxcIhy/Evs=
Received: by 10.43.49.68 with SMTP id uz4mr8598549icb.256.1309900172444;
	Tue, 05 Jul 2011 14:09:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id vn4sm7982300icb.7.2011.07.05.14.09.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 14:09:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 14:09:15 -0700
Message-Id: <070741a3f9f52350dde045f4fdbca6c611f4bec6.1309899985.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <bceff46868b198126d398d7b89e7d444a67c0dff.1309899985.git.raj.khem@gmail.com>
References: <bceff46868b198126d398d7b89e7d444a67c0dff.1309899985.git.raj.khem@gmail.com>
In-Reply-To: <cover.1309899985.git.raj.khem@gmail.com>
References: <cover.1309899985.git.raj.khem@gmail.com>
Subject: [PATCH 2/5] tcmode-default: Define UCLIBCVERSION and set it to 0.9.32
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
X-List-Received-Date: Tue, 05 Jul 2011 21:13:20 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index ed8f303..aded555 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,6 +21,7 @@ SDKGCCVERSION ?= "4.6%"
 BINUVERSION ?= "2.21"
 GLIBCVERSION ?= "2.10.1"
 EGLIBCVERSION ?= "2.13"
+UCLIBCVERSION ?= "0.9.32"
 LINUXLIBCVERSION ?= "2.6.37.2"
 
 # Temporary preferred version overrides for PPC
@@ -57,6 +58,8 @@ PREFERRED_VERSION_eglibc-nativesdk         ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-initial           ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-initial-nativesdk ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_cross-localedef-native   ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_uclibc                   ?= "${UCLIBCVERSION}"
+PREFERRED_VERSION_uclibc-initial           ?= "${UCLIBCVERSION}"
 PREFERRED_VERSION_elfutils ?= "0.148"
 # don't use version earlier than 1.4 for gzip-native, as it's necessary for
 # some packages using an archive format incompatible with earlier gzip
-- 
1.7.4.1



