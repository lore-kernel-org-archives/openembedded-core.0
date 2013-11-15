Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id E9F136D227
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 23:54:42 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id fb10so1708183wid.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 15:54:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AY0As6i4LwRB95NDmUlS30I9ZbhJdcZB8dITPx67+WM=;
	b=QqFWbgLISKcERHa8MbhxTrBrmUBzFPJRSXo+aIl26XZUPFjd7i/Te+W9R7e4lI+XdV
	DP8NOBkesEh/jh/6QI7k316StllIAbxmw4v/7+cs93PPMMcr+l4Ca8JgLgI1KF+3LQuc
	4BLbjwjwGhVfAdJpm95pDwVSxvNXqpu1WjLQWMdcwmF96c2DWjlRrxj3fN0Kdb0FwTmU
	SO/w0vDnZ0XMPxm8l7my59PFAGqQbKKL3JnTA9XLMk9epr5qDin5yEcbzHWiUnRuJYQ2
	NRU1Dc7v3iwExPn35yHz204uSxjXPenTqpef5QI0weGUVi33505VZGttVFzt/4wc2uNV
	dzTw==
X-Gm-Message-State: ALoCoQmWAn/Xz7D6S0jGHgtV+ZAtTs8AzEJihcBKeR/Ut5MI7fQ+89LMZtKOXsEwTdB7y0BddAAl
X-Received: by 10.194.119.106 with SMTP id kt10mr1642576wjb.72.1384559684070; 
	Fri, 15 Nov 2013 15:54:44 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id qc10sm26483wic.9.2013.11.15.15.54.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 15:54:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 23:54:40 +0000
Message-Id: <1384559680-28033-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] weston: remove reference to gles in PACKAGECONFIG
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
X-List-Received-Date: Fri, 15 Nov 2013 23:54:43 -0000

The "gles" configuration was removed in the upgrade to 1.3.0, and it was enabled
only if the unknown/rare opengles2 DISTRO_FEATURE was enabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.3.0.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.3.0.bb b/meta/recipes-graphics/wayland/weston_1.3.0.bb
index eb38ce1..7a0b3f9 100644
--- a/meta/recipes-graphics/wayland/weston_1.3.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.3.0.bb
@@ -31,7 +31,6 @@ EXTRA_OECONF = "--enable-setuid-install \
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                   "
 #
-- 
1.7.10.4


