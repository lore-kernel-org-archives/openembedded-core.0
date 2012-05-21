Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJa0-0005c2-Ed
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:44 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so5415613dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7mM+7nII8KV1svz9Rd9j/pzZ1XqtY6eVqnfggMC0duM=;
	b=cZ6KZWumN34d3TO74F+0Ax2CMqkyQFCD7BB7sx/y/9yX+51PtxN9/x12Gm6Z4HIafE
	51TtVkBvZ6Vg6yOAXIhbFpLjsK2H9JAuAH+7u2BkytPnx6h+Q2vmriAUZt/pwl5EJ+51
	yONVmH09M6ooWCSO6KjlXuQImtTWJCrxsBs/loTHxRp30qpii2ChwcpQhOUG8izQqRFT
	rsO7+BXRSkGtsRCdTiNwjbIFHVDLw81KuGGDiOHXo8LFhKbsSlzDFgeovLtne0PMvxUI
	0VztO1T8PxxiTld8JTzih6CZDBKeYTp/lMCvriM7QCrFZ8H/Uvggai1o0IVl5NYRoA/e
	9J7A==
Received: by 10.68.202.8 with SMTP id ke8mr62407400pbc.94.1337571399366;
	Sun, 20 May 2012 20:36:39 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm21589703pbc.56.2012.05.20.20.36.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:45 -0700
Message-Id: <7bdc3a07d3212d7fc820c77ba509e476cc7aa672.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
References: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Subject: [PATCH 10/14] site/sh-common: Add missing caches variables to build glib-2.32
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
X-List-Received-Date: Mon, 21 May 2012 03:46:44 -0000

This is on the same tone as done for other architectures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/sh-common |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/site/sh-common b/meta/site/sh-common
index c386266..bde416a 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -147,6 +147,10 @@ glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
 glib_cv_sys_use_pid_niceness_surrogate=${glib_cv_sys_use_pid_niceness_surrogate=yes}
 
 glib_cv_strlcpy=${glib_cv_strlcpy=no}
+glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=4
 
 # httppc
 ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
-- 
1.7.5.4



