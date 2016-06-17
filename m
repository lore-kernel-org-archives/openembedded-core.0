Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11EF7731E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 13:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id AA720181AD;
	Fri, 17 Jun 2016 15:41:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 2LN08zE3einI; Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id C3F8A181D1;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id AE5BD49F;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id A109B1BB0;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 9CA71DFA;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u5HDfIjV001943;
	Fri, 17 Jun 2016 15:41:18 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u5HDfIjC001942;
	Fri, 17 Jun 2016 15:41:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 15:41:03 +0200
Message-Id: <37d008cb22d350306d7d41e66f97e9106fb0c2a0.1466170741.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1466170741.git.pkj@axis.com>
References: <cover.1466170741.git.pkj@axis.com>
In-Reply-To: <cover.1466170741.git.pkj@axis.com>
References: <cover.1466170741.git.pkj@axis.com>
Subject: [PATCH 1/4] documentation.conf: Add information about USERADD varaibles
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
X-List-Received-Date: Fri, 17 Jun 2016 13:41:23 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/documentation.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index c0025f5..38639d5 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -452,8 +452,12 @@ UBOOT_SUFFIX[doc] = "Points to the generated U-Boot extension."
 UBOOT_TARGET[doc] = "Specifies the target used for building U-Boot."
 USE_DEVFS[doc] = "When building images, specifies to populate or not /dev. This variable defaults to '1' (leave directory empty, surely because devtmpfs do the job). Set it to '0' to use makedevs (or consider using a custom file with IMAGE_DEVICE_TABLES)."
 USER_CLASSES[doc] = "List of additional classes to use when building images that enable extra features."
+USERADD_ERROR_DYNAMIC[doc] = "Forces the OpenEmbedded build system to produce an error if the user identification (uid) and group identification (gid) values are not defined in files/passwd and files/group files."
+USERADD_GID_TABLES[doc] = "Specifies a password file to use for obtaining static group identification (gid) values when the OpenEmbedded build system adds a group to the system during package installation."
 USERADD_PACKAGES[doc] = "When a recipe inherits the useradd class, this variable specifies the individual packages within the recipe that require users and/or groups to be added."
 USERADD_PARAM[doc] = "When a recipe inherits the useradd class, this variable specifies for a package what parameters should be passed to the useradd command if you wish to add a user to the system when the package is installed."
+USERADD_UID_TABLES[doc] = "Specifies a password file to use for obtaining static user identification (uid) values when the OpenEmbedded build system adds a user to the system during package installation."
+USERADDEXTENSION[doc] = "When set to 'useradd-staticids', causes the OpenEmbedded build system to base all user and group additions on a static passwd and group files found in BBPATH."
 
 #W
 
-- 
2.9.0


