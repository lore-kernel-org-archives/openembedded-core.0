Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TTAlH-0007Ck-1k
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 13:17:39 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 30 Oct 2012 05:04:00 -0700
Received: by mail-bk0-f69.google.com with SMTP id jg15so170560bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 05:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=bMuGq+Li+xYJrexfEVLxrnwQSX/fjSjRgQGwxOnyeNM=;
	b=CALbCLYO4RPJb6xzuSDWOJuQJplA7lI8Joq6pcMGI5LxhZyHl1ShpCTGO4sNsvV0TR
	HKVZeqIe/4jT8fuNWkz3UEw+M9AX3x5XDYXc8l7V3oCGO0D+vz/tf3lmYFYw1yuQuNW+
	TtjLu26kQv2G7nIB6fchK4qHuvfZGrGpvqpqQgQRuXIWqu77fqNA9XR6AqsXlyPj9KIZ
	LDLZ6zwHo98fYVsSoN94+6lDM+eTtPNna8zEpc2WQ2fOmnVSCtCqEWkr12ijinLhPbHL
	B7XUwYMPKsyrZcaqQnOQCeJG3VojsBHWizjNRK896JfePU2RFgmuzYmVPIwb6Vy2C1ZX
	64Qw==
Received: by 10.180.91.71 with SMTP id cc7mr2426142wib.2.1351598639061;
	Tue, 30 Oct 2012 05:03:59 -0700 (PDT)
Received: by 10.180.91.71 with SMTP id cc7mr2426130wib.2.1351598638978;
	Tue, 30 Oct 2012 05:03:58 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ei1sm899560wid.7.2012.10.30.05.03.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Oct 2012 05:03:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Oct 2012 12:02:45 +0000
Message-Id: <1351598565-7424-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkk+EymMsmHYbf4kLoMzsZKADLHy6DHD/kpqGTUNuZM3S5RESeWWul6HJ+WxOz+VjOXk6STNvFtPgm8oRZne9wXsoIPC59D+A0dnskVPbIkFklAxr1RSEEtLbC4zVljhK9yK7VZ6SnIXpe4daVzSvRn6p0BjlY5R3FKiq4/UMMMW6IW2eNSAt/J82ZwHoR/c++wZBQv
Subject: [PATCH] gnome-common: Fix license
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
X-List-Received-Date: Tue, 30 Oct 2012 12:17:39 -0000

gnome-common 2.28 is GPLv2+.  From Christian Persch, upstream:

  The licence is presumed GPL2+, although it's not there explicitly.  GPL2+
  because as far as I could figure out when I tried to, gnome-autogen started in
  gnome-core which had a GPL2 COPYING file.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/gnome-common_2.28.0.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb b/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
index 8936dbd..e094ccf 100644
--- a/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "Common macros for building GNOME applications"
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
-LICENSE = "GPLv3"
+LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SECTION = "x11/gnome"
-PR = "r1"
+PR = "r3"
 inherit gnome allarch
 
 # The omf.make file failed if scrollkeeper doesn't happen to be
-- 
1.7.10



