Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 575A26011C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:50:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3M5ocsF021998
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 22:50:38 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Apr 2016 22:50:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2016 22:50:33 -0700
Message-ID: <cover.1461304177.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/4] set COMPATIBLE_HOST for several recipes
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
X-List-Received-Date: Fri, 22 Apr 2016 05:50:38 -0000
Content-Type: text/plain

The following changes since commit 9838f8d077d16e52ad592879d65a9e8350b93075:

  build-appliance-image: Update to krogoth head revision (2016-04-19 21:25:53 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/arm
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/arm

Robert Yang (4):
  grub_git: set COMPATIBLE_HOST_armv7a to null
  webkitgtk: set COMPATIBLE_HOST_armv4 to null
  gnu-efi: set COMPATIBLE_HOST_armv4 to null
  cogl-1.0: set COMPATIBLE_HOST_armv4 to null

 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb    | 1 +
 meta/recipes-bsp/grub/grub_git.bb            | 1 +
 meta/recipes-graphics/cogl/cogl-1.0.inc      | 2 ++
 meta/recipes-sato/webkit/webkitgtk_2.10.7.bb | 1 +
 4 files changed, 5 insertions(+)

-- 
2.8.0


