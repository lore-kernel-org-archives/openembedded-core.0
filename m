Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF7475E7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 21:31:35 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so119681234wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 14:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8SQArjoT+WGB65P+fzV4g9o14GicFda4an9nzSbpxno=;
	b=BQpjZbbluD5OlnrMdwYzCkVOZviPl88s5BrzeCE6TIO1sQ4XEbrK/273VgHA813W1h
	HNSHIygbHu/1CmlKE5YH9WBuyE80GYhcWHGX6yYepKf++TjFCyopSVD5nYJyl0juqnOx
	nwf4k3YgGlB/zx2XMdJqI0Y2Cjw0G6ADmTvqcy+s0UBA22+DLj8KNVVB/30p48etPWpn
	2O94SbjX0aj436q5oqFeMGYb6Dy+GvQUcHh63KKQeS//zoJDm/6HHGSEysUkNlpYeX5n
	BEcqW0Hr92tEZJygA66hxpYySe/ELjA6LCwIakIXxOSzd+EIpuvCb2Qo9x7PO2/ymyHN
	YWrg==
X-Gm-Message-State: ALoCoQkDi/ktiGO1cw0clXZ2xkOqNJ/JqMZxnQkZslmLhIqmbccAwPRhZnuk00DHF5qGFQA0+AmM
X-Received: by 10.194.95.71 with SMTP id di7mr17244455wjb.125.1439933495869;
	Tue, 18 Aug 2015 14:31:35 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a19sm23966351wjr.27.2015.08.18.14.31.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Aug 2015 14:31:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Aug 2015 22:25:17 +0100
Message-Id: <1439933118-17773-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] gnome: move introspection options to gnomebase
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
X-List-Received-Date: Tue, 18 Aug 2015 21:31:41 -0000

The gnome class is really a convenience class to include other classes, so move
the introspection arguments into gnomebase.bbclass.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gnome.bbclass     | 4 ----
 meta/classes/gnomebase.bbclass | 3 +++
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gnome.bbclass b/meta/classes/gnome.bbclass
index 0de22dd..c6202bbb75 100644
--- a/meta/classes/gnome.bbclass
+++ b/meta/classes/gnome.bbclass
@@ -1,5 +1 @@
 inherit gnomebase gtk-icon-cache gconf mime
-
-EXTRA_OECONF += "--disable-introspection"
-
-UNKNOWN_CONFIGURE_WHITELIST += "--disable-introspection"
diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index 6ca13cb..fa8f88d 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -28,3 +28,6 @@ do_install_append() {
 	rm -f ${D}${datadir}/applications/*.cache
 }
 
+EXTRA_OECONF += "--disable-introspection"
+
+UNKNOWN_CONFIGURE_WHITELIST += "--disable-introspection"
-- 
2.1.4


