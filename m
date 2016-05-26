Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8EBC26E688
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 14:01:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2016 07:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="975020265"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2016 07:01:10 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 17:00:46 +0300
Message-Id: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 0/6] Version updates, disabling introspection on native/nativesdk
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
X-List-Received-Date: Thu, 26 May 2016 14:01:13 -0000

A bunch of version updates that I forgot to sent out. I'll be working on more of those
in the coming days to catch up to upstream somewhat.

Also: disable gobject introspection for native and nativesdk targets.

The following changes since commit 2718e843b3502afa1e21510bb6b9c4720f75124c:

  yocto-bsps: update to 4.4.11 (2016-05-26 11:34:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (6):
  gobject-introspection.bbclass: disable introspection for -native and
    -nativesdk recipes
  msmtp: upgrade to 1.6.4
  babeltrace: upgrade to 1.3.2
  gcr: upgrade to 3.20.0
  liburcu: upgrade to 0.9.2
  libsecret: upgrade to 0.18.5

 meta/classes/gobject-introspection.bbclass                 | 14 ++++++++++++--
 .../msmtp/{msmtp_1.6.3.bb => msmtp_1.6.4.bb}               |  4 ++--
 meta/recipes-gnome/gcr/{gcr_3.18.0.bb => gcr_3.20.0.bb}    |  4 ++--
 .../libsecret/{libsecret_0.18.4.bb => libsecret_0.18.5.bb} |  4 ++--
 .../lttng/{babeltrace_1.3.1.bb => babeltrace_1.3.2.bb}     |  2 +-
 .../liburcu/{liburcu_0.9.1.bb => liburcu_0.9.2.bb}         |  4 ++--
 6 files changed, 21 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.6.3.bb => msmtp_1.6.4.bb} (86%)
 rename meta/recipes-gnome/gcr/{gcr_3.18.0.bb => gcr_3.20.0.bb} (89%)
 rename meta/recipes-gnome/libsecret/{libsecret_0.18.4.bb => libsecret_0.18.5.bb} (84%)
 rename meta/recipes-kernel/lttng/{babeltrace_1.3.1.bb => babeltrace_1.3.2.bb} (93%)
 rename meta/recipes-support/liburcu/{liburcu_0.9.1.bb => liburcu_0.9.2.bb} (83%)

-- 
2.8.1


