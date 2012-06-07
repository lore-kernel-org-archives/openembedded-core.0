Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Scdjv-0005sN-7g
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 16:31:07 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 07 Jun 2012 07:20:23 -0700
Received: by wibhn6 with SMTP id hn6so230815wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2012 07:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=mqVa4R6Z+OtLx4Em7L6maO2bU+hoXPgsZlATq5u9fqg=;
	b=o8hGdp6hz4NAI1od79GcKpnJNaMxMQzYPQeIaOCjMM3A7Iov0Ccte/nlFQ9oqC2uwn
	3hFdgsclxhJ8OLE3YLdRMaKeNNR0tCi4wYy9WxkcwI+hJ29kJiMg22gRMRfezWY7TgNX
	Cn+Qqoi6LpxVqCV74L3kr+7Mx/2N3YPkkhuWzvbjJTNeXgsfBZ7ywa2Dv4BV48viszLF
	RGTbFAy1P9xLSVwmXqeS9y7h7rd8Ab0/rBVafYcuAHDQ5+8R4wWGcOpmdVsx7a++H5sJ
	Y6fyLuH9RZEuk+1qqb6OMEzkbMlS2u/yYvQFXo0Q4WeMgep9fhQm/yDOUttB1f17+QQu
	BbQg==
Received: by 10.216.142.167 with SMTP id i39mr962500wej.94.1339078821811;
	Thu, 07 Jun 2012 07:20:21 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id
	eb8sm1341625wib.11.2012.06.07.07.20.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jun 2012 07:20:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 15:19:35 +0100
Message-Id: <cover.1339078729.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQnuHRUuPNkfCXoXurshIdKgVrOaV6IqWWZWwINjGjnzerBvX/1PMervWMwfDsYDoHsRPxRo
Subject: [PATCH 0/3] connman fixes, upgrade
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
X-List-Received-Date: Thu, 07 Jun 2012 14:31:07 -0000

Same as the previous patch series, but with the signed-off lines.  Whoops, sorry.

The following changes since commit df8f55a919b3cc602ce1f1c51630c7edf6e36b55:

  ltp: Add patch to correct failing build (2012-06-05 23:05:00 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ross/connman
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/connman

Ross Burton (3):
  connman: respect the 3g feature and enable/disable ofono support
  connman: Document the ACL-breaking sed
  connman: upgrade to 1.0

 meta/recipes-connectivity/connman/connman.inc      |   33 ++++++++----
 ...ange-visibility-to-default-for-debug-symb.patch |   35 ------------
 .../connman/connman/disable_alg-test.patch         |   46 ----------------
 .../connman/connman/ethernet_default.patch         |   22 --------
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 ------------------
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 --------------------
 meta/recipes-connectivity/connman/connman_0.79.bb  |   14 -----
 meta/recipes-connectivity/connman/connman_1.0.bb   |    9 +++
 8 files changed, 32 insertions(+), 232 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/disable_alg-test.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/ethernet_default.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman_0.79.bb
 create mode 100644 meta/recipes-connectivity/connman/connman_1.0.bb

-- 
1.7.7.6



