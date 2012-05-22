Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1SXVwt-0005SP-Ji
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 13:11:19 +0200
Received: by bkcjm2 with SMTP id jm2so7280397bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 04:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=resent-from:resent-to:resent-date:resent-message-id
	:resent-user-agent:received-spf:from:to:cc:subject:date:message-id
	:x-mailer:x-gm-message-state;
	bh=lR/6seYq3owgEaXlggacySs+9cWdE2sXX1L4P/Mc6vs=;
	b=nvL6VqIBiNRAC+l3CZvziX9FwjFgRSfM0ZYZQ7kKzXPCt/QW0vgRASP9Ar+8CYc/Ei
	jrmmN2MBMDZhuQO3avwbwumvGSrbxkZ+RDq0hg/lICraZ6xTso+/wHEqEbZ7wQTbatqv
	TZmsslVRiqSo1MROgZkrTs8f0s7F0p5U2ahqdb46kzGwS/4ij+lTbmnGj/WtVAap4+E5
	W2mGIrfZRCWeGkz7RZLgxY1yI+5HC2U7Im+EOgztW7w64c/u+zsQbFMEkXEgdlOgAx39
	GnVvFaxlCbl2Et5GseXKphbQZrO7UnbkNf9YJbSGLNI9wv9rSzSxPTVBYXIXKv5iDHBJ
	8e8A==
Received: by 10.204.156.137 with SMTP id x9mr13125930bkw.135.1337857268117;
	Thu, 24 May 2012 04:01:08 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id h18sm2186753bkh.8.2012.05.24.04.01.06
	(version=SSLv3 cipher=OTHER); Thu, 24 May 2012 04:01:07 -0700 (PDT)
Resent-From: Steffen Sledz <sledz@dresearch-fe.de>
Resent-To: openembedded-core <openembedded-core@lists.openembedded.org>
Resent-Date: Thu, 24 May 2012 13:01:06 +0200
Resent-Message-Id: <4FBE14F2.9030808@dresearch-fe.de>
Resent-User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120427 Thunderbird/12.0.1
Received: by 10.101.13.8 with SMTP id q8csp320497ani;
	Tue, 22 May 2012 07:16:08 -0700 (PDT)
Received: by 10.112.36.163 with SMTP id r3mr10109821lbj.87.1337696167504;
	Tue, 22 May 2012 07:16:07 -0700 (PDT)
Received: from mail-lpp01m010-f44.google.com (mail-lpp01m010-f44.google.com
	[209.85.215.44])
	by mx.google.com with ESMTPS id w4si8284197lby.34.2012.05.22.07.16.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 May 2012 07:16:07 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.215.44 is neither permitted nor
	denied by best guess record for domain of
	builder@dresearch-fe.de) client-ip=209.85.215.44; 
Received: by lagv3 with SMTP id v3so4997349lag.31
	for <sledz@dresearch-fe.de>; Tue, 22 May 2012 07:16:06 -0700 (PDT)
Received: by 10.152.132.40 with SMTP id or8mr12465460lab.24.1337696166435;
	Tue, 22 May 2012 07:16:06 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id xx8sm7504593lab.10.2012.05.22.07.16.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 May 2012 07:16:05 -0700 (PDT)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id 2917C443C22; Tue, 22 May 2012 16:16:02 +0200 (CEST)
From: Steffen Sledz <builder@dresearch-fe.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 16:16:00 +0200
Message-Id: <1337696160-26734-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
X-Gm-Message-State: ALoCoQnFfuP2HPJkkM7+V/z7eILIib+ZMNVckVUgJZavn2eDwV60yWTpUrpHiVwSvnPfJHp16vG6
Subject: [PATCH] dropbear: fix include dependent PR generation
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
X-List-Received-Date: Thu, 24 May 2012 11:11:19 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 meta/recipes-core/dropbear/dropbear.inc        |    2 ++
 meta/recipes-core/dropbear/dropbear_2012.55.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 2d6aeb2..2de442c 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -2,6 +2,8 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP implementation"
 HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
 SECTION = "console/network"
 
+INC_PR = "r0"
+
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
 LICENSE = "MIT"
diff --git a/meta/recipes-core/dropbear/dropbear_2012.55.bb b/meta/recipes-core/dropbear/dropbear_2012.55.bb
index 4f0ef80..8323a33 100644
--- a/meta/recipes-core/dropbear/dropbear_2012.55.bb
+++ b/meta/recipes-core/dropbear/dropbear_2012.55.bb
@@ -3,4 +3,4 @@ require dropbear.inc
 SRC_URI[md5sum] = "44836e5a0419ba12557f9ea46880077e"
 SRC_URI[sha256sum] = "808df243c61bb60f2f18fa64bca628cbba0918b2a14139f10e6d59d4ac5a17ce"
 
-PR = "r0"
+PR = "${INC_PR}.0"
-- 
1.7.7



