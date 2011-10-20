Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGyVF-0005Bq-Kf
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 21:42:09 +0200
Received: by gyc15 with SMTP id 15so3049812gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 12:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=HrdqdOkToQ9ASsRZ3yzFQYv5BTyu6frw3vJ4ISVQpeQ=;
	b=GaZHDhbFG9MtYgX4qFpKoIsl46TmcReTaAhfmrDopAiffaAViPe6g3xTkZDgYBUYGb
	Y9DWQ8rYkAy+RMiF6lDomy04r+QReG6Fq3gB1SP2iA+1CrcXE9/Y2+lKzSuZSPH6iJFD
	4ZyEMF0WO4gEqxe4wuhCT04P88Oy4VKOOTKr8=
Received: by 10.42.154.7 with SMTP id o7mr20437103icw.48.1319139372038;
	Thu, 20 Oct 2011 12:36:12 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id c2sm26057020iba.7.2011.10.20.12.36.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 12:36:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 12:36:01 -0700
Message-Id: <15763124703d12326c8ba4d296a2b2680528c2da.1319139126.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1319139126.git.raj.khem@gmail.com>
References: <cover.1319139126.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] xserver-xorg: Add mesa-dri to DEPENDS
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
X-List-Received-Date: Thu, 20 Oct 2011 19:42:09 -0000

Fixes the compile problems e.g.

| checking for GL... yes
| checking for DRIPROTO... yes
| checking for DRI... no
| configure: error: Package requirements (glproto >= 1.4.14 dri >=
7.8.0) were not met:
|
| No package 'dri' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-xserver/xserver-xorg_1.11.1.bb            |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
index 0f94fe2..2aa71e5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
@@ -1,2 +1,3 @@
 require xserver-xorg.inc
 require xserver-xorg-${PV}.inc
+DEPENDS += "mesa-dri"
-- 
1.7.5.4



