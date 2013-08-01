Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C18786B1F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 11:04:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r71B4AY0006762
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Aug 2013 04:04:10 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 1 Aug 2013 04:04:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Aug 2013 19:04:04 +0800
Message-ID: <cover.1375354695.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] list-packageconfig-flag.py: add a script to list all PACKAGECONFIG's flags
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
X-List-Received-Date: Thu, 01 Aug 2013 11:04:10 -0000
Content-Type: text/plain

Usage: list-packageconfig-flag.py [OPTION] [METADIR]...
  list recipes which have PACKAGECONFIG's flags in METADIR

OPTION:
  -h, --help  display this help and exit
  -f, --flag  list PACKAGECONFIG's flags and all affected recipes in METADIR

EXAMPLE:
list-packageconfig-flag.py poky/meta poky/meta-yocto
RECIPE NAME          PACKAGECONFIG's flag
=========================================
libarchive_2.8.5.bb  acl xattr largefile zlib bz2 xz openssl libxml2 expat
strace_4.8.bb        libaio acl
connman.inc          wifi bluetooth 3g tist openvpn vpnc l2tp pptp wispr

list-packageconfig-flag.py -f poky/meta poky/meta-yocto
PACKAGECONFIG's flag     RECIPE NAME
====================================
speex                    gstreamer1.0-plugins-good.inc
keyutils                 rpm_5.4.9.bb
gallium-egl              mesa.inc

//Hongxu

The following changes since commit 67864ca79da08df752487a3a4e1a975546da123d:

  systemd: Remove systemd_unitdir if systemd is not in distro features (2013-07-24 11:35:39 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/list-pkgconfigflag
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/list-pkgconfigflag

Hongxu Jia (1):
  list-packageconfig-flag.py: add a script to list all PACKAGECONFIG's
    flags

 scripts/contrib/list-packageconfig-flag.py | 180 +++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100755 scripts/contrib/list-packageconfig-flag.py

-- 
1.8.1.2


