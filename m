Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 384C077255
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 12:28:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 12 Aug 2016 05:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,510,1464678000"; d="scan'208";a="1013215732"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.28.64])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2016 05:28:17 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 13:28:11 +0100
Message-Id: <cover.1471004470.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [Fido][PATCH 00/18] Updates for fido
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
X-List-Received-Date: Fri, 12 Aug 2016 12:28:20 -0000

Please consider the following patches for the fido branch. 

They have been queued in my joshuagl/fido-next branch of openembedded-core-contrib for too long, apologies to the authors and submitters.

Regards,

Joshua

The following changes since commit 511ea0fcc9c238ad8e3b3089ec2bcf82bb1ecc77:

  build-appliance-image: Update to fido head revision (2016-05-12 13:14:48 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/fido-next

Armin Kuster (17):
  tzcode: update to 2016e
  tzdata: update to 2016e
  libxml2: Security fix for CVE-2016-1762
  libxml2: Security fix for CVE-2016-3705
  libxml2: Security fix for CVE-2016-1834.patch
  libxml2: Security fix for CVE-2016-4483.patch
  libxml2: Security fix for CVE-2016-1840
  libxml2: Security fix for CVE-2016-1838
  libxml2: Security fix for CVE-2016-1839
  libxml2: Security fix for CVE-2016-1836
  libxml2: Security fix for CVE-2016-4449
  libxml2: Security fix for CVE-2016-1837
  libxml2: Security fix for CVE-2016-1835
  libxml2: Security fix for CVE-2016-1833
  libxml2: Security fix for CVE-2016-3627
  libxml2: Security fix for CVE-2016-4447
  libxml2: Security fix for CVE-2016-4448

Roy Li (1):
  systemd: re-enable mount propagation for udevd

 .../libxml/libxml2/CVE-2016-1762.patch             |   84 ++
 .../libxml/libxml2/CVE-2016-1833.patch             |  368 +++++++
 .../libxml/libxml2/CVE-2016-1834.patch             |   55 +
 .../libxml/libxml2/CVE-2016-1835.patch             |   95 ++
 .../libxml/libxml2/CVE-2016-1836.patch             |  443 ++++++++
 .../libxml/libxml2/CVE-2016-1837.patch             |  143 +++
 .../libxml/libxml2/CVE-2016-1838.patch             |   96 ++
 .../libxml/libxml2/CVE-2016-1839.patch             |  127 +++
 .../libxml/libxml2/CVE-2016-1840.patch             |   37 +
 .../libxml/libxml2/CVE-2016-3627.patch             |   64 ++
 .../libxml/libxml2/CVE-2016-3705.patch             |   71 ++
 .../libxml/libxml2/CVE-2016-4447.patch             |  208 ++++
 .../libxml/libxml2/CVE-2016-4448_1.patch           | 1067 ++++++++++++++++++++
 .../libxml/libxml2/CVE-2016-4448_2.patch           |  208 ++++
 .../libxml/libxml2/CVE-2016-4449.patch             |   47 +
 .../libxml/libxml2/CVE-2016-4483.patch             |   55 +
 meta/recipes-core/libxml/libxml2_2.9.2.bb          |   18 +
 ...dev-re-enable-mount-propagation-for-udevd.patch |   29 +
 meta/recipes-core/systemd/systemd_219.bb           |    1 +
 ...code-native_2016d.bb => tzcode-native_2016e.bb} |    9 +-
 .../tzdata/{tzdata_2016d.bb => tzdata_2016e.bb}    |    4 +-
 21 files changed, 3223 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1762.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1833.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1834.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1835.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1836.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1837.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1838.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1839.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1840.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-3627.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-3705.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4447.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4448_1.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4448_2.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4449.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4483.patch
 create mode 100644 meta/recipes-core/systemd/systemd/udev-re-enable-mount-propagation-for-udevd.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2016d.bb => tzcode-native_2016e.bb} (67%)
 rename meta/recipes-extended/tzdata/{tzdata_2016d.bb => tzdata_2016e.bb} (98%)

-- 
2.7.4


