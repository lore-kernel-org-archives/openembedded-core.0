Received: from mail-we0-f178.google.com ([74.125.82.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAK4K-0006UV-28
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 13:55:41 +0100
Received: by mail-we0-f178.google.com with SMTP id x48so3640388wey.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 04:39:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=NPPhqybYvvU0dtBWbM/49hi9v+4RNFLN2qIpW9CV1WU=;
	b=S4wOPGs6c05gQOujGjsaCAhgeVc8IA4RuxWdupoZ3rybyhCqlek7OvrqdIj0cO8V5b
	9bwlI371CJBERzX4QbbCuh22HPt2hinrNQxAg1zX/e+S+QtF5V+d3H/5nYYPGtVhzs3K
	SsQyQe+jXg2fFMEVNR4cxPp0g46bR62AXvy76Q/bCE74mjoFBP1+yNTTRUs0RaqSnYAI
	F7yqeAsG0vkUj+ux3YbQJ41ktjO3pobmzTyqVRakjyhhbnvpdU93MYAL/9ZHh+DJh+a2
	49ljwg1K1cyASHcb/Q+BFV9BWVcbwzKRgumUZaztGuRFb635qxzAb6UrbJFm/YLMUryj
	yMTA==
X-Received: by 10.180.108.3 with SMTP id hg3mr18814294wib.33.1361882360647;
	Tue, 26 Feb 2013 04:39:20 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bg5sm1683544wib.8.2013.02.26.04.39.18
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 04:39:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2013 12:36:56 +0000
Message-Id: <1361882216-8152-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkfervvPATohI568n1tnl2KPjS/bx9w5nSo7NsvjFNE7wcG3pDeEAbmtZSV8IjdCcDmib9T
Subject: [PATCH] xkeyboard-config: this is architecture-indepedent, so set PACKAGE_ARCH
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
X-List-Received-Date: Tue, 26 Feb 2013 12:55:42 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
index 8ca2f6a..ee3e20c 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
@@ -19,6 +19,8 @@ SRC_URI[sha256sum] = "4e1cf5468d488aaf320ddfd439e03cbda0b213550fd734026d23138e4b
 SECTION = "x11/libs"
 DEPENDS = "intltool-native xkbcomp-native glib-2.0 virtual/gettext"
 
+PACKAGE_ARCH = "all"
+
 PR = "r0"
 
 EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
-- 
1.7.10.4



