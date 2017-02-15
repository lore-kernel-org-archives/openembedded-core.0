Return-Path: <geoffrey.levillain@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9BF60721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 16:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 3B4151EE19B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 17:20:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024) with ESMTP id hj7E9ub+H4TV
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 17:20:33 +0100 (CET)
Received: from Mirage.daviel.idf.intranet (fw-alt.idf.smile.fr
	[109.190.187.143])
	by idris.smile.fr (Postfix) with ESMTPA id 1001D1EE1942
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 17:20:33 +0100 (CET)
From: Geoffrey Levillain <geoffrey.levillain@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 17:18:46 +0100
Message-Id: <20170215161849.7773-1-geoffrey.levillain@smile.fr>
X-Mailer: git-send-email 2.11.0
Subject: Permit to install files from an overlay in images recipes
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
X-List-Received-Date: Wed, 15 Feb 2017 16:20:36 -0000

[PATCH 1/3] No need to force image licence on MIT
[PATCH 2/3] Add possibility to install overlays to image through a class
[PATCH 3/3] Do not remove fetching and install_overlay stamps

These patches introduce a capability to install overlay into image after
fetching them.

There is actually a need to add image-specific configurations files into
image recipes, and these patches are a way to standardize this process as
well as simplify it by re-enabling fetching when image_overlay is
inherited, and by providing a task that copy every files in directories
listed in OVERLAY_ROOT_DIRS into IMAGE_ROOTFS directory.

Regards,
Geoffrey Levillain

