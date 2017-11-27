Return-Path: <martyn.welch@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 6E86978416
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 19:28:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: martyn) with ESMTPSA id EA66326FCAC
From: Martyn Welch <martyn.welch@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 19:28:47 +0000
Message-Id: <1511810927-22695-2-git-send-email-martyn.welch@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1511810927-22695-1-git-send-email-martyn.welch@collabora.co.uk>
References: <1511810927-22695-1-git-send-email-martyn.welch@collabora.co.uk>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: [PATCH v5 2/2] core-image.bbclass: add default IMAGE_QA_PROHIBIT_PATHS variable
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
X-List-Received-Date: Mon, 27 Nov 2017 19:29:00 -0000

Add a default IMAGE_QA_PROHIBIT_PATHS variable containing paths known to
be mounted in the default fstab, which are known mount points or
directories which should be populated at runtime.

Suggested-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
---

Changes since v3:
 - This patch added.

 meta/classes/core-image.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index a9a2cec..8d5fb97 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -56,6 +56,11 @@ IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
 # IMAGE_FEATURES_CONFLICTS_foo = 'bar1 bar2'
 # An error exception would be raised if both image features foo and bar1(or bar2) are included
 
+# IMAGE_QA_PROHIBITED_PATHS
+# Ensure images aren't including files in places that will be used as mount points or that are
+# reserved for runtime data.
+IMAGE_QA_PROHIBITED_PATHS ?= "/dev/pts/*:/media/*:/mnt/*:/proc/*:/run/*:/tmp/*:/var/run/*:/var/tmp/*:/var/volatile/*"
+
 MACHINE_HWCODECS ??= ""
 
 CORE_IMAGE_BASE_INSTALL = '\
-- 
2.1.4


