Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qudif-00048V-Rp
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 07:03:42 +0200
Received: by ywa12 with SMTP id 12so1631876ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 21:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=V41b9ZQo6TFCrAIMMHoSPGhMe4SIJEcH/XZzjF+2Rnw=;
	b=vwtLdF/R25Vcb89XCZ9sWh+7pz57PpZbVtYjnNFQ4DNsUDdraHZFVEu56G2Nym5Sof
	ide1sJkCXKQSvrJmy/Qt5jLM9/f3LWtfJ208WiRMza5uO+dqKaZ14cJu3NVJ2TwLEEsp
	jwWR8yMEC9eskzrRINKhKVGXY8XRo+OSDyS8Q=
Received: by 10.236.72.194 with SMTP id t42mr671145yhd.111.1313816339933;
	Fri, 19 Aug 2011 21:58:59 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f48sm4668774yhh.56.2011.08.19.21.58.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 21:58:58 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Aug 2011 04:58:38 +0000
Message-Id: <cover.1313816148.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/8] Pending patches from O.S. Systems tree
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
X-List-Received-Date: Sat, 20 Aug 2011 05:03:42 -0000

The following changes since commit c539155c51e43680711130df9050d3e92282591e:

  newt: update distro tracking fields (2011-08-19 09:05:54 -0700)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/master

Otavio Salvador (8):
  Use OECORE_DISTRO_VERSION instead of POKY_DISTRO_VERSION
  kernel.bbclass: blacklist perf-dbg
  kernel.bbclass: move uboot image generation to a specific class
  kernel.bbclass: save kernel image name into $kerneldir
  fix SDK building due TARGET_ARCH use in installation path
  scripts/runqemu: add support to pass bootparams to kernel
  scripts/runqemu: remove redundant checking
  scripts/combo-layer: fix configuration file handling

 meta/classes/kernel.bbclass            |   47 ++++++++++++++++++++-----------
 meta/classes/populate_sdk.bbclass      |    2 +-
 meta/classes/toolchain-scripts.bbclass |   12 ++++----
 meta/conf/bitbake.conf                 |    2 +-
 scripts/combo-layer                    |    4 +-
 scripts/oe-find-native-sysroot         |    2 +-
 scripts/runqemu                        |    5 +++-
 scripts/runqemu-export-rootfs          |    2 +-
 8 files changed, 46 insertions(+), 30 deletions(-)

-- 
1.7.2.5



