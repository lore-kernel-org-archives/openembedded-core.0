Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD666D12A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 12:21:34 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id hq4so1656550wib.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 04:21:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=a0StGARkuySQ/9cKnU1XW3aaJTxIO5R3/x/Bilqeniw=;
	b=gzrTgoPw8Ui7Q29NkFKmIjL450ALaKz4WfFwu65612KC4nXiZHgRq0B1jUWhJvgJAE
	l6Ps+YAcZF7zsey9UZPTigRzOXfFzpWgxjMdddfJ5ZPyqCDwAOW4Ln7a0+SolpkmJ9M8
	2yLjY5U9DKHF6Hib+ex0EQMOqSL1KbSs0kawbDPvPHa2YOuiMX1Z4EpU+7p1bEXN/rSZ
	MJ9tjtFRvziqLuAgjasEYfCijSbcUtcqALZqrvWRoUZnNLf0ORBpmk6iNJAw14RadgeH
	W0dUMmD95F0N/0JZOPQv6lkSoJi+iNcSd3/b+pmYjA/j/R7CAmHMZl6RE6Y1fxxwqf2A
	WJZA==
X-Gm-Message-State: ALoCoQnepHyg5jna+hUqyRr2tyJ0tXvuNlR5hITFu1kudlTwWDIxnH+bSXBFK03W55zG3yG2dTLM
X-Received: by 10.180.39.212 with SMTP id r20mr12105403wik.13.1384172495334;
	Mon, 11 Nov 2013 04:21:35 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id y20sm33698802wib.0.2013.11.11.04.21.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Nov 2013 04:21:34 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2013 12:21:32 +0000
Message-Id: <1384172492-23874-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] weston-init: use /run instead of /var/run
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
X-List-Received-Date: Mon, 11 Nov 2013 12:21:34 -0000

/var/run is just a symlink to /run now, so use /run directly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston-init/init |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index 284fd0a..8e662e0 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -29,7 +29,7 @@ case "$1" in
 
         # This is all a nasty hack
         if test -z "$XDG_RUNTIME_DIR"; then
-                export XDG_RUNTIME_DIR=/var/run/user/root
+                export XDG_RUNTIME_DIR=/run/user/root
                 mkdir --parents $XDG_RUNTIME_DIR
                 chmod 0700 $XDG_RUNTIME_DIR
         fi
-- 
1.7.10.4


