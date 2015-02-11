Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0900D609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 10:18:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1BAIXkp013094
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Feb 2015 02:18:33 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 11 Feb 2015 02:18:32 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <paul.eggleton@linux.intel.com>
Date: Wed, 11 Feb 2015 18:12:22 +0800
Message-ID: <cover.1423649385.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V4 0/2] bitbake-layers: add a ability to query layer dependencies from layer index
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
X-List-Received-Date: Wed, 11 Feb 2015 10:18:44 -0000
Content-Type: text/plain

$ bitbake-layers show-layer-deps meta-security
Layer                Dependencies         Git repository                                          Subdirectory
===================================================================================================================
meta-python          meta-oe              git://git.openembedded.org/meta-openembedded            meta-oe
meta-python          openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-security        meta-networking      git://git.openembedded.org/meta-openembedded            meta-networking
meta-networking      openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-security        meta-perl            git://git.openembedded.org/meta-openembedded            meta-perl
meta-oe              openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-perl            openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-security        meta-oe              git://git.openembedded.org/meta-openembedded            meta-oe
meta-networking      meta-python          git://git.openembedded.org/meta-openembedded            meta-python
meta-security        openembedded-core    git://git.openembedded.org/openembedded-core            meta

$ bitbake-layers show-layer-deps meta-security -f
Layer                Dependencies         Git repository                                          Subdirectory
===================================================================================================================
meta-python          meta-oe              git://git.openembedded.org/meta-openembedded            meta-oe
meta-python          openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-security        meta-networking      git://git.openembedded.org/meta-openembedded            meta-networking
meta-networking      openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-security        meta-perl            git://git.openembedded.org/meta-openembedded            meta-perl
meta-oe              openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-perl            openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-security        meta-oe              git://git.openembedded.org/meta-openembedded            meta-oe
meta-networking      meta-python          git://git.openembedded.org/meta-openembedded            meta-python
meta-security        openembedded-core    git://git.openembedded.org/openembedded-core            meta
Cloning into '/buildarea2/clu1/source/poky/meta-security'...
remote: Counting objects: 736, done.
remote: Compressing objects: 100% (485/485), done.
remote: Total 736 (delta 378), reused 572 (delta 214)
Receiving objects: 100% (736/736), 749.55 KiB | 70.00 KiB/s, done.
Resolving deltas: 100% (378/378), done.
Checking connectivity... done.

$ bitbake-layers show-layer-deps meta-security -a
Layer                Dependencies         Git repository                                          Subdirectory
===================================================================================================================
meta-python          meta-oe              git://git.openembedded.org/meta-openembedded            meta-oe
meta-python          openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-security        meta-networking      git://git.openembedded.org/meta-openembedded            meta-networking
meta-networking      openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-security        meta-perl            git://git.openembedded.org/meta-openembedded            meta-perl
meta-oe              openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-perl            openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-security        meta-oe              git://git.openembedded.org/meta-openembedded            meta-oe
meta-networking      meta-python          git://git.openembedded.org/meta-openembedded            meta-python
meta-security        openembedded-core    git://git.openembedded.org/openembedded-core            meta
Add "meta-networking" to conf/bblayers.conf
Add "meta-oe" to conf/bblayers.conf
Add "meta-perl" to conf/bblayers.conf
Add "meta-python" to conf/bblayers.conf
Add "meta-security" to conf/bblayers.conf

$ bitbake-layers show-layer-deps meta-networking -bdizzy
Layer                Dependencies         Git repository                                          Subdirectory
===================================================================================================================
meta-networking      openembedded-core    git://git.openembedded.org/openembedded-core            meta

$ bitbake-layers show-layer-deps meta-networking -bdaisy
Layer                Dependencies         Git repository                                          Subdirectory
===================================================================================================================
meta-networking      openembedded-core    git://git.openembedded.org/openembedded-core            meta

$ bitbake-layers show-layer-deps meta-networking -bmaster
Layer                Dependencies         Git repository                                          Subdirectory
===================================================================================================================
meta-networking      openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-python          meta-oe              git://git.openembedded.org/meta-openembedded            meta-oe
meta-oe              openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-python          openembedded-core    git://git.openembedded.org/openembedded-core            meta
meta-networking      meta-python          git://git.openembedded.org/meta-openembedded            meta-python


The following changes since commit 35c9fa0588ed8e88b541a6c80cc1517324616cea:

  maintainers: Update for non-maintained recipes (2015-01-20 21:39:41 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/layerindex
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/layerindex

Chong Lu (2):
  bitbake.conf: Add two variables for layer index
  bitbake-layers: add a ability to query layer dependencies from layer index

 bitbake/bin/bitbake-layers | 244 +++++++++++++++++++++++++++++++++++++++++++++
 meta/conf/bitbake.conf     |   6 ++
 2 files changed, 250 insertions(+)

-- 
1.9.1


