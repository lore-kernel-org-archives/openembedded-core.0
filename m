Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TvVmr-0006vj-JM
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 17:24:41 +0100
Received: from mail-wg0-f69.google.com ([74.125.82.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 16 Jan 2013 08:09:02 -0800
Received: by mail-wg0-f69.google.com with SMTP id es5so1634596wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 08:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=SUJkrKZQQp0pa1fdwDWnbHBerPVEj9WwD5DETODML/k=;
	b=TV/mPRQArYDGdg4cCE5aiIJZdtACQLEYPljTBMdMk50JTeRBjYWdKqlZyzEQK/+Bz4
	nJZwlwvHBEsBARyQ40mUwj60cjn4F/HJjAvwR2lO+A11BO2xaAcBjfOU4x4j+l4gZFPs
	FuCV1Eqi4jDLf0spD41U18ddut4vnfTE5Hx8F8T8B8x3xE+3k4M8F5ByWqy6GMxLWTIu
	jomNvmBCpebyzEpD2vAMPpnmHYwRvFg50fPELhBy+QiweqYmdGdH4d5os1HYOWnmxkrL
	PoYcO5ChL/61H20vFgEtOLgETdMvqc3OAW/BsC4f4ZDaUYrBnp1BWncJzazR7YdmqHJq
	ndAA==
X-Received: by 10.194.238.226 with SMTP id vn2mr3211911wjc.23.1358352540468;
	Wed, 16 Jan 2013 08:09:00 -0800 (PST)
X-Received: by 10.194.238.226 with SMTP id vn2mr3211896wjc.23.1358352540321;
	Wed, 16 Jan 2013 08:09:00 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ex6sm9768803wid.3.2013.01.16.08.08.59
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 08:08:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 16:06:56 +0000
Message-Id: <ed75a9a94602e93c220254b57a1311d7f67454ce.1358351050.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358351050.git.ross.burton@intel.com>
References: <cover.1358351050.git.ross.burton@intel.com>
In-Reply-To: <cover.1358351050.git.ross.burton@intel.com>
References: <cover.1358351050.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmj/fJiLB0xmCKAbfT1nJR2qEDTda/GK29ECDj7+5WDJPWqXaokSNqZYgDqCFGNCoT3oNDP/3pk8uGVVgBtwkQDPptUH/aiqm771TF1Y6C4+CBANJgnWwNlr1wSWhA676gs76E8p6v7eClYxnKIBByGiXqSZx+pAt/YzlCQ+1m5i+LgG7NkOuwQTIiyG/MoDuZawVVE
Subject: [PATCH 1/4] x11-common: set XDG_RUNTIME_DIR if it isn't already set
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
X-List-Received-Date: Wed, 16 Jan 2013 16:24:42 -0000

Wayland needs this set for the communication pipes, so set a fallback in case it
hasn't already been set.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh        |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh

diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh
new file mode 100644
index 0000000..91594b9
--- /dev/null
+++ b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh
@@ -0,0 +1,13 @@
+# Minimal/stub implementation of the XDG Base Directory specification.
+# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
+#
+# Wayland needs XDG_RUNTIME_DIR, so set it to /tmp.  This isn't compliant with
+# the specification (wrong mode, wrong owner) but it's mostly sufficient.
+#
+# In the ideal case where SystemD is booting and userspace is initiated by a
+# SystemD user session this will have been set already, so don't overwrite it.
+
+if [ -z "$XGD_RUNTIME_DIR" ]; then
+	XDG_RUNTIME_DIR="/tmp"
+        export XDG_RUNTIME_DIR
+fi
-- 
1.7.10.4



