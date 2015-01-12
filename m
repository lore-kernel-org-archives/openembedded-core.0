Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D366165C85
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 06:52:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0C6qgVt017052
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 11 Jan 2015 22:52:42 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 11 Jan 2015 22:52:41 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <paul.eggleton@linux.intel.com>
Date: Mon, 12 Jan 2015 14:48:41 +0800
Message-ID: <cover.1421044647.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] bitbake-layers: add a ability to query layer dependencies from layer index
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
X-List-Received-Date: Mon, 12 Jan 2015 06:52:48 -0000
Content-Type: text/plain

Change since V1:
Extend bitbake-layers to add this ability.

Add meta-openstack to BBLAYERS.

$ bitbake-layers show-layerdependencies
Layer                 Dependencies          Git repository                                      Subdirectory
===============================================================================================================
meta-yocto            openembedded-core     git://git.openembedded.org/openembedded-core        meta
meta-yocto-bsp        openembedded-core     git://git.openembedded.org/openembedded-core        meta
meta-openstack        meta-ruby             git://git.openembedded.org/meta-openembedded        meta-ruby
meta-openstack        meta-networking       git://git.openembedded.org/meta-openembedded        meta-networking
meta-openstack        meta-virtualization   git://git.yoctoproject.org/meta-virtualization      
meta-openstack        openembedded-core     git://git.openembedded.org/openembedded-core        meta
meta-openstack        meta-oe               git://git.openembedded.org/meta-openembedded        meta-oe

The following changes since commit 2674ddb4b0c0645c91d1794cbd9166418b984351:

  dev-manual: Some minor fixes to some text. (2015-01-06 14:27:03 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/layerindex
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/layerindex

Chong Lu (1):
  bitbake-layers: add a ability to query layer dependencies from layer
    index

 bitbake/bin/bitbake-layers | 116 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

-- 
1.9.1


