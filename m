Return-Path: <geoffrey.levillain@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 2A69C777C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id ACE0A1EE20C2;
	Tue, 14 Mar 2017 17:58:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id GuItFczHKqEh; Tue, 14 Mar 2017 17:58:39 +0100 (CET)
Received: from Mirage.daviel.idf.intranet
	(lns-bzn-39-82-255-32-23.adsl.proxad.net [82.255.32.23])
	by idris.smile.fr (Postfix) with ESMTPA id 88B521EE1738;
	Tue, 14 Mar 2017 17:58:39 +0100 (CET)
From: Geoffrey Levillain <geoffrey.levillain@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 17:58:15 +0100
Message-Id: <20170314165816.25512-1-geoffrey.levillain@smile.fr>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH v3 0/1] Permit to install files from an overlay in images recipes
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
X-List-Received-Date: Tue, 14 Mar 2017 16:58:39 -0000

Hi, 

This patch introduce a capability to install overlays into image
after fetching them. There is actually a need to add image-specific
configurations files into image recipes, and this patch is a way
to standardize this process as well as simplify it by fetching and
install overlays when image_overlay is inherited.

It copy every files in directories listed in OVERLAY_ROOT_DIRS into
IMAGE_ROOTFS directory after execution of do_rootfs. 

This implementation use ROOTFS_POSTPROCESS_COMMAND instead of using
a task like the previous version.

Geoffrey Levillain (1):
  image_overlay.bbclass: Add possibility to install overlays to image

 meta/classes/image_overlay.bbclass | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta/classes/image_overlay.bbclass

Regards,
Geoffrey Levillain


