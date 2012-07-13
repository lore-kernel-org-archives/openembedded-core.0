Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sphlb-0001nt-1t
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 17:26:51 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 13 Jul 2012 08:15:35 -0700
Received: by weyt11 with SMTP id t11so1484911wey.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 08:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=YDOMXI1FufL1Fgf5pEnuKtigA6iu/wdl+fcvrEgU8v4=;
	b=IW0MahxbadHodipgem3EB6C/kEyVC4uiu51x7Wlwyfsp9sJa89d1MO4CvokKzrxeUa
	skU18L0/Y0PI0z3hqgexLcLAfqwQBGJyEAoD0hzhm5tRecTk4yuzllxciTwkSbLVfsE7
	Qt6pjP+LXC/lgYthDIl2JiUIYN3D6gwgU3phw/VFh0Ml1zHg/oziDnKD+FLRs6FjgHLq
	MHxl54FO3GvFGjQTyBaufI+SDPb83/8lx8IGz8nd+I/LkaDsdApQ+YxzQcT0WQ422nwO
	DpDWoviWmtLQZ0tVumdO4WPy0pkNDptK7jkxtlNHOmuFs9kleCDWc0e8ImodkUx5nXgu
	lcPQ==
Received: by 10.180.91.1 with SMTP id ca1mr4987158wib.8.1342192533192;
	Fri, 13 Jul 2012 08:15:33 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id el6sm3780926wib.8.2012.07.13.08.15.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 08:15:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2012 16:15:17 +0100
Message-Id: <cover.1342192478.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkmblbg6qAUjuuoKMWxwetj8m3wWSrTG5o5g+TVymJtT7BG3/HLw0wvKiBVnD5+ppaw20zj
Subject: [PATCH 0/3] Web fixes
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
X-List-Received-Date: Fri, 13 Jul 2012 15:26:51 -0000

Some small fixes for Web.

The following changes since commit eb0cb7e8234f5d2e5623406e9660be91cf52f65e:

  perf: add perl, python to DEPENDS (2012-07-12 12:52:09 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/web

for you to fetch changes up to d48782c50edd6fc4018b8144050922bd439abea1:

  web-webkit: don't link using g++, it's not needed anymore (2012-07-13 16:12:55 +0100)

----------------------------------------------------------------
Ross Burton (3):
      web-webkit: remove unused dependencies (taken from the gecko-based recipe)
      web-webkit: push make whitespace fix upstream
      web-webkit: don't link using g++, it's not needed anymore

 .../web/web-webkit/link-with-g++.patch             |   35 --------------------
 meta/recipes-sato/web/web-webkit/make-382.patch    |   17 ----------
 meta/recipes-sato/web/web-webkit_git.bb            |   16 +++------
 3 files changed, 5 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-sato/web/web-webkit/link-with-g++.patch
 delete mode 100644 meta/recipes-sato/web/web-webkit/make-382.patch

Ross Burton (3):
  web-webkit: remove unused dependencies (taken from the gecko-based
    recipe)
  web-webkit: push make whitespace fix upstream
  web-webkit: don't link using g++, it's not needed anymore

 .../web/web-webkit/link-with-g++.patch             |   35 --------------------
 meta/recipes-sato/web/web-webkit/make-382.patch    |   17 ----------
 meta/recipes-sato/web/web-webkit_git.bb            |   16 +++------
 3 files changed, 5 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-sato/web/web-webkit/link-with-g++.patch
 delete mode 100644 meta/recipes-sato/web/web-webkit/make-382.patch

-- 
1.7.10



