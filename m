Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SujIX-0003k5-JP
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:05:37 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 27 Jul 2012 04:54:04 -0700
Received: by weyt11 with SMTP id t11so1789339wey.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 04:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=HifwpqFArIyVKOrcPDPU3Abj4/rDqYTKXpQqE5ZNEpw=;
	b=ZUve8EFx3hJAADaLI0Z+w9SSMVhprUaKCdCSILileki15L19nkoJKky7Ahvgbrmfqb
	ERa/GN/OPdK/jiwFrvBqfN6MjADHyQGrevkT81L/+Rhae7sqRvqQxsV0EMbcbnde4au6
	nQs2jep94j6fIteBIFCfedFV35IwVtqQpeHBkuskDsuLy5tQZrCOmDuCYblMimQi5zwx
	D4S0KQ4btBwkBJKt6F41Ji9HW5ehb+yPSPbgajLclBxbXfPlNT61XhlIbst9FHu8mfkM
	gf3z+cyguI7gQxenyf0tliT4qtdebOeI7mpwLx9SkJACLe25yI45+fbdTEqGGdhsJWPQ
	+MQw==
Received: by 10.216.136.158 with SMTP id w30mr1119691wei.136.1343390042414;
	Fri, 27 Jul 2012 04:54:02 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id y5sm13523563wiw.9.2012.07.27.04.54.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 04:54:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2012 12:53:34 +0100
Message-Id: <cover.1343389943.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQn/dA4YwK1H6ov9OpBo0nmR4bAOuUnJRAY62bCohV1k8/nqOvAIlpv3NMM4UjoiKdJwD113
Subject: [PATCH 0/4] drm updates
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
X-List-Received-Date: Fri, 27 Jul 2012 12:05:37 -0000

Forwarding some patches to libdrm.  More mesa-related changes later.

The following changes since commit fb53d69d9c726e6a663ea276cc440676e20f8326:

  documentation/dev-manual/dev-manual-intro.xml: typo fixed. (2012-07-26 18:53:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mesa

for you to fetch changes up to cae0f7ba7693529116ae5e21cdddc35bf96aa8fe:

  libdrm: Bump libdrm_git to 2.4.37 (2012-07-27 12:51:29 +0100)

----------------------------------------------------------------
Damien Lespiau (3):
      libdrm: libdrm does not depend on xcb any more
      libdrm: Put the license md5sum in the common include
      libdrm: Bump libdrm_git to 2.4.37

Ross Burton (1):
      drm: move to PR/INC_PR, starting at r1 as libdrm_git was at r1

 meta/recipes-graphics/drm/libdrm.inc       |    5 ++++-
 meta/recipes-graphics/drm/libdrm_2.4.35.bb |    4 +---
 meta/recipes-graphics/drm/libdrm_git.bb    |    7 ++++---
 3 files changed, 9 insertions(+), 7 deletions(-)

Damien Lespiau (3):
  libdrm: libdrm does not depend on xcb any more
  libdrm: Put the license md5sum in the common include
  libdrm: Bump libdrm_git to 2.4.37

Ross Burton (1):
  drm: move to PR/INC_PR, starting at r1 as libdrm_git was at r1

 meta/recipes-graphics/drm/libdrm.inc       |    5 ++++-
 meta/recipes-graphics/drm/libdrm_2.4.35.bb |    4 +---
 meta/recipes-graphics/drm/libdrm_git.bb    |    7 ++++---
 3 files changed, 9 insertions(+), 7 deletions(-)

-- 
1.7.10



