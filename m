Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNyRN-0003LZ-0y
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 04:03:05 +0100
Received: from localhost (c-98-246-160-155.hsd1.or.comcast.net
	[98.246.160.155])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 2B89D2FD07
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 21:56:46 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 18:56:39 -0800
Message-Id: <747159d992634741777e8b05dce036346cbf8de2.1320807056.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320807056.git.scott.a.garman@intel.com>
References: <cover.1320807056.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1320807056.git.scott.a.garman@intel.com>
References: <cover.1320807056.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 2B89D2FD07.1CF1A
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 4/4] avahi: remove USERADDPN
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
X-List-Received-Date: Wed, 09 Nov 2011 03:03:05 -0000

USERADDPN is no longer used; remove it.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 728c38f..deebbd6 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -23,7 +23,6 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://99avahi-autoipd \
           file://initscript.patch"
 
-USERADDPN = "avahi-daemon"
 USERADD_PACKAGES = "avahi-daemon"
 USERADD_PARAM_avahi-daemon = "--system --home /var/run/avahi-daemon \
                               --no-create-home --shell /bin/false \
-- 
1.7.5.4



