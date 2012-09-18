Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TDycu-0001Zw-Nb
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 16:18:12 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 18 Sep 2012 07:05:20 -0700
Received: by wgbdq11 with SMTP id dq11so3196489wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=72hxYX7fwrBVLKw3sI1D+CRipDl+mlM9kf4tdcWDYqc=;
	b=hRTIPp++iscEerymU6YMqnSPbY52kqh7yFdlgxcDLYtAXXn6pF8AndgLfwPH4zHNtd
	kbmK6WkD/7xsAfoVbGrpafCmkwAaMtbLfKzTZ5A2dfk1N1mLB2k+OidQryOdjmHvAvYZ
	Uh68iulyUqh203kHkh1JjMiSNNX8tRVlWqtVxwIezLz2W7LXrm3kamRjR4I6MSMoD32g
	SFqp25nL0WkJl6SbW+jaAP/IJQ+86wXHDm6ue/Drcp2xPKBaHzVlOFH5D7p8gfUw2GXP
	S+CsThEfic0pSpAIq07gy9PHTIPiRBjoXQr+l0CIAQ3jDi6XVIrTvnoTgzUgPP6VXsU/
	AkmQ==
Received: by 10.180.94.164 with SMTP id dd4mr61999wib.1.1347977129159;
	Tue, 18 Sep 2012 07:05:29 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id v3sm22910986wiw.7.2012.09.18.07.05.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:05:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 15:04:34 +0100
Message-Id: <1347977074-3803-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmgC3dzRitUaJLOMzb6HlFLXQ6uqyQiCUZ0KCSMigbylCXLJiP/tfY3AqKGJ+RL38EKP/UV
Subject: [PATCH] hob: Don't set busy cursor on the root window, just our window
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
X-List-Received-Date: Tue, 18 Sep 2012 14:18:12 -0000

[ YOCTO #3127 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 bitbake/lib/bb/ui/crumbs/builder.py |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/bb/ui/crumbs/builder.py b/bitbake/lib/bb/ui/crumbs/builder.py
index 6df1ca4..335a5cb 100755
--- a/bitbake/lib/bb/ui/crumbs/builder.py
+++ b/bitbake/lib/bb/ui/crumbs/builder.py
@@ -809,9 +809,9 @@ class Builder(gtk.Window):
         self.image_details_page.set_sensitive(sensitive)
 
         if sensitive:
-            self.get_root_window().set_cursor(gtk.gdk.Cursor(gtk.gdk.LEFT_PTR))
+            self.window.set_cursor(None)
         else:
-            self.get_root_window().set_cursor(gtk.gdk.Cursor(gtk.gdk.WATCH))
+            self.window.set_cursor(gtk.gdk.Cursor(gtk.gdk.WATCH))
         self.sensitive = sensitive
 
 
-- 
1.7.10



