Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0WHh-0006DO-VK
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 11:52:26 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so474013eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 02:44:07 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.39.148 as permitted sender) client-ip=10.14.39.148; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.39.148 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.39.148])
	by 10.14.39.148 with SMTP id d20mr505345eeb.90.1329993847080 (num_hops
	= 1); Thu, 23 Feb 2012 02:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=scG/T+h6Yn7w5E3Zj+bn8cBrNjHU3j4pI8b4P5X7JxU=;
	b=DM0eyKe4nnfuSGVFqEdymVpVZHK7JDxpiKwoUxUtaiEwn3FQkdUox1RSYXi5twiMXu
	vt9547fpkDNz1058EgSkhoNa9NV6GDfsVl2co+xhgMAG9JU7iXQ2hLek4GjI9oQIC7iL
	U5DxWrq+/yY+lqZgIcJsgHMoKH1p1jTqZvREw=
Received: by 10.14.39.148 with SMTP id d20mr401841eeb.90.1329993846974;
	Thu, 23 Feb 2012 02:44:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm3935723eef.10.2012.02.23.02.44.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 02:44:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 11:43:39 +0100
Message-Id: <31839c0ee2b68d525cbfaff920b502537980bc33.1329993620.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
References: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329993620.git.Martin.Jansa@gmail.com>
References: <cover.1329993620.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/7] sstatesig: add pointercal-xinput to excluded machine specific configs
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
X-List-Received-Date: Thu, 23 Feb 2012 10:52:26 -0000

* it's used by xinput-calibrator in meta-oe but contains just calibration data like pointercal does for tslib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/sstatesig.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index ee7cbad..080b722 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -27,7 +27,7 @@ def sstate_rundepfilter(fn, recipename, task, dep, depname):
         return False
 
     # Exclude well defined machine specific configurations which don't change ABI
-    if depname in ['sysvinit-inittab', 'shadow-securetty', 'opkg-config-base', 'netbase', 'formfactor', 'xserver-xf86-config', 'pointercal', 'base-files']:
+    if depname in ['sysvinit-inittab', 'shadow-securetty', 'opkg-config-base', 'netbase', 'formfactor', 'xserver-xf86-config', 'pointercal', 'pointercal-xinput', 'base-files']:
         return False
 
     # Default to keep dependencies
-- 
1.7.8.4



