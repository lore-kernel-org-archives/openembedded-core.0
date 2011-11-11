Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1ROmOr-0008SQ-V1
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 09:23:50 +0100
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Fri, 11 Nov 2011
	09:17:32 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Nov 2011 09:17:31 +0100
Message-ID: <cover.1320998007.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.7.2
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [RFC PATCH 0/1] busybox: update to 1.19.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Nov 2011 08:23:50 -0000
Content-Type: text/plain

This updates busybox to the latest stable, 1.19.3.

Among other things, there should be rudimentary support in syslogd for
systemd, by enabling CONFIG_FEATURE_SYSTEMD.

It has been tested and verified on qemux86 and on our local arm-based system.

However, the patch busybox-udhcpc-no_deconfig.patch has been modified to
apply, but hasn't really been tested. As we're currently mostly running static
configurations, we've only verified that udhcpc works to the extent that we
get the network up and running, not how it behaves during dhcp renewal.
Thus I'm starting this as an RFC.

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 379c77d1516fe8fdbd1cd7063f709b5266872b03:

  populate_*.bbclass: Correct INSTALL variable name after recent multilib changes (2011-11-10 18:05:06 +0000)

are available in the git repository at:
  git://github.com/darander/oe-core busybox-systemd
  https://github.com/darander/oe-core/tree/busybox-systemd

Anders Darander (1):
  busybox: update to 1.19.3

 .../B921600.patch                                  |    0
 .../busybox-appletlib-dependency.patch             |    0
 .../busybox-udhcpc-no_deconfig.patch               |   66 +++--
 .../{busybox-1.18.5 => busybox-1.19.3}/defconfig   |  271 +++++++++++++-------
 .../get_header_tar.patch                           |    0
 .../run-parts.in.usr-bin.patch                     |   16 +-
 .../udhcpc-fix-nfsroot.patch                       |    0
 .../udhcpscript.patch                              |    0
 .../{busybox_1.18.5.bb => busybox_1.19.3.bb}       |    6 +-
 9 files changed, 230 insertions(+), 129 deletions(-)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/B921600.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/busybox-appletlib-dependency.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/busybox-udhcpc-no_deconfig.patch (62%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/defconfig (89%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/get_header_tar.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/run-parts.in.usr-bin.patch (64%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/udhcpc-fix-nfsroot.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/udhcpscript.patch (100%)
 rename meta/recipes-core/busybox/{busybox_1.18.5.bb => busybox_1.19.3.bb} (85%)

-- 
1.7.7.2



