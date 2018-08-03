Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A630378E18
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 02:25:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w732PslS025964
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Aug 2018 19:25:54 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 2 Aug 2018 19:25:47 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 3 Aug 2018 09:49:45 +0800
Message-ID: <20180803014947.23598-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V2 0/2] Remove allarch from recipes which rdeps TUNE_PKGARCH packages
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
X-List-Received-Date: Fri, 03 Aug 2018 02:25:55 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V2:
* rebase on Ross's patch 'ca-certificates: upgrade 20170717 -> 20180409'

Kai Kang (2):
  remove allarch from recipes which rdepends on TUNE_PKGARCH packages
  layer.conf: update SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS

 meta/conf/layer.conf                                       | 7 -------
 meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb     | 2 +-
 meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb    | 2 --
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 --
 .../initrdscripts/initramfs-module-setup-live_1.0.bb       | 2 --
 .../docbook-xml/docbook-xsl-stylesheets_1.79.1.bb          | 1 -
 meta/recipes-graphics/wayland/weston-init.bb               | 2 +-
 meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb        | 2 --
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb      | 2 +-
 .../ca-certificates/ca-certificates_20180409.bb            | 2 --
 10 files changed, 3 insertions(+), 21 deletions(-)

-- 
2.17.1


