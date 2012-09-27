Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1THFAs-0008Mt-Gs
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 16:34:46 +0200
Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 27 Sep 2012 07:21:52 -0700
Received: by wibhj13 with SMTP id hj13so3006667wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 07:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=c+s0rylMLU7453SeTJnpCgTh8pyXkrOopJYEFqpRvXc=;
	b=GWZEjaJj/eUUsTAK8w76C1xdzpLWJoXtxw+HJLoonDJF+epIWrTEuVKLGg+Hkk51Bg
	3Nry9dU+HkPfIsoY+Az6bUMzeQTj6+tmIF9I9Y62mZZlxLN1rk63GK/xGK1p11+ukwEY
	BG2a8pvZXr/SgGSkF0xW9cBFesJkaesiNXfZ6R2zM6KRD0wBBmQ/cV80hFIL622J3fVF
	6NbWj96ha6MPRcaTiXIrLWUesfsLLTZJnDAlE0T5iY1mGoNHCoA88kYrFtysKdyhdq8n
	yS+pEWnKhhUunwU977wi/KAZzxJveyrdSd6C5JVMXWGpLJn1dHdoSFgyze3z+PH0CNVJ
	dPHA==
Received: by 10.180.91.169 with SMTP id cf9mr4479264wib.1.1348755710605;
	Thu, 27 Sep 2012 07:21:50 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm13426611wix.6.2012.09.27.07.21.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 07:21:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 15:20:49 +0100
Message-Id: <cover.1348755513.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQk5OLCu44j9YoVbT3YMMF0WEsx55Q8YGeAaQhsBBX7EJuWfiMRS+Tn/Q/Z4+fq2KA7QrvsN
Subject: [PATCH 0/2] initramfs fixes
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
X-List-Received-Date: Thu, 27 Sep 2012 14:34:46 -0000

A colleague was working on an initramfs-based yocto system and encounting some
issues because the initial script is quite fragile.

Attached are two patches to make it less fragile, and drop you to a shell if it
does break.

The following changes since commit 55b3e7bf48a67c0ce42308b8332262fbe4eccd24:

  dbus: disable all X11 when native (2012-09-26 21:23:37 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/initramfs

for you to fetch changes up to 265e1e50186d5982b40d87f37f0662a0e09a7daa:

  initramfs: Make mkdir not fail (2012-09-27 15:17:35 +0100)

----------------------------------------------------------------
Damien Lespiau (2):
      initrd: Spawn an emergency shell when something goes wrong
      initramfs: Make mkdir not fail

 meta/recipes-core/initrdscripts/files/init-live.sh |   17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

Damien Lespiau (2):
  initrd: Spawn an emergency shell when something goes wrong
  initramfs: Make mkdir not fail

 meta/recipes-core/initrdscripts/files/init-live.sh |   17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

-- 
1.7.10



